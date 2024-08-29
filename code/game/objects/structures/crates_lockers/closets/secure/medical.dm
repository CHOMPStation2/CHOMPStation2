/obj/structure/closet/secure_closet/medical1
	name = "medicine closet"
	desc = "Filled with medical junk."
	req_access = list(access_medical)
	closet_appearance = /decl/closet_appearance/secure_closet/medical/alt

	starts_with = list(
		/obj/item/storage/box/autoinjectors, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/syringes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/dropper = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/beaker = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/antitoxin = 2) // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/secure_closet/medical2
	name = "anesthetics closet"
	desc = "Used to knock people out."
	req_access = list(access_surgery)
	closet_appearance = /decl/closet_appearance/secure_closet/medical

	starts_with = list(
		/obj/item/tank/anesthetic = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/breath/medical = 3)


/obj/structure/closet/secure_closet/medical3
	name = "medical doctor's locker"
	req_access = list(access_medical_equip)
	closet_appearance = /decl/closet_appearance/secure_closet/medical/doctor

	starts_with = list(
		/obj/item/clothing/under/rank/medical,
		/obj/item/clothing/under/rank/nurse,
		/obj/item/clothing/under/rank/orderly,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/clothing/suit/storage/toggle/labcoat/modern,
		/obj/item/clothing/suit/storage/toggle/fr_jacket,
		/obj/item/clothing/shoes/white,
		/obj/item/cartridge/medical, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/radio/headset/headset_med, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/headset_med/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/alt,
		/obj/item/clothing/shoes/boots/winter/medical,
		/obj/item/clothing/under/rank/nursesuit,
		/obj/item/clothing/head/nursehat,
		/obj/item/storage/box/freezer = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/medical) //VOREStation Add // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/secure_closet/medical3/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/medic // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/med // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/med // CHOMPEdit - Removal of obj/item/weapon
	switch(pick("blue", "green", "purple", "black", "navyblue"))
		if ("blue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs
			starts_with += /obj/item/clothing/head/surgery/blue
		if ("green")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/green
			starts_with += /obj/item/clothing/head/surgery/green
		if ("purple")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/purple
			starts_with += /obj/item/clothing/head/surgery/purple
		if ("black")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/black
			starts_with += /obj/item/clothing/head/surgery/black
		if ("navyblue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/navyblue
			starts_with += /obj/item/clothing/head/surgery/navyblue
	switch(pick("blue", "green", "purple", "black", "navyblue"))
		if ("blue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs
			starts_with += /obj/item/clothing/head/surgery/blue
		if ("green")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/green
			starts_with += /obj/item/clothing/head/surgery/green
		if ("purple")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/purple
			starts_with += /obj/item/clothing/head/surgery/purple
		if ("black")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/black
			starts_with += /obj/item/clothing/head/surgery/black
		if ("navyblue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/navyblue
			starts_with += /obj/item/clothing/head/surgery/navyblue
	return ..()


/obj/structure/closet/secure_closet/paramedic
	name = "paramedic locker"
	desc = "Supplies for a first responder."
	req_access = list(access_medical_equip)
	closet_appearance = /decl/closet_appearance/secure_closet/medical/paramedic

	starts_with = list(
		/obj/item/storage/backpack/dufflebag/emt, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/autoinjectors, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/syringes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/inaprovaline, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/antitoxin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/medical/emt, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/suit/storage/toggle/fr_jacket,
		/obj/item/clothing/suit/storage/toggle/labcoat/emt,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/para,
		/obj/item/clothing/shoes/boots/winter/medical,
		/obj/item/radio/headset/headset_med/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cartridge/medical, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/briefcase/inflatable, // CHOMPEdit - Removal of obj/item/weapon
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
		/obj/item/taperoll/medical)

/obj/structure/closet/secure_closet/CMO
	name = "chief medical officer's locker"
	req_access = list(access_cmo)
	closet_appearance = /decl/closet_appearance/secure_closet/cmo

	starts_with = list(
		/obj/item/clothing/under/rank/chief_medical_officer,
		/obj/item/clothing/under/rank/chief_medical_officer/skirt,
		/obj/item/clothing/suit/storage/toggle/labcoat/cmo,
		/obj/item/clothing/suit/storage/toggle/labcoat/cmoalt,
		/obj/item/clothing/suit/storage/toggle/labcoat/modern/cmo,
		/obj/item/cartridge/cmo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/gloves/sterile/latex,
		/obj/item/clothing/shoes/brown,
		/obj/item/clothing/under/rank/neo_cmo,
		/obj/item/clothing/under/rank/neo_cmo_skirt,
		/obj/item/clothing/under/rank/neo_cmo_turtle,
		/obj/item/clothing/under/rank/neo_cmo_turtle_skirt,
		/obj/item/clothing/under/rank/neo_cmo_gorka,
		/obj/item/radio/headset/heads/cmo, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset/heads/cmo/alt, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flash, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/hypospray/vial, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical,
		/obj/item/clothing/suit/storage/hooded/wintercoat/medical/cmo,
		/obj/item/clothing/shoes/boots/winter/medical,
		/obj/item/clothing/head/beret/medical/cmo,
		/obj/item/clothing/head/beret/medical/cmo/blue,
		/obj/item/storage/box/freezer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas,
		/obj/item/taperoll/medical,
		/obj/item/clothing/suit/bio_suit/cmo,
		/obj/item/clothing/head/bio_hood/cmo,
		/obj/item/clothing/shoes/white,
		/obj/item/reagent_containers/glass/beaker/vial, //VOREStation Add // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/medical) //VOREStation Add // CHOMPEdit - Removal of obj/item/weapon

/obj/structure/closet/secure_closet/CMO/Initialize()
	if(prob(50))
		starts_with += /obj/item/storage/backpack/medic // CHOMPEdit - Removal of obj/item/weapon
	else
		starts_with += /obj/item/storage/backpack/satchel/med // CHOMPEdit - Removal of obj/item/weapon
	if(prob(50))
		starts_with += /obj/item/storage/backpack/dufflebag/med // CHOMPEdit - Removal of obj/item/weapon
	switch(pick("blue", "green", "purple", "black", "navyblue"))
		if ("blue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs
			starts_with += /obj/item/clothing/head/surgery/blue
		if ("green")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/green
			starts_with += /obj/item/clothing/head/surgery/green
		if ("purple")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/purple
			starts_with += /obj/item/clothing/head/surgery/purple
		if ("black")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/black
			starts_with += /obj/item/clothing/head/surgery/black
		if ("navyblue")
			starts_with += /obj/item/clothing/under/rank/medical/scrubs/navyblue
			starts_with += /obj/item/clothing/head/surgery/navyblue
	return ..()


/obj/structure/closet/secure_closet/animal
	name = "animal control closet"
	req_access = list(access_surgery)

	starts_with = list(
		/obj/item/assembly/signaler, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/electropack = 3) // CHOMPEdit - Removal of obj/item/device


/obj/structure/closet/secure_closet/chemical
	name = "chemical closet"
	desc = "Store dangerous chemicals in here."
	req_access = list(access_chemistry)
	closet_appearance = /decl/closet_appearance/secure_closet/medical/chemistry

	starts_with = list(
		/obj/item/storage/box/pillbottles = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/beakers, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/autoinjectors, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/syringes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/dropper = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/inaprovaline = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/bottle/antitoxin = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/fancy/vials) //VOREStation Add // CHOMPEdit - Removal of obj/item/weapon


/obj/structure/closet/secure_closet/psych
	name = "psychiatric cabinet"
	desc = "Store psychology tools and medicines in here."
	req_access = list(access_psychiatrist)
	closet_appearance = /decl/closet_appearance/cabinet/secure

	open_sound = 'sound/effects/wooden_closet_open.ogg'
	close_sound = 'sound/effects/wooden_closet_close.ogg'

	starts_with = list(
		/obj/item/clothing/under/rank/psych,
		/obj/item/clothing/under/rank/psych/turtleneck,
		/obj/item/clothing/suit/straight_jacket,
		/obj/item/reagent_containers/glass/bottle/stoxin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/syringe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/citalopram, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/pill/methylphenidate, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/folder/white, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/taperecorder, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tape/random = 3, // CHOMPEdit - Removal of obj/item/device
		/obj/item/camera, // CHOMPEdit - Removal of obj/item/device
		/obj/item/toy/plushie/therapy/blue)


/obj/structure/closet/secure_closet/medical_wall
	name = "first aid closet"
	desc = "It's a secure wall-mounted storage unit for first aid supplies."
	plane = TURF_PLANE
	layer = ABOVE_TURF_LAYER
	anchored = TRUE
	density = FALSE
	wall_mounted = 1
	store_mobs = 0
	req_access = list(access_medical_equip)
	closet_appearance = /decl/closet_appearance/wall/medical

/obj/structure/closet/secure_closet/medical_wall/pills
	name = "pill cabinet"

	starts_with = list(
		/obj/item/storage/pill_bottle/tramadol, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/antitox, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/carbon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/random/medical/pillbottle)


/obj/structure/closet/secure_closet/medical_wall/anesthetics
	name = "anesthetics wall closet"
	desc = "Used to knock people out."
	req_access = list(access_surgery)

	starts_with = list(
		/obj/item/tank/anesthetic = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/breath/medical = 3)
