/datum/gear/uniform/suit/permit
	display_name = "nudity permit"
	path = /obj/item/clothing/under/permit

//Polaris overrides
/datum/gear/uniform/solgov/pt/sifguard
	display_name = "pt uniform, planetside sec"
	path = /obj/item/clothing/under/solgov/pt/sifguard

/datum/gear/uniform/job_skirt/sci
	allowed_roles = list("Research Director","Scientist", "Xenobiologist", "Xenobotanist")

/datum/gear/uniform/job_turtle/science
	allowed_roles = list("Research Director", "Scientist", "Roboticist", "Xenobiologist", "Xenobotanist")


//KHI Uniforms
/datum/gear/uniform/job_khi/cmd
	display_name = "ge uniform, cmd" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/cmd
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_khi/sec
	display_name = "geuniform, sec" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/sec
	allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer","Blueshield Guard","Security Pilot") //YW ADDITIONS

/datum/gear/uniform/job_khi/med
	display_name = "ge uniform, med" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/med
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Field Medic")

/datum/gear/uniform/job_khi/eng
	display_name = "ge uniform, eng" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/eng
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer")

/datum/gear/uniform/job_khi/sci
	display_name = "ge uniform, sci" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/sci
	allowed_roles = list("Research Director", "Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Pathfinder", "Explorer")

/datum/gear/uniform/job_khi/crg
	display_name = "ge uniform, cargo" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/crg
	allowed_roles = list("Quartermaster", "Cargo Technician", "Shaft Miner")

/datum/gear/uniform/job_khi/civ
	display_name = "ge uniform, civ" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/civ

//Federation jackets
/datum/gear/suit/job_fed/sec
	display_name = "fed uniform, sec"
	path = /obj/item/clothing/suit/storage/fluff/fedcoat
	allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer","Blueshield Guard","Security Pilot") //YW ADDITIONS

/datum/gear/suit/job_fed/medsci
	display_name = "fed uniform, med/sci"
	path = /obj/item/clothing/suit/storage/fluff/fedcoat/fedblue
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist","Xenobotanist","Pathfinder","Explorer","Field Medic")

/datum/gear/suit/job_fed/eng
	display_name = "fed uniform, eng"
	path = /obj/item/clothing/suit/storage/fluff/fedcoat/fedeng
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer")

// Trekie things
//TOS
/datum/gear/uniform/job_trek/cmd/tos
	display_name = "TOS uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/tos
	display_name = "TOS uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Pathfinder", "Explorer", "Field Medic")

/datum/gear/uniform/job_trek/eng/tos
	display_name = "TOS uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.
	
//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.


//TNG
/datum/gear/uniform/job_trek/cmd/tng
	display_name = "TNG uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command/next
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/tng
	display_name = "TNG uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci/next
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Pathfinder", "Explorer", "Field Medic")

/datum/gear/uniform/job_trek/eng/tng
	display_name = "TNG uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng/next //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.
	
//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.

//VOY
/datum/gear/uniform/job_trek/cmd/voy
	display_name = "VOY uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command/voy
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/voy
	display_name = "VOY uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci/voy
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Pathfinder", "Explorer", "Field Medic")

/datum/gear/uniform/job_trek/eng/voy
	display_name = "VOY uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng/voy //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.
	
//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.


//DS9

/datum/gear/suit/job_trek/ds9_coat
	display_name = "DS9 Overcoat (use uniform)"
	path = /obj/item/clothing/suit/storage/trek/ds9
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director",
						"Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist",
						"Scientist","Roboticist","Xenobiologist","Xenobotanist","Atmospheric Technician",
						"Station Engineer","Warden","Detective","Security Officer", "Pathfinder", "Explorer", "Field Medic", "Blueshield Guard","Security Pilot") //YW ADDITIONS


/datum/gear/uniform/job_trek/cmd/ds9
	display_name = "DS9 uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command/ds9
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/ds9
	display_name = "DS9 uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci/ds9
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Pathfinder", "Explorer", "Field Medic")

/datum/gear/uniform/job_trek/eng/ds9
	display_name = "DS9 uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng/ds9 //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.

//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.

//ENT
/datum/gear/uniform/job_trek/cmd/ent
	display_name = "ENT uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command/ent
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/ent
	display_name = "ENT uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci/ent
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Pathfinder", "Explorer", "Field Medic")

/datum/gear/uniform/job_trek/eng/ent
	display_name = "ENT uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng/ent //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.
	
//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.
	
/*
Swimsuits
*/

/datum/gear/uniform/swimsuits
	display_name = "swimsuits selection"
	path = /obj/item/weapon/storage/box/fluff/swimsuit

/datum/gear/uniform/swimsuits/New()
	..()
	var/list/swimsuits = list()
	for(var/swimsuit in typesof(/obj/item/weapon/storage/box/fluff/swimsuit))
		var/obj/item/weapon/storage/box/fluff/swimsuit/swimsuit_type = swimsuit
		swimsuits[initial(swimsuit_type.name)] = swimsuit_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(swimsuits))

/datum/gear/uniform/suit/gnshorts
	display_name = "GN shorts"
	path = /obj/item/clothing/under/fluff/gnshorts

//Latex maid dress
/datum/gear/uniform/latexmaid
	display_name = "latex maid dress"
	path = /obj/item/clothing/under/fluff/latexmaid

//Tron Siren outfit
/datum/gear/uniform/siren
	display_name = "jumpsuit, Siren"
	path = /obj/item/clothing/under/fluff/siren

/datum/gear/uniform/suit/v_nanovest
	display_name = "Varmacorp nanovest"
	path = /obj/item/clothing/under/fluff/v_nanovest

/*
Qipao
*/
/datum/gear/uniform/qipao
	display_name = "qipao, black"
	path = /obj/item/clothing/under/dress/qipao

/datum/gear/uniform/qipao_red
	display_name = "qipao, red"
	path = /obj/item/clothing/under/dress/qipao/red

/datum/gear/uniform/qipao_white
	display_name = "qipao, white"
	path = /obj/item/clothing/under/dress/qipao/white

/*
Bluespace jumpsuit
*/
/datum/gear/uniform/hfjumpsuit
	display_name = "HYPER jumpsuit"
	path = /obj/item/clothing/under/hyperfiber
	cost = 2