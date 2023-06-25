/mob/living
	// var/ear_deaf_loop = FALSE // Are we already playing our deafened loop? Checked for safety so we don't deafen our players. (Not sure if we need this bc looping sounds datums have protection for starts being called repeatedly, commented out)
	var/datum/looping_sound/mob/deafened/deaf_loop
	/* TL;DR - the following is a lot of copypasta, but allows us to give simplemobs pain and death sounds.
	 * Different from carbons, where we check species, here we just check on the mob itself.
	 * TBD: Maybe port over from species to mob?
	*/
	var/can_pain_emote = TRUE
	var/pain_emote_1p = null
	var/pain_emote_3p = null
	var/species_sounds = "None" // By default, we have nothing.
	var/death_sound_override = null
	var/virtual_reality_mob = FALSE // gross boolean for keeping VR mobs in VR
	var/datum/looping_sound/mob/on_fire/firesoundloop
	// var/datum/looping_sound/mob/stunned/stunnedloop
	/* // Not sure if needed, screams aren't a carbon thing rn.
	var/scream_sound = null
	var/female_scream_sound = null
	var/male_scream_sound = null
	var/scream_emote = null
	*/

/mob/living/Initialize()
	. = ..()

	deaf_loop = new(list(src), FALSE)
	firesoundloop = new(list(src), FALSE)
	// stunnedloop = new(list(src), FALSE)
	if(firesoundloop) // Partly safety, partly so we can have different probs for randomization
		if(prob(40)) // Randomize our end_sound. Can't really do this easily in looping_sound without some work
			if(prob(30))
				firesoundloop.end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish2.ogg'
			else if(prob(20))
				firesoundloop.end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish3.ogg'
			else
				firesoundloop.end_sound = 'sound/effects/mob_effects/on_fire/fire_extinguish4.ogg'

/mob/living/Destroy()
	. = ..()

	QDEL_NULL(deaf_loop)
	QDEL_NULL(firesoundloop)
	// QDEL_NULL(stunnedloop)

/mob/living/proc/vs_animate(var/belly_to_animate)
  return

/*
Maybe later, gotta figure out a way to click yourself when in a locker etc.

/mob/living/proc/click_self()
	set name = "Click Self"
	set desc = "Clicks yourself. Useful when you can't see yourself."
	set category = "IC"

	ClickOn(src)

/mob/living/New(var/newloc)
	..()
	verbs |= /mob/living/proc/click_self
*/

/mob/living/proc/handle_vorefootstep(m_intent, turf/T) // Moved from living_ch.dm
	return FALSE

// Gross proc which is called on Life() to check for escaped VR mobs. Tried to do this with Exited() on area/vr but ended up being too heavy.
/mob/living/proc/handle_vr_derez()
	if(virtual_reality_mob && !istype(get_area(src), /area/vr))
		log_debug("[src] escaped virtual reality")
		visible_message("[src] blinks out of existence.")
		for(var/obj/belly/B in vore_organs) // Assume anybody inside an escaped VR mob is also an escaped VR mob.
			for(var/mob/living/L in B)
				log_debug("[L] was inside an escaped VR mob and has been deleted.")
				qdel(L)
		qdel(src) // Would like to convert escaped players into AR holograms in the future to encourage exploit finding.

// TRANSFORMATION PROCS

// Used to check if THIS MOB has been transformed into a different mob, as only the NEW mob uses tf_mob_holder.
// Necessary in niche cases where a proc interacts with the old body and needs to know it's been transformed (such as transforming into a mob then dying in virtual reality).
// Use this if you cannot use the tf_mob_holder var. Returns TRUE if transformed, FALSE if not.
/mob/living/proc/tfed_into_mob_check()
	if(loc && isliving(loc))
		var/mob/living/M = loc
		if(istype(M) && M.tf_mob_holder && (M.tf_mob_holder == src))
			return TRUE
		else
			return FALSE
	else
		return FALSE

// For some reason upstream made a general revert proc but not a general transform proc, so here it is.
// Requires a /mob/living type path for transformation. Returns the new mob on success, null in all other cases.
// Just handles mob TF right now, but maybe we'll want to do something similar for items in the future.
/mob/living/proc/transform_into_mob(mob/living/new_form, pref_override = FALSE, revert = FALSE)
	if(!src.mind)
		return
	if(!src.allow_spontaneous_tf && !pref_override)
		return
	if(src.tf_mob_holder) //If we're already transformed
		if(revert)
			revert_mob_tf()
			return
		else
			return
	else
		if(src.stat == DEAD)
			return
		if(!ispath(new_form, /mob/living))
			return
		var/mob/living/new_mob = new new_form(get_turf(src))
		new_mob.faction = src.faction

		if(new_mob && isliving(new_mob))
			for(var/obj/belly/B as anything in new_mob.vore_organs)
				new_mob.vore_organs -= B
				qdel(B)
			new_mob.vore_organs = list()
			new_mob.name = src.name
			new_mob.real_name = src.real_name
			for(var/lang in src.languages)
				new_mob.languages |= lang
			src.copy_vore_prefs_to_mob(new_mob)
			new_mob.vore_selected = src.vore_selected
			if(ishuman(src))
				var/mob/living/carbon/human/H = src
				if(ishuman(new_mob))
					var/mob/living/carbon/human/N = new_mob
					N.gender = H.gender
					N.identifying_gender = H.identifying_gender
				else
					new_mob.gender = H.gender
			else
				new_mob.gender = src.gender
				if(ishuman(new_mob))
					var/mob/living/carbon/human/N = new_mob
					N.identifying_gender = src.gender

			for(var/obj/belly/B as anything in src.vore_organs)
				B.loc = new_mob
				B.forceMove(new_mob)
				B.owner = new_mob
				src.vore_organs -= B
				new_mob.vore_organs += B

			new_mob.ckey = src.ckey
			if(src.ai_holder && new_mob.ai_holder)
				var/datum/ai_holder/old_AI = src.ai_holder
				old_AI.set_stance(STANCE_SLEEP)
				var/datum/ai_holder/new_AI = new_mob.ai_holder
				new_AI.hostile = old_AI.hostile
				new_AI.retaliate = old_AI.retaliate
			src.loc = new_mob
			src.forceMove(new_mob)
			new_mob.tf_mob_holder = src
			return new_mob
