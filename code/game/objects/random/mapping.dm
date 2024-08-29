/*
//	Least descriptive filename?
//	This is where all of the things that aren't really loot should go.
//	Barricades, mines, etc.
*/

/obj/random/junk //Broken items, or stuff that could be picked up
	name = "random junk"
	desc = "This is some random junk."
	icon = 'icons/obj/trash.dmi'
	icon_state = "trashbag3"

/obj/random/junk/item_to_spawn()
	return get_random_junk_type()

/obj/random/trash //Mostly remains and cleanable decals. Stuff a janitor could clean up
	name = "random trash"
	desc = "This is some random trash."
	icon = 'icons/effects/effects.dmi'
	icon_state = "greenglow"

/obj/random/trash/item_to_spawn()
	return pick(/obj/effect/decal/remains/lizard,
				/obj/effect/decal/cleanable/blood/gibs/robot,
				/obj/effect/decal/cleanable/blood/oil,
				/obj/effect/decal/cleanable/blood/oil/streak,
				/obj/effect/decal/cleanable/bug_remains,
				/obj/effect/decal/remains/mouse,
				/obj/effect/decal/cleanable/vomit,
				/obj/effect/decal/cleanable/blood/splatter,
				/obj/effect/decal/cleanable/ash,
				/obj/effect/decal/cleanable/generic,
				/obj/effect/decal/cleanable/flour,
				/obj/effect/decal/cleanable/dirt,
				/obj/effect/decal/remains/robot)

/obj/random/crate //Random 'standard' crates for variety in maintenance spawns.
	name = "random crate"
	desc = "This is a random crate"
	icon = 'icons/obj/closets/bases/crate.dmi'
	icon_state = "base"

/obj/random/crate/item_to_spawn() //General crates, excludes some more high-grade and medical brands
	return pick (/obj/structure/closet/crate/plastic,
				/obj/structure/closet/crate/aether,
				/obj/structure/closet/crate/centauri,
				/obj/structure/closet/crate/einstein,
				/obj/structure/closet/crate/focalpoint,
				/obj/structure/closet/crate/gilthari,
				/obj/structure/closet/crate/grayson,
				/obj/structure/closet/crate/nanotrasen,
				/obj/structure/closet/crate/nanothreads,
				/obj/structure/closet/crate/oculum,
				/obj/structure/closet/crate/ward,
				/obj/structure/closet/crate/xion,
				/obj/structure/closet/crate/zenghu,
				/obj/structure/closet/crate/allico,
				/obj/structure/closet/crate/carp,
				/obj/structure/closet/crate/galaksi,
				/obj/structure/closet/crate/thinktronic,
				/obj/structure/closet/crate/ummarcar,
				/obj/structure/closet/crate/unathi,
				/obj/structure/closet/crate/hydroponics,
				/obj/structure/closet/crate/engineering,
				/obj/structure/closet/crate)

/obj/random/vendorall //Fully random selection of consumer vendors
	name = "random vending machine"
	desc = "This is a random vending machine"
	icon = 'icons/obj/vending.dmi'
	icon_state = "radren-off"

/obj/random/vendorall/item_to_spawn()
	return pick (prob(5);/obj/machinery/vending/coffee,	//VOREStation Edit Start - Let's weight this a little bit
				prob(5);/obj/machinery/vending/snack,
				prob(5);/obj/machinery/vending/cola,
				prob(3);/obj/machinery/vending/fitness,
				prob(4);/obj/machinery/vending/cigarette,
				prob(3);/obj/machinery/vending/giftvendor,
				prob(5);/obj/machinery/vending/weeb,
				prob(5);/obj/machinery/vending/sol,
				prob(5);/obj/machinery/vending/snix,
				prob(5);/obj/machinery/vending/snlvend,
				prob(5);/obj/machinery/vending/sovietsoda,
				prob(5);/obj/machinery/vending/sovietvend,
				prob(5);/obj/machinery/vending/radren,
				prob(3);/obj/machinery/vending/altevian,
				prob(5);/obj/machinery/vending/desatti,
				prob(5);/obj/machinery/vending/nukie) //VOREStation Edit End

/obj/random/vendorfood //Random food vendors for station use
	name = "random snack vending machine"
	desc = "This is a random food vending machine"
	icon = 'icons/obj/vending.dmi'
	icon_state = "snack"

/obj/random/vendorfood/item_to_spawn()
	return pick (/obj/machinery/vending/snack,
				/obj/machinery/vending/weeb,
				/obj/machinery/vending/sol,
				/obj/machinery/vending/snix,
				/obj/machinery/vending/snlvend,
				/obj/machinery/vending/altevian,
				/obj/machinery/vending/desatti)

/obj/random/vendordrink //Random drink vendors for station use
	name = "random drink vending machine"
	desc = "This is a random drink vending machine"
	icon = 'icons/obj/vending.dmi'
	icon_state = "Cola_Machine"

//VOREStation Edit Start
/obj/random/vendordrink/item_to_spawn() //Not including coffee as it's more specific in usage.
	return pick (/obj/machinery/vending/cola,
				/obj/machinery/vending/cola/soft,
				/obj/machinery/vending/bepis,
				/obj/machinery/vending/sovietsoda,
				/obj/machinery/vending/radren,
				/obj/machinery/vending/nukie)
//VOREStation Edit End

/obj/random/obstruction //Large objects to block things off in maintenance
	name = "random obstruction"
	desc = "This is a random obstruction."
	icon = 'icons/obj/cult.dmi'
	icon_state = "cultgirder"

/obj/random/obstruction/item_to_spawn()
	return pick(/obj/structure/barricade,
				/obj/structure/girder,
				/obj/structure/girder/displaced,
				/obj/structure/girder/reinforced,
				/obj/structure/grille,
				/obj/structure/grille/broken,
				/obj/structure/foamedmetal,
				/obj/structure/inflatable,
				/obj/structure/inflatable/door)

/obj/random/landmine
	name = "Random Land Mine"
	desc = "This is a random land mine."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "landmine"
	spawn_nothing_percentage = 25

