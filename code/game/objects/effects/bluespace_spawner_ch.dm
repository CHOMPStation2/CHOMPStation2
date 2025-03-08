/obj/effect/bspawner
	name = "bluespace tear"
	desc = "An erratic portal of bluespace energies, its tear seems quite unstable but seems to endlessly create crystals. . ."
	anchored = 1
	icon = 'icons/obj/stationobjs_vr.dmi'
	icon_state = "portalgateway"
	var/obj/item_to_spawn = /obj/item/stack/telecrystal
	var/item_arg = 8
	var/time_between_spawn = 1 MINUTE
	var/time_to_end = 45 MINUTES
	var/spawned_num = 0
	var/init_time

/obj/effect/bspawner/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj,src)
	init_time = world.time

/obj/effect/bspawner/proc/spawn_item()
	if(!isnull(item_arg))
		new item_to_spawn(loc,item_arg)
	else
		new item_to_spawn(loc)

/obj/effect/bspawner/process()
	if(world.time > init_time + time_between_spawn * (spawned_num + 1))
		spawn_item()
		spawned_num++
	if(world.time > init_time + time_to_end)
		qdel(src)

/obj/effect/bspawner/Destroy()
	STOP_PROCESSING(SSobj,src)
	. = ..()

/obj/effect/bspawner/min30
	time_to_end = 30 MINUTES
