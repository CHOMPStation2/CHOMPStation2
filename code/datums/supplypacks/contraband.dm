/*
*	Here is where any supply packs that may or may not be legal
*	  and require modification of the supply controller live.
*/


/datum/supply_pack/randomised/contraband
	num_contained = 5
	contains = list(
			/obj/item/seeds/bloodtomatoseed,
			/obj/item/weapon/storage/pill_bottle/zoom,
			/obj/item/weapon/storage/pill_bottle/happy,
			/obj/item/weapon/reagent_containers/food/drinks/bottle/pwine
			)

	name = "Contraband crate"
	cost = 500
	containertype = /obj/structure/closet/crate
	containername = "Unlabeled crate"
	contraband = 1
	group = "Supplies"

/datum/supply_pack/security/specialops
	name = "Special Ops supplies"
	contains = list(
			/obj/item/weapon/storage/box/emps,
			/obj/item/weapon/grenade/smokebomb = 4,
			/obj/item/weapon/grenade/chem_grenade/incendiary
			)
	cost = 500
	containertype = /obj/structure/closet/crate
	containername = "Special Ops crate"
	contraband = 1

/datum/supply_pack/supply/moghes
	name = "Moghes imports"
	contains = list(
			/obj/item/weapon/reagent_containers/food/drinks/bottle/redeemersbrew = 2,
			/obj/item/weapon/reagent_containers/food/snacks/unajerky = 4
			)
	cost = 25
	containertype = /obj/structure/closet/crate
	containername = "Moghes imports crate"
	contraband = 1

/datum/supply_pack/munitions/bolt_rifles_militia
 	name = "Weapon - Surplus militia rifles"
 	contains = list(
 			/obj/item/weapon/gun/projectile/shotgun/pump/rifle = 3,
 			/obj/item/ammo_magazine/clip/c762 = 6
 			)
 	cost = 1000
 	contraband = 1
 	containertype = /obj/structure/closet/crate/secure/weapon
 	containername = "Ballistic weapons crate"

/datum/supply_pack/randomised/misc/telecrate
	name = "Confiscated equipment"
	num_contained = 1
	contains = list(
			list( //the operator,
					/obj/item/clothing/suit/storage/vest/heavy/merc,
					/obj/item/clothing/glasses/night,
					/obj/item/weapon/storage/box/anti_photons
					),
			list( //the indian,
					/obj/item/weapon/gun/projectile/dartgun,
					/obj/item/ammo_magazine/chemdart
					),

			list( //the doc,
					/obj/item/weapon/storage/firstaid/combat,
					/obj/item/weapon/reagent_containers/hypospray
					),

			list( //the sapper,
					/obj/item/weapon/melee/energy/sword/ionic_rapier,
					/obj/item/weapon/storage/box/syndie_kit/space, //doesn't matter what species you are,
					/obj/item/device/multitool/ai_detector,
					/obj/item/weapon/storage/toolbox/syndicate/powertools
					),
			list( //the infiltrator,
					/obj/item/device/chameleon,
					/obj/item/weapon/storage/box/syndie_kit/chameleon,
					/obj/item/device/encryptionkey/syndicate,
					/obj/item/weapon/card/id/syndicate,
					/obj/item/clothing/mask/gas/voice,
					/obj/item/weapon/makeover
					),
			list( //the professional,
					/obj/item/weapon/gun/energy/ionrifle/pistol,
					/obj/item/weapon/material/knife/tacknife/combatknife,
					/obj/item/clothing/mask/balaclava
					)
			)
	cost = 400 //price,
	contraband = 1
	containertype = /obj/structure/largecrate
	containername = "Suspicious crate"
