#define ICON_CELL 1
#define ICON_CAP 2
#define ICON_BAD 4
#define ICON_CHARGE 8
#define ICON_READY 16
#define ICON_LOADED 32

/obj/item/gun/magnetic
	name = "improvised coilgun"
	desc = "A coilgun hastily thrown together out of a basic frame and advanced power storage components. Is it safe for it to be duct-taped together like that?"
	icon_state = "coilgun"
	item_state = "coilgun"
	icon = 'icons/obj/railgun.dmi'
//	one_handed_penalty = 15
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4, TECH_ILLEGAL = 2, TECH_MAGNET = 4)
	w_class = ITEMSIZE_HUGE //CHOMP Edit.

	var/obj/item/cell/cell                              // Currently installed powercell.
	var/obj/item/stock_parts/capacitor/capacitor        // Installed capacitor. Higher rating == faster charge between shots. Set to a path to spawn with one of that type.
	var/removable_components = TRUE                            // Whether or not the gun can be dismantled.
	var/gun_unreliable = 15                                    // Percentage chance of detonating in your hands.

	var/obj/item/loaded                                        // Currently loaded object, for retrieval/unloading.
	var/load_type = /obj/item/stack/rods                       // Type of stack to load with.
	projectile_type = /obj/item/projectile/bullet/magnetic 	   // Actual fire type, since this isn't throw_at rod launcher.

	var/power_cost = 950                                       // Cost per fire, should consume almost an entire basic cell.
	var/power_per_tick                                         // Capacitor charge per process(). Updated based on capacitor rating.

	var/state = 0

/obj/item/gun/magnetic/Initialize()
	. = ..()
	// So you can have some spawn with components
	if(ispath(cell))
		cell = new cell(src)
	if(ispath(capacitor))
		capacitor = new capacitor(src)
		capacitor.charge = capacitor.max_charge
	if(ispath(loaded))
		loaded = new loaded(src)

	START_PROCESSING(SSobj, src)

	if(capacitor)
		power_per_tick = (power_cost*0.15) * capacitor.rating

	update_icon()

/obj/item/gun/magnetic/Destroy()
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(cell)
	QDEL_NULL(loaded)
	QDEL_NULL(capacitor)
	. = ..()

/obj/item/gun/magnetic/get_cell()
	return cell

/obj/item/gun/magnetic/process()
	if(capacitor)
		if(cell)
			if(capacitor.charge < capacitor.max_charge && cell.checked_use(power_per_tick))
				capacitor.charge(power_per_tick)
		else
			capacitor.use(capacitor.charge * 0.05)

	update_state() // May update icon, only if things changed.

/obj/item/gun/magnetic/proc/update_state()
	var/newstate = 0

	// Parts or lack thereof
	if(removable_components)
		if(cell)
			newstate |= ICON_CELL
		if(capacitor)
			newstate |= ICON_CAP

	// Functional state
	if(!cell || !capacitor)
		newstate |= ICON_BAD
	else if(capacitor.charge < power_cost)
		newstate |= ICON_CHARGE
	else
		newstate |= ICON_READY

	// Ammo indicator
	if(loaded)
		newstate |= ICON_LOADED

	// Only update if the state has changed
	var/needs_update = FALSE
	if(state != newstate)
		needs_update = TRUE

	state = newstate

	if(needs_update)
		update_icon()

/obj/item/gun/magnetic/update_icon()
	cut_overlays()
	if(state & ICON_CELL)
		add_overlay("[icon_state]_cell")
	if(state & ICON_CAP)
		add_overlay("[icon_state]_capacitor")
	if(state & ICON_BAD)
		add_overlay("[icon_state]_red")
	if(state & ICON_CHARGE)
		add_overlay("[icon_state]_amber")
	if(state & ICON_READY)
		add_overlay("[icon_state]_green")
	if(state & ICON_LOADED)
		add_overlay("[icon_state]_loaded")

	..()

/obj/item/gun/magnetic/proc/show_ammo()
	var/list/ammotext = list()
	if(loaded)
		ammotext += "<span class='notice'>It has \a [loaded] loaded.</span>"

	return ammotext

