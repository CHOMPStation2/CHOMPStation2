/obj/item/contraband
	name = "contraband"
	desc = "A tightly sealed package. Dare to look inside?"
	icon = 'icons/obj/storage.dmi'
	icon_state = "deliverycrate5"
	item_state = "table_parts"
	w_class = ITEMSIZE_HUGE

/obj/item/contraband/attack_self(mob/user)
	var/contraband = pick(
		/obj/item/weapon/reagent_containers/glass/beaker/vial/macrocillin,
		/obj/item/weapon/reagent_containers/glass/beaker/vial/microcillin,
		/obj/item/weapon/gun/energy/sizegun/not_advanced,
		/obj/item/clothing/mask/muzzle,
		/obj/item/device/pda/clown,
		/obj/item/device/pda/mime,
		/obj/item/weapon/storage/fancy/cigar/havana,
		/obj/item/weapon/card/emag_broken,
		/obj/item/device/sleevemate,
		/obj/item/weapon/disk/nifsoft/compliance,
		/obj/item/seeds/ambrosiadeusseed,
		/obj/item/seeds/ambrosiavulgarisseed,
		/obj/item/device/bodysnatcher)

	user.put_in_hands(new contraband(usr.loc))
	to_chat(user, "You unwrap the package.")
	qdel(src)
