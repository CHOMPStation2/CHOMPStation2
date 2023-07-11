// ////////////////////////////////
// /// used to be old energy_vr.dm
// ////////////////////////////////

// For general use
/obj/item/weapon/gun/energy/imperial
	name = "imperial energy pistol"
	desc = "An elegant weapon developed by the Imperium Auream. Their weaponsmiths have cleverly found a way to make a gun that is only about the size of an average energy pistol, yet with the fire power of a laser carbine."
	icon = 'icons/obj/gun_vr.dmi'
	icon_override = 'icons/obj/gun_vr.dmi'
	icon_state = "ge_pistol"
	item_state = "ge_pistol"
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_NORMAL
	force = 10
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 2)
	matter = list(MAT_STEEL = 2000)
	fire_sound = 'sound/weapons/mandalorian.ogg'
	projectile_type = /obj/item/projectile/beam/imperial

// Removed because gun64_vr.dmi guns don't work.
/*
//-----------------------G44 Energy Variant--------------------
/obj/item/weapon/gun/energy/gun/burst/g44e
	name = "G44 Energy Rifle"
	desc = "The G44 Energy is a laser variant of the G44 lightweight assault rifle manufactured by the National Armory of Gaia. Though almost exclusively to the United Federation's Military Assault Command Operations Department (MACOs) and Starfleet, it is occassionally sold to security departments for their stun capabilities."
	icon = 'icons/obj/gun64_vr.dmi'
	icon_state = "g44estun100"
	item_state = "energystun100" //This is temporary.
	fire_sound = 'sound/weapons/Taser.ogg'
	charge_cost = 100
	force = 8
	w_class = ITEMSIZE_LARGE
	fire_delay = 6
	pixel_x = -16

	projectile_type = /obj/item/projectile/beam/stun/weak
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 2, TECH_ILLEGAL = 3)
	modifystate = "g44estun"

	one_handed_penalty = 60

	firemodes = list(
		list(mode_name="stun", burst=1, projectile_type=/obj/item/projectile/beam/stun/weak, modifystate="g44estun", fire_sound='sound/weapons/Taser.ogg', charge_cost = 100),
		list(mode_name="stun burst", burst=3, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.5), projectile_type=/obj/item/projectile/beam/stun/weak, modifystate="g44estun", fire_sound='sound/weapons/Taser.ogg'),
		list(mode_name="lethal", burst=1, projectile_type=/obj/item/projectile/beam/burstlaser, modifystate="g44ekill", fire_sound='sound/weapons/Laser.ogg', charge_cost = 200),
		list(mode_name="lethal burst", burst=3, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.5), projectile_type=/obj/item/projectile/beam/burstlaser, modifystate="g44ekill", fire_sound='sound/weapons/Laser.ogg'),
		)
*/

//////////////////// Energy Weapons ////////////////////

// ------------ Energy Luger ------------
//MOVED TO nuclear.dm

//////////////////// Eris Ported Guns ////////////////////
//HoP gun
/obj/item/weapon/gun/energy/gun/martin
	name = "holdout energy gun"
	desc = "The FS PDW E \"Martin\" is small holdout e-gun. Don't miss!"
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "PDW"
	item_state = "gun"
	w_class = ITEMSIZE_SMALL
	projectile_type = /obj/item/projectile/beam/stun
	charge_cost = 1200
	charge_meter = 0
	modifystate = null
	battery_lock = 1
	fire_sound = 'sound/weapons/Taser.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, fire_sound='sound/weapons/Taser.ogg', charge_cost = 600),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam, fire_sound='sound/weapons/Laser.ogg', charge_cost = 1200),
		)

/obj/item/weapon/gun/energy/gun/martin/proc/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	switch(current_mode.name)
		if("stun") add_overlay("taser_pdw")
		if("lethal") add_overlay("lazer_pdw")

/obj/item/weapon/gun/energy/gun/martin/update_icon()
	cut_overlays()
	update_mode()

