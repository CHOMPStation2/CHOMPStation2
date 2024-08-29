/*
*	Here is where any supply packs
*	related to medical tasks live.
*/


/datum/supply_pack/med
	group = "Medical"

/datum/supply_pack/med/medical
	name = "Medical crate"
	contains = list(
			/obj/item/storage/firstaid/regular, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/firstaid/fire, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/firstaid/toxin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/firstaid/o2, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/firstaid/adv, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/glass/bottle/antitoxin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/glass/bottle/inaprovaline, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/glass/bottle/stoxin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/syringes, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/autoinjectors // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 15
	containertype = /obj/structure/closet/crate/zenghu
	containername = "Medical crate"

/datum/supply_pack/med/bloodpack
	name = "BloodPack crate"
	contains = list(/obj/item/storage/box/bloodpacks = 3) // CHOMPEdit - Removal of obj/item/weapon
	cost = 10
	containertype = /obj/structure/closet/crate/nanomed
	containername = "BloodPack crate"

/datum/supply_pack/med/synthplas
	name = "BloodPack (Synthplas) crate"
	contains = list(/obj/item/reagent_containers/blood/synthplas = 6) // CHOMPEdit - Removal of obj/item/weapon
	cost = 80
	containertype = /obj/structure/closet/crate/nanomed
	containername = "SynthPlas crate"

/datum/supply_pack/med/bodybag
	name = "Body bag crate"
	contains = list(/obj/item/storage/box/bodybags = 3) // CHOMPEdit - Removal of obj/item/weapon
	cost = 10
	containertype = /obj/structure/closet/crate/nanomed
	containername = "Body bag crate"

/datum/supply_pack/med/cryobag
	name = "Stasis bag crate"
	contains = list(/obj/item/bodybag/cryobag = 3)
	cost = 40
	containertype = /obj/structure/closet/crate/nanomed
	containername = "Stasis bag crate"

/datum/supply_pack/med/surgery
	name = "Surgery crate"
	contains = list(
			/obj/item/surgical/cautery, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/surgical/surgicaldrill, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/mask/breath/medical,
			/obj/item/tank/anesthetic, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/surgical/FixOVein, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/surgical/hemostat, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/surgical/scalpel, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/surgical/bonegel, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/surgical/retractor, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/surgical/bonesetter, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/surgical/circular_saw // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 25
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Surgery crate"
	access = access_medical

/datum/supply_pack/med/deathalarm
	name = "Death Alarm crate"
	contains = list(
			/obj/item/storage/box/cdeathalarm_kit, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/cdeathalarm_kit // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 40
	containertype = /obj/structure/closet/crate/secure/ward
	containername = "Death Alarm crate"
	access = access_medical

/datum/supply_pack/med/clotting
	name = "Clotting Medicine crate"
	contains = list(
			/obj/item/storage/firstaid/clotting // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 100
	containertype = /obj/structure/closet/crate/secure/zenghu
	containername = "Clotting Medicine crate"
	access = access_medical

/datum/supply_pack/med/sterile
	name = "Sterile equipment crate"
	contains = list(
			/obj/item/clothing/under/rank/medical/scrubs/green = 2,
			/obj/item/clothing/head/surgery/green = 2,
			/obj/item/storage/box/masks, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/gloves, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/belt/medical = 3 // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 10
	containertype = /obj/structure/closet/crate/veymed
	containername = "Sterile equipment crate"

/datum/supply_pack/med/extragear
	name = "Medical surplus equipment"
	contains = list(
			/obj/item/storage/belt/medical = 3, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/glasses/hud/health = 3,
			/obj/item/radio/headset/headset_med/alt = 3, // CHOMPEdit - Removal of obj/item/device
			/obj/item/clothing/suit/storage/hooded/wintercoat/medical = 3
			)
	cost = 10
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical surplus equipment"
	access = access_medical

/datum/supply_pack/med/cmogear
	name = "Chief medical officer equipment"
	contains = list(
			/obj/item/storage/belt/medical, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/radio/headset/heads/cmo, // CHOMPEdit - Removal of obj/item/device
			/obj/item/clothing/under/rank/chief_medical_officer,
			/obj/item/reagent_containers/hypospray/vial, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/accessory/stethoscope,
			/obj/item/clothing/glasses/hud/health,
			/obj/item/clothing/suit/storage/toggle/labcoat/cmo,
			/obj/item/clothing/suit/storage/toggle/labcoat/cmoalt,
			/obj/item/clothing/mask/surgical,
			/obj/item/clothing/shoes/white,
			/obj/item/cartridge/cmo, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/gloves/sterile/latex,
			/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
			/obj/item/flashlight/pen, // CHOMPEdit - Removal of obj/item/device
			/obj/item/reagent_containers/syringe // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 50
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Chief medical officer equipment"
	access = access_cmo

/datum/supply_pack/med/doctorgear
	name = "Medical Doctor equipment"
	contains = list(
			/obj/item/storage/belt/medical, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/radio/headset/headset_med, // CHOMPEdit - Removal of obj/item/device
			/obj/item/clothing/under/rank/medical,
			/obj/item/clothing/accessory/stethoscope,
			/obj/item/clothing/glasses/hud/health,
			/obj/item/clothing/suit/storage/toggle/labcoat,
			/obj/item/clothing/mask/surgical,
			/obj/item/storage/firstaid/adv, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/shoes/white,
			/obj/item/cartridge/medical, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/gloves/sterile/latex,
			/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
			/obj/item/flashlight/pen, // CHOMPEdit - Removal of obj/item/device
			/obj/item/reagent_containers/syringe // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical Doctor equipment"
	access = access_medical_equip

/datum/supply_pack/med/chemistgear
	name = "Chemist equipment"
	contains = list(
			/obj/item/storage/box/beakers, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/radio/headset/headset_med, // CHOMPEdit - Removal of obj/item/device
			/obj/item/storage/box/autoinjectors, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/under/rank/chemist,
			/obj/item/clothing/glasses/science,
			/obj/item/clothing/suit/storage/toggle/labcoat/chemist,
			/obj/item/clothing/mask/surgical,
			/obj/item/clothing/shoes/white,
			/obj/item/cartridge/chemistry, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/gloves/sterile/latex,
			/obj/item/reagent_containers/dropper, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
			/obj/item/storage/box/pillbottles, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/syringe // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Chemist equipment"
	access = access_chemistry

/datum/supply_pack/med/paramedicgear
	name = "Paramedic equipment"
	contains = list(
			/obj/item/storage/belt/medical/emt, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/radio/headset/headset_med, // CHOMPEdit - Removal of obj/item/device
			/obj/item/clothing/under/rank/medical/scrubs/black,
			/obj/item/clothing/accessory/armband/medblue,
			/obj/item/clothing/glasses/hud/health,
			/obj/item/clothing/suit/storage/toggle/labcoat/emt,
			/obj/item/clothing/under/rank/medical/paramedic,
			/obj/item/clothing/suit/storage/toggle/fr_jacket,
			/obj/item/clothing/mask/gas,
			/obj/item/clothing/under/rank/medical/paramedic_alt,
			/obj/item/clothing/accessory/stethoscope,
			/obj/item/storage/firstaid/adv, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/shoes/boots/jackboots,
			/obj/item/clothing/gloves/sterile/latex,
			/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
			/obj/item/cartridge/medical, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/flashlight/pen, // CHOMPEdit - Removal of obj/item/device
			/obj/item/reagent_containers/syringe, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/clothing/accessory/storage/white_vest
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Paramedic equipment"
	access = access_medical_equip

/datum/supply_pack/med/psychiatristgear
	name = "Psychiatrist equipment"
	contains = list(
			/obj/item/clothing/under/rank/psych,
			/obj/item/radio/headset/headset_med, // CHOMPEdit - Removal of obj/item/device
			/obj/item/clothing/under/rank/psych/turtleneck,
			/obj/item/clothing/shoes/laceup,
			/obj/item/clothing/suit/storage/toggle/labcoat,
			/obj/item/clothing/shoes/white,
			/obj/item/clipboard, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/folder/white, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/pen, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/cartridge/medical // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Psychiatrist equipment"
	access = access_psychiatrist

/datum/supply_pack/med/medicalscrubs
	name = "Medical scrubs"
	contains = list(
			/obj/item/clothing/shoes/white = 3,,
			/obj/item/clothing/under/rank/medical/scrubs = 3,
			/obj/item/clothing/under/rank/medical/scrubs/green = 3,
			/obj/item/clothing/under/rank/medical/scrubs/purple = 3,
			/obj/item/clothing/under/rank/medical/scrubs/black = 3,
			/obj/item/clothing/head/surgery = 3,
			/obj/item/clothing/head/surgery/purple = 3,
			/obj/item/clothing/head/surgery/blue = 3,
			/obj/item/clothing/head/surgery/green = 3,
			/obj/item/clothing/head/surgery/black = 3,
			/obj/item/storage/box/masks, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/gloves // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 10
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical scrubs crate"
	access = access_medical_equip

/datum/supply_pack/med/autopsy
	name = "Autopsy equipment"
	contains = list(
			/obj/item/folder/white, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/camera, // CHOMPEdit - Removal of obj/item/device
			/obj/item/camera_film = 2, // CHOMPEdit - Removal of obj/item/device
			/obj/item/autopsy_scanner, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/surgical/scalpel, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/masks, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/gloves, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/pen // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Autopsy equipment crate"
	access = access_morgue

/datum/supply_pack/med/medicaluniforms
	name = "Medical uniforms"
	contains = list(
			/obj/item/clothing/shoes/white = 3,
			/obj/item/clothing/under/rank/chief_medical_officer,
			/obj/item/clothing/under/rank/geneticist,
			/obj/item/clothing/under/rank/virologist,
			/obj/item/clothing/under/rank/nursesuit,
			/obj/item/clothing/under/rank/nurse,
			/obj/item/clothing/under/rank/orderly,
			/obj/item/clothing/under/rank/medical = 3,
			/obj/item/clothing/under/rank/medical/paramedic = 3,
			/obj/item/clothing/suit/storage/toggle/labcoat = 3,
			/obj/item/clothing/suit/storage/toggle/labcoat/cmo,
			/obj/item/clothing/suit/storage/toggle/labcoat/emt,
			/obj/item/clothing/suit/storage/toggle/labcoat/cmoalt,
			/obj/item/clothing/suit/storage/toggle/labcoat/genetics,
			/obj/item/clothing/suit/storage/toggle/labcoat/virologist,
			/obj/item/clothing/suit/storage/toggle/labcoat/chemist,
			/obj/item/storage/box/masks, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/gloves // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 10
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical uniform crate"
	access = access_medical_equip

/datum/supply_pack/med/medicalbiosuits
	name = "Medical biohazard gear"
	contains = list(
			/obj/item/clothing/head/bio_hood/modern = 3,
			/obj/item/clothing/suit/bio_suit/modern = 3,
			/obj/item/clothing/head/bio_hood/virology = 2,
			/obj/item/clothing/suit/bio_suit/cmo,
			/obj/item/clothing/head/bio_hood/cmo,
			/obj/item/clothing/mask/gas/clear = 5, //ChompEdit: Proper implementation of clear gas masks
			/obj/item/tank/oxygen = 5, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/masks, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/gloves // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 50
	containertype = /obj/structure/closet/crate/secure/nanomed
	containername = "Medical biohazard equipment"
	access = access_medical_equip

/datum/supply_pack/med/portablefreezers
	name = "Portable freezers crate"
	contains = list(/obj/item/storage/box/freezer = 7) // CHOMPEdit - Removal of obj/item/weapon
	cost = 25
	containertype = /obj/structure/closet/crate/secure/veymed
	containername = "Portable freezers"
	access = access_medical_equip

/datum/supply_pack/med/virus
	name = "Virus sample crate"
	contains = list(/obj/item/virusdish/random = 4) // CHOMPEdit - Removal of obj/item/weapon
	cost = 25
	containertype = /obj/structure/closet/crate/secure/zenghu
	containername = "Virus sample crate"
	access = access_cmo

/datum/supply_pack/med/defib
	name = "Defibrillator crate"
	contains = list(/obj/item/defib_kit = 2) // CHOMPEdit - Removal of obj/item/device
	cost = 30
	containertype = /obj/structure/closet/crate/veymed
	containername = "Defibrillator crate"

/datum/supply_pack/med/distillery
	name = "Chemical distiller crate"
	contains = list(/obj/machinery/portable_atmospherics/powered/reagent_distillery = 1)
	cost = 50
	containertype = /obj/structure/closet/crate/large/nanotrasen
	containername = "Chemical distiller crate"

/datum/supply_pack/med/advdistillery
	name = "Industrial Chemical distiller crate"
	contains = list(/obj/machinery/portable_atmospherics/powered/reagent_distillery/industrial = 1)
	cost = 150
	containertype = /obj/structure/closet/crate/large/xion
	containername = "Industrial Chemical distiller crate"

/datum/supply_pack/med/oxypump
	name = "Oxygen pump crate"
	contains = list(/obj/machinery/oxygen_pump/mobile = 1)
	cost = 125
	containertype = /obj/structure/closet/crate/large/xion
	containername = "Oxygen pump crate"

/datum/supply_pack/med/anestheticpump
	name = "Anesthetic pump crate"
	contains = list(/obj/machinery/oxygen_pump/mobile/anesthetic = 1)
	cost = 130
	containertype = /obj/structure/closet/crate/large/nanotrasen
	containername = "Anesthetic pump crate"

/datum/supply_pack/med/stablepump
	name = "Portable stabilizer crate"
	contains = list(/obj/machinery/oxygen_pump/mobile/stabilizer = 1)
	cost = 175
	containertype = /obj/structure/closet/crate/large/nanotrasen
	containername = "Portable stabilizer crate"

/datum/supply_pack/med/medicalbiosuits
	contains = list(
			/obj/item/clothing/head/bio_hood/scientist = 3,
			/obj/item/clothing/suit/bio_suit/scientist = 3,
			/obj/item/clothing/suit/bio_suit/virology = 3,
			/obj/item/clothing/head/bio_hood/virology = 3,
			/obj/item/clothing/suit/bio_suit/cmo,
			/obj/item/clothing/head/bio_hood/cmo,
			/obj/item/clothing/shoes/white = 7,
			/obj/item/clothing/mask/gas/clear = 7, //ChompEdit: Proper implementation of clear gas masks
			/obj/item/tank/oxygen = 7, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/masks, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/gloves // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 40

/datum/supply_pack/med/virologybiosuits
	name = "Virology biohazard gear"
	contains = list(
			/obj/item/clothing/suit/bio_suit/virology = 3,
			/obj/item/clothing/head/bio_hood/virology = 3,
			/obj/item/clothing/mask/gas/clear = 3, //ChompEdit: Proper implementation of clear gas masks
			/obj/item/tank/oxygen = 3, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/masks, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/storage/box/gloves // CHOMPEdit - Removal of obj/item/weapon
			)
	cost = 40
	containertype = /obj/structure/closet/crate/secure
	containername = "Virology biohazard equipment"
	access = access_medical_equip

/datum/supply_pack/med/virus
	name = "Virus sample crate"
	contains = list(/obj/item/virusdish/random = 4) // CHOMPEdit - Removal of obj/item/weapon
	cost = 25
	containertype = /obj/structure/closet/crate/secure
	containername = "Virus sample crate"
	access = access_medical_equip


/datum/supply_pack/med/bloodpack
	containertype = /obj/structure/closet/crate/medical/blood

/datum/supply_pack/med/compactdefib
	name = "Compact Defibrillator crate"
	contains = list(/obj/item/defib_kit/compact = 1) // CHOMPEdit - Removal of obj/item/device
	cost = 90
	containertype = /obj/structure/closet/crate/secure
	containername = "Compact Defibrillator crate"
	access = access_medical_equip
