/obj/item/contraband
	name = "contraband"
	desc = "A tightly sealed package. Dare to look inside?"
	icon = 'icons/obj/storage.dmi'
	icon_state = "deliverycrate5"
	item_state = "table_parts"
	w_class = ITEMSIZE_HUGE

/obj/item/contraband/attack_self(mob/user)
	var/contraband = pick(
		/obj/item/reagent_containers/glass/beaker/vial/macrocillin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/beaker/vial/microcillin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/sizegun/not_advanced, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/muzzle,
		/obj/item/pda/clown, // CHOMPEdit - Removal of obj/item/device
		/obj/item/pda/mime, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/fancy/cigar/havana, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/card/emag_broken, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/sleevemate, // CHOMPEdit - Removal of obj/item/device
		/obj/item/disk/nifsoft/compliance, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/seeds/ambrosiadeusseed,
		/obj/item/seeds/ambrosiavulgarisseed,
		/obj/item/bodysnatcher) // CHOMPEdit - Removal of obj/item/device

	user.put_in_hands(new contraband(usr.loc))
	to_chat(user, "You unwrap the package.")
	qdel(src)