//Gun Locking Mechanism
/obj/item/weapon/gun/energy/locked
	req_access = list(access_armory) //for toggling safety
	var/locked = 1
	var/lockable = 1

/obj/item/weapon/gun/energy/locked/attackby(obj/item/I, mob/user)
	var/obj/item/weapon/card/id/id = I.GetID()
	if(istype(id) && lockable)
		if(check_access(id))
			locked = !locked
			to_chat(user, "<span class='warning'>You [locked ? "enable" : "disable"] the safety lock on \the [src].</span>")
		else
			to_chat(user, "<span class='warning'>Access denied.</span>")
		user.visible_message("<span class='notice'>[user] swipes \the [I] against \the [src].</span>")
	else
		return ..()

/obj/item/weapon/gun/energy/locked/emag_act(var/remaining_charges,var/mob/user)
	..()
	if(lockable)
		locked = !locked
		to_chat(user, "<span class='warning'>You [locked ? "enable" : "disable"] the safety lock on \the [src]!</span>")

/obj/item/weapon/gun/energy/locked/special_check(mob/user)
	if(locked)
		var/turf/T = get_turf(src)
		if(T.z in using_map.station_levels)
			to_chat(user, "<span class='warning'>The safety device prevents the gun from firing this close to the facility.</span>")
			return 0
	return ..()

////////////////Expedition Frontier Phaser////////////////

/obj/item/weapon/gun/energy/locked/frontier
	name = "frontier phaser"
	desc = "An extraordinarily rugged laser weapon, built to last and requiring effectively no maintenance. Includes a built-in crank charger for recharging away from civilization. This one has a safety interlock that prevents firing while in proximity to the facility."
	description_fluff = "The NT Brand Model E2 Secured Phaser System, a specialty phaser that has an intergrated chip that prevents the user from opperating the weapon within the vicinity of any NanoTrasen opperated outposts/stations/bases. However, this chip can be disabled so the weapon CAN BE used in the vicinity of any NanoTrasen opperated outposts/stations/bases. The weapon doesn't use traditional weapon power cells and instead works via a pump action that recharges the internal cells. It is a staple amongst exploration personell who usually don't have the license to opperate a lethal weapon through NT and provides them with a weapon that can be recharged away from civilization."
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "phaserkill"
	item_state = "phaser"
	item_icons = list(slot_l_hand_str = 'icons/mob/items/lefthand_guns_vr.dmi', slot_r_hand_str = 'icons/mob/items/righthand_guns_vr.dmi', "slot_belt" = 'icons/inventory/belt/mob_vr.dmi')
	fire_sound = 'sound/weapons/laser2.ogg'
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 2, TECH_POWER = 4)
	charge_cost = 300

	battery_lock = 1
	unacidable = TRUE

	var/recharging = 0
	var/phase_power = 75

	projectile_type = /obj/item/projectile/beam/phaser
	//CHOMP Edit: Changed beam type to new phaser beam type.
	firemodes = list(
		list(mode_name="lethal", fire_delay=12, projectile_type=/obj/item/projectile/beam/phaser, charge_cost = 300),
		list(mode_name="low-power", fire_delay=8, projectile_type=/obj/item/projectile/beam/phaser/light, charge_cost = 80),
	)
	recoil_mode = 0 //CHOMP Addition: Removes recoil for micros.

/obj/item/weapon/gun/energy/locked/frontier/unload_ammo(var/mob/user)
	if(recharging)
		return
	recharging = 1
	update_icon()
	user.visible_message("<span class='notice'>[user] opens \the [src] and starts pumping the handle.</span>", \
						"<span class='notice'>You open \the [src] and start pumping the handle.</span>")
	while(recharging)
		if(!do_after(user, 10, src))
			break
		playsound(src,'sound/items/change_drill.ogg',25,1)
		user.hud_used.update_ammo_hud(user, src)
		if(power_supply.give(phase_power/8) < phase_power/8) //CHOMP Edit: Nerfed charge time of all phasers by adding /8 in a couple spots to this line
			break

	recharging = 0
	update_icon()
	user.hud_used.update_ammo_hud(user, src) // Update one last time once we're finished!

