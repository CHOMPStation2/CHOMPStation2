/obj/item/storage/box/halloween
	name = "costume box"
	desc = "A cardboard box, with all your halloween-esque items ready!"
	icon = 'icons/obj/storage_ch.dmi'
	icon_state = "box"

/obj/item/storage/box/halloween/masked_killer
	name = "masked killer costume"
	starts_with = list(
		/obj/item/clothing/under/overalls,
		/obj/item/clothing/shoes/white,
		/obj/item/clothing/gloves/sterile/latex,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/suit/storage/apron,
		/obj/item/material/twohanded/fireaxe/foam,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/professional
	name = "the professional costume"
	starts_with = list(
		/obj/item/clothing/under/suit_jacket{ starting_accessories=list(/obj/item/clothing/accessory/wcoat) },
		/obj/item/storage/briefcase/ { starts_with = list(/obj/item/clothing/mask/gas/clown_hat, /obj/item/ammo_magazine/mfoam_dart/pistol, /obj/item/gun/projectile/pistol/toy, /obj/item/toy/sword) },
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/glasses/fakesunglasses,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/horrorcop
	name = "slasher movie cop costume"
	starts_with = list(
		/obj/item/clothing/under/corp/pcrc{ starting_accessories=list(/obj/item/clothing/accessory/holster/hip) },
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/glasses/fakesunglasses,
		/obj/item/clothing/mask/fakemoustache,
		/obj/item/clothing/head/beret,
		/obj/item/gun/projectile/revolver/capgun,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/cowboy
	name = "cowboy costume"
	starts_with = list(
		/obj/item/clothing/under/pants{ starting_accessories=list(/obj/item/clothing/accessory/holster/hip) },
		/obj/item/clothing/shoes/boots/cowboy,
		/obj/item/clothing/head/cowboy,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/clothing/accessory/poncho,
		/obj/item/gun/projectile/revolver/capgun,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/lumberjack
	name = "lumberjack costume"
	starts_with = list(
		/obj/item/clothing/under/pants{ starting_accessories=list(/obj/item/clothing/accessory/sweater/blackneck) },
		/obj/item/clothing/shoes/boots/workboots,
		/obj/item/clothing/head/beanie,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/clothing/suit/storage/flannel/red,
		/obj/item/material/twohanded/fireaxe/foam,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/firefighter
	name = "firefighter costume"
	starts_with = list(
		/obj/item/clothing/under/pants,
		/obj/item/clothing/shoes/boots/workboots,
		/obj/item/clothing/head/hardhat/firefighter,
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/suit/fire/firefighter,
		/obj/item/material/twohanded/fireaxe/foam,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/vampire
	name = "vampire costume"
	starts_with = list(
		/obj/item/clothing/under/suit_jacket/really_black,
		/obj/item/clothing/shoes/dress,
		/obj/item/clothing/gloves/white,
		/obj/item/bedsheet/red,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/vampirehunter
	name = "vampire hunter costume"
	starts_with = list(
		/obj/item/clothing/under/pants/tan,
		/obj/item/clothing/suit/storage/toggle/brown_jacket/sleeveless,
		/obj/item/clothing/shoes/boots/jackboots,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/gun/projectile/revolver/toy/crossbow/halloween,
		/obj/item/flashlight/color/red,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/pirate
	name = "pirate costume"
	starts_with = list(
		/obj/item/clothing/under/pirate,
		/obj/item/clothing/shoes/brown,
		/obj/item/clothing/head/pirate,
		/obj/item/clothing/suit/pirate,
		/obj/item/clothing/glasses/eyepatch,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/whiteout
	name = "snow ghost costume"
	starts_with = list(
		/obj/item/clothing/under/color/white{ starting_accessories=list(/obj/item/clothing/accessory/scarf/white) },
		/obj/item/clothing/shoes/white,
		/obj/item/clothing/suit/storage/hooded/chaplain_hoodie/whiteout,
		/obj/item/clothing/gloves/white,
		/obj/item/clothing/mask/surgical,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/marine
	name = "ruin marine costume"
	starts_with = list(
		/obj/item/clothing/under/color/grey,
		/obj/item/clothing/shoes/brown,
		/obj/item/clothing/head/marine,
		/obj/item/clothing/suit/marine,
		/obj/item/gun/projectile/revolver/toy/sawnoff,
		/obj/item/storage/bag/plasticbag/halloween
	)

/obj/item/storage/box/halloween/ghost
	name = "ghost costume"
	starts_with = list(
		/obj/item/clothing/mask/costume/ghost,
		/obj/item/storage/bag/plasticbag/halloween
	)
