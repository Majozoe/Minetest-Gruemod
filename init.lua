-- Declaring variables

local health = 0
local position = {x=0, y=0, z=0}
local lightlevel = 0
grue = {players = {}}


minetest.register_on_joinplayer(function(player) -- Adds connected players to the table.
    local name = player:get_player_name()
    local tname = grue.players[name]
	
    if not tname then
        grue.players[name] = { timer = 0, warned = false } -- This ties the timer and the "warned" flag to individual players, instead of to the server itself.
    end
end)

minetest.register_on_leaveplayer(function(player) -- Removes disconnected players from the table. No need to hang on to that info.
	local name = player:get_player_name()
	grue.players[name] = nil
end)

-- Function for retrieving settings

local function get_setting_value(name, default)
	local value = minetest.settings:get("grue_" .. name)
	if type(value) == "nil" then value = default end	-- Checks if the retrieved value is "nil". If so, returns the default value supplied to the function.
	return tonumber(value)
end

-- Configurable variables.

local maxlight = get_setting_value("maxlight", 1) -- Max light level that the Grue can attack in
local soundvolume = get_setting_value("soundvolume", 1) -- Multiplier for how loud the audio clips are.
local warntime = get_setting_value("warntime", 5)-- Time before you are warned about getting eaten by a Grue
local deathtime = get_setting_value("deathtime", 10) -- Time after getting warned before you are eaten by a Grue	

-- Main function, checking every tick.

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local tname = grue.players[name]
		local health = player:get_hp()
		local position = player:get_pos()
		position.y = position.y + 0.5		-- Done to ensure the code doesn't check the block underneath the player by accident.
		local node = minetest.get_node(position)
		
		if node.name == 'ignore' then		-- Ensures people don't die due to loading issues
			tname.timer = 0
			tname.warned = false
			break
		end
		
		if health > 0 then					-- Making sure the player isn't dead. The Grue is only interested in live prey.
			local lightlevel = minetest.get_node_light(position,nil)
			if lightlevel == nil then break end
			
			if lightlevel <= maxlight then			-- Checking to see if the local light level is low enough
				tname.timer = tname.timer + dtime
				
				if (tname.warned == false) and (warntime ~= 0) then	-- Checking to see if the player has already been warned. Skips if player set warntime to 0
				
					if tname.timer >= warntime then
						minetest.chat_send_player(name, "You are likely to be eaten by a Grue.")
						while soundvolume > 0 do	-- Hacky way of supporting values greater than 1, since increasing the gain doesn't seem to do anything.
							minetest.sound_play("grue_warning", {pos = position, gain = soundvolume, max_hear_distance = 8,})
							soundvolume = soundvolume - 1
							end
						tname.warned = true
						tname.timer = 0
						soundvolume = get_setting_value("soundvolume", 1) -- Reset sound value
					end
				else
				
					if tname.timer >= deathtime then	--This is the part where you die
						player:set_hp(0, set_hp)
						minetest.chat_send_player(name, "You have been eaten by a Grue.")
						while soundvolume > 0 do
							minetest.sound_play("grue_attack", {pos = position, gain = soundvolume, max_hear_distance = 8,})
							soundvolume = soundvolume - 1
							end
						tname.warned = false
						tname.timer = 0
						soundvolume = get_setting_value("soundvolume", 1) -- Reset sound value
					end					
				end
				
			else	-- Resetting variables now that the player is in a better lit area.
				tname.timer = 0
				tname.warned = false
			end
		else		-- Resetting variables in the event the player died to other circumstances
			tname.timer = 0
			tname.warned = false
		end
	end
end)