/obj/item/weapon/gun/energy/locked/frontier/update_icon()
	if(recharging)
		icon_state = "[initial(icon_state)]_pump"
		update_held_icon()
		return
	..()

/obj/item/weapon/gun/energy/locked/frontier/emp_act(severity)
	return ..(severity+2)

/obj/item/weapon/gun/energy/locked/frontier/ex_act() //|rugged|
	return

/obj/item/weapon/gun/energy/locked/frontier/unlocked
	desc = "An extraordinarily rugged laser weapon, built to last and requiring effectively no maintenance. Includes a built-in crank charger for recharging away from civilization."
	req_access = newlist() //for toggling safety
	locked = 0
	lockable = 0

////////////////Phaser Carbine////////////////

/obj/item/weapon/gun/energy/locked/frontier/carbine
	name = "frontier carbine"
	desc = "An ergonomically improved version of the venerable frontier phaser, the carbine is a fairly new weapon, and has only been produced in limited numbers so far. Includes a built-in crank charger for recharging away from civilization. This one has a safety interlock that prevents firing while in proximity to the facility."
	description_fluff = "The NT Brand Model AT2 Secured Phaser System, a specialty phaser that has an intergrated chip that prevents the user from opperating the weapon within the vicinity of any NanoTrasen opperated outposts/stations/bases. However, this chip can be disabled so the weapon CAN BE used in the vicinity of any NanoTrasen opperated outposts/stations/bases. The weapon doesn't use traditional weapon power cells and instead works via a pump action that recharges the internal cells. It is a staple amongst exploration personell who usually don't have the license to opperate a lethal weapon through NT and provides them with a weapon that can be recharged away from civilization."
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "carbinekill"
	item_state = "energykill"
	item_icons = list(slot_l_hand_str = 'icons/mob/items/lefthand_guns.dmi', slot_r_hand_str = 'icons/mob/items/righthand_guns.dmi')
	phase_power = 150

	modifystate = "carbinekill"
	//CHOMP Edit: Changed beam type to new phaser beam type.
	firemodes = list(
		list(mode_name="lethal", fire_delay=12, projectile_type=/obj/item/projectile/beam/phaser, modifystate="carbinekill", charge_cost = 300),
		list(mode_name="low-power", fire_delay=8, projectile_type=/obj/item/projectile/beam/phaser/light, modifystate="carbinestun", charge_cost = 80),
	)

/obj/item/weapon/gun/energy/locked/frontier/carbine/update_icon()
	if(recharging)
		icon_state = "[modifystate]_pump"
		update_held_icon()
		return
	..()

/obj/item/weapon/gun/energy/locked/frontier/carbine/unlocked
	desc = "An ergonomically improved version of the venerable frontier phaser, the carbine is a fairly new weapon, and has only been produced in limited numbers so far. Includes a built-in crank charger for recharging away from civilization."
	req_access = newlist() //for toggling safety
	locked = 0
	lockable = 0

////////////////Expeditionary Holdout Phaser Pistol////////////////

/obj/item/weapon/gun/energy/locked/frontier/holdout
	name = "holdout frontier phaser"
	desc = "An minaturized weapon designed for the purpose of expeditionary support to defend themselves on the field. Includes a built-in crank charger for recharging away from civilization. This one has a safety interlock that prevents firing while in proximity to the facility."
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "holdoutkill"
	item_state = null
	phase_power = 100

	w_class = ITEMSIZE_SMALL
	charge_cost = 600
	modifystate = "holdoutkill"
	//CHOMP Edit: Changed beam type to new phaser beam type.
	firemodes = list(
		list(mode_name="lethal", fire_delay=12, projectile_type=/obj/item/projectile/beam/phaser, modifystate="holdoutkill", charge_cost = 600),
		list(mode_name="low-power", fire_delay=8, projectile_type=/obj/item/projectile/beam/phaser/light, modifystate="holdoutstun", charge_cost = 120),
		list(mode_name="stun", fire_delay=12, projectile_type=/obj/item/projectile/beam/stun/med, modifystate="holdoutshock", charge_cost = 300),
	)

