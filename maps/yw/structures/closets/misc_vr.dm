/obj/structure/closet/secure_closet/explorer
	icon = 'icons/obj/closet_vr.dmi'
	closet_appearance = /decl/closet_appearance/secure_closet/exploration
	starts_with = list(
		/obj/item/clothing/under/explorer,
		/obj/item/clothing/suit/storage/hooded/explorer,
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/gloves/black,
		/obj/item/radio/headset/explorer, // CHOMPEdit - Removal of obj/item/device
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

/obj/structure/closet/secure_closet/sar
	name = "field medic locker"
	closet_appearance = /decl/closet_appearance/secure_closet/medical
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
		/obj/item/cartridge/medical, // CHOMPEdit - Removal of obj/item/weapon
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

/obj/structure/closet/secure_closet/pilot
	closet_appearance = /decl/closet_appearance/secure_closet/exploration/pilot
	starts_with = list(
		/obj/item/storage/backpack/parachute, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/locked/frontier/holdout, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/pilot,
		/obj/item/clothing/under/rank/pilot1,
		/obj/item/clothing/suit/storage/toggle/bomber/pilot,
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/radio/headset/pilot/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/food/snacks/liquidfood, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/liquidprotein, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/drinks/cans/waterbottle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/flare, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps/explorer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cataloguer/compact) // CHOMPEdit - Removal of obj/item/device

/obj/structure/closet/secure_closet/pathfinder
	name = "pathfinder locker"
	closet_appearance = /decl/closet_appearance/secure_closet/exploration/pathfinder
	req_access = list(access_pathfinder)
	starts_with = list(
		/obj/item/clothing/under/explorer,
		/obj/item/clothing/suit/storage/hooded/explorer,
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/gloves/black,
		/obj/item/radio/headset/explorer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps/explorer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/box/flare, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/explorerkeys, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/bluespaceradio/cryogaia_prelinked, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/marker_beacon/thirty,
		/obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/knife/machete/deluxe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/locked/frontier/carbine, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/holster/machete,
		/obj/item/reagent_containers/food/snacks/liquidfood, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/liquidprotein, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cataloguer/compact/pathfinder) // CHOMPEdit - Removal of obj/item/device

/obj/structure/closet/secure_closet/pathfinder/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/norm // CHOMPEdit - Removal of obj/item/weapon
	return ..()
