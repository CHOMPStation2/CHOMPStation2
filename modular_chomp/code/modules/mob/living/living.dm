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
	/* // Not sure if needed, screams aren't a carbon thing rn.
	var/scream_sound = null
	var/female_scream_sound = null
	var/male_scream_sound = null
	var/scream_emote = null
	*/

/mob/living/Initialize()
	. = ..()

	deaf_loop = new(list(src), FALSE)

/mob/living/Destroy()
	. = ..()

	QDEL_NULL(deaf_loop)

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
