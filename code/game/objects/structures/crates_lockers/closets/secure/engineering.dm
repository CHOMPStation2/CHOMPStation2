/obj/structure/closet/secure_closet/engineering_chief
	name = "chief engineer's locker"
	req_access = list(access_ce)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/ce

	starts_with = list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/areaeditor/blueprints,
		/obj/item/wire_reader,
		///obj/item/clamp,	//VOREStation Removal: without leaks those are pointless,
		///obj/item/clamp,	//VOREStation Removal: without leaks those are pointless,
		/obj/item/clothing/under/rank/chief_engineer,
		/obj/item/clothing/under/rank/chief_engineer/skirt,
		/obj/item/clothing/under/rank/neo_chiefengi,
		/obj/item/clothing/under/rank/neo_chiefengi_skirt,
		/obj/item/clothing/under/rank/neo_ce_gorka,
		/obj/item/clothing/head/hardhat/white,
		///obj/item/clothing/head/welding,	//VOREStation Removal: Locker bloat, grr. They get fancy goggles or can raid the welding supplies locker for one of these.
		/obj/item/clothing/gloves/heavy_engineer,	//VOREStation Edit: chief gets the good shit
		/obj/item/clothing/shoes/brown,
		/obj/item/cartridge/ce, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio/headset/heads/ce, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/heads/ce/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/toolbox/mechanical, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/storage/hazardvest,
		///obj/item/clothing/mask/gas,	//VOREStation Removal: Locker bloat, grr. The fancy one below functions as a mask & helmet combined.
		/obj/item/clothing/head/hardhat/firefighter/chief, //VOREStation Add: replaces the bog-standard gas mask
		///obj/item/multitool,	//VOREStation Removal: The belt they get, both standard and the fancy one, both come with one already, why stick another in here too? // CHOMPEdit - Removal of obj/item/device
		/obj/item/storage/belt/utility/chief/full, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flash, // CHOMPEdit - Removal of obj/item/device
		/obj/item/t_scanner/upgraded, // CHOMPEdit - Removal of obj/item/device
		/obj/item/taperoll/engineering,
		///obj/item/clothing/suit/storage/hooded/wintercoat/engineering,	//VOREStation Removal: Locker bloat, grr. They can grab from the engi-clothes vendor if they want the standard one.
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering/ce,
		///obj/item/clothing/shoes/boots/winter/engineering,	//VOREStation Removal: Locker bloat, grr. As above.
		/obj/item/clothing/head/beret/engineering/ce,
		/obj/item/clothing/head/beret/engineering/ce/white,
		/obj/item/tank/emergency/oxygen/double,	//VOREStation Edit: chief gets the good shit // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/spray/windowsealant, //VOREStation Add, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/holosign_creator/combifan, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rcd/advanced/loaded, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pipe_dispenser) //YW Add // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/secure_closet/engineering_chief/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/industrial // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/eng // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/eng // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/obj/structure/closet/secure_closet/engineering_electrical
	name = "electrical supplies"
	req_access = list(access_engine_equip)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/electrical

	starts_with = list(
		/obj/item/clothing/gloves/yellow = 2,
		/obj/item/storage/toolbox/electrical = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/module/power_control = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool = 3) // CHOMPEdit - Removal of obj/item/device

/obj/structure/closet/secure_closet/engineering_electrical/double
	starts_with = list(
		/obj/item/clothing/gloves/yellow = 4,
		/obj/item/storage/toolbox/electrical = 6, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/module/power_control = 6, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool = 6) // CHOMPEdit - Removal of obj/item/device

/obj/structure/closet/secure_closet/engineering_welding
	name = "welding supplies"
	req_access = list(access_construction)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/welding

	starts_with = list(
		/obj/item/clothing/head/welding = 3,
		/obj/item/weldingtool/largetank = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldpack = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses/welding = 3)

/obj/structure/closet/secure_closet/engineering_welding/double
	starts_with = list(
		/obj/item/clothing/head/welding = 6,
		/obj/item/weldingtool/largetank = 6, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldpack = 6, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses/welding = 6)

/obj/structure/closet/secure_closet/engineering_personal
	name = "engineer's locker"
	req_access = list(access_engine_equip)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering

	starts_with = list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/storage/toolbox/mechanical, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio/headset/headset_eng, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/headset_eng/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/glasses/meson,
		/obj/item/cartridge/engineering, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/taperoll/engineering,
		/obj/item/clothing/head/hardhat,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering,
		/obj/item/clothing/shoes/boots/winter/engineering,
		/obj/item/tank/emergency/oxygen/engi, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/utility,	//VOREStation Add // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/spray/windowsealant,	//VOREStation Add // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/areaeditor/blueprints/engineers) //VOREStation Add

/obj/structure/closet/secure_closet/engineering_personal/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/industrial // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/eng // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/eng // CHOMPEdit - Removal of obj/item/weapon
	return ..()


/obj/structure/closet/secure_closet/atmos_personal
	name = "technician's locker"
	req_access = list(access_atmospherics)
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/atmos

	starts_with = list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/clothing/suit/fire/heavy,
		/obj/item/clothing/head/hardhat/firefighter/atmos,
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/extinguisher/atmo, // CHOMPEdit - Removal of obj/item/weapon
		///obj/item/clamp,	//VOREStation Removal: without leaks those are pointless,
		/obj/item/radio/headset/headset_eng, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/headset_eng/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/suit/storage/hazardvest/atmos,	//VOREStation edit. Eng locker gets regular haz-vest, atmos gets the themed one of their own
		/obj/item/clothing/mask/gas,
		/obj/item/cartridge/atmos, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/taperoll/atmos,
		/obj/item/clothing/suit/storage/hooded/wintercoat/engineering/atmos,
		/obj/item/clothing/shoes/boots/winter/atmos,
		/obj/item/tank/emergency/oxygen/engi, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/holosign_creator/combifan, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pipe_dispenser, //CHOMPAdd // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/utility/atmostech) //VOREStation edit. They don't get a toolbox to fill it from, so why not give a spare one that's full already? // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/secure_closet/atmos_personal/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/industrial // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/eng // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/eng // CHOMPEdit - Removal of obj/item/weapon
	return ..()