/obj/item/weapon/gun/energy/locked/frontier/holdout/unlocked
	desc = "An minaturized weapon designed for the purpose of expeditionary support to defend themselves on the field. Includes a built-in crank charger for recharging away from civilization."
	req_access = newlist() //for toggling safety
	locked = 0
	lockable = 0

////////////////Phaser Rifle////////////////

/obj/item/weapon/gun/energy/locked/frontier/rifle
	name = "frontier marksman rifle"
	desc = "A much larger, heavier weapon than the typical frontier-type weapons, this DMR can be fired both from the hip, and in scope. Includes a built-in crank charger for recharging away from civilization. This one has a safety interlock that prevents firing while in proximity to the facility."
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "riflekill"
	item_state = "sniper"
	item_state_slots = list(slot_r_hand_str = "lsniper", slot_l_hand_str = "lsniper")
	wielded_item_state = "lsniper-wielded"
	action_button_name = "Use Scope"
	w_class = ITEMSIZE_LARGE
	item_icons = list(slot_l_hand_str = 'icons/mob/items/lefthand_guns.dmi', slot_r_hand_str = 'icons/mob/items/righthand_guns.dmi')
	accuracy = -15 //better than most snipers but still has penalty
	scoped_accuracy = 40
	one_handed_penalty = 50 // The weapon itself is heavy, and the long barrel makes it hard to hold steady with just one hand.
	phase_power = 150 //efficient crank charger
	projectile_type = /obj/item/projectile/beam/phaser/heavy //CHOMPEdit
	modifystate = "riflekill"
	//CHOMP Edit: Changed beam type to new phaser beam type.
	firemodes = list(
		list(mode_name="sniper", fire_delay=35, projectile_type=/obj/item/projectile/beam/phaser/heavy, modifystate="riflekill", charge_cost = 600),
		list(mode_name="lethal", fire_delay=12, projectile_type=/obj/item/projectile/beam/phaser, modifystate="riflestun", charge_cost = 200),
	)

/obj/item/weapon/gun/energy/locked/frontier/rifle/ui_action_click()
	scope()

/obj/item/weapon/gun/energy/locked/frontier/rifle/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

/obj/item/weapon/gun/energy/locked/frontier/rifle/update_icon()
	if(recharging)
		icon_state = "[modifystate]_pump"
		update_held_icon()
		return
	..()

/obj/item/weapon/gun/energy/locked/frontier/rifle/unlocked
	desc = "A much larger, heavier weapon than the typical frontier-type weapons, this DMR can be fired both from the hip, and in scope. Includes a built-in crank charger for recharging away from civilization."
	req_access = newlist() //for toggling safety
	locked = 0
	lockable = 0

///phaser bow///

/obj/item/weapon/gun/energy/locked/frontier/handbow
	name = "phaser handbow"
	desc = "An minaturized weapon that fires a bolt of energy. Includes a built-in crank charger for recharging away from civilization. This one has a safety interlock that prevents firing while in proximity to the facility."
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "handbowkill"
	item_state = null
	phase_power = 100

	w_class = ITEMSIZE_SMALL
	charge_cost = 600
	modifystate = "handbowkill"
	firemodes = list(
		list(mode_name="lethal", fire_delay=12, projectile_type=/obj/item/projectile/energy/phase/bolt/heavy, modifystate="handbowkill", charge_cost = 600), //CHOMP Edit
		list(mode_name="low-power", fire_delay=8, projectile_type=/obj/item/projectile/energy/phase/bolt, modifystate="handbowstun", charge_cost = 200), //CHOMP Edit
	)

