/obj/item/grenade/supermatter // CHOMPEdit - Removal of obj/item/weapon
	name = "supermatter grenade"
	icon_state = "banana"
	item_state = "emergency_engi"
	origin_tech = list(TECH_BLUESPACE = 5, TECH_MAGNET = 4, TECH_ENGINEERING = 5)
	arm_sound = 'sound/effects/3.wav'
	var/implode_at

/obj/item/grenade/supermatter/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	if(implode_at)
		STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/grenade/supermatter/detonate() // CHOMPEdit - Removal of obj/item/weapon
	..()
	START_PROCESSING(SSobj, src)
	implode_at = world.time + 10 SECONDS
	update_icon()
	playsound(src, 'sound/weapons/wave.ogg', 100)

/obj/item/grenade/supermatter/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	cut_overlays()
	if(implode_at)
		add_overlay(image(icon = 'icons/rust.dmi', icon_state = "emfield_s1"))

/obj/item/grenade/supermatter/process() // CHOMPEdit - Removal of obj/item/weapon
	if(!isturf(loc))
		if(ismob(loc))
			var/mob/M = loc
			M.drop_from_inventory(src)
		forceMove(get_turf(src))
	playsound(src, 'sound/effects/supermatter.ogg', 100)
	supermatter_pull(src, world.view, STAGE_THREE)
	if(world.time > implode_at)
		explosion(loc, 1, 3, 5, 4)
		qdel(src)