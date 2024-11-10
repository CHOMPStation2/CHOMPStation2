/mob/living/simple_animal/clockwork
	name = "Clockwork Marauder"
	desc = "The stalwart apparition of a clockwork flame guardian. It's eternal flame glows a firey-red."
	tt_desc = "Aeterna flamma armis"
	intelligence_level = SA_ANIMAL
	icon = 'icons/mob/clockwork_mobs.dmi'
	icon_state = "clockwork_marauder"
	item_state = "clockwork_marauder"
	icon_living = "clockwork_marauder"
	icon_dead = "fallen_armor"
	icon_rest = "clockwork_marauder"

	investigates = 1
	specific_targets = 1 //Only targets with Found()
	run_at_them = 0 //DOMESTICATED
	view_range = 5
	harm_intent_damage = 10
	turns_per_move = 5
	see_in_dark = 6

	response_help  = "pats"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"

	min_oxy = 16 //Require atleast 16kPA oxygen
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 323	//Above 50 Degrees Celcius

	mob_size = MOB_SMALL

	has_langs = list("Occursus")
	speak_chance = 1
	speak = list("Heretics!","Burn them!","Protect believers!","Hail Helios")
	speak_emote = list("crackles", "burns")
	emote_hear = list("crackles","burns")
	emote_see = list("twists their sword", "adjusts their shield")
	say_maybe_target = list("Who?","Strange.")
	say_got_target = list("Purge!","Cleanse!","Burn!")

	meat_amount = 0
	meat_type = /obj/item/reagent_containers/food/snacks/meat

	var/turns_since_scan = 0
	var/mob/flee_target

/mob/living/simple_animal/clockwork/Life()
	. = ..()
	if(!.) return

	if(prob(2)) //spooky
		var/mob/observer/dead/spook = locate() in range(src,5)
		if(spook)
			var/turf/T = spook.loc
			var/list/visible = list()
			for(var/obj/O in T.contents)
				if(!O.invisibility && O.name)
					visible += O
			if(visible.len)
				var/atom/A = pick(visible)
				visible_emote("suddenly stops and stares at something unseen[istype(A) ? " near [A]":""].")

	handle_flee_target()


/mob/living/simple_animal/clockwork/proc/handle_flee_target()
	//see if we should stop fleeing
	if (flee_target && !(flee_target in ListTargets(view_range)))
		flee_target = null
		GiveUpMoving()

	if (flee_target && !stat && !buckled)
		if (resting)
			lay_down()
		if(prob(25)) say("HSSSSS")
		stop_automated_movement = 1
		walk_away(src, flee_target, 7, 2)

/mob/living/simple_animal/clockwork/react_to_attack(var/atom/A)
	if(A == src) return
	flee_target = A
	turns_since_scan = 5

/mob/living/simple_animal/clockwork/ex_act()
	. = ..()
	react_to_attack(src.loc)

//Basic friend AI
/*/mob/living/simple_animal/clockwork/fluff
	var/mob/living/carbon/human/friend
	var/befriend_job = null

/mob/living/simple_animal/clockwork/fluff/Life()
	. = ..()
	if(!. || ai_inactive || !friend) return

	var/friend_dist = get_dist(src,friend)

	if (friend_dist <= 4)
		if(stance == STANCE_IDLE)
			if(set_follow(friend))
				handle_stance(STANCE_FOLLOW)

	if (friend_dist <= 1)
		if (friend.stat >= DEAD || friend.health <= config.health_threshold_softcrit)
			if (prob((friend.stat < DEAD)? 50 : 15))
				var/verb = pick("meows", "mews", "mrowls")
				audible_emote(pick("[verb] in distress.", "[verb] anxiously."))
		else
			if (prob(5))
				visible_emote(pick("nuzzles [friend].",
								   "brushes against [friend].",
								   "rubs against [friend].",
								   "purrs."))
	else if (friend.health <= 50)
		if (prob(10))
			var/verb = pick("meows", "mews", "mrowls")
			audible_emote("[verb] anxiously.")

/mob/living/simple_animal/cat/fluff/verb/become_friends()
	set name = "Become Friends"
	set category = "Abilities.General" //CHOMPEdit
	set src in view(1)

	if(!friend)
		var/mob/living/carbon/human/H = usr
		if(istype(H) && (!befriend_job || H.job == befriend_job))
			friend = usr
			. = 1
	else if(usr == friend)
		. = 1 //already friends, but show success anyways

	if(.)
		set_dir(get_dir(src, friend))
		visible_emote(pick("nuzzles [friend].",
						   "brushes against [friend].",
						   "rubs against [friend].",
						   "purrs."))
	else
		usr << "<span class='notice'>[src] ignores you.</span>"
	return */

/mob/living/simple_animal/clockwork/fluff/Ignis
	name = "Ignis"
	desc = "The stalwart apparition of a clockwork flame guardian. This one appears to be  to be have been somehow modified to be 'docile', it's living fire turned blue."
	tt_desc = "Aeterna flamma armis" //Chaplains new pet!
	icon = 'icons/mob/clockwork_mobs.dmi'
	icon_state = "ignis"
	item_state = "ignis"
	icon_living = "ignis"
	icon_dead = "fallen_armor"
	icon_rest = "ignis"
	retaliate = 1 // In theory this will make Ignis fight back. Maybe. -RF
