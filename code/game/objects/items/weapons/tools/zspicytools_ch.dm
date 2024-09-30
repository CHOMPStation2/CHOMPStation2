//Try not to question it too hard. These are the spicy tools.

/obj/item/tool/crowbar/heavysniper
	name = "anti-materiel sniper crowbar"
	desc = "This abomination or piece of art, depending on how you view it, seems to use a 14.5mm anti-materiel sniper rifle to the same effect of a crowbar."
	icon = 'icons/obj/gun.dmi'
	icon_state = "heavysniper"
	item_icons = list(slot_l_hand_str = 'icons/mob/items/lefthand_guns.dmi',slot_r_hand_str = 'icons/mob/items/righthand_guns.dmi')
	item_state = "heavysniper"
	toolspeed = 0.1
	force = 30
	usesound = 'sound/weapons/Gunshot_cannon.ogg'

/obj/item/weldingtool/lasercannon
	name = "laser cannon welding tool"
	desc = "This abomination or piece of art, depending on how you view it, seems to be a laser cannon converted into a welding tool."
	icon = 'icons/obj/gun.dmi'
	icon_state = "lasercannon"
	item_icons = list(slot_l_hand_str = 'icons/mob/items/lefthand_guns.dmi',slot_r_hand_str = 'icons/mob/items/righthand_guns.dmi')
	item_state = "mhdhowitzer-wielded"
	toolspeed = 0.1
	usesound = 'sound/weapons/lasercannonfire.ogg'
	acti_sound = 'sound/weapons/kenetic_reload.ogg'
	always_process = TRUE

/obj/item/weldingtool/lasercannon/process()
	if(get_fuel() <= get_max_fuel())
		reagents.add_reagent("fuel", 1)
	..()

/obj/item/weldingtool/lasercannon/update_icon()
	// Lights
	if(welding && flame_intensity)
		set_light(flame_intensity, flame_intensity, flame_color)
	else
		set_light(0)

//	icon_state = welding ? "[icon_state]1" : "[initial(icon_state)]"
	var/mob/M = loc
	if(istype(M))
		M.update_inv_l_hand()
		M.update_inv_r_hand()

/obj/item/tool/wrench/fuelrod
	name = "fuel-rod cannon wrench"
	desc = "This abomination or piece of art, depending on how you view it, seems to by some means use a fuel rod cannon as a wrench... how this is possible, one can only theorize."
	icon = 'icons/obj/railgun.dmi'
	icon_state = "fuelrodgun"
	item_icons = list(slot_l_hand_str = 'icons/mob/items/lefthand_guns.dmi',slot_r_hand_str = 'icons/mob/items/righthand_guns.dmi')
	item_state = "coilgun"
	usesound = 'sound/weapons/railgun.ogg'
	toolspeed = 0.1
	force = 30

/obj/item/tool/wirecutters/chainsaw
	name = "chainsaw wirecutters"
	desc = "This abomination or piece of art, depending on how you view it, seems to be a chainsaw that is by some means converted into wirecutters."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "chainsaw0"
	item_state = "chainsaw0"
	usesound = 'sound/weapons/chainsaw_attack.ogg'
	random_color = FALSE
	toolspeed = 0.1
	force = 30

/obj/item/tool/screwdriver/diamonddrill
	name = "diamond drill power screwdriver"
	desc = "This abomination or piece of art, depending on how you view it, seems to be a diamond drill that was converted into a power screwdriver."
	icon = 'icons/obj/items.dmi'
	icon_state = "diamonddrill"
	item_state = "jackhammer"
	hitsound = 'sound/items/drill_hit.ogg'
	usesound = 'sound/items/drill_use.ogg'
	random_color = FALSE
	toolspeed = 0.1
	force = 30

/obj/item/stack/cable_coil/alien/blood
	name = "Blood cable coil"
	desc = "This seems to be a blood red cable coil which magically replenishes itself, and if you look closely at the insulation you can read the words \"forged from the blood of our enemies\""
	icon = 'icons/obj/power.dmi'
	icon_state = "coil"
	item_state = "coil"
	color = "#8A0303"
	catalogue_data = null
	toolspeed = 0.1

/obj/item/storage/belt/utility/spicyfull
	starts_with = list(
		/obj/item/tool/crowbar/heavysniper,
		/obj/item/weldingtool/lasercannon,
		/obj/item/tool/wrench/fuelrod,
		/obj/item/tool/wirecutters/chainsaw,
		/obj/item/tool/screwdriver/diamonddrill,
		/obj/item/stack/cable_coil/alien/blood
		)
