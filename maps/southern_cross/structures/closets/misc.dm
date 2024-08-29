//Gun Cabinets

/obj/structure/closet/secure_closet/guncabinet/sidearm
	name = "emergency weapon cabinet"
	req_one_access = list(access_armory,access_captain)

	starts_with = list(
		/obj/item/gun/energy/gun = 4) // CHOMPEdit - Removal of obj/item/weapon


/obj/structure/closet/secure_closet/guncabinet/rifle
	name = "rifle cabinet"
	req_one_access = list(access_explorer,access_brig)

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
	name = "explorer weapon cabinet"
	req_one_access = list(access_explorer,access_brig)

	starts_with = list(
		/obj/item/gun/energy/locked/phasegun = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/locked/phasegun/pistol, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device/weapon = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/permit/gun/planetside)

//Explorer Lockers

/obj/structure/closet/secure_closet/explorer
	name = "explorer locker"
	req_access = list(access_explorer)

	starts_with = list(
		/obj/item/clothing/under/explorer,
		/obj/item/clothing/suit/armor/pcarrier/explorer/light,
		/obj/item/clothing/head/helmet/explorer,
		/obj/item/clothing/suit/storage/hooded/explorer,
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/storage/belt/explorer, //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/gloves/black,
		/obj/item/radio/headset/explorer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/explorer/alt, //CHOMPADD // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps/explorer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/box/flare, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/marker_beacon/thirty,
		/obj/item/reagent_containers/food/snacks/liquidfood, //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/liquidprotein, //CHOMPADD // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cataloguer // CHOMPEdit - Removal of obj/item/device
		)

/obj/structure/closet/secure_closet/explorer/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/norm // CHOMPEdit - Removal of obj/item/weapon
	if(prob(75))
		starts_with += /obj/item/material/knife/tacknife/survival // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/material/knife/machete // CHOMPEdit - Removal of obj/item/weapon
	return ..()

//SAR Lockers

/obj/structure/closet/secure_closet/sar
	name = "search and rescue locker"
	desc = "Supplies for a wilderness first responder."
	req_access = list(access_medical_equip)
	closet_appearance = /decl/closet_appearance/secure_closet/medical

	starts_with = list(
		/obj/item/storage/backpack/dufflebag/emt, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/autoinjectors, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/syringes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/inaprovaline, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/antitoxin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/medical/emt, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar,
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/radio/headset/sar, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cartridge/medical, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank/emergency/oxygen/engi, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses/hud/health,
		/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/off, // CHOMPEdit - Removal of obj/item/device
		/obj/random/medical,
		/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher/mini, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/freezer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/storage/white_vest,
		/obj/item/taperoll/medical,
		/obj/item/gps, // CHOMPEdit - Removal of obj/item/device
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/bodybag/cryobag)

//Pilot Locker

/obj/structure/closet/secure_closet/pilot
	name = "pilot locker"
	req_access = list(access_pilot)

	starts_with = list(
		/obj/item/storage/backpack/parachute, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/pilot,
		/obj/item/clothing/under/rank/pilot1,
		/obj/item/clothing/suit/storage/toggle/bomber/pilot,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/radio/headset/pilot/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/food/snacks/liquidfood, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/drinks/cans/waterbottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/flare, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio) // CHOMPEdit - Removal of obj/item/device

/obj/structure/closet/secure_closet/pilot/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/norm // CHOMPEdit - Removal of obj/item/weapon
	return ..()

//Exotic Seeds Crate

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
