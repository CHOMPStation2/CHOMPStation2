// Specialized AI for metroid simplemobs.
// Unlike the parent AI code, this will probably break a lot of things if you put it on something that isn't /mob/living/simple_mob/metroid/juvenile

/datum/ai_holder/simple_mob/juvenile_metroid
	hostile = TRUE
	cooperative = TRUE
	firing_lanes = TRUE
	mauling = TRUE // They need it to get the most out of monkeys.
	conserve_ammo = TRUE					// Might help avoid 'I shoot the wall forever' cheese.
	var/closest_desired_distance = 1		// Otherwise run up to them to be able to potentially shock or punch them.
	var/always_stun = FALSE // If true, the metroid will elect to attempt to permastun the target.

/datum/ai_holder/simple_mob/juvenile_metroid/on_engagement(atom/A)
	if(get_dist(holder, A) > closest_desired_distance)
		holder.IMove(get_step_towards(holder, A))

/datum/ai_holder/simple_mob/juvenile_metroid/New()
	..()
	ASSERT(istype(holder, /mob/living/simple_mob/metroid/juvenile))


/datum/ai_holder/simple_mob/juvenile_metroid/handle_special_tactic()
	evolve_and_reproduce()

// Hit the correct verbs to keep the metroid species going.
/datum/ai_holder/simple_mob/juvenile_metroid/proc/evolve_and_reproduce()
	var/mob/living/simple_mob/metroid/juvenile/my_juvenile = holder
	if(my_juvenile.nutrition >= my_juvenile.evo_point)
		// Press the correct verb when we can.
		my_juvenile.evolve() // Turns our holder into an adult metroid.

// The holder's attack changes based on intent. This lets the AI choose what effect is desired.
/datum/ai_holder/simple_mob/juvenile_metroid/pre_melee_attack(atom/A)
	if(istype(A, /mob/living))
		var/mob/living/L = A
		var/mob/living/simple_mob/metroid/juvenile/my_juvenile = holder

		if( (!L.lying && prob(30 + (my_juvenile.power_charge * 7) ) || (!L.lying && always_stun) ))
			my_juvenile.a_intent = I_DISARM // Stun them first.
		else if(my_juvenile.is_juvenile && my_juvenile.can_consume(L) && L.lying)
			my_juvenile.a_intent = I_GRAB // Then eat them.
		else
			my_juvenile.a_intent = I_HURT // Otherwise robust them.

/datum/ai_holder/simple_mob/juvenile_metroid/closest_distance(atom/movable/AM)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(istype(H.species, /datum/species/monkey))
				return 1 // Otherwise ranged metroids will eat a lot less often.
		if(L.stat >= UNCONSCIOUS)
			return 1 // Melee (eat) the target if dead/dying, don't shoot it.
	return ..()

/datum/ai_holder/simple_mob/juvenile_metroid/can_attack(atom/movable/AM, var/vision_required = TRUE)
	. = ..()
	if(.) // Do some additional checks because we have Special Code(tm).
		if(ishuman(AM))
			var/mob/living/carbon/human/H = AM
			if(istype(H.species, /datum/species/monkey)) // istype() is so they'll eat the alien monkeys too.
				return TRUE // Monkeys are always food (sorry Pun Pun).
