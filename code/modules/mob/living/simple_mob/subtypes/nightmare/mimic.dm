/*
 *	This file is used as the main file for the mimic.
 *	This is heavily inspired by PREY 2017. Go play it.
 *	Mimics are intended to be able to take the form of objects up to and including medbots/engibots/etc for Greater Mimics.
 *	Mimics generate phantoms from dead people. VERY DANGEROUS.
 *	Codewise: A lot of the code is pulled from the morph for taking forms, because why reinvent the wheel, unless there's a drastic issue?
*/

/datum/category_item/catalogue/aberration/mimic
	name = "UNKNOWN - Aberration Classification: MIMIC"
	desc = "Classification: ????? \
	<br><br>\
	It is primarily a hunter but may also scavenge, with the capacity to eat and digest skin, bone and other animal waste. \
	The spotted hyena displays greater plasticity in its hunting and foraging behaviour than other similar carnivores; \
	it hunts alone, in small parties of 2–5 individuals or in large groups. \
	During a hunt, spotted hyenas often run through ungulate herds in order to select an individual to attack. \
	Once selected, their prey is chased over a long distance, often several kilometres, at speeds of up to 60 km/h."
	value = CATALOGUER_REWARD_MEDIUM

// You carry this thing on station? You're gonna have a bad day.
/mob/living/simple_mob/nightmare/mimic
	name = "mimic"
	desc = "A shiny, shimmering black substance that skitters on four legs - and seems to flee from direct confrontation unless alone."
	health = 9
	maxHealth = 9
	pass_flags = PASSTABLE
	movement_cooldown = 0 	// VERY FAST CRITTERS.
	mob_bump_flag = SLIME
	var/threatened = FALSE	// Are we threatened/in danger right now?
	var/last_shift			// When did we last change forms?
	var/last_reproduction	// When did we last reproduce a Husk or Weaver?
	var/shiftready = TRUE	// Are we ready to assume a new form?
	var/morphed = FALSE		// Are we morphed currently? IE not our base form.
	var/energy = 200		// How much energy we have to move in object + mimic form.
	var/max_energy = 200	// Our maximum energy stores, regenerated over time. Ticks away at a rate of 2 (mimic), 4 (object) per move, allowing 100 tiles of movement in mimic form, 50 tiles as object.
	
/mob/living/simple_mob/nightmare/mimic/Initialize()
	verbs += /mob/living/proc/ventcrawl
	return ..()

/mob/living/simple_mob/nightmare/mimic/Destroy()
	form = null
	return ..()
	
/mob/living/simple_mob/nightmare/mimic/examine(mob/user)
	if(morphed)
		. = form.examine(user)
		if(get_dist(user, src) <= 3)
			. += "<span class='warning'>[form] doesn't look quite right...</span>"
			make_jittery(rand(150,200))
	else
		. = ..()
		
// Mimic Abilities Start Here //
// Morphing into an object //

// Morph Ability - Transforms us into an object. Pass through the object we've selected as an arg, such as: morph(sodacan)
/mob/living/simple_mob/nightmare/mimic/proc/morph(var/object)
	set name = "Morph into Object"
	set desc = "Allows you to transform into an object, taking on it's properties, able to observe and move. A word of warning - observers WILL see you jitter if they examine you, or periodically at random intervals."
	set category = "Abilities"
	
	object = new obj
	
// De-Morphing (Resuming our Mimic Form)
/mob/living/simple_mob/nightmare/mimic/proc/restore