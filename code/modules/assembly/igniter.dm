/obj/item/assembly/igniter // CHOMPEdit - Removal of obj/item/device
	name = "igniter"
	desc = "A small electronic device able to ignite combustable substances."
	icon_state = "igniter"
	origin_tech = list(TECH_MAGNET = 1)
	matter = list(MAT_STEEL = 500, MAT_GLASS = 50)

	secured = 1
	wires = WIRE_RECEIVE

/obj/item/assembly/igniter/activate() // CHOMPEdit - Removal of obj/item/device
	if(!..())
		return FALSE

	if(holder && istype(holder.loc,/obj/item/grenade/chem_grenade)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/grenade/chem_grenade/grenade = holder.loc // CHOMPEdit - Removal of obj/item/weapon
		grenade.detonate()
	else
		var/turf/location = get_turf(loc)
		if(location)
			location.hotspot_expose(1000,1000)
		if (istype(src.loc,/obj/item/assembly_holder)) // CHOMPEdit - Removal of obj/item/device
			if (istype(src.loc.loc, /obj/structure/reagent_dispensers/fueltank/))
				var/obj/structure/reagent_dispensers/fueltank/tank = src.loc.loc
				if (tank && tank.modded)
					tank.explode()

		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, src)
		s.start()

	return TRUE


/obj/item/assembly/igniter/attack_self(var/mob/user) // CHOMPEdit - Removal of obj/item/device
	activate()
	add_fingerprint(user)

/obj/item/assembly/igniter/is_hot() // CHOMPEdit - Removal of obj/item/device
	return TRUE