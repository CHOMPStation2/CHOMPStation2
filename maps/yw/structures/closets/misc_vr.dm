/obj/structure/closet/secure_closet/explorer
	icon = 'icons/obj/closet_vr.dmi'
	closet_appearance = /decl/closet_appearance/secure_closet/exploration
	starts_with = list(
		/obj/item/clothing/under/explorer,
		/obj/item/clothing/suit/storage/hooded/explorer,
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/gloves/black,
		/obj/item/radio/headset/explorer,
		/obj/item/flashlight,
		/obj/item/gps/explorer,
		/obj/item/storage/box/flare,
		/obj/item/geiger,
		/obj/item/cell/device,
		/obj/item/radio,
		/obj/item/stack/marker_beacon/thirty,
		/obj/item/material/knife/tacknife/survival,
		/obj/item/material/knife/machete,
		/obj/item/clothing/accessory/holster/machete,
		/obj/item/reagent_containers/food/snacks/liquidfood,
		/obj/item/reagent_containers/food/snacks/liquidprotein,
		/obj/item/cataloguer)

/obj/structure/closet/secure_closet/sar
	name = "field medic locker"
	closet_appearance = /decl/closet_appearance/secure_closet/medical
	starts_with = list(
		/obj/item/storage/backpack/dufflebag/emt,
		/obj/item/storage/box/autoinjectors,
		/obj/item/storage/box/syringes,
		/obj/item/reagent_containers/glass/bottle/inaprovaline,
		/obj/item/reagent_containers/glass/bottle/antitoxin,
		/obj/item/storage/belt/medical/emt,
		/obj/item/material/knife/tacknife/survival,
		/obj/item/gun/energy/locked/frontier/holdout,
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/clothing/suit/storage/hooded/explorer/medic,
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
		/obj/item/reagent_containers/food/snacks/liquidfood = 2,
		/obj/item/reagent_containers/food/snacks/liquidprotein = 2,
		/obj/item/tool/crowbar,
		/obj/item/extinguisher/mini,
		/obj/item/storage/box/freezer,
		/obj/item/clothing/accessory/storage/white_vest,
		/obj/item/taperoll/medical,
		/obj/item/gps/medical,
		/obj/item/geiger,
		/obj/item/bodybag/cryobag,
		/obj/item/cataloguer/compact)

/obj/structure/closet/secure_closet/pilot
	closet_appearance = /decl/closet_appearance/secure_closet/exploration/pilot
	starts_with = list(
		/obj/item/storage/backpack/parachute,
		/obj/item/material/knife/tacknife/survival,
		/obj/item/gun/energy/locked/frontier/holdout,
		/obj/item/clothing/head/pilot,
		/obj/item/clothing/under/rank/pilot1,
		/obj/item/clothing/suit/storage/toggle/bomber/pilot,
		/obj/item/clothing/shoes/boots/winter/explorer,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/radio/headset/pilot/alt,
		/obj/item/flashlight,
		/obj/item/reagent_containers/food/snacks/liquidfood,
		/obj/item/reagent_containers/food/snacks/liquidprotein,
		/obj/item/reagent_containers/food/drinks/cans/waterbottle,
		/obj/item/storage/box/flare,
		/obj/item/cell/device,
		/obj/item/radio,
		/obj/item/gps/explorer,
		/obj/item/cataloguer/compact)

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
		/obj/item/radio/headset/explorer,
		/obj/item/flashlight,
		/obj/item/gps/explorer,
		/obj/item/storage/box/flare,
		/obj/item/storage/box/explorerkeys,
		/obj/item/geiger,
		/obj/item/cell/device,
		/obj/item/radio,
		/obj/item/bluespaceradio/cryogaia_prelinked,
		/obj/item/stack/marker_beacon/thirty,
		/obj/item/material/knife/tacknife/survival,
		/obj/item/material/knife/machete/deluxe,
		/obj/item/gun/energy/locked/frontier/carbine,
		/obj/item/clothing/accessory/holster/machete,
		/obj/item/reagent_containers/food/snacks/liquidfood,
		/obj/item/reagent_containers/food/snacks/liquidprotein,
		/obj/item/cataloguer/compact/pathfinder)

/obj/structure/closet/secure_closet/pathfinder/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack
	else
		starts_with += /obj/item/storage/backpack/satchel/norm
	return ..()
