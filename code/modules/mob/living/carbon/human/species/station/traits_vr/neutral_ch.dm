/datum/trait/neutral/mobegglaying
	name = "Egg Laying"
	desc = "You can lay eggs, much like an avian."
	cost = 0

/datum/trait/neutral/mobegglaying/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/proc/mobegglaying) //CHOMPEdit TGPanel

/datum/trait/neutral/succubus_bite
	name = "Succubus Bite"
	desc = "Allows you to inject your prey with poison, much like a venemous snake."
	cost = 0
	custom_only = FALSE	//CHOMPEdit I hate custom only

/datum/trait/neutral/succubus_bite/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/proc/succubus_bite) //CHOMPEdit TGPanel

/datum/trait/neutral/nutritiongrow
	name = "Growing"
	desc = "After you consume enough nutrition, you start to slowly grow while metabolizing nutrition faster."
	cost = 0
	var_changes = list("grows" = TRUE)

/datum/trait/neutral/nutritiongrow/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/carbon/proc/toggle_growth) //CHOMPEdit TGPanel

/datum/trait/neutral/nutritionshrink
	name = "Shrinking"
	desc = "If you don't eat enough, your body starts shrinking to make up the difference!"
	cost = 0
	var_changes = list("shrinks" = TRUE)

/datum/trait/neutral/nutritiongrow/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/carbon/proc/toggle_shrinking) //CHOMPEdit TGPanel

/datum/trait/neutral/singularity_metabolism
	name = "Metabolism, Singularity"
	desc = "You are insanely hungry. You can seemingly never get enough to eat. Perhaps you had a singularity as an ancestor, or maybe one is currently living inside of your gut."
	cost = 0
	var_changes = list("metabolic_rate" = 2, "hunger_factor" = 1.6, "metabolism" = 0.012)	//2x metabolism speed, 32x hunger speed
	custom_only = FALSE

/datum/trait/neutral/hardfeet
	name = "Hard Feet"	// Free protection 4 ur pawbs
	desc = "Makes your nice clawed, scaled, hooved, armored, or otherwise just awfully calloused feet immune to glass shards."
	cost = 0 //CHOMP Edit
	var_changes = list("flags" = NO_MINOR_CUT) //Checked the flag is only used by shard stepping.

/datum/trait/neutral/small_mouth_extreme
	name = "Slow Eater"
	desc = "It takes four times as many bites to finish food as it does for most people."
	cost = 0
	var_changes = list("bite_mod" = 0.25)
	custom_only = FALSE

/datum/trait/neutral/small_mouth
	name = "Slow Eater, Minor"
	desc = "It takes twice as many bites to finish food as it does for most people."
	cost = 0
	var_changes = list("bite_mod" = 0.5)
	custom_only = FALSE

/datum/trait/neutral/big_mouth
	name = "Fast Eater, Minor"
	desc = "It takes half as many bites to finish food as it does for most people."
	cost = 0
	var_changes = list("bite_mod" = 2)
	custom_only = FALSE

/datum/trait/neutral/big_mouth_extreme
	name = "Fast Eater"
	desc = "It takes a quarter as many bites to finish food as it does for most people."
	cost = 0
	var_changes = list("bite_mod" = 4)
	custom_only = FALSE

// Doing this BC I can't rename the datum without fucking over savefiles, so meh. Hyper > Extreme, right?
/datum/trait/neutral/big_mouth_hyper
	name = "Fast Eater, Major"
	desc = "You will eat anything instantly, in one bite."
	cost = 0
	var_changes = list("bite_mod" = 16) // Setting this intentionally ridiculously high, so anything will overflow and be eaten in one go.
	custom_only = FALSE

// CHOMPNote: Moving YW additions here, to sync our files better with VORE in the event of edits.
/datum/trait/neutral/autohiss_vassilian
	name = "Autohiss (Vassilian)"
	desc = "You buzz your S's, F's, Th's, and R's."
	cost = 0
	var_changes = list(
	autohiss_basic_map = list(
        "s" = list("sz", "z", "zz"),
        "f" = list("zk")
		),
	autohiss_extra_map = list(
		"th" = list("zk", "szk"),
        "r" = list("rk")
	),
	autohiss_exempt = list("Vespinae"))
	excludes = list(/datum/trait/neutral/autohiss_tajaran, /datum/trait/neutral/autohiss_unathi)

/datum/trait/neutral/slip_reflex
	name ="Slippery Reflexes"
	desc = "Your reflexes are quick enough to react to slippery surfaces. You are not immune though."
	cost = 0

/datum/trait/neutral/slip_reflex/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.slip_reflex = TRUE
