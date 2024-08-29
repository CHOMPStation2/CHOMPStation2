var/list/exploration_cartridges = list(
	/obj/item/cartridge/explorer, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/sar // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/cartridge // CHOMPEdit - Removal of obj/item/weapon
	slot_flags = SLOT_EARS

/obj/item/cartridge/explorer // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Explorator cartridge"
	icon_state = "cart-e"
	programs = list(
		new/datum/data/pda/utility/scanmode/reagent,
		new/datum/data/pda/utility/scanmode/gas)

/obj/item/cartridge/sar // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Med-Exp cartridge"
	icon_state = "cart-m"
	programs = list(
		new/datum/data/pda/app/crew_records/medical,
		new/datum/data/pda/utility/scanmode/medical,
		new/datum/data/pda/utility/scanmode/reagent,
		new/datum/data/pda/utility/scanmode/gas)

/obj/item/cartridge/storage // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper BLU-PAK cartridge"
	desc = "It feels heavier for some reason."
	w_class = ITEMSIZE_SMALL
	icon_state = "cart-lib"
	show_examine = FALSE
	var/slots = 1
	var/obj/item/storage/internal/hold // CHOMPEdit - Removal of obj/item/weapon

/obj/item/cartridge/storage/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	hold = new/obj/item/storage/internal(src) // CHOMPEdit - Removal of obj/item/weapon
	hold.max_storage_space = slots * 2
	hold.max_w_class = ITEMSIZE_SMALL

/obj/item/cartridge/storage/attack_hand(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if (hold.handle_attack_hand(user))	//otherwise interact as a regular storage item
		..(user)

/obj/item/cartridge/storage/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return hold.attackby(W, user)

/obj/item/cartridge/storage/MouseDrop(obj/over_object as obj) // CHOMPEdit - Removal of obj/item/weapon
	if (hold.handle_mousedrop(usr, over_object))
		..(over_object)

/obj/item/cartridge/storage/attack_self(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	to_chat(user, "<span class='notice'>You empty [src].</span>")
	var/turf/T = get_turf(src)
	hold.hide_from(usr)
	for(var/obj/item/I in hold.contents)
		hold.remove_from_storage(I, T)
	add_fingerprint(user)

/obj/item/cartridge/storage/emp_act(severity) // CHOMPEdit - Removal of obj/item/weapon
	hold.emp_act(severity)
	..()

/obj/item/cartridge/storage/deluxe // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper BLU-PAK DELUXE cartridge"
	programs = list(
		new/datum/data/pda/app/power,
		new/datum/data/pda/utility/scanmode/halogen,

		new/datum/data/pda/utility/scanmode/gas,

		new/datum/data/pda/app/crew_records/medical,
		new/datum/data/pda/utility/scanmode/medical,

		new/datum/data/pda/utility/scanmode/reagent,

		new/datum/data/pda/app/crew_records/security,

		new/datum/data/pda/app/janitor,

		new/datum/data/pda/app/supply,

		new/datum/data/pda/app/status_display)
