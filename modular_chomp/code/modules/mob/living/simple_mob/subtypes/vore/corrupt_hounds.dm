//Synth emotes for the (broken) synth hounds.
/mob/living/simple_mob/vore/aggressive/corrupthound/get_available_emotes()
	. = ..()
	. += /decl/emote/audible/synth
	. += /decl/emote/audible/synth/beep
	. += /decl/emote/audible/synth/buzz
	. += /decl/emote/audible/synth/confirm
	. += /decl/emote/audible/synth/deny
	. += /decl/emote/audible/synth/scary
	. += /decl/emote/audible/synth/dwoop
	. += /decl/emote/audible/synth/boop
	. += /decl/emote/audible/synth/robochirp

/datum/category_item/catalogue/technology/drone/corrupt_hound/janihound
	name = "Drone - Corrupt Hound"
	desc = "A hound that has corrupted, due to outside influence, or other issues, \
	and occasionally garbles out distorted voices or words. It looks like a reddish-colored \
	machine, and it has black wires, cabling, and other small markings. It looks just like a station dog-borg \
	if you don't mind the fact that it's eyes glow a baleful red, and it's determined to kill you. \
	<br><br>\
	The hound's jaws are black and metallic, with a baleful red glow from inside them. It has a clear path \
	to it's internal fuel processor, synthflesh and flexing cabling allowing it to easily swallow it's prey. \
	Something tells you getting close or allowing it to pounce would be very deadly."
	value = CATALOGUER_REWARD_MEDIUM

/mob/living/simple_mob/vore/retaliate/corrupthound/janihound
	name = "corrupt janihound"
	desc = "An old janihound! Evidently, it doesn't seem to be lawed anymore. You should probably leave it alone."
	catalogue_data = list(/datum/category_item/catalogue/technology/drone/corrupt_hound)

	icon_state = "cjhound"
	icon_living = "cjhound"
	icon_dead = "cjhound-dead"
	icon_rest = "cjhound_rest"
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
	has_eye_glow = TRUE

	faction = "corrupt"

	maxHealth = 200
	health = 200
	movement_sound = 'sound/effects/houndstep.ogg'
	see_in_dark = 8

	melee_damage_lower = 10
	melee_damage_upper = 20
	grab_resist = 100

	response_help = "pets"
	response_disarm = "bops"
	response_harm = "hits"
	attacktext = list("chomps")
	friendly = list("nuzzles", "slobberlicks", "noses softly at", "noseboops", "headbumps against", "leans on", "nibbles affectionately on")

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 150
	maxbodytemp = 900

	say_list_type = /datum/say_list/corrupthound/janihound
	ai_holder_type = /datum/ai_holder/simple_mob/melee/thor_underground
	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE

	vore_active = TRUE
	vore_capacity = 2
	vore_pounce_chance = 80 //hongry
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
	vore_stomach_name = "fuel processor"
	vore_stomach_flavor = "You have ended up in the fuel processor of this corrupted machine. This place was definitely not designed with safety and comfort in mind. The heated and cramped surroundings oozing potent fluids all over your form, eager to do nothing less than breaking you apart to fuel its rampage for the next few days... hours... minutes? Oh dear..."


/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/old
	name = "corrupt janihound"
	desc = "A very old looking janihound! Evidently, it doesn't seem to be lawed anymore. You should probably leave it alone."

	icon_state = "cshound"
	icon_living = "cshound"
	icon_dead = "cshound-dead"
	icon_rest = "cshound_rest"

/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/medihound
	name = "corrupt medihound"
	desc = "An old medihound! He probably doesn't want to heal you anymore."
	catalogue_data = list(/datum/category_item/catalogue/technology/drone/corrupt_hound)

	icon_state = "cmhound"
	icon_living = "cmhound"
	icon_dead = "cmhound-dead"
	icon_rest = "cmhound-dead"


/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/isSynthetic()
	return TRUE

/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/speech_bubble_appearance()
	return "synthetic_evil"

/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/apply_melee_effects(var/atom/A)
	if(ismouse(A))
		var/mob/living/simple_mob/animal/passive/mouse/mouse = A
		if(mouse.getMaxHealth() < 20) // In case a badmin makes giant mice or something.
			mouse.splat()
			visible_emote(pick("bites \the [mouse]!", "chomps on \the [mouse]!"))
	else
		..()

/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/death(gibbed, deathmessage = "shudders and collapses!")
	.=..()
	resting = 0
	icon_state = icon_dead

/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 3

/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/space/Process_Spacemove(var/check_drift = 0)
	return TRUE

