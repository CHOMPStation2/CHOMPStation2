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
	

/mob/living/simple_mob/metroid/juvenile/proc/evo_advance()
	var/mob/living/simple_mob/metroid/new_metroid
	if(is_baby)
		new_metroid = new /mob/living/simple_mob/metroid/juvenile/super
/*	if(my_metroid.is_super)
		new_metroid = new /mob/living/simple_mob/metroid/adult/alpha
	if(my_metroid.is_alpha)
		new_metroid = new /mob/living/simple_mob/metroid/adult/gamma
	if(my_metroid.is_gamma)
		new_metroid = new /mob/living/simple_mob/metroid/adult/zeta
	if(my_metroid.is_zeta)
		new_metroid = new /mob/living/simple_mob/metroid/adult/omega
	if(my_metroid.is_omega)
		new_metroid = new /mob/living/simple_mob/metroid/adult/queen
	if(my_metroid.is_queen)
		return
*/		

/mob/living/simple_mob/metroid/juvenile/proc/pacify()
	harmless = TRUE
	if(has_AI())
		var/datum/ai_holder/simple_mob/xenobio_slime/AI = ai_holder
		AI.pacify()

	faction = "neutral"

	// If for whatever reason the mob AI (or player) decides to try to attack something anyways.
	melee_damage_upper = 1
	melee_damage_lower = 3


// These are verbs so that player slimes can evolve/split.
/mob/living/simple_mob/metroid/juvenile/verb/evolve()
	set category = "Slime"
	set desc = "This will let you evolve."

	if(stat)
		to_chat(src, span("warning", "I must be conscious to do this..."))
		return

	if(harmless)
		to_chat(src, span("warning", "I have been pacified. I cannot evolve..."))
		return

	if(evo_point >= 10)
		evo_advance()
	else
		to_chat(src, span("warning", "I am not ready to evolve yet..."))


/mob/living/simple_mob/metroid/juvenile/verb/reproduce()
	set category = "Slime"
	set desc = "This will make you split into four new slimes."

	if(stat)
		to_chat(src, span("warning", "I must be conscious to do this..."))
		return

	if(harmless)
		to_chat(src, span("warning", "I have been pacified. I cannot reproduce..."))
		return

	if(is_adult)
		if(evo_point >= 10)
			evo_advance()
			var/mob/living/simple_mob/metroid/new_metroid
			if(src.mind)
				src.mind.transfer_to(new_metroid)
			else
				new_metroid.key = src.key
			qdel(src)
		else
			to_chat(src, span("warning", "I am not ready to reproduce yet..."))
	else
		to_chat(src, span("warning", "I have not evolved enough to reproduce yet..."))










/*
/obj/item/queenpromote/attack(mob/living/M, mob/living/carbon/alien/humanoid/user)
	if(!isalienadult(M) || isalienroyal(M))
		to_chat(user, "<span class='noticealien'>You may only use this with your adult, non-royal children!</span>")
		return
	if(get_alien_type(/mob/living/carbon/alien/humanoid/royal/praetorian/))
		to_chat(user, "<span class='noticealien'>You already have a Praetorian!</span>")
		return

	var/mob/living/carbon/alien/humanoid/A = M
	if(A.stat == CONSCIOUS && A.mind && A.key)
		if(!user.usePlasma(500))
			to_chat(user, "<span class='noticealien'>You must have 500 plasma stored to use this!</span>")
			return

		to_chat(A, "<span class='noticealien'>The queen has granted you a promotion to Praetorian!</span>")
		user.visible_message("<span class='alertalien'>[A] begins to expand, twist and contort!</span>")
		var/mob/living/carbon/alien/humanoid/royal/praetorian/new_prae = new (A.loc)
		A.mind.transfer_to(new_prae)
		qdel(A)
		qdel(src)
		return
	else
		to_chat(user, "<span class='warning'>This child must be alert and responsive to become a Praetorian!</span>")

/obj/item/queenpromote/attack_self(mob/user)
	to_chat(user, "<span class='noticealien'>You discard [src].</span>")
	qdel(src)	
*/
