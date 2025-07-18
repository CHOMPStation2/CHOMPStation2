/atom/proc/singularity_act()
	return

/atom/proc/singularity_pull(S, current_size)
	return

/mob/living/singularity_act()
	investigate_log("has been consumed by a singularity", I_SINGULO)
	gib()
	return 20

/mob/living/singularity_pull(S, current_size)
	step_towards(src, S)
	apply_effect(current_size * 3, IRRADIATE, blocked = getarmor(null, "rad"))

/mob/living/carbon/human/singularity_act()
	var/gain = 20
	if(mind)
		if((mind.assigned_role == JOB_ENGINEER) || (mind.assigned_role == JOB_CHIEF_ENGINEER))
			gain = 100
		if(mind.assigned_role == JOB_ALT_VISITOR) //VOREStation Edit - Visitor not Assistant
			gain = rand(0, 300)
	investigate_log(I_SINGULO,"has been consumed by a singularity", I_SINGULO)
	gib()
	return gain

/mob/living/carbon/human/singularity_pull(S, current_size)
	if(current_size >= STAGE_THREE)
		var/list/handlist = list(l_hand, r_hand)
		for(var/obj/item/hand in handlist)
			if(prob(current_size*5) && hand.w_class >= ((11-current_size)/2) && unEquip(hand))
				step_towards(hand, S)
				to_chat(src, span_warning("The [S] pulls \the [hand] from your grip!"))

	if(!lying && (!shoes || !(shoes.item_flags & NOSLIP)) && (!species || !(species.flags & NOSLIP)) && prob(current_size*5))
		to_chat(src, span_danger("A strong gravitational force slams you to the ground!"))
		Weaken(current_size)
	..()

/obj/singularity_act()
	if(simulated)
		ex_act(1)
		if(src)
			qdel(src)
		return 2

/obj/singularity_pull(S, current_size)
	set waitfor = 0

	if(anchored)
		return

	sleep(0) //this is needed or multiple items will be thrown sequentially and not simultaneously
	if(current_size >= STAGE_FOUR)
		step_towards(src,S)
		sleep(1)
		step_towards(src,S)
	else if(current_size > STAGE_ONE)
		step_towards(src,S)
	else ..()

/obj/effect/beam/singularity_pull()
	return

/obj/effect/overlay/singularity_pull()
	return

/obj/machinery/power/supermatter/shard/singularity_act()
	qdel(src)
	return 5000

/obj/machinery/power/supermatter/singularity_act()
	if(!src.loc)
		return

	var/prints = ""
	if(forensic_data?.get_hiddenprints())
		prints = ", all touchers : " + forensic_data?.get_hiddenprints()

	SetUniversalState(/datum/universal_state/supermatter_cascade)
	log_admin("New super singularity made by eating a SM crystal [prints]. Last touched by [forensic_data?.get_lastprint()].")
	message_admins("New super singularity made by eating a SM crystal [prints]. Last touched by [forensic_data?.get_lastprint()].")
	qdel(src)
	return 50000

/obj/item/projectile/beam/emitter/singularity_pull()
	return

/obj/effect/projectile/emitter/singularity_pull()
	return

/obj/item/storage/backpack/holding/singularity_act(S, current_size)
	var/dist = max((current_size - 2), 1)
	explosion(src.loc,(dist),(dist*2),(dist*4))
	return -1000	//CHOMPEDIT - Consistency with literally every other codebase

/turf/singularity_act(S, current_size)
	if(!is_plating())
		for(var/obj/O in contents)
			if(O.level != 1)
				continue
			if(O.invisibility == INVISIBILITY_ABSTRACT)
				O.singularity_act(src, current_size)
	ChangeTurf(get_base_turf_by_area(src))
	return 2

/turf/space/singularity_act()
	return

/turf/simulated/open/singularity_act()
	return

/*******************
* Nar-Sie Act/Pull *
*******************/
/atom/proc/singuloCanEat()
	return 1

/mob/observer/singuloCanEat()
	return 0

/mob/new_player/singuloCanEat()
	return 0