/obj/random/landmine/item_to_spawn()
	return pick(prob(30);/obj/effect/mine,
				prob(25);/obj/effect/mine/frag,
				prob(25);/obj/effect/mine/emp,
				prob(15);/obj/effect/mine/camo,
				prob(15);/obj/effect/mine/emp/camo,
				prob(10);/obj/effect/mine/stun,
				prob(10);/obj/effect/mine/incendiary,)

/obj/random/humanoidremains
	name = "Random Humanoid Remains"
	desc = "This is a random pile of remains."
	spawn_nothing_percentage = 15
	icon = 'icons/effects/blood.dmi'
	icon_state = "remains"

/obj/random/humanoidremains/item_to_spawn()
	return pick(prob(30);/obj/effect/decal/remains/human,
				prob(25);/obj/effect/decal/remains/ribcage,
				prob(25);/obj/effect/decal/remains/tajaran,
				prob(10);/obj/effect/decal/remains/unathi,
				prob(10);/obj/effect/decal/remains/posi
				)

/obj/random/nukies_can_legal
	name = "Random Legal Nukies Can"
	desc = "This is a random can of (legal) Nukies Energy Drink."

/obj/random/nukies_can_legal/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/drinks/cans/nukie_peach, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/nukie_pear, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/nukie_cherry, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/nukie_melon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/nukie_banana, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/nukie_rose, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/nukie_lemon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/nukie_fruit, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/nukie_special) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/desatti_snacks
	name = "Random Desatti Snacks"
	desc = "This is a random Desatti Catering snack."

/obj/random/desatti_snacks/item_to_spawn()
	return pick(/obj/item/storage/box/jaffacake, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/winegum, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/saucer, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/shrimpsandbananas, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/rhubarbcustard, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/custardcream, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/bourbon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/packaged/sausageroll, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/packaged/pasty, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/packaged/scotchegg, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/packaged/porkpie) // CHOMPEdit - Removal of obj/item/weapon

/obj/random_multi/single_item/captains_spare_id
	name = "Multi Point - Captain's Spare"
	id = "Captain's spare id"
	item_path = /obj/item/card/id/gold/captain/spare // CHOMPEdit - Removal of obj/item/weapon

/obj/random_multi/single_item/hand_tele
	name = "Multi Point - Hand Teleporter"
	id = "hand tele"
	item_path = /obj/item/hand_tele // CHOMPEdit - Removal of obj/item/weapon

/obj/random_multi/single_item/sfr_headset
	name = "Multi Point - headset"
	id = "SFR headset"
	item_path = /obj/random/sfr

// This is in here because it's spawned by the SFR Headset randomizer
/obj/random/sfr
	name = "random SFR headset"
	desc = "This is a headset spawn."
	icon = 'icons/misc/mark.dmi'
	icon_state = "rup"

/obj/random/sfr/item_to_spawn()
	return pick(prob(25);/obj/item/radio/headset/heads/captain/sfr, // CHOMPEdit - Removal of obj/item/device
				prob(25);/obj/item/radio/headset/headset_cargo/alt, // CHOMPEdit - Removal of obj/item/device
				prob(25);/obj/item/radio/headset/headset_com/alt, // CHOMPEdit - Removal of obj/item/device
				prob(25);/obj/item/radio/headset) // CHOMPEdit - Removal of obj/item/device

// Mining Goodies
/obj/random/multiple/minevault
	name = "random vault loot"
	desc = "Loot for mine vaults."
	icon = 'icons/obj/storage.dmi'
	icon_state = "crate"