/obj/item/gun/magnetic/examine(var/mob/user)
	. = ..()
	if(get_dist(user, src) <= 2)
		. += show_ammo()

		if(cell)
			. += "<span class='notice'>The installed [cell.name] has a charge level of [round((cell.charge/cell.maxcharge)*100)]%.</span>"
		if(capacitor)
			. += "<span class='notice'>The installed [capacitor.name] has a charge level of [round((capacitor.charge/capacitor.max_charge)*100)]%.</span>"

		if(state & ICON_BAD)
			. += "<span class='notice'>The capacitor charge indicator is blinking [span_red("red")]. Maybe you should check the cell or capacitor.</span>"
		else
			if(state & ICON_CHARGE)
				. += "<span class='notice'>The capacitor charge indicator is [span_orange("amber")].</span>"
			else
				. += "<span class='notice'>The capacitor charge indicator is [span_green("green")].</span>"

/obj/item/gun/magnetic/attackby(var/obj/item/thing, var/mob/user)

	if(removable_components)
		if(istype(thing, /obj/item/cell))
			if(cell)
				to_chat(user, "<span class='warning'>\The [src] already has \a [cell] installed.</span>")
				return
			cell = thing
			user.drop_from_inventory(cell, src)
			playsound(src, 'sound/machines/click.ogg', 10, 1)
			user.visible_message("<b>\The [user]</b> slots \the [cell] into \the [src].")
			update_icon()
			return

		if(thing.has_tool_quality(TOOL_SCREWDRIVER))
			if(!capacitor)
				to_chat(user, "<span class='warning'>\The [src] has no capacitor installed.</span>")
				return
			user.put_in_hands(capacitor)
			user.visible_message("<b>\The [user]</b> unscrews \the [capacitor] from \the [src].")
			playsound(src, thing.usesound, 50, 1)
			capacitor = null
			update_icon()
			return

		if(istype(thing, /obj/item/stock_parts/capacitor))
			if(capacitor)
				to_chat(user, "<span class='warning'>\The [src] already has \a [capacitor] installed.</span>")
				return
			capacitor = thing
			user.drop_from_inventory(capacitor, src)
			playsound(src, 'sound/machines/click.ogg', 10, 1)
			power_per_tick = (power_cost*0.15) * capacitor.rating
			user.visible_message("<b>\The [user]</b> slots \the [capacitor] into \the [src].")
			update_icon()
			return

	if(istype(thing, load_type))

		if(loaded)
			to_chat(user, "<span class='warning'>\The [src] already has \a [loaded] loaded.</span>")
			return

		// This is not strictly necessary for the magnetic gun but something using
		// specific ammo types may exist down the track.
		var/obj/item/stack/ammo = thing
		if(!istype(ammo))
			loaded = thing
			user.drop_from_inventory(thing)
			thing.forceMove(src)
		else
			loaded = new load_type(src, 1)
			ammo.use(1)

		user.visible_message("<b>\The [user]</b> loads \the [src] with \the [loaded].")
		playsound(src, 'sound/weapons/flipblade.ogg', 50, 1)
		update_icon()
		return
	. = ..()

/obj/item/gun/magnetic/attack_hand(var/mob/user)
	if(user.get_inactive_hand() == src)
		var/obj/item/removing

		if(loaded)
			removing = loaded
			loaded = null
		else if(cell && removable_components)
			removing = cell
			cell = null

		if(removing)
			removing.forceMove(get_turf(src))
			user.put_in_hands(removing)
			user.visible_message("<b>\The [user]</b> removes \the [removing] from \the [src].")
			playsound(src, 'sound/machines/click.ogg', 10, 1)
			update_icon()
			return
	. = ..()

/obj/item/gun/magnetic/proc/check_ammo()
	return loaded

/obj/item/gun/magnetic/proc/use_ammo()
	qdel(loaded)
	loaded = null

/obj/item/gun/magnetic/consume_next_projectile()

	if(!check_ammo() || !capacitor || capacitor.charge < power_cost)
		return

	use_ammo()
	capacitor.use(power_cost)
	update_icon()

	if(gun_unreliable && prob(gun_unreliable))
		spawn(3) // So that it will still fire - considered modifying Fire() to return a value but burst fire makes that annoying.
			visible_message("<span class='danger'>\The [src] explodes with the force of the shot!</span>")
			explosion(get_turf(src), -1, 0, 2)
			qdel(src)

	return new projectile_type(src)

