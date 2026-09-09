/mob/living/simple_mob/mechanical/mecha/eclipse/proc/teleport_attack(atom/target, next_cycle, tele_miss)
	// Teleport attack.
	if(!target)
		to_chat(src, span_warning("There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(tele_miss, target)
	var/list/valid_turfs = list()

	// All this work to just go to a non-dense tile.
	for(var/turf/potential_turf in nearby_things)
		var/valid_turf = TRUE
		if(potential_turf.density)
			continue
		for(var/atom/movable/AM in potential_turf)
			if(AM.density)
				valid_turf = FALSE
		if(valid_turf)
			valid_turfs.Add(potential_turf)

	if(!(valid_turfs.len))
		to_chat(src, span_warning("There wasn't an unoccupied spot to teleport to."))
		return FALSE

	var/turf/target_turf = pick(valid_turfs)
	var/turf/T = get_turf(src)

	var/datum/effect/effect/system/spark_spread/s1 = new /datum/effect/effect/system/spark_spread
	s1.set_up(5, 1, T)
	var/datum/effect/effect/system/spark_spread/s2 = new /datum/effect/effect/system/spark_spread
	s2.set_up(5, 1, target_turf)


	T.visible_message(span_warning("\The [src] vanishes!"))
	s1.start()

	forceMove(target_turf)
	playsound(target_turf, 'sound/effects/phasein.ogg', 50, 1)
	to_chat(src, span_notice("You teleport to \the [target_turf]."))

	target_turf.visible_message(span_warning("\The [src] appears!"))
	s2.start()
	attackcycle = next_cycle

/obj/effect/artillery_attack
	anchored = TRUE
	density = FALSE
	unacidable = TRUE
	mouse_opacity = 0
	icon = 'icons/effects/effects.dmi'
	icon_state = "drop_marker"
	var/ammmotype = /obj/effect/falling_effect/callstrike_bomb

/obj/effect/artillery_attack/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/artillery_attack/LateInitialize()
	var/delay = rand(25, 30)
	addtimer(CALLBACK(src, PROC_REF(spawner)), delay, TIMER_DELETE_ME)

/obj/effect/artillery_attack/proc/spawner()
	new ammmotype(src.loc)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src), 0.7 SECONDS, TIMER_DELETE_ME)

/obj/effect/falling_effect/callstrike_bomb
	falling_type = /obj/effect/callstrike
	crushing = FALSE

/obj/effect/artillery_attack/spear
	ammmotype = /obj/effect/falling_effect/callstrike_spear

/obj/effect/falling_effect/callstrike_spear
	falling_type = /obj/effect/callstrike/spear
	crushing = FALSE

/obj/effect/callstrike
	anchored = TRUE
	density = FALSE
	mouse_opacity = 0
	icon ='modular_chomp/icons/obj/guns/precursor/tyr.dmi'
	var/meteor_type = BURN
	var/meteor_vaule = 40
	var/meteor_defense = "laser"
	var/meteor_icon = "arti"

/obj/effect/callstrike/Initialize(mapload)
	.=..()
	icon_state = meteor_icon

/obj/effect/callstrike/end_fall(crushing = FALSE)
	for(var/mob/living/L in loc)
		var/target_zone = ran_zone()
		var/blocked = L.run_armor_check(target_zone, meteor_defense)

		if(!L.apply_damage(meteor_vaule, meteor_type, target_zone, blocked))
			break
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src), 0.25 SECONDS, TIMER_DELETE_ME) //QDEL_IN(0.25, SECONDS) Commenting this out since it doesnt want to work otherwise

/obj/effect/callstrike/spear
	meteor_type = BRUTE
	meteor_vaule = 40
	meteor_icon = "spear"

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/line_encase(atom/target, next_cycle)
	var/turf/T = get_turf(target)
	new artidrop(locate(T.x-3, T.y-1, T.z))
	new artidrop(locate(T.x-3, T.y, T.z))
	new artidrop(locate(T.x-3, T.y+1, T.z))
	new artidrop(locate(T.x+3, T.y, T.z))
	new artidrop(locate(T.x+3, T.y, T.z))
	new artidrop(locate(T.x+3, T.y, T.z))
	new artidrop(locate(T.x-1, T.y-3, T.z))
	new artidrop(locate(T.x+1, T.y-3, T.z))
	new artidrop(locate(T.x, T.y-3, T.z))
	new artidrop(locate(T.x-1, T.y+3, T.z))
	new artidrop(locate(T.x+1, T.y+3, T.z))
	new artidrop(locate(T.x, T.y+3, T.z))
	attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/circle_sniper(atom/target, next_cycle, amount, fire_delay)
	var/turf/T = get_turf(target)
	new artidrop(locate(T.x-3, T.y-1, T.z))
	new artidrop(locate(T.x-3, T.y, T.z))
	new artidrop(locate(T.x-3, T.y+1, T.z))
	new artidrop(locate(T.x+3, T.y, T.z))
	new artidrop(locate(T.x+3, T.y, T.z))
	new artidrop(locate(T.x+3, T.y, T.z))
	new artidrop(locate(T.x-1, T.y-3, T.z))
	new artidrop(locate(T.x+1, T.y-3, T.z))
	new artidrop(locate(T.x, T.y-3, T.z))
	new artidrop(locate(T.x-1, T.y+3, T.z))
	new artidrop(locate(T.x+1, T.y+3, T.z))
	new artidrop(locate(T.x, T.y+3, T.z))
	new artidrop(locate(T.x, T.y, T.z))
	amount--
	if(amount > 0)
		addtimer(CALLBACK(src, PROC_REF(circle_sniper), target, next_cycle, fire_delay, amount), fire_delay, TIMER_DELETE_ME)
	else
		attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/block_sniper(atom/target, next_cycle, amount, fire_delay)
	var/turf/T = get_turf(target)
	new artidrop(locate(T.x-1, T.y, T.z))
	new artidrop(locate(T.x, T.y, T.z))
	new artidrop(locate(T.x+1, T.y, T.z))
	new artidrop(locate(T.x+1, T.y+1, T.z))
	new artidrop(locate(T.x-1, T.y+1, T.z))
	new artidrop(locate(T.x, T.y+1, T.z))
	new artidrop(locate(T.x+1, T.y-1, T.z))
	new artidrop(locate(T.x-1, T.y-1, T.z))
	new artidrop(locate(T.x, T.y-1, T.z))
	amount--
	if(amount > 0)
		addtimer(CALLBACK(src, PROC_REF(block_sniper), target, next_cycle, fire_delay, amount), fire_delay, TIMER_DELETE_ME)
	else
		attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/web_sniper(atom/target, next_cycle, amount, fire_delay)
	var/turf/T = get_turf(target)
	new artidrop(locate(T.x, T.y, T.z))
	new artidrop(locate(T.x-2, T.y, T.z))
	new artidrop(locate(T.x+2, T.y, T.z))
	new artidrop(locate(T.x, T.y-2, T.z))
	new artidrop(locate(T.x, T.y+2, T.z))
	new artidrop(locate(T.x-1, T.y-1, T.z))
	new artidrop(locate(T.x+1, T.y+1, T.z))
	new artidrop(locate(T.x-1, T.y+1, T.z))
	new artidrop(locate(T.x+1, T.y-1, T.z))
	amount--
	if(amount > 0)
		addtimer(CALLBACK(src, PROC_REF(web_sniper), target, next_cycle, fire_delay, amount), fire_delay, TIMER_DELETE_ME)
	else
		attackcycle = next_cycle

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/gravity_surge(atom/target, next_cycle, pull_radius, pull_strength)
	if(!target)
		return
	for(target in range(pull_radius, src))
		target.singularity_pull(src, pull_strength)
	attackcycle = next_cycle