/obj/random/multiple/minevault/item_to_spawn()
	return pick(
			prob(5);list(
				/obj/item/clothing/mask/smokable/pipe,
				/obj/item/reagent_containers/food/drinks/bottle/rum, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/whiskey, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/grown/ambrosiadeus, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/flame/lighter/zippo, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/hydroponics
			),
			prob(5);list(
				/obj/item/pickaxe, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/under/rank/miner,
				/obj/item/clothing/head/hardhat,
				/obj/structure/closet/crate/engineering
			),
			prob(5);list(
				/obj/item/pickaxe/drill, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/suit/space/void/mining,
				/obj/item/clothing/head/helmet/space/void/mining,
				/obj/structure/closet/crate/engineering
			),
			prob(5);list(
				/obj/item/pickaxe/advdrill, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/suit/space/void/mining/alt,
				/obj/item/clothing/head/helmet/space/void/mining/alt,
				/obj/structure/closet/crate/engineering
			),
			prob(5);list(
				/obj/item/reagent_containers/glass/beaker/bluespace, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/glass/beaker/bluespace, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/glass/beaker/bluespace, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/science
			),
			prob(5);list(
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/engineering
			),
			prob(5);list(
				/obj/item/pickaxe, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/glasses/material,
				/obj/structure/ore_box,
				/obj/structure/closet/crate
			),
			prob(5);list(
				/obj/item/reagent_containers/glass/beaker/noreact, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/glass/beaker/noreact, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/glass/beaker/noreact, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/science
			),
			prob(5);list(
				/obj/item/storage/secure/briefcase/money, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/freezer/rations
			),
			prob(5);list(
				/obj/item/clothing/accessory/tie/horrible,
				/obj/item/clothing/accessory/tie/horrible,
				/obj/item/clothing/accessory/tie/horrible,
				/obj/item/clothing/accessory/tie/horrible,
				/obj/item/clothing/accessory/tie/horrible,
				/obj/item/clothing/accessory/tie/horrible,
				/obj/structure/closet/crate
			),
			prob(5);list(
				/obj/item/melee/baton, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/melee/baton, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/melee/baton, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/melee/baton, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate
			),
			prob(5);list(
				/obj/item/clothing/under/shorts/red,
				/obj/item/clothing/under/shorts/blue,
				/obj/structure/closet/crate
			),
			prob(2);list(
				/obj/item/melee/baton/cattleprod, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/melee/baton/cattleprod, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/high, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/high, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate
			),
			prob(2);list(
				/obj/item/latexballon,
				/obj/item/latexballon,
				/obj/structure/closet/crate
			),
			prob(2);list(
				/obj/item/toy/syndicateballoon,
				/obj/item/toy/syndicateballoon,
				/obj/structure/closet/crate
			),
			prob(2);list(
				/obj/item/rig/industrial/equipped, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/engineering
			),
			prob(2);list(
				/obj/item/clothing/head/kitty,
				/obj/item/clothing/head/kitty,
				/obj/item/clothing/head/kitty,
				/obj/item/clothing/head/kitty,
				/obj/structure/closet/crate
			),
			prob(2);list(
				/obj/random/coin,
				/obj/random/coin,
				/obj/random/coin,
				/obj/random/coin,
				/obj/random/coin,
				/obj/structure/closet/crate/plastic
			),
			prob(2);list(
				/obj/random/multiple/voidsuit,
				/obj/random/multiple/voidsuit,
				/obj/structure/closet/crate/engineering
			),
			prob(2);list(
				/obj/item/clothing/suit/space/syndicate/black/red,
				/obj/item/clothing/head/helmet/space/syndicate/black/red,
				/obj/item/clothing/suit/space/syndicate/black/red,
				/obj/item/clothing/head/helmet/space/syndicate/black/red,
				/obj/item/gun/projectile/automatic/mini_uzi, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/gun/projectile/automatic/mini_uzi, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ammo_magazine/m45uzi,
				/obj/item/ammo_magazine/m45uzi,
				/obj/item/ammo_magazine/m45uzi/empty,
				/obj/item/ammo_magazine/m45uzi/empty,
				/obj/structure/closet/crate/plastic
			),
			prob(2);list(
				/obj/item/clothing/suit/ianshirt,
				/obj/item/clothing/suit/ianshirt,
				/obj/item/bedsheet/ian, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/plastic
			),
			prob(2);list(
				/obj/item/clothing/suit/armor/vest,
				/obj/item/clothing/suit/armor/vest,
				/obj/item/gun/projectile/garand, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/gun/projectile/garand, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ammo_magazine/m762enbloc,
				/obj/item/ammo_magazine/m762enbloc,
				/obj/structure/closet/crate/plastic
			),
			prob(2);list(
				/obj/mecha/working/ripley/mining
			),
			prob(2);list(
				/obj/mecha/working/hoverpod/combatpod
			),
			prob(2);list(
				/obj/item/pickaxe/silver, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/glasses/material,
				/obj/structure/closet/crate/engineering
			),
			prob(2);list(
				/obj/item/pickaxe/advdrill, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/glasses/material,
				/obj/structure/closet/crate/engineering
			),
			prob(2);list(
				/obj/item/pickaxe/jackhammer, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/glasses/material,
				/obj/structure/closet/crate/engineering
			),
			prob(2);list(
				/obj/item/pickaxe/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/glasses/material,
				/obj/structure/closet/crate/engineering
			),
			prob(2);list(
				/obj/item/pickaxe/diamonddrill, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/glasses/material,
				/obj/structure/closet/crate/engineering
			),
			prob(2);list(
				/obj/item/pickaxe/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/glasses/material,
				/obj/structure/closet/crate/engineering
			),
			prob(2);list(
				/obj/item/pickaxe/plasmacutter, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/glasses/material,
				/obj/structure/closet/crate/engineering
			),
			prob(2);list(
				/obj/item/material/sword/katana, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/material/sword/katana, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate
			),
			prob(2);list(
				/obj/item/material/sword, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/material/sword, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate
			),
			prob(1);list(
				/obj/item/clothing/mask/balaclava,
				/obj/item/material/star, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/material/star, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/material/star, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/material/star, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate
			),
			prob(1);list(
				/obj/item/weed_extract,
				/obj/item/xenos_claw,
				/obj/structure/closet/crate/science
			),
			prob(1);list(
				/obj/item/clothing/head/bearpelt,
				/obj/item/clothing/under/soviet,
				/obj/item/clothing/under/soviet,
				/obj/item/gun/projectile/shotgun/pump/rifle/ceremonial, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/gun/projectile/shotgun/pump/rifle/ceremonial, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate
			),
			prob(1);list(
				/obj/item/gun/projectile/revolver/detective, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/gun/projectile/contender, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/gun/projectile/p92x, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/gun/projectile/derringer, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate
			),
			prob(1);list(
				/obj/item/melee/cultblade, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/suit/cultrobes,
				/obj/item/clothing/head/culthood,
				/obj/item/soulstone, // CHOMPEdit - Removal of obj/item/device
				/obj/structure/closet/crate
			),
			prob(1);list(
				/obj/item/vampiric, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/vampiric, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/science
			),
			prob(1);list(
				/obj/item/archaeological_find // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(1);list(
				/obj/item/melee/energy/sword, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/melee/energy/sword, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/melee/energy/sword, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/shield/energy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/shield/energy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/science
			),
			prob(1);list(
				/obj/item/storage/backpack/clown, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/under/rank/clown,
				/obj/item/clothing/shoes/clown_shoes,
				/obj/item/pda/clown, // CHOMPEdit - Removal of obj/item/device
				/obj/item/clothing/mask/gas/clown_hat,
				/obj/item/bikehorn, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/spray/waterflower, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/crayon/rainbow, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate
			),
			prob(1);list(
				/obj/item/clothing/under/mime,
				/obj/item/clothing/shoes/black,
				/obj/item/pda/mime, // CHOMPEdit - Removal of obj/item/device
				/obj/item/clothing/gloves/white,
				/obj/item/clothing/mask/gas/mime,
				/obj/item/clothing/head/beret,
				/obj/item/clothing/suit/suspenders,
				/obj/item/pen/crayon/mime, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate
			),
			prob(1);list(
				/obj/item/storage/belt/champion, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/mask/luchador,
				/obj/item/clothing/mask/luchador/rudos,
				/obj/item/clothing/mask/luchador/tecnicos,
				/obj/structure/closet/crate
			),
			prob(1);list(
				/obj/machinery/artifact,
				/obj/structure/anomaly_container
			),
			prob(1);list(
				/obj/random/curseditem,
				/obj/random/humanoidremains,
				/obj/structure/closet/crate
			)
		)