/obj/item/gun/magnetic/fuelrod
	name = "Fuel-Rod Cannon"
	desc = "A bulky weapon designed to fire reactor core fuel rods at absurd velocities... who thought this was a good idea?!"
	description_antag = "This device is capable of firing reactor fuel assemblies, acquired from a R-UST fuel compressor and an appropriate fueltype. Be warned, Supermatter rods may have unforseen consequences."
	description_fluff = "Morpheus' second entry into the arms manufacturing field, the Morpheus B.F.G, or 'Big Fuel-rod Gun' made some noise when it was initially sent to the market. By noise, they mean it was rapidly declared 'incredibly dangerous to the wielder and civilians within a mile radius alike'."
	icon_state = "fuelrodgun"
	item_state = "coilgun"
	icon = 'icons/obj/railgun.dmi'
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 4, TECH_PHORON = 4, TECH_ILLEGAL = 5, TECH_MAGNET = 4)
	w_class = ITEMSIZE_LARGE

	removable_components = TRUE
	gun_unreliable = 0

	load_type = /obj/item/fuel_assembly
	projectile_type = /obj/item/projectile/bullet/magnetic/fuelrod

	power_cost = 500

/obj/item/gun/magnetic/fuelrod/consume_next_projectile()
	if(!check_ammo() || !capacitor || capacitor.charge < power_cost)
		return

	if(loaded) //Safety.
		if(istype(loaded, /obj/item/fuel_assembly))
			var/obj/item/fuel_assembly/rod = loaded
			//CHOMPEdit Begin
			switch(rod.fuel_type)
				if("composite") //Safety check for rods spawned in without a fueltype.
					projectile_type = /obj/item/projectile/bullet/magnetic/fuelrod
				if("deuterium")
					projectile_type = /obj/item/projectile/bullet/magnetic/fuelrod
				if("tritium")
					projectile_type = /obj/item/projectile/bullet/magnetic/fuelrod/tritium
				if("phoron")
					projectile_type = /obj/item/projectile/bullet/magnetic/fuelrod/phoron
				if("supermatter")
					projectile_type = /obj/item/projectile/bullet/magnetic/fuelrod/supermatter
					visible_message("<span class='danger'>The barrel of \the [src] glows a blinding white!</span>")
					spawn(5)
						visible_message("<span class='danger'>\The [src] begins to rattle, its acceleration chamber collapsing in on itself!</span>")
						removable_components = FALSE
						spawn(15)
							audible_message("<span class='critical'>\The [src]'s power supply begins to overload as the device crumples!</span>", runemessage = "VWRRRRRRRR") //Why are you still holding this?
							playsound(src, 'sound/effects/grillehit.ogg', 10, 1)
							var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
							var/turf/T = get_turf(src)
							sparks.set_up(2, 1, T)
							sparks.start()
							spawn(15)
								visible_message("<span class='critical'>\The [src] explodes in a blinding white light!</span>")
								explosion(src.loc, -1, 1, 2, 3)
								qdel(src)
				if("blitz")
					var/max_range = 6																// -- Polymorph
					var/banglet = 0
					projectile_type = /obj/item/projectile/bullet/magnetic/fuelrod/blitz
					visible_message("<span class='critical'>\The [src] explodes in a blinding white light with a deafening bang!</span>")
					for(var/obj/structure/closet/L in hear(max_range, get_turf(src)))
						if(locate(/mob/living/carbon/, L))
							for(var/mob/living/carbon/M in L)
								blitzed(get_turf(src), M, max_range, banglet)
					for(var/mob/living/carbon/M in hear(max_range, get_turf(src)))
						blitzed(get_turf(src), M, max_range, banglet)
					new/obj/effect/effect/sparks(src.loc)
					new/obj/effect/effect/smoke/illumination(src.loc, 5, range=30, power=30, color="#FFFFFF")
					spawn(2)
						qdel(src)
				if("blitzu")
					visible_message("<span class='critical'>\The [src] explodes in a blinding white light with a deafening bang!</span>")
					explosion(get_turf(src),1,2,4,6)
					qdel(src)
					return
				else
					projectile_type = /obj/item/projectile/bullet/magnetic/fuelrod
	use_ammo()
	capacitor.use(power_cost)
	update_icon()
	if(projectile_type)
		return new projectile_type(src)
	else
		return

