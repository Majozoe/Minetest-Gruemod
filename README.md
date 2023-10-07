https://github.com/Majozoe/Minetest-Gruemod/issues

The Grue - A mod for Minetest
< - - - >

Version: 1.0.1

License: CC0 (https://creativecommons.org/publicdomain/zero/1.0/)

< - - - >

Changelog

Version 1.0.2 (October 7th, 2023)

Whoops, a year late for Halloween. At least I got it this time, right? Just a tiny QOL and polish patch.

Added a visual warning at the center of the screen that shows up whenever you are in danger. Should be much easier to see than the chat message in the corner of the screen, no?

Added a special extra image for when you die to the Grue. Crediting 'Duckgo' for this idea.

Version 1.0.1 (August 12th, 2022)

Added configuration options to the main menu. This is accessible by going to the settings tab, then clicking on "All Settings", then "Content: Mods", and searching for Grue.

There are currently 4 options available, controlling when the grue can attack and how loud the audio cues are.
Note: I had to resort to using what I felt was a strange method for increasing the volume for values greater than 1. I found no issues major during my short time testing it, but if you encounter any issues, please let me know.

Increased the default death time from 5 seconds to 10 seconds.

Version 1.0.0a (August 8th, 2022)

Adjusted position checking to reduce the likelihood that the mod checks the block underneath the player. This would cause the mod to return a light level of 0, and may end up with the player getting killed by the Grue in broad daylight.
< - - - >

< - What is this mod? - >

The 'Grue' mod is a mod for Minetest that implements a nefarious creature lurking in the dark. As long as you stay in well lit areas, you will be perfectly safe, but stray too far into the dark caves, and you may get eaten.



< - That's cool and all, but how does it work? - >

As of right now, the game is constantly checking your light level. If it falls below a light level of 2 (0 is the lowest), then a timer starts ticking down. This timer is reset if you retreat back to a brighter area.

After 5 seconds, you'll get a warning, and after an additional 5 seconds, you will die.



< - Can I see the Grue? - >

Nope. The Grue hates light so will stay in pitch black darkness at all times.

That's the lore reason anyway. Technically speaking, there is not a visible Grue. It's really just a couple of audio files and a timer counting to your doom. :)



< - Does this work in multiplayer? - >

According to my own testing, yes it does!



< - Are you going to add..? - >

Me adding anything to this mod is INCREDIBLY unlikely. Really the only point of this mod was to just add the one thing, and I did it! I might still listen to requests, but do be prepared to be let down, especially since I'm a newbie at this at the time of writing.



< - Does this mod need anything else installed? - >

Nope!



< - How do I install this mod? - >

Please see http://wiki.minetest.com/wiki/Installing_Mods for the recommended methods of installing

If you are downloading this from Github, extract the zip file, then make sure the folder is named "grue" (all lowercaps) and then move it to the mods directory (the above link has details on that too.)



< - Heeeelp! I have an issue! - >

Don't worry! In the event of something crazy happening, just refer to the forum post located [here](https://forum.minetest.net/viewtopic.php?f=11&t=28523&p=413810#p413810) or create an issue on the Github.

Be sure to include a description of what is going on, what you were doing, whether or not you were on singleplayer, what other mods or even what game you were using, as well as any other info you might think is necessary such as a crash log or a screenshot, etc. 

If you do not include enough information, then I'm afraid I am incapable of helping you unless I ask for more info.