/obj/random/multiple/ore_pile
	name = "random ore pile"
	desc = "A pile of random ores. High chance of a larger pile of common ores, lower chances of small piles of rarer ores."
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore_clown"


/obj/random/multiple/ore_pile/item_to_spawn()
	return pick(
			/*prob(10);list(
				/obj/item/ore/bauxite, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/bauxite, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/bauxite, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/bauxite, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/bauxite, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/bauxite, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/bauxite, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/bauxite, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/bauxite, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/bauxite // CHOMPEdit - Removal of obj/item/weapon
			),*/
			prob(10);list(
				/obj/item/ore/coal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/coal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/coal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/coal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/coal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/coal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/coal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/coal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/coal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/coal // CHOMPEdit - Removal of obj/item/weapon
			),
			/*prob(10);list(
				/obj/item/ore/copper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/copper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/copper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/copper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/copper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/copper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/copper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/copper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/copper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/copper // CHOMPEdit - Removal of obj/item/weapon
			),*/
			prob(3);list(
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/diamond // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(15);list(
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/glass // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(5);list(
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/gold // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(2);list(
				/obj/item/ore/hydrogen, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/hydrogen // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(10);list(
				/obj/item/ore/iron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/iron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/iron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/iron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/iron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/iron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/iron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/iron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/iron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/iron // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(10);list(
				/obj/item/ore/lead, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/lead, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/lead, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/lead, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/lead, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/lead, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/lead, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/lead, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/lead, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/lead // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(5);list(
				/obj/item/ore/marble, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/marble, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/marble, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/marble, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/marble // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(3);list(
				/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/osmium // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(5);list(
				/obj/item/ore/phoron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/phoron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/phoron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/phoron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/phoron // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(5);list(
				/obj/item/ore/rutile, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/rutile, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/rutile, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/rutile, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/rutile // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(5);list(
				/obj/item/ore/silver, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/silver, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/silver, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/silver, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/silver // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(3);list(
				/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/uranium // CHOMPEdit - Removal of obj/item/weapon
			),
			prob(2);list(
				/obj/item/ore/verdantium, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/verdantium // CHOMPEdit - Removal of obj/item/weapon
			),/*
			prob(2);list(
				/obj/item/ore/void_opal, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/ore/void_opal // CHOMPEdit - Removal of obj/item/weapon
			),*/
		)

/obj/random/multiple/corp_crate
	name = "random corporate crate"
	desc = "A random corporate crate with thematic contents."
	icon = 'icons/obj/storage.dmi'
	icon_state = "crate"

/obj/random/multiple/corp_crate/item_to_spawn()
	return pick(
			prob(10);list(
				/obj/random/tank,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/aether //AETHER AIRSUPPLY
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/aether //AETHER OLDSUITS
			),
			prob(10);list(
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/structure/closet/crate/centauri //CENTAURI MRES
			),
			prob(10);list(
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/structure/closet/crate/freezer/centauri //CENTAURI SODA
			),
			prob(10);list(
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/structure/closet/crate/freezer/centauri //CENTAURI SNACKS
			),
			prob(10);list(
				/obj/item/storage/box/donkpockets, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/freezer/centauri //CENTAURI DONK-POCKETS
			),
			prob(10);list(
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/structure/closet/crate/einstein //EINSTEIN BATTERYPACK
			),
			prob(5);list(
				/obj/item/circuitboard/smes, // CHOMPEdit - Removal of obj/item/weapon
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/structure/closet/crate/focalpoint //FOCAL SMES
			),
			prob(10);list(
				/obj/item/module/power_control, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/stack/cable_coil,
				/obj/item/frame/apc,
				/obj/item/cell/apc, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/focalpoint //FOCAL APC
			),
			prob(5);list(
				/obj/random/drinkbottle,
				/obj/random/drinkbottle,
				/obj/random/drinkbottle,
				/obj/random/cigarettes,
				/obj/random/cigarettes,
				/obj/random/cigarettes,
				/obj/structure/closet/crate/gilthari //GILTHARI LUXURY
			),
			prob(10);list(
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/structure/closet/crate/grayson //GRAYSON TECH
			),
			prob(15);list(
				/obj/random/multiple/ore_pile,
				/obj/random/multiple/ore_pile,
				/obj/random/multiple/ore_pile,
				/obj/random/multiple/ore_pile,
				/obj/structure/closet/crate/grayson //GRAYSON ORES
			),
			prob(10);list(
				/obj/random/material/refined,
				/obj/random/material/refined,
				/obj/random/material/refined,
				/obj/random/material/refined,
				/obj/structure/closet/crate/grayson //GRAYSON MATS
			),
			prob(2);list(
				/obj/random/energy,
				/obj/random/energy,
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/secure/heph //HEPHAESTUS ENERGY
			),
			prob(1);list(
				/obj/random/grenade/box,
				/obj/random/grenade/box,
				/obj/structure/closet/crate/secure/heph //HEPHAESTUS GRENADES
			),
			prob(2);list(
				/obj/random/projectile/random,
				/obj/random/projectile/random,
				/obj/structure/closet/crate/secure/lawson //LAWSON PROJECTILE
			),
			prob(3);list(
				/obj/random/grenade/less_lethal,
				/obj/random/grenade/less_lethal,
				/obj/random/grenade/less_lethal,
				/obj/random/grenade/less_lethal,
				/obj/structure/closet/crate/secure/nanotrasen //NTSEC CROWD GRENADES
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/security,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/secure/nanotrasen //NTSEC SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/medical,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/secure/veymed //VM SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/mining,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/grayson //GRAYSON SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/engineering,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/xion //XION SUIT
			),
			prob(5);list(
				/obj/item/clothing/suit/space/void/salvagecorp_shipbreaker,
				/obj/item/clothing/head/helmet/space/void/salvagecorp_shipbreaker,
				/obj/item/tank/jetpack/breaker, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/coyote_salvage //CSC SUIT
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/medical,
				/obj/random/medical,
				/obj/random/medical,
				/obj/random/medical/lite,
				/obj/random/medical/lite,
				/obj/structure/closet/crate/veymed //VM GRABBAG
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/structure/closet/crate/freezer/veymed //VM FAKS
			),
			prob(5);list(
				/obj/random/internal_organ,
				/obj/random/internal_organ,
				/obj/random/internal_organ,
				/obj/random/internal_organ,
				/obj/structure/closet/crate/freezer/veymed //VM ORGANSES
			),
			prob(10);list(
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/structure/closet/crate/xion //XION SUPPLY
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/medical,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/lite,
				/obj/random/medical/lite,
				/obj/structure/closet/crate/freezer/zenghu //ZENGHU GRABBAG
			),
			prob(10);list(
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/structure/closet/crate/freezer/zenghu //ZENGHU PILLS
			),
			prob(10);list(
				/obj/item/toner, // CHOMPEdit - Removal of obj/item/device
				/obj/item/toner, // CHOMPEdit - Removal of obj/item/device
				/obj/item/toner, // CHOMPEdit - Removal of obj/item/device
				/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/red, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/camera_film, // CHOMPEdit - Removal of obj/item/device
				/obj/item/folder/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/folder/red, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/folder/yellow, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/hand_labeler, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tape_roll, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/paper_bin, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/sticky_pad/random,
				/obj/structure/closet/crate/ummarcar //UMMARCAR OFFICE TRASH
			),
			prob(5);list(
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/unathi //UNAJERKY
			),
			prob(10);list(
				/obj/item/reagent_containers/glass/bucket, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/mop, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/under/rank/janitor,
				/obj/item/cartridge/janitor, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/gloves/black,
				/obj/item/clothing/head/soft/purple,
				/obj/item/storage/belt/janitor, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/shoes/galoshes,
				/obj/item/clothing/glasses/hud/janitor,
				/obj/item/storage/bag/trash, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/lightreplacer, // CHOMPEdit - Removal of obj/item/device
				/obj/item/reagent_containers/spray/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/glass/rag, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/galaksi //GALAKSI JANITOR SUPPLIES
			),
			prob(5);list(
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/allico //GUMMIES
			),
			prob(5);list(
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/structure/closet/crate/nukies // NUKIES DRANKS
			),
			prob(5);list(
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/structure/closet/crate/desatti //DESATTI SNACKI
			),
			prob(2);list(
				/obj/item/tank/phoron/pressurized, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tank/phoron/pressurized, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/secure/phoron //HQ FUEL TANKS
			),
			prob(1);list(
				/obj/random/contraband/nofail,
				/obj/random/contraband/nofail,
				/obj/random/unidentified_medicine/combat_medicine,
				/obj/random/unidentified_medicine/combat_medicine,
				/obj/random/projectile/random,
				/obj/random/projectile/random,
				/obj/random/mre,
				/obj/random/mre,
				/obj/structure/closet/crate/secure/saare //SAARE GRAB BAG
			),
			prob(2);list(
				/obj/random/grenade,
				/obj/random/grenade,
				/obj/random/grenade,
				/obj/random/grenade,
				/obj/random/grenade,
				/obj/random/grenade,
				/obj/structure/closet/crate/secure/saare //SAARE GRENADES
			),
			prob(1);list(
				/obj/random/material/precious,
				/obj/random/material/precious,
				/obj/random/material/precious,
				/obj/random/material/precious,
				/obj/structure/closet/crate/secure/saare //SAARE BULLION CRATE
			),
			prob(1);list(
				/obj/random/cash/big,
				/obj/random/cash/big,
				/obj/random/cash/big,
				/obj/random/cash/huge,
				/obj/random/cash/huge,
				/obj/random/cash/huge,
				/obj/structure/closet/crate/secure/saare //SAARE CASH CRATE
			)
		)

