/*
*	Here is where any supply packs that may or may not be legal
*	  and require modification of the supply controller live.
*/


/datum/supply_pack/randomised/contraband
	num_contained = 5
	contains = list(
			/obj/item/seeds/bloodtomatoseed,
			/obj/item/storage/pill_bottle/zoom, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/pill_bottle/happy, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/bottle/pwine // CHOMPEdit - Removal of obj/item/weapon
			)

	name = "Contraband crate"
	cost = 25
	containertype = /obj/structure/closet/crate
	containername = "Unlabeled crate"
	contraband = 1
	group = "Supplies"

/datum/supply_pack/security/specialops
	name = "Special Ops supplies"
	contains = list(
			/obj/item/storage/box/emps, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/grenade/smokebomb = 4, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/grenade/chem_grenade/incendiary // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 25
	containertype = /obj/structure/closet/crate/weapon
	containername = "Special Ops crate"
	contraband = 1

/datum/supply_pack/supply/moghes
	name = "Moghes imports"
	contains = list(
			/obj/item/reagent_containers/food/drinks/bottle/redeemersbrew = 2, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/snacks/unajerky = 4 // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 25
	containertype = /obj/structure/closet/crate/unathi
	containername = "Moghes imports crate"
	contraband = 1

/datum/supply_pack/munitions/bolt_rifles_militia
 	name = "Weapon - Surplus militia rifles"
 	contains = list(
 			/obj/item/gun/projectile/shotgun/pump/rifle = 3, // CHOMPEdit - Removal of obj/item/weapon
 			/obj/item/ammo_magazine/clip/c762 = 6
 			)
 	cost = 1000
 	contraband = 1
 	containertype = /obj/structure/closet/crate/hedberg
 	containername = "Ballistic weapons crate"

/datum/supply_pack/randomised/misc/telecrate
	name = "Confiscated equipment"
	num_contained = 1
	contains = list(
			list( //the operator,
					/obj/item/clothing/suit/storage/vest/heavy/merc,
					/obj/item/clothing/glasses/night,
					/obj/item/storage/box/anti_photons // CHOMPEdit - Removal of obj/item/weapon
					),
			list( //the indian,
					/obj/item/gun/projectile/dartgun, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/ammo_magazine/chemdart
					),

			list( //the doc,
					/obj/item/storage/firstaid/combat, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/reagent_containers/hypospray // CHOMPEdit - Removal of obj/item/weapon
					),

			list( //the sapper,
					/obj/item/melee/energy/sword/ionic_rapier, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/storage/box/syndie_kit/space, //doesn't matter what species you are, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/multitool/ai_detector, // CHOMPEdit - Removal of obj/item/device
					/obj/item/storage/toolbox/syndicate/powertools // CHOMPEdit - Removal of obj/item/weapon
					),
			list( //the infiltrator,
					/obj/item/chameleon, // CHOMPEdit - Removal of obj/item/device
					/obj/item/storage/box/syndie_kit/chameleon, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/encryptionkey/syndicate, // CHOMPEdit - Removal of obj/item/device
					/obj/item/card/id/syndicate, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/clothing/mask/gas/voice,
					/obj/item/makeover // CHOMPEdit - Removal of obj/item/weapon
					),
			list( //the professional,
					/obj/item/gun/energy/ionrifle/pistol, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/material/knife/tacknife/combatknife, // CHOMPEdit - Removal of obj/item/weapon
					/obj/item/clothing/mask/balaclava
					)
			)
	cost = 400 //price,
	contraband = 1
	containertype = /obj/structure/closet/crate/large
	containername = "Suspicious crate"
