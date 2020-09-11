// These slimes have the mechanics xenobiologists care about, such as reproduction, mutating into new colors, and being able to submit through fear.

/mob/living/simple_mob/metroid/juvenile
	desc = "The most basic of slimes.  The grey slime has no remarkable qualities, however it remains one of the most useful colors for scientists."
	layer = MOB_LAYER + 1 // Need them on top of other mobs or it looks weird when consuming something.
//	ai_holder_type = /datum/ai_holder/simple_mob/xenobio_slime // This should never be changed for xenobio slimes.
	max_nutrition = 1000
	var/is_adult = FALSE // Slimes turn into adults when fed enough. Adult slimes are somewhat stronger, and can reproduce if fed enough.
	var/maxHealth_adult = 200
	var/power_charge = 0 // Disarm attacks can shock someone if high/lucky enough.
	var/mob/living/victim = null // the person the slime is currently feeding on
//	var/mutation_chance = 25 // Odds of spawning as a new color when reproducing.  Can be modified by certain xenobio products.  Carried across generations of slimes.

	var/amount_grown = 0 // controls how long the slime has been overfed, if 10, grows or reproduces
	var/number = 0 // This is used to make the slime semi-unique for indentification.
	var/harmless = FALSE // Set to true when pacified. Makes the slime harmless, not get hungry, and not be able to grow/reproduce.


/mob/living/simple_mob/metroid/juvenile/Destroy()
	if(victim)
		stop_consumption() // Unbuckle us from our victim.
	return ..()


/*
/mob/living/simple_mob/metroid/juvenile/update_icon()
	icon = "
	icon_living = "[icon_state_override ? "[icon_state_override] slime" : "slime"] [is_adult ? "adult" : "baby"][victim ? " eating" : ""]"
	icon_dead = "[icon_state_override ? "[icon_state_override] slime" : "slime"] [is_adult ? "adult" : "baby"] dead"
	icon_rest = icon_dead
	..() // This will apply the correct icon_state and do the other overlay-related things.
*/

/mob/living/simple_mob/metroid/juvenile/handle_special()
	if(stat != DEAD)
		if(victim)
			handle_consumption()

		handle_stuttering() // ??

	..()

/mob/living/simple_mob/metroid/juvenile/examine(mob/user)
	. = ..()
	if(stat == DEAD)
		. += "It appears to be dead."
	else if(incapacitated(INCAPACITATION_DISABLED))
		. += "It appears to be incapacitated."
	else if(harmless)
		. += "It appears to have been pacified."


/mob/living/simple_mob/metroid/proc/alien_evolve(mob/living/simple_mob/metroid/new_metroid)
	to_chat(src, "<span class='noticealien'>You begin to evolve!</span>")
	visible_message("<span class='alertalien'>[src] begins to twist and contort!</span>")
	if(mind)
		mind.transfer_to(new_metroid)
	qdel(src)
	




















/mob/living/simple_mob/metroid/juvenile/verb/reproduce()
	set category = "Slime"
	set desc = "This will make you split into four new slimes."

	if(stat)
		to_chat(src, span("warning", "I must be conscious to do this..."))
		return

	if(harmless)
		to_chat(src, span("warning", "I have been pacified. I cannot reproduce..."))
		return

/mob/living/simple_mob/metroid/juvenile/verb/evolve()
	set category = "Slime"
	set desc = "This will let you advance to next form."

	if(stat)
		to_chat(src, span("warning", "I must be conscious to do this..."))
		return
/*
	if(is_queen)
		paralysis = 7998
		playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
		src.visible_message("<span class='notice'>\The [src] begins to lay an egg.</span>")
		spawn(50)
		new /obj/effect/metroid/egg(loc, src)
		nutrition = 500
		paralysis = 0
		return
*/
	if(nutrition >= evo_limit && (buckled || vore_fullness == 1)) //spit dat crap out if nutrition gets too high!
		release_vore_contents()
		prey_excludes.Cut()
		stop_consumption()

	if(nutrition >= evo_point && !buckled && vore_fullness == 0 && !victim)
		playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
		paralysis = 7998
		sleep(50)
		expand_troid()
		
	else
		to_chat(src, span("warning", "I am not ready to evolve yet..."))

/mob/living/simple_mob/metroid/juvenile/proc/expand_troid()
	var/mob/living/E
	E = new next(get_turf(src)) //Next is a variable defined by metTypes.dm that just points to the next metroid in the evolutionary stage.
	src.mind.transfer_to(E)
	visible_message("<span class='warning'>\The [src] suddenly evolves!</span>")
	qdel(src)	

/mob/living/simple_mob/metroid/juvenile/proc/pacify()
	harmless = TRUE
	if(has_AI())
		var/datum/ai_holder/simple_mob/xenobio_slime/AI = ai_holder
		AI.pacify()

	faction = "neutral"

	// If for whatever reason the mob AI (or player) decides to try to attack something anyways.
	melee_damage_upper = 1
	melee_damage_lower = 3