/obj/random/multiple/corp_crate/no_weapons
	name = "random corporate crate (no weapons)"
	desc = "A random corporate crate with thematic contents. No weapons."
	icon = 'icons/obj/storage.dmi'
	icon_state = "crate"

/obj/random/multiple/corp_crate/no_weapons/item_to_spawn()
	return pick(
			prob(10);list(
				/obj/random/tank,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/aether //AETHER AIRSUPPLY
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/aether //AETHER OLDSUITS
			),
			prob(10);list(
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/structure/closet/crate/centauri //CENTAURI MRES
			),
			prob(10);list(
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/structure/closet/crate/freezer/centauri //CENTAURI SODA
			),
			prob(10);list(
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/structure/closet/crate/freezer/centauri //CENTAURI SNACKS
			),
			prob(10);list(
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/structure/closet/crate/einstein //EINSTEIN BATTERYPACK
			),
			prob(5);list(
				/obj/item/circuitboard/smes, // CHOMPEdit - Removal of obj/item/weapon
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/structure/closet/crate/focalpoint //FOCAL SMES
			),
			prob(10);list(
				/obj/item/module/power_control, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/stack/cable_coil,
				/obj/item/frame/apc,
				/obj/item/cell/apc, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/focalpoint //FOCAL APC
			),
			prob(5);list(
				/obj/random/drinkbottle,
				/obj/random/drinkbottle,
				/obj/random/drinkbottle,
				/obj/random/cigarettes,
				/obj/random/cigarettes,
				/obj/random/cigarettes,
				/obj/structure/closet/crate/gilthari //GILTHARI LUXURY
			),
			prob(10);list(
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/structure/closet/crate/grayson //GRAYSON TECH
			),
			prob(15);list(
				/obj/random/multiple/ore_pile,
				/obj/random/multiple/ore_pile,
				/obj/random/multiple/ore_pile,
				/obj/random/multiple/ore_pile,
				/obj/structure/closet/crate/grayson //GRAYSON ORES
			),
			prob(10);list(
				/obj/random/material/refined,
				/obj/random/material/refined,
				/obj/random/material/refined,
				/obj/random/material/refined,
				/obj/structure/closet/crate/grayson //GRAYSON MATS
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/security,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/secure/nanotrasen //NTSEC SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/medical,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/secure/veymed //VM SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/mining,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/grayson //GRAYSON SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/engineering,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/xion //XION SUIT
			),
			prob(5);list(
				/obj/item/clothing/suit/space/void/salvagecorp_shipbreaker,
				/obj/item/clothing/head/helmet/space/void/salvagecorp_shipbreaker,
				/obj/item/tank/jetpack/breaker, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/coyote_salvage //CSC SUIT
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/medical,
				/obj/random/medical,
				/obj/random/medical,
				/obj/random/medical/lite,
				/obj/random/medical/lite,
				/obj/structure/closet/crate/freezer/veymed //VM GRABBAG
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/structure/closet/crate/freezer/veymed //VM FAKS
			),
			prob(5);list(
				/obj/random/internal_organ,
				/obj/random/internal_organ,
				/obj/random/internal_organ,
				/obj/random/internal_organ,
				/obj/structure/closet/crate/freezer/veymed //VM ORGANSES
			),
			prob(10);list(
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/structure/closet/crate/xion //XION SUPPLY
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/medical,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/lite,
				/obj/random/medical/lite,
				/obj/structure/closet/crate/freezer/zenghu //ZENGHU GRABBAG
			),
			prob(10);list(
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/structure/closet/crate/freezer/zenghu //ZENGHU PILLS
			),
			prob(10);list(
				/obj/item/toner, // CHOMPEdit - Removal of obj/item/device
				/obj/item/toner, // CHOMPEdit - Removal of obj/item/device
				/obj/item/toner, // CHOMPEdit - Removal of obj/item/device
				/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/red, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/camera_film, // CHOMPEdit - Removal of obj/item/device
				/obj/item/folder/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/folder/red, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/folder/yellow, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/hand_labeler, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tape_roll, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/paper_bin, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/sticky_pad/random,
				/obj/structure/closet/crate/ummarcar //UMMARCAR OFFICE TRASH
			),
			prob(5);list(
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/unathi //UNAJERKY
			),
			prob(10);list(
				/obj/item/reagent_containers/glass/bucket, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/mop, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/under/rank/janitor,
				/obj/item/cartridge/janitor, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/gloves/black,
				/obj/item/clothing/head/soft/purple,
				/obj/item/storage/belt/janitor, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/shoes/galoshes,
				/obj/item/clothing/glasses/hud/janitor,
				/obj/item/storage/bag/trash, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/lightreplacer, // CHOMPEdit - Removal of obj/item/device
				/obj/item/reagent_containers/spray/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/glass/rag, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/galaksi //GALAKSI JANITOR SUPPLIES
			),
			prob(5);list(
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/allico //GUMMIES
			),
			prob(5);list(
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/structure/closet/crate/nukies // NUKIES DRANKS
			),
			prob(5);list(
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/structure/closet/crate/desatti //DESATTI SNACKI
			),
			prob(2);list(
				/obj/item/tank/phoron/pressurized, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tank/phoron/pressurized, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/secure/phoron //HQ FUEL TANKS
			),
			prob(1);list(
				/obj/random/material/precious,
				/obj/random/material/precious,
				/obj/random/material/precious,
				/obj/random/material/precious,
				/obj/structure/closet/crate/secure/saare //SAARE BULLION CRATE
			),
			prob(1);list(
				/obj/random/cash/big,
				/obj/random/cash/big,
				/obj/random/cash/big,
				/obj/random/cash/huge,
				/obj/random/cash/huge,
				/obj/random/cash/huge,
				/obj/structure/closet/crate/secure/saare //SAARE CASH CRATE
			)
		)