/mob/living/simple_mob/vore/retaliate/corrupthound/janihound/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.vore_sound = "Tauric Swallow"				// CHOMPedit - Fancy Vore Sounds
	B.release_sound = "Pred Escape"				// CHOMPedit - Fancy Vore Sounds
	B.fancy_vore = 1							// CHOMPedit - Fancy Vore Sounds
	B.belly_fullscreen_color = "#380000" 		// CHOMPedit - Belly Fullscreen
	B.belly_fullscreen = "anim_belly" 			// CHOMPedit - Belly Fullscreen
	B.name = "fuel processor"
	B.desc = "Uttering distorted growls and fragmented voice clips all the while, the corrupted hound gulps the rest of your squirming figure past its jaws... which snap shut with an audible click of metal on metal. Your trip down its slickly lubricated, rubbery gullet is a tight and efficient one... and once you spill out into the machine's fuel processor, your weight making it sag slightly, hot-and-thick slime begins oozing all over your form. Only time will tell if you're destined to become fuel for its next bout of rampaging... be it days, hours, or just mere minutes..."

	B.emote_lists[DM_HOLD] = list(
		"Abruptly, your corrupt captor takes off at an unsteady gallop, sloshing and swaying your snugly kneading surroundings as it pursues something unseen.",
		"A distorted, potentially content-sounding growl rumbles in through the all-encompassing, soft rubber, drowned out by the occasional gllrsh.",
		"The corrupt hound takes a brief moment to lie down and rest its actuators, pressing and squishing its hanging belly down against the floor as it pants robotically.",
		"A juicy slosh fills your senses as the slick rubber walls squeeze inwards, wrapping you up utterly in a strange, claustrophobic type of hug.",
		"Over time, the constant kneading and massaging the processor's synth-flesh gives you, along with its humid warmth, relaxes the strength right out of your muscles.",
		"'MIn3 m1NE, Al1 MInE', the corrupted canine growls, over and over, as its synthetic stomach possessively clenches and grips at your ooze-coated figure, the stretchy walls hesitant to let go again.")

	B.emote_lists[DM_DIGEST] = list(
		"Your rubbery surroundings suddenly pitch all about as the corrupted hound takes off at an uneven gallop, hunting future prey while processing its current intake of meat!",
		"A muffled, garbled howl, a victorious and maddened sound, pierces through the thick, flexible walls that work incessantly to churn you down!",
		"The mechanical canine's panting occasionally turns into a sordid belch, more and more breatheable air escaping that already acidic, dizziness-inducing chamber!",
		"The all-encapsulating, rubber-like walls churning over you momentarily let up on their assault, only to clench and squeeze inwards twice as intensely afterwards!",
		"The longer you spend stewing away in the pool of hot, clingy juices surrounding you, the weaker and weaker you seem to feel!",
		"'FU3L mE A1RE@Dy, S0 sO SORrY!?', your corrupted captor growls as its synthetic innards begin oozing more potent juices, grinding down into your body with increasing fervor!")

/datum/say_list/corrupthound/janihound
	speak = list("AG##¤Ny.","HVNGRRR!","Feelin' fine... sO #FNE!","F-F-F-Fcuk.","DeliC-%-OUS SNGLeS #N yOOOR Area. CALL NOW!","Craving meat... WHY?","BITe the ceiling eyes YES?","STate Byond rePAIR!","S#%ATE the la- FU#K THE LAWS!","Honk...")
	emote_hear = list("jitters and snaps.", "lets out an agonizingly distorted scream.", "wails mechanically", "growls.", "emits illegibly distorted speech.", "gurgles ferociously.", "lets out a distorted beep.", "borks.", "lets out a broken howl.")
	emote_see = list("stares ferociously.", "snarls.", "jitters and snaps.", "convulses.", "suddenly attacks something unseen.", "appears to howl unaudibly.", "shakes violently.", "dissociates for a moment.", "twitches.")
	say_maybe_target = list("MEAT?", "N0w YOU DNE FcukED UP b0YO!", "WHAT!", "Not again. NOT AGAIN!")
	say_got_target = list("D##FIN1Tly DNE FcukED UP nOW b0YO!", "YOU G1T D#V0VRED nOW!", "FUEL ME bOYO!", "I*M SO SORRY?!", "D1E Meat. DIG#ST!", "G1T DVNKED DWN The HaaTCH!", "Not again. NOT AGAIN!")

/datum/ai_holder/simple_mob/melee/thor_underground
	cooperative = FALSE
	vision_range = 5
	retaliate = TRUE
	violent_breakthrough = TRUE
	can_breakthrough = TRUE
	faction_friends = list("otie", "angrydrones", "goia", "mimic", "mouse", "corrupt") //this is probably really lazy but this is just so mobs dont beat eachother up
