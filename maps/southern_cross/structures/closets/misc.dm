//Gun Cabinets

/obj/structure/closet/secure_closet/guncabinet/sidearm
	name = "emergency weapon cabinet"
	req_one_access = list(access_armory,access_captain)

	starts_with = list(
		/obj/item/gun/energy/gun = 4)


/obj/structure/closet/secure_closet/guncabinet/rifle
	name = "rifle cabinet"
	req_one_access = list(access_explorer,access_brig)

	starts_with = list(
		/obj/item/ammo_magazine/clip/c762/hunter = 9,
		/obj/item/gun/projectile/shotgun/pump/rifle = 2)

/obj/structure/closet/secure_closet/guncabinet/rifle/Initialize()
	if(prob(85))
		starts_with += /obj/item/gun/projectile/shotgun/pump/rifle
	else
		starts_with += /obj/item/gun/projectile/shotgun/pump/rifle/lever
	return ..()

/obj/structure/closet/secure_closet/guncabinet/phase
	name = "explorer weapon cabinet"
	req_one_access = list(access_explorer,access_brig)

	starts_with = list(
<<<<<<< HEAD
		/obj/item/weapon/gun/energy/locked/phasegun = 2,
		/obj/item/weapon/gun/energy/locked/phasegun/pistol,
		/obj/item/weapon/cell/device/weapon = 2,
=======
		/obj/item/gun/energy/phasegun = 2,
		/obj/item/gun/energy/phasegun/pistol,
		/obj/item/cell/device/weapon = 2,
>>>>>>> 55942407f2... Merge pull request #16327 from TheCaramelion/weapon-removal
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
		/obj/item/weapon/storage/belt/explorer, //CHOMPADD
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/gloves/black,
<<<<<<< HEAD
		/obj/item/device/radio/headset/explorer,
		/obj/item/device/radio/headset/explorer/alt, //CHOMPADD
		/obj/item/device/flashlight,
		/obj/item/device/gps/explorer,
		/obj/item/weapon/storage/box/flare,
		/obj/item/device/geiger,
		/obj/item/weapon/cell/device,
		/obj/item/stack/marker_beacon/thirty,
		/obj/item/weapon/reagent_containers/food/snacks/liquidfood, //CHOMPADD
		/obj/item/weapon/reagent_containers/food/snacks/liquidprotein, //CHOMPADD
		/obj/item/device/cataloguer
=======
		/obj/item/radio/headset/explorer,
		/obj/item/flashlight,
		/obj/item/gps/explorer,
		/obj/item/storage/box/flare,
		/obj/item/geiger,
		/obj/item/cell/device,
		/obj/item/radio,
		/obj/item/stack/marker_beacon/thirty,
		/obj/item/cataloguer
>>>>>>> 55942407f2... Merge pull request #16327 from TheCaramelion/weapon-removal
		)

/obj/structure/closet/secure_closet/explorer/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack
	else
<<<<<<< HEAD
		starts_with += /obj/item/weapon/storage/backpack/satchel/norm
=======
		starts_with += /obj/item/storage/backpack/satchel/norm
	/* VOREStation Removal - Always give both
>>>>>>> 55942407f2... Merge pull request #16327 from TheCaramelion/weapon-removal
	if(prob(75))
		starts_with += /obj/item/material/knife/tacknife/survival
	else
<<<<<<< HEAD
		starts_with += /obj/item/weapon/material/knife/machete
=======
		starts_with += /obj/item/material/knife/machete
	*/ //VOREStation Removal End
>>>>>>> 55942407f2... Merge pull request #16327 from TheCaramelion/weapon-removal
	return ..()

//SAR Lockers

/obj/structure/closet/secure_closet/sar
	name = "search and rescue locker"
	desc = "Supplies for a wilderness first responder."
	req_access = list(access_medical_equip)
	closet_appearance = /decl/closet_appearance/secure_closet/medical

	starts_with = list(
		/obj/item/storage/backpack/dufflebag/emt,
		/obj/item/storage/box/autoinjectors,
		/obj/item/storage/box/syringes,
		/obj/item/reagent_containers/glass/bottle/inaprovaline,
		/obj/item/reagent_containers/glass/bottle/antitoxin,
		/obj/item/storage/belt/medical/emt,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/sar,
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/radio/headset/sar,
		/obj/item/cartridge/medical,
		/obj/item/flashlight,
		/obj/item/tank/emergency/oxygen/engi,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/healthanalyzer,
		/obj/item/radio/off,
		/obj/random/medical,
		/obj/item/tool/crowbar,
		/obj/item/extinguisher/mini,
		/obj/item/storage/box/freezer,
		/obj/item/clothing/accessory/storage/white_vest,
		/obj/item/taperoll/medical,
		/obj/item/gps,
		/obj/item/geiger,
		/obj/item/bodybag/cryobag)

//Pilot Locker

/obj/structure/closet/secure_closet/pilot
	name = "pilot locker"
	req_access = list(access_pilot)

	starts_with = list(
		/obj/item/storage/backpack/parachute,
		/obj/item/material/knife/tacknife/survival,
		/obj/item/clothing/head/pilot,
		/obj/item/clothing/under/rank/pilot1,
		/obj/item/clothing/suit/storage/toggle/bomber/pilot,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/radio/headset/pilot/alt,
		/obj/item/flashlight,
		/obj/item/reagent_containers/food/snacks/liquidfood,
		/obj/item/reagent_containers/food/drinks/cans/waterbottle,
		/obj/item/storage/box/flare,
		/obj/item/cell/device,
		/obj/item/radio)

/obj/structure/closet/secure_closet/pilot/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack
	else
		starts_with += /obj/item/storage/backpack/satchel/norm
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