/obj/item/gun/magnetic/fuelrod/proc/blitzed(var/turf/T, var/mob/living/carbon/M, var/max_range, var/banglet)					// Added a new proc called 'bang' that takes a location and a person to be banged.
	to_chat(M, "<span class='danger'>BANG</span>")						// Called during the loop that bangs people in lockers/containers and when banging
	playsound(src, 'sound/effects/bang.ogg', 50, 1, 30)		// people in normal view.  Could theroetically be called during other explosions.


	//Checking for protections
	var/eye_safety = 0
	var/ear_safety = 0
	if(iscarbon(M))
		eye_safety = M.eyecheck()
		ear_safety = M.get_ear_protection()

	//Flashing everyone
	var/mob/living/carbon/human/H = M
	var/flash_effectiveness = 1
	var/bang_effectiveness = 1
	if(ishuman(M))
		flash_effectiveness = H.species.flash_mod
		bang_effectiveness = H.species.sound_mod
	if(eye_safety < 1 && get_dist(M, T) <= round(max_range * 0.7 * flash_effectiveness))
		M.flash_eyes()
		M.Confuse(2 * flash_effectiveness)
		M.Weaken(5 * flash_effectiveness)

	//Now applying sound
	if((get_dist(M, T) <= round(max_range * 0.3 * bang_effectiveness) || src.loc == M.loc || src.loc == M))
		if(ear_safety > 0)
			M.Confuse(2)
			M.Weaken(1)
		else
			M.Confuse(10)
			M.Weaken(3)
			if ((prob(14) || (M == src.loc && prob(70))))
				M.ear_damage += rand(1, 10)
			else
				M.ear_damage += rand(0, 5)
				M.ear_deaf = max(M.ear_deaf,15)
				M.deaf_loop.start() // CHOMPStation Add: Ear Ringing/Deafness

	else if(get_dist(M, T) <= round(max_range * 0.5 * bang_effectiveness))
		if(!ear_safety)
			M.Confuse(8)
			M.ear_damage += rand(0, 3)
			M.ear_deaf = max(M.ear_deaf,10)
			M.deaf_loop.start() // CHOMPStation Add: Ear Ringing/Deafness

	else if(!ear_safety && get_dist(M, T) <= (max_range * 0.7 * bang_effectiveness))
		M.Confuse(4)
		M.ear_damage += rand(0, 1)
		M.ear_deaf = max(M.ear_deaf,5)
		M.deaf_loop.start() // CHOMPStation Add: Ear Ringing/Deafness

	//This really should be in mob not every check
	if(ishuman(M))
		var/obj/item/organ/internal/eyes/E = H.internal_organs_by_name[O_EYES]
		if (E && E.damage >= E.min_bruised_damage)
			to_chat(M, "<span class='danger'>Your eyes start to burn badly!</span>")
			if(!banglet && !(istype(src , /obj/item/grenade/flashbang/clusterbang)))
				if (E.damage >= E.min_broken_damage)
					to_chat(M, "<span class='danger'>You can't see anything!</span>")
	if (M.ear_damage >= 15)
		to_chat(M, "<span class='danger'>Your ears start to ring badly!</span>")
		if(!banglet && !(istype(src , /obj/item/grenade/flashbang/clusterbang)))
			if (prob(M.ear_damage - 10 + 5))
				to_chat(M, "<span class='danger'>You can't hear anything!</span>")
				M.sdisabilities |= DEAF
	else if(M.ear_damage >= 5)
		to_chat(M, "<span class='danger'>Your ears start to ring!</span>")
//CHOMPEdit End
/obj/item/gun/magnetic/fuelrod/New()
	cell = new /obj/item/cell/high
	capacitor = new /obj/item/stock_parts/capacitor
	. = ..()

#undef ICON_CELL
#undef ICON_CAP
#undef ICON_BAD
#undef ICON_CHARGE
#undef ICON_READY
#undef ICON_LOADED