/obj/item/weapon/gun/energy/locked/frontier/handbow/unlocked
	desc = "An minaturized weapon that fires a bolt of engery. Includes a built-in crank charger for recharging away from civilization."
	req_access = newlist() //for toggling safety
	locked = 0
	lockable = 0

// ////////////////////////////////
// /// End of old energy_vr.dm
// ////////////////////////////////
/obj/item/weapon/gun/energy/laser
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "lcarbine"
	name = "NT LC-525 Laser Rifle"
	desc = "A relatively new, mass produced Nanotrasen laser carbine designed to kill with concentrated energy blasts. Just like the G40E, it has two firemodes, standard, and suppressive, which fires more efficent but weaker beams."
	icon_expected_width = 64
	var/is64x32 = TRUE
	var/is64x32_override = FALSE
	var/is_picked_up = FALSE

/obj/item/weapon/gun/energy/laser/equipped()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/weapon/gun/energy/laser/pickup()
	. = ..()
	is_picked_up = TRUE
	update_transform()

/obj/item/weapon/gun/energy/laser/dropped()
	. = ..()
	if(!istype(loc,/mob/living))
		is_picked_up = FALSE
	update_transform()

/obj/item/weapon/gun/energy/laser/Initialize()
	. = ..()
	if((!(type == /obj/item/weapon/gun/energy/laser)) && !is64x32_override)
		is64x32 = FALSE
		if(icon_expected_width == 64)
			icon_expected_width = 32
		if(icon == 'icons/obj/64x32guns_ch.dmi')
			icon = 'icons/obj/gun.dmi'
	if(is64x32)
		update_transform()

/obj/item/weapon/gun/energy/laser/update_transform()
	. = ..()
	if(is64x32)
		if(is_picked_up)
			transform = transform.Turn(-45)
		transform = transform.Translate(-16,0)

/obj/item/weapon/gun/energy/laser/empty
	is64x32_override = TRUE

/obj/item/weapon/gun/energy/laser/mounted
	is64x32_override = TRUE

/obj/item/weapon/gun/energy/laser/practice
	is64x32_override = TRUE

/obj/item/weapon/gun/energy/laser/vepr
	name = "WKHM 'Vepr'"
	desc = "The Vepr lasgun, in 40 Watt range. One of the most robust laser rifles out there, but not one that's commonly seen. This piece is WKHM's latest entry into the energy weapon market, competing with the Hephaestus Industries G40E. Uses its own proprietary energy cells. It has three settings, standard, suppressive, and burst. This one bears the 'WKHM Adamant' arkship's production stamp."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	icon_expected_width = 64
	icon_state = "vepr"
	firemodes = list(
		list(mode_name="normal", fire_delay=8, projectile_type=/obj/item/projectile/beam/midlaser, charge_cost = 240),
		list(mode_name="suppressive", fire_delay=5, projectile_type=/obj/item/projectile/beam/weaklaser, charge_cost = 60),
		list(mode_name="burst", burst=3, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.5), projectile_type=/obj/item/projectile/beam/burstlaser, charge_cost = 200),
		)
	force = 8
	w_class = ITEMSIZE_HUGE		//Probably gonna make it a rifle sooner or later //CHOMP Edit, and so I did.
	slot_flags = SLOT_BELT|SLOT_BACK //CHOMP Edit. Let's make it so that if it doesn't fit in a backpack, it doesn't fit in a holster either.
	is64x32_override = TRUE
	accept_cell_type = /obj/item/weapon/cell/vepr
	cell_type = /obj/item/weapon/cell/vepr
	origin_tech = list(TECH_POWER = 4, TECH_COMBAT = 6, TECH_MAGNET = 4, TECH_ILLEGAL = 4)