/obj/random/multiple/large_corp_crate
	name = "random large corporate crate"
	desc = "A random large corporate crate with thematic contents."
	icon = 'icons/obj/storage.dmi'
	icon_state = "largermetal"

/obj/random/multiple/large_corp_crate/item_to_spawn()
	return pick(
			prob(30);list(
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/large/aether //AETHER SUITSBOX
			),
			prob(30);list(
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/structure/closet/crate/large/einstein //EIN BATTERY MEGAPACK
			),
			prob(20);list(
				/obj/item/circuitboard/smes, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/circuitboard/smes, // CHOMPEdit - Removal of obj/item/weapon
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/structure/closet/crate/large/einstein //EIN SMESBOX
			),
			prob(2);list(
				/obj/random/energy,
				/obj/random/energy,
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/random/energy,
				/obj/random/energy,
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/large/secure/heph //HEPH ENERGY
			),
			prob(2);list(
				/obj/random/projectile/random,
				/obj/random/projectile/random,
				/obj/random/projectile/random,
				/obj/random/projectile/random,
				/obj/structure/closet/crate/large/secure/heph //HEPH BALLISTICS
			),
			prob(20);list(
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/structure/closet/crate/large/xion //XION TECH SUPPLY
			),
			prob(20);list(
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/structure/closet/crate/large/secure/xion //XION TECH COMPS
			)
		)

/obj/random/multiple/large_corp_crate/no_weapons
	name = "random large corporate crate (no weapons)"
	desc = "A random large corporate crate with thematic contents. No weapons."
	icon = 'icons/obj/storage.dmi'
	icon_state = "largermetal"

/obj/random/multiple/large_corp_crate/no_weapons/item_to_spawn()
	return pick(
			prob(30);list(
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/large/aether //AETHER SUITSBOX
			),
			prob(30);list(
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/structure/closet/crate/large/einstein //EIN BATTERY MEGAPACK
			),
			prob(20);list(
				/obj/item/circuitboard/smes, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/circuitboard/smes, // CHOMPEdit - Removal of obj/item/weapon
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/structure/closet/crate/large/einstein //EIN SMESBOX
			),
			prob(20);list(
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/structure/closet/crate/large/xion //XION TECH SUPPLY
			),
			prob(20);list(
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/structure/closet/crate/large/secure/xion //XION TECH COMPS
			)
		)

//recursion crate!
/obj/random/multiple/random_size_crate
	name = "random size corporate crate"
	desc = "A random size corporate crate with thematic contents: prefers small crates."
	icon = 'icons/obj/storage.dmi'
	icon_state = "largermetal"

/obj/random/multiple/random_size_crate/item_to_spawn()
	return pick(
			prob(85);list(
				/obj/random/multiple/corp_crate
			),
			prob(15);list(
				/obj/random/multiple/large_corp_crate
			)
		)
