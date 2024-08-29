/*
 * Closets for Virgo
 * Contains:
 *		Gun Cabinets
 *		Explorer
 *		Pathfinder
 *		SAR/Field Medic
 *		Pilot/Navigator
 *		Exotic Seeds
 *		Autolok Suit
 *		Emergency Suit (Wall)
 *
 */

/*
 * Gun Cabinets
 */
/obj/structure/closet/secure_closet/guncabinet/sidearm
	name = "emergency weapon cabinet"
	req_one_access = list(access_armory,access_captain)

	starts_with = list(
		/obj/item/gun/energy/gun = 4) // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/secure_closet/guncabinet/rifle
	name = "rifle cabinet"
	req_one_access = list(access_explorer,access_brig) //CHOMP explo keep

	starts_with = list(
		/obj/item/ammo_magazine/clip/c762/hunter = 9,
		/obj/item/gun/projectile/shotgun/pump/rifle = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/secure_closet/guncabinet/rifle/Initialize()
	if(prob(85))
		starts_with += /obj/item/gun/projectile/shotgun/pump/rifle // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/gun/projectile/shotgun/pump/rifle/lever // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/obj/structure/closet/secure_closet/guncabinet/phase
	name = "explorer weapon cabinet" //CHOMP explo keep
	req_one_access = list(access_explorer,access_brig) //CHOMP explo keep

	starts_with = list(
		/obj/item/gun/energy/locked/phasegun = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/locked/phasegun/pistol, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device/weapon = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/permit/gun/planetside)

/*
 * Explorer
 */
/obj/structure/closet/secure_closet/explorer
	name = "explorer locker" //CHOMP explo keep
	req_access = list(access_explorer) //CHOMP explo keep
	closet_appearance = /decl/closet_appearance/secure_closet/expedition/explorer

	starts_with = list(
		/obj/item/clothing/under/explorer,
		/obj/item/clothing/suit/storage/hooded/explorer,
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/storage/belt/explorer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/gloves/black,
		/obj/item/radio/headset/explorer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/explorer/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cartridge/explorer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps/explorer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/box/flare, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/marker_beacon/thirty,
		/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/machete, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/holster/machete,
		/obj/item/reagent_containers/food/snacks/liquidfood, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/liquidprotein, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cataloguer) // CHOMPEdit - Removal of obj/item/device

/obj/structure/closet/secure_closet/explorer/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/explorer // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/explorer // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/explorer // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/*
 * Pathfinder
 */
/obj/structure/closet/secure_closet/pathfinder
	name = "pathfinder locker"
	req_access = list(access_pathfinder) //CHOMP explo keep
	closet_appearance = /decl/closet_appearance/secure_closet/expedition/pathfinder

	starts_with = list(
		/obj/item/clothing/under/explorer,
		/obj/item/clothing/suit/storage/hooded/explorer,
		/obj/item/clothing/suit/armor/pcarrier/explorer/light, //CHOMPADD
		/obj/item/clothing/head/helmet/explorer, //CHOMPADD
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/storage/belt/explorer/pathfinder, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/gloves/black,
		/obj/item/radio/headset/pathfinder, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/pathfinder/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cartridge/explorer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps/explorer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/box/flare, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/explorerkeys, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/marker_beacon/thirty,
		/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/machete/deluxe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/holster/machete,
		/obj/random/explorer_shield,
		/obj/item/reagent_containers/food/snacks/liquidfood, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/liquidprotein, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cataloguer/compact/pathfinder, // CHOMPEdit - Removal of obj/item/device
		/obj/item/mapping_unit) // CHOMPEdit - Removal of obj/item/device

/obj/structure/closet/secure_closet/pathfinder/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/explorer //CHOMPEDIT // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/explorer //CHOMPEDIT START // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/explorer //CHOMPEDIT STOP // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/*
 * SAR/Field Medic
 */
/obj/structure/closet/secure_closet/sar
	name = "field medic locker"
	desc = "Supplies for a wilderness first responder."
	req_access = list(access_medical_equip)
	closet_appearance = /decl/closet_appearance/secure_closet/expedition/sar

	starts_with = list(
		/obj/item/storage/backpack/dufflebag/emt, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/autoinjectors, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/syringes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/inaprovaline, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/antitoxin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/medical/emt, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/locked/frontier/holdout, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/clothing/suit/storage/hooded/explorer/medic,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar,
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/radio/headset/sar, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/sar/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cartridge/sar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank/emergency/oxygen/engi, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses/hud/health,
		/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/off, // CHOMPEdit - Removal of obj/item/device
		/obj/random/medical,
		/obj/item/reagent_containers/food/snacks/liquidfood = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/liquidprotein = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher/mini, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/freezer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/storage/white_vest,
		/obj/item/taperoll/medical,
		/obj/item/gps/medical, // CHOMPEdit - Removal of obj/item/device
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/bodybag/cryobag,
		/obj/item/cataloguer/compact) // CHOMPEdit - Removal of obj/item/device

/obj/structure/closet/secure_closet/sar/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/medic // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/med // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/med // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/*
 * Pilot/Navigator
 */
/obj/structure/closet/secure_closet/pilot
	name = "pilot locker"
	req_access = list(access_pilot)
	closet_appearance = /decl/closet_appearance/secure_closet/expedition/pilot

	starts_with = list(
		/obj/item/storage/backpack/parachute, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/locked/frontier/holdout, //CHOMP explo keep // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/pilot_vr,
		/obj/item/clothing/under/rank/pilot1/no_webbing,
		/obj/item/clothing/suit/storage/toggle/bomber/pilot,
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/radio/headset/pilot, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/pilot/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/food/snacks/liquidfood, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/liquidprotein, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/drinks/cans/waterbottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/flare, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps/explorer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cataloguer/compact, //CHOMP edit // CHOMPEdit - Removal of obj/item/device
	//	/obj/item/gun/energy/gun/protector/pilotgun/locked, //CHOMP Removed // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/gloves/watch/survival,
		/obj/item/clothing/accessory/storage/webbing/pilot1,
		/obj/item/clothing/accessory/storage/webbing/pilot2,
		/obj/item/emergency_beacon // CHOMPEdit - Removal of obj/item/device
		)

/obj/structure/closet/secure_closet/pilot/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/norm // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/*
 * Exotic Seeds
 */
/obj/structure/closet/crate/hydroponics/exotic
	name = "exotic seeds crate"
	desc = "All you need to destroy that pesky planet."

	starts_with = list(
		/obj/item/seeds/random = 6,
		/obj/item/seeds/replicapod = 2,
		/obj/item/seeds/ambrosiavulgarisseed = 2,
		/obj/item/seeds/kudzuseed,
		/obj/item/seeds/libertymycelium,
		/obj/item/seeds/reishimycelium)

/*
 * Autolok Suit
 */
/obj/structure/closet/autolok_wall
	name = "autolok suit storage"
	desc = "It's wall-mounted storage unit for an AutoLok suit."
	icon = 'icons/obj/closets/bases/wall_double.dmi'
	closet_appearance = /decl/closet_appearance/wall_double/autolok
	open_sound = 'sound/machines/click.ogg'
	close_sound = 'sound/machines/click.ogg'
	anchored = TRUE
	density = FALSE
	wall_mounted = 1
	store_mobs = 0

	starts_with = list(
		/obj/item/clothing/suit/space/void/autolok,
		/obj/item/tank/emergency/oxygen/engi, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/suit_cooling_unit/emergency // CHOMPEdit - Removal of obj/item/device
	)

/*
 * Emergency Suit (Wall)
 */
/obj/structure/closet/emergsuit_wall
	name = "emergency suit storage"
	desc = "It's wall-mounted storage unit for an emergency suit."
	icon = 'icons/obj/closets/bases/wall.dmi'
	closet_appearance = /decl/closet_appearance/wall/emergency
	open_sound = 'sound/machines/click.ogg'
	close_sound = 'sound/machines/click.ogg'
	anchored = TRUE
	density = FALSE
	wall_mounted = 1
	store_mobs = 0

	starts_with = list(
		/obj/item/clothing/head/helmet/space/emergency,
		/obj/item/clothing/suit/space/emergency,
		/obj/item/tank/emergency/oxygen/engi, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/suit_cooling_unit/emergency // CHOMPEdit - Removal of obj/item/device
	)
