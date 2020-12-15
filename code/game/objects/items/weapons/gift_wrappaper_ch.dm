
// Chomp gift, randomized color and size, wider selection of items to obtain, also chance of chaos present with even wilder stuff


/obj/item/weapon/a_gift/advanced
	name = "present"
	desc = "A gift! What could be inside?!"
	icon = 'icons/obj/items_ch.dmi'
	icon_state = "gift1_g"
	item_state = "gift1_g"
	var/chaos = "I can do anything!"

/obj/item/weapon/a_gift/advanced/New()
	..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)

	chaos = rand(1, 100)
	if(chaos == 1)
		icon_state = "gift_chaos"
		chaos = TRUE
	else
		icon_state = "gift[pick("1", "2", "3")]_[pick("g", "r", "b", "y", "p")]"
		chaos = FALSE

	item_state = icon_state
	return

/obj/item/weapon/a_gift/advanced/attack_self(mob/M as mob) //WIP - add more items to list! - Jack
	var/gift_type = pick(
		/obj/item/weapon/storage/wallet,
		/obj/item/weapon/storage/photo_album,
		/obj/item/weapon/storage/box/snappops,
		/obj/item/weapon/storage/fancy/crayons,
		/obj/item/weapon/storage/backpack/holding,
		/obj/item/weapon/storage/belt/champion,
		/obj/item/weapon/soap/deluxe,
		/obj/item/weapon/pickaxe/silver,
		/obj/item/weapon/pen/invisible,
		/obj/item/weapon/lipstick/random,
		/obj/item/weapon/grenade/smokebomb,
		/obj/item/weapon/corncob,
		/obj/item/weapon/contraband/poster,
		/obj/item/weapon/book/manual/barman_recipes,
		/obj/item/weapon/book/manual/chef_recipes,
		/obj/item/weapon/bikehorn,
		/obj/item/weapon/beach_ball,
		/obj/item/weapon/beach_ball/holoball,
		/obj/item/toy/balloon,
		/obj/item/toy/blink,
		/obj/item/toy/crossbow,
		/obj/item/weapon/gun/projectile/revolver/capgun,
		/obj/item/toy/katana,
		/obj/item/toy/mecha/deathripley,
		/obj/item/toy/mecha/durand,
		/obj/item/toy/mecha/fireripley,
		/obj/item/toy/mecha/gygax,
		/obj/item/toy/mecha/honk,
		/obj/item/toy/mecha/marauder,
		/obj/item/toy/mecha/mauler,
		/obj/item/toy/mecha/odysseus,
		/obj/item/toy/mecha/phazon,
		/obj/item/toy/mecha/ripley,
		/obj/item/toy/mecha/seraph,
		/obj/item/toy/spinningtoy,
		/obj/item/toy/sword,
		/obj/item/weapon/reagent_containers/food/snacks/grown/ambrosiadeus,
		/obj/item/weapon/reagent_containers/food/snacks/grown/ambrosiavulgaris,
		/obj/item/device/paicard,
		/obj/item/device/instrument/violin,
		/obj/item/weapon/storage/belt/utility/full,
		/obj/item/clothing/accessory/tie/horrible)

	if(!ispath(gift_type,/obj/item))	return

	var/obj/item/I = new gift_type(M)
	M.remove_from_mob(src)
	M.put_in_hands(I)
	I.add_fingerprint(M)
	qdel(src)
	return