//VOREStation Add - Random good, no guns gooder
/obj/random/multiple/random_size_crate/no_weapons
	name = "random size corporate crate (no weapons)"
	desc = "A random size corporate crate with thematic contents: prefers small crates."
	icon = 'icons/obj/storage.dmi'
	icon_state = "largermetal"
	spawn_nothing_percentage = 50

/obj/random/multiple/random_size_crate/no_weapons/item_to_spawn()
	return pick(
			prob(85);list(
				/obj/random/multiple/corp_crate/no_weapons
			),
			prob(15);list(
				/obj/random/multiple/large_corp_crate/no_weapons
			)
		)

/obj/random/multiple/random_size_crate/no_weapons/nofail
	spawn_nothing_percentage = 0

//VOREStation Add End
/*
 * Turf swappers.
 */

/obj/random/turf
	name = "random Sif turf"
	desc = "This is a random Sif turf."

	spawn_nothing_percentage = 20

	var/override_outdoors = FALSE	// Do we override our chosen turf's outdoors?
	var/turf_outdoors = OUTDOORS_AREA	// Will our turf be outdoors?

/obj/random/turf/spawn_item()
	var/build_path = item_to_spawn()

	var/turf/T1 = get_turf(src)
	T1.ChangeTurf(build_path, 1, 1, FALSE)

	if(override_outdoors)
		T1.outdoors = turf_outdoors

/obj/random/turf/item_to_spawn()
	return pick(prob(25);/turf/simulated/floor/outdoors/grass/sif,
				prob(25);/turf/simulated/floor/outdoors/dirt,
				prob(25);/turf/simulated/floor/outdoors/grass/sif/forest,
				prob(25);/turf/simulated/floor/outdoors/rocks)

/obj/random/turf/lava
	name = "random Lava spawn"
	desc = "This is a random lava spawn."

	override_outdoors = TRUE
	turf_outdoors = OUTDOORS_NO

/obj/random/turf/lava/item_to_spawn()
	return pick(prob(5);/turf/simulated/floor/lava,
				prob(3);/turf/simulated/floor/outdoors/rocks/caves,
				prob(1);/turf/simulated/mineral/ignore_mapgen/cave)

//VOREStation Add Start - Underdark stuff that would be cool if existed if the underdark doesn't.

/obj/random/underdark
	name = "random underdark loot"
	desc = "Random loot for Underdark."
	icon = 'icons/obj/items.dmi'
	icon_state = "spickaxe"

/obj/random/underdark/item_to_spawn()
	return pick(prob(3);/obj/random/multiple/underdark/miningdrills,
				prob(3);/obj/random/multiple/underdark/ores,
				prob(2);/obj/random/multiple/underdark/treasure,
				prob(1);/obj/random/multiple/underdark/mechtool)

/obj/random/underdark/uncertain
	icon_state = "upickaxe"
	spawn_nothing_percentage = 65	//only 33% to spawn loot

/obj/random/multiple/underdark/miningdrills
	name = "random underdark mining tool loot"
	desc = "Random mining tool loot for Underdark."
	icon = 'icons/obj/items.dmi'
	icon_state = "spickaxe"

/obj/random/multiple/underdark/miningdrills/item_to_spawn()
	return pick(
				prob(10);list(/obj/item/pickaxe/silver), // CHOMPEdit - Removal of obj/item/weapon
				prob(8);list(/obj/item/pickaxe/drill), // CHOMPEdit - Removal of obj/item/weapon
				prob(6);list(/obj/item/pickaxe/advdrill), // CHOMPEdit - Removal of obj/item/weapon
				prob(6);list(/obj/item/pickaxe/jackhammer), // CHOMPEdit - Removal of obj/item/weapon
				prob(5);list(/obj/item/pickaxe/gold), // CHOMPEdit - Removal of obj/item/weapon
				prob(4);list(/obj/item/pickaxe/plasmacutter), // CHOMPEdit - Removal of obj/item/weapon
				prob(2);list(/obj/item/pickaxe/diamond), // CHOMPEdit - Removal of obj/item/weapon
				prob(1);list(/obj/item/pickaxe/diamonddrill) // CHOMPEdit - Removal of obj/item/weapon
				)

/obj/random/multiple/underdark/ores
	name = "random underdark mining ore loot"
	desc = "Random mining utility loot for Underdark."
	icon = 'icons/obj/mining.dmi'
	icon_state = "satchel"

/obj/random/multiple/underdark/ores/item_to_spawn()
	return pick(
				prob(9);list(
							/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/shovel, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/glass, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/hydrogen, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/hydrogen, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/hydrogen, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/hydrogen, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/hydrogen, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/hydrogen // CHOMPEdit - Removal of obj/item/weapon
							),
				prob(7);list(
							/obj/item/storage/bag/ore, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/pickaxe, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/osmium // CHOMPEdit - Removal of obj/item/weapon
							),
				prob(4);list(
							/obj/item/clothing/suit/radiation,
							/obj/item/clothing/head/radiation,
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/uranium), // CHOMPEdit - Removal of obj/item/weapon
				prob(2);list(
							/obj/item/flashlight/lantern, // CHOMPEdit - Removal of obj/item/device
							/obj/item/clothing/glasses/material,
							/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/diamond, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/diamond // CHOMPEdit - Removal of obj/item/weapon
							),
				prob(1);list(
							/obj/item/mining_scanner, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/shovel/spade, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/verdantium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/verdantium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/verdantium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/verdantium, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/ore/verdantium // CHOMPEdit - Removal of obj/item/weapon
							)
				)

/obj/random/multiple/underdark/treasure
	name = "random underdark treasure"
	desc = "Random treasure loot for Underdark."
	icon = 'icons/obj/storage.dmi'
	icon_state = "cashbag"

