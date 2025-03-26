//Vox Pirate Saylist
/datum/say_list/merc/voxpirate
	speak = list("Lookings for scrap, yaya.",
				"Tank is lookings low.",
				"Knowings should haves stayed on the Ark.",
				"Quills itchings...",
				"Cravings Teshari on stick.",
				"Plates locking up. Not good.")
	emote_see = list("sniffs", "coughs", "taps his foot", "looks around", "checks his equipment")

	say_understood = list("Yayaya!")
	say_cannot = list("Skreking negatives!", "Can't do that.")
	say_maybe_target = list("Who's theres?", "Is hearing things?")
	say_got_target = list("Dust!", "Easy loot!")
	say_threaten = list("Gets out of heres!")
	say_stand_down = list("Yaya, runs!", "Kikikiki!")
	say_escalate = list("Skrek!", "Bringings it!", "Takings shot", "Lock claws!")


	//Synth Horror Saylist

/datum/say_list/cyber_horror
	speak = list("H@!#$$P M@!$#",
					"GHAA!@@#",
					"KR@!!N",
					"K!@@##L!@@ %!@#E",
					"G@#!$ H@!#%",
					"H!@%%@ @!E")
	emote_hear = list("emits", "groans", "wails", "pleads")
	emote_see = list ("stares unblinkingly.", "jitters and twitches.", "emits a synthetic scream.", "rapidly twitches.", "convulses.", "twitches uncontrollably.", "goes stock still.")
	say_threaten = list ("FR@#DOM","EN@ T#I$-$","N0$ M^> B@!#")
	say_got_target = list("I *#@ Y@%","!E@#$P","F#RR @I","D0@#$ ##OK %","IT $##TS")

//Roach Saylists Woo Hoo
/datum/say_list/roach
	speak = list("Chitter!","Chk chk!","Tchk?")
	emote_hear = list("chitters","chirps","shuffles")
	emote_see = list("rubs its antennae", "skitters", "clacks across the floor")

/datum/say_list/possessed
	speak = list("Where am I?",
				"Why am I here?",
				"Where did everyone go?")

	emote_hear = list("lets out a mournful cry.", "can be heard sobbing.", "groans out in pain.")
	emote_see = list("kneels down for a moment, picking something up before casting it away.","stands as still as a statue.", "looks to be doing some kind of work.")

	say_maybe_target = list("Is there someone there?", "Who's there?")
	say_got_target = list("You! You help people!", "Can you help me?", "I'm lost!")
	say_threaten = list("Help me!", "Please help!", "Hey, who turned out the lights?", "Allonsy!", "Geronimo!")
	say_stand_down = list("Please. Anyone. Help!", "Where is everyone?", "Where am I?")
	say_escalate = list("Help!", "I'm sorry!", "I can't stop!", "I don't want to do this!", "I don't want to go!")

/datum/say_list/merc/elite // colder. also, actually just assholes.
	speak = list("I got better pay on my last job.",
				"So, y'think we'll get to shoot anyone today?",
				"Fuck, I hate those guys.",
				"Would be nice for something to happen, for once.",
				"Think those NT shits'll rear their heads?",
				"Any of you see anything recently?")
	emote_see = list("taps his foot", "looks around coldly", "checks his equipment", "rummages in his webbing")
	say_understood = list("Aff.", "Affirmative.", "Copy.", "Understood.")
	say_cannot = list("Neg.", "Negative.")
	say_maybe_target = list("I heard something.")
	say_got_target = list("Oh, good, I needed more range fodder.", "I'm going to enjoy this.", "I see you.", "Not quiet enough.")
	say_threaten = list("Hoy, private property, fuck off.", "You're acting mighty bold for a bullet sponge.", "First and last warning; find somewhere else to be.", "I wouldn't do that if I were you.", "Back off or your field medic's getting a bonus.")
	say_stand_down = list("Damn it, I was hoping you'd push your luck.", "What, that's it? Pussy.", "And don't come back.", "Good call. Don't do it again.", "Harrumph.", "That'll teach 'ya.")
	say_escalate = list("Oh, I'm gonna enjoy this.", "I'm going to enjoy making you regret that.", "Last mistake you'll make.")


//Synth Horror Saylist

/datum/say_list/cyber_horror
	speak = list("H@!#$$P M@!$#",
					"GHAA!@@#",
					"KR@!!N",
					"K!@@##L!@@ %!@#E",
					"G@#!$ H@!#%",
					"H!@%%@ @!E")
	emote_hear = list("emits", "groans", "wails", "pleads")
	emote_see = list ("stares unblinkingly.", "jitters and twitches.", "emits a synthetic scream.", "rapidly twitches.", "convulses.", "twitches uncontrollably.", "goes stock still.")
	say_threaten = list ("FR@#DOM","EN@ T#I$-$","N0$ M^> B@!#")
	say_got_target = list("I *#@ Y@%","!E@#$P","F#RR @I","D0@#$ ##OK %","IT $##TS")


// This one's pretty dumb, but pirates are dumb anyways.
/datum/say_list/pirate
	speak = list("Yarr!",
				"Yohoho and a bottle of rum...",
				"Getting tried of hardtack.",
				"What do you do with a drunken sailor...",
				"One day We'll get that big score.",
				"They ain't catching this pirate no-sir-ree")

	say_understood = list("Alright, matey.")
	say_cannot = list("No, matey.")
	say_maybe_target = list("Eh?", "Who goes there?")
	say_got_target = list("Yarrrr!", "Just drop your loot and run")
	say_threaten = list("You best leave, this booty is mine.", "No plank to walk on, just walk away.")
	say_stand_down = list("Good.", "That's right run you lilly livers.")
	say_escalate = list("Yarr! The booty is mine!", "Going to gut you landlubber.")


/datum/say_list/possessed
	speak = list("Where am I?",
				"Why am I here?",
				"Where did everyone go?")

	emote_hear = list("lets out a mournful cry.", "can be heard sobbing.", "groans out in pain.")
	emote_see = list("kneels down for a moment, picking something up before casting it away.","stands as still as a statue.", "looks to be doing some kind of work.")

	say_maybe_target = list("Is there someone there?", "Who's there?")
	say_got_target = list("You! You help people!", "Can you help me?", "I'm lost!")
	say_threaten = list("Help me!", "Please help!", "Hey, who turned out the lights?", "Allonsy!", "Geronimo!")
	say_stand_down = list("Please. Anyone. Help!", "Where is everyone?", "Where am I?")
	say_escalate = list("Help!", "I'm sorry!", "I can't stop!", "I don't want to do this!", "I don't want to go!")