/obj/item/weapon/cell/vepr
	icon = 'icons/obj/ammo_ch.dmi'
	icon_state = "veprcell"
	item_state = "egg6"
	w_class = ITEMSIZE_SMALL
	maxcharge = 7200
	charge_amount = 20
	matter = list("metal" = 350, "glass" = 50)
	preserve_item = 1
	origin_tech = list(TECH_POWER = 6)

/obj/item/weapon/gun/energy/tommylaser
	name = "M-2421 'Tommy-Laser'"
	desc = "A automatic laser weapon resembling a Tommy-Gun. Designed by Cybersun Industries to be a man portable supressive fire laser weapon."
	icon_state = "etommy"
	item_state = "etommy"
	w_class = ITEMSIZE_LARGE
	slot_flags = SLOT_BACK
	charge_cost = 60 // 40 shots, lay down the firepower
	projectile_type = /obj/item/projectile/beam/weaklaser
	cell_type = /obj/item/weapon/cell/device/weapon
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 5, TECH_ILLEGAL = 3)

	firemodes = list(
		list(mode_name="single shot", burst = 1, fire_delay=4, move_delay=null, burst_accuracy = null, dispersion = null),
		list(mode_name="three shot bursts", burst=3, fire_delay=10 , move_delay=4,    burst_accuracy=list(65,65,65), dispersion=list(1,1,1)),
		list(mode_name="short bursts",	burst=5, fire_delay=10 ,move_delay=6, burst_accuracy = list(65,65,65,65,65), dispersion = list(4,4,4,4,4)),
		)

/obj/item/weapon/gun/energy/zip
	name = "Zip-Las"
	desc = "A homemade (and somehow safe) laser gun designed around shooting single powerful laser beam draining the cell entirely. Better not miss and better have spare cells."
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "ziplas"
	item_state = "ziplas"
	w_class = ITEMSIZE_SMALL
	slot_flags = SLOT_BELT|SLOT_BACK
	charge_cost = 1500 //You got 1 shot...
	projectile_type = /obj/item/projectile/beam/heavylaser //But it hurts a lot
	cell_type = /obj/item/weapon/cell/device/weapon

/obj/item/weapon/gun/energy/vepr/plasma
	name = "WKHM 'Vepr-Prisma'"
	desc = "The Vepr-Prisma plasma rifle, in 40 Watt range. A very robust version of the Vepr lasrifle, made to fire energized bolts of plasma. The Vepr-Prisma is very uncommon, reserved mainly for W-K's internal security forces, and organizations with lots of money to spend. Lacks a burst mode, but it probably doesn't need it. This one bears the 'WKHM Adamant' arkship's production stamp."
	description_fluff = "WKHM, is a minor arms company that has been around for quite some time, established in 2408. Known for being one of the many suppliers of weapons to dangerous worlds on the rim, and a part of the FTU. They produce a large variety of firearms, strike craft, and armored vehicles to fufill various their various contracts, and are largely migrant, moving wherever the money is. Found almost entirely on mobile production ships and various escort craft. Identifiable by their logo, a red Omega symbol with a black or white W in the middle. The sheer quantity of their firearms produced ensures they can be found.. just about anywhere, and they are very sought after by pirates for their reliability."
	icon_expected_width = 64
	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_state = "vepr"
	fire_delay = 0.5
	projectile_type = /obj/item/projectile/energy/plasma/vepr
	force = 8
	w_class = ITEMSIZE_HUGE		//Probably gonna make it a rifle sooner or later //CHOMP Edit, and so I did.
	slot_flags = SLOT_BELT|SLOT_BACK //CHOMP Edit. Let's make it so that if it doesn't fit in a backpack, it doesn't fit in a holster either.
	var/is64x32_override = TRUE
	accept_cell_type = /obj/item/weapon/cell/vepr
	cell_type = /obj/item/weapon/cell/vepr
	origin_tech = list(TECH_POWER = 4, TECH_COMBAT = 6, TECH_MAGNET = 4, TECH_ILLEGAL = 4)