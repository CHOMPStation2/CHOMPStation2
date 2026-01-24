/mob/living/simple_mob/mechanical/mecha/eclipse/proc/summon_puddles(atom/A, var/next_cycle, var/puddle_item)
	for(var/mob/living/L in view(src, 7))
		if(L.stat != DEAD || !IIsAlly(L))
			L.add_modifier(puddle_item, 3, src)
	attackcycle = next_cycle

/datum/modifier/mmo_drop
	name = "Targeted"
	on_created_text = span_notice("You feel like you're being targeted.")
	stacks = MODIFIER_STACK_FORBID
	var/puddleitem = /obj/effect/spider/spiderling/antling

/datum/modifier/mmo_drop/on_expire()
	if(holder.stat != DEAD)
		var/turf/T = get_turf(holder)
		new puddleitem(T)

/datum/modifier/mmo_drop/jelly_fish
	puddleitem = /obj/effect/ant_structure/trap

/datum/modifier/mmo_drop/blade_boss_long
	puddleitem = /obj/item/grenade/shooter/auto_explode/blade_boss_long

/datum/modifier/mmo_drop/blade_boss_short
	puddleitem = /obj/item/grenade/shooter/auto_explode/blade_boss_short

/datum/modifier/mmo_drop/tyr_flora
	puddleitem = /obj/item/grenade/shooter/auto_explode/tyr_flora

/obj/item/grenade/shooter/auto_explode
	icon = 'icons/effects/effects.dmi'
	icon_state = "drop_marker"
	mouse_opacity = 0 //no touching the attack
	spread_range = 3
	var/fuse_time = 3.5 SECONDS

/obj/item/grenade/shooter/auto_explode/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(detonate)), fuse_time, TIMER_DELETE_ME)

/obj/item/grenade/shooter/auto_explode/blade_boss_long
	spread_range = 1
	projectile_types = list(/obj/item/projectile/bullet/astral_blade)

/obj/item/grenade/shooter/auto_explode/blade_boss_short
	spread_range = 3
	projectile_types = list(/obj/item/projectile/bullet/astral_blade/short)

/obj/item/grenade/shooter/auto_explode/tyr_flora
	spread_range = 1
	projectile_types = list(/obj/item/projectile/energy/neurotoxin/toxic/tyr_flora)