/obj/random/multiple/underdark/treasure/item_to_spawn()
	return pick(
				prob(5);list(
							/obj/random/coin,
							/obj/random/coin,
							/obj/random/coin,
							/obj/random/coin,
							/obj/random/coin,
							/obj/item/clothing/head/pirate
							),
				prob(4);list(
							/obj/item/storage/bag/cash, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/spacecash/c500, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/spacecash/c100, // CHOMPEdit - Removal of obj/item/weapon
							/obj/item/spacecash/c50 // CHOMPEdit - Removal of obj/item/weapon
							),
				prob(3);list(
							/obj/item/clothing/head/hardhat/orange,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold,
							/obj/item/stack/material/gold),
				prob(1);list(
							/obj/item/stack/material/phoron,
							/obj/item/stack/material/phoron,
							/obj/item/stack/material/phoron,
							/obj/item/stack/material/phoron,
							/obj/item/stack/material/diamond,
							/obj/item/stack/material/diamond,
							/obj/item/stack/material/diamond
							)
				)

/obj/random/multiple/underdark/mechtool
	name = "random underdark mech equipment"
	desc = "Random mech equipment loot for Underdark."
	icon = 'icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_clamp"

/obj/random/multiple/underdark/mechtool/item_to_spawn()
	return pick(
				prob(12);list(/obj/item/mecha_parts/mecha_equipment/tool/drill),
				prob(10);list(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp),
				prob(8);list(/obj/item/mecha_parts/mecha_equipment/generator),
				prob(7);list(/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot/rigged),
				prob(6);list(/obj/item/mecha_parts/mecha_equipment/repair_droid),
				prob(3);list(/obj/item/mecha_parts/mecha_equipment/gravcatapult),
				prob(2);list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser),
				prob(2);list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/flamer/rigged),
				prob(1);list(/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill),
				)
//VOREStation Add End

/obj/random/multiple/corp_crate_supply
	name = "random corporate supply crate"
	desc = "A random corporate crate with thematic contents. No weapons."
	icon = 'icons/obj/storage.dmi'
	icon_state = "crate"

/obj/random/multiple/corp_crate_supply/item_to_spawn()
	return pick(
			prob(10);list(
				/obj/random/tank,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/aether //AETHER AIRSUPPLY
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/aether //AETHER OLDSUITS
			),
			prob(10);list(
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/structure/closet/crate/centauri //CENTAURI MRES
			),
			prob(10);list(
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/structure/closet/crate/freezer/centauri //CENTAURI SODA
			),
			prob(10);list(
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/structure/closet/crate/freezer/centauri //CENTAURI SNACKS
			),
			prob(10);list(
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/structure/closet/crate/einstein //EINSTEIN BATTERYPACK
			),
			prob(5);list(
				/obj/item/circuitboard/smes, // CHOMPEdit - Removal of obj/item/weapon
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/structure/closet/crate/focalpoint //FOCAL SMES
			),
			prob(10);list(
				/obj/item/module/power_control, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/stack/cable_coil,
				/obj/item/frame/apc,
				/obj/item/cell/apc, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/focalpoint //FOCAL APC
			),
			prob(5);list(
				/obj/random/drinkbottle,
				/obj/random/drinkbottle,
				/obj/random/drinkbottle,
				/obj/random/cigarettes,
				/obj/random/cigarettes,
				/obj/random/cigarettes,
				/obj/structure/closet/crate/gilthari //GILTHARI LUXURY
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/security,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/secure/nanotrasen //NTSEC SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/medical,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/secure/veymed //VM SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/mining,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/grayson //GRAYSON SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/engineering,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/xion //XION SUIT
			),
			prob(5);list(
				/obj/item/clothing/suit/space/void/salvagecorp_shipbreaker,
				/obj/item/clothing/head/helmet/space/void/salvagecorp_shipbreaker,
				/obj/item/tank/jetpack/breaker, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/coyote_salvage //CSC SUIT
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/medical,
				/obj/random/medical,
				/obj/random/medical,
				/obj/random/medical/lite,
				/obj/random/medical/lite,
				/obj/structure/closet/crate/freezer/veymed //VM GRABBAG
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/structure/closet/crate/freezer/veymed //VM FAKS
			),
			prob(5);list(
				/obj/random/internal_organ,
				/obj/random/internal_organ,
				/obj/random/internal_organ,
				/obj/random/internal_organ,
				/obj/structure/closet/crate/freezer/veymed //VM ORGANSES
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/medical,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/lite,
				/obj/random/medical/lite,
				/obj/structure/closet/crate/freezer/zenghu //ZENGHU GRABBAG
			),
			prob(10);list(
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/structure/closet/crate/freezer/zenghu //ZENGHU PILLS
			),
			prob(10);list(
				/obj/item/toner, // CHOMPEdit - Removal of obj/item/device
				/obj/item/toner, // CHOMPEdit - Removal of obj/item/device
				/obj/item/toner, // CHOMPEdit - Removal of obj/item/device
				/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/red, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/pen/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/camera_film, // CHOMPEdit - Removal of obj/item/device
				/obj/item/folder/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/folder/red, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/folder/yellow, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/hand_labeler, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tape_roll, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/paper_bin, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/sticky_pad/random,
				/obj/structure/closet/crate/ummarcar //UMMARCAR OFFICE TRASH
			),
			prob(5);list(
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/unathi //UNAJERKY
			),
			prob(10);list(
				/obj/item/reagent_containers/glass/bucket, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/mop, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/under/rank/janitor,
				/obj/item/cartridge/janitor, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/gloves/black,
				/obj/item/clothing/head/soft/purple,
				/obj/item/storage/belt/janitor, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/shoes/galoshes,
				/obj/item/clothing/glasses/hud/janitor,
				/obj/item/storage/bag/trash, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/lightreplacer, // CHOMPEdit - Removal of obj/item/device
				/obj/item/reagent_containers/spray/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/glass/rag, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/galaksi //GALAKSI JANITOR SUPPLIES
			),
			prob(5);list(
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/allico //GUMMIES
			),
			prob(5);list(
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/random/nukies_can_legal,
				/obj/structure/closet/crate/nukies // NUKIES DRANKS
			),
			prob(5);list(
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/random/desatti_snacks,
				/obj/structure/closet/crate/desatti //DESATTI SNACKI
			),
			prob(2);list(
				/obj/item/tank/phoron/pressurized, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tank/phoron/pressurized, // CHOMPEdit - Removal of obj/item/weapon
				/obj/structure/closet/crate/secure/phoron //HQ FUEL TANKS
			),
		)
