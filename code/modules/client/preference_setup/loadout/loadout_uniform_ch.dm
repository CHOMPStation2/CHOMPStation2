/datum/gear/uniform/job_sec/flightsuit
	display_name = "security flight suit"
	path = /obj/item/clothing/under/sec_flight_suit
	allowed_roles = list("Warden","Detective","Security Officer","Head of Security","Blueshield Guard")


// Trekie things
//TOS
/datum/gear/uniform/job_trek/sec/tos
	display_name = "TOS uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec
	allowed_roles = list("Warden","Detective","Security Officer","Head of Security","Blueshield Guard")

//TNG
/datum/gear/uniform/job_trek/sec/tng
	display_name = "TNG uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec/next
	allowed_roles = list("Warden","Detective","Security Officer","Head of Security","Blueshield Guard")

//VOY
/datum/gear/uniform/job_trek/sec/voy
	display_name = "VOY uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec/voy
	allowed_roles = list("Warden","Detective","Security Officer","Head of Security","Blueshield Guard")

//DS9
/datum/gear/uniform/job_trek/sec/ds9
	display_name = "DS9 uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec/ds9
	allowed_roles = list("Warden","Detective","Security Officer","Head of Security","Blueshield Guard")

//ENT
/datum/gear/uniform/job_trek/sec/ent
	display_name = "ENT uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec/ent
	allowed_roles = list("Warden","Detective","Security Officer","Head of Security","Blueshield Guard")


//Nullsuits (Zero Suits)
/datum/gear/uniform/job_nullsuit/civ
	display_name = "nullsuit, civilian"
	path = /obj/item/clothing/under/rank/nullsuit/civ

/datum/gear/uniform/job_nullsuit/cmd
	display_name = "nullsuit, cmd"
	path = /obj/item/clothing/under/rank/nullsuit/cmd
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard")

/datum/gear/uniform/job_nullsuit/sec
	display_name = "nullsuit, sec"
	path = /obj/item/clothing/under/rank/nullsuit/sec
	allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer","Blueshield Guard")

/datum/gear/uniform/job_nullsuit/sec/hos
	display_name = "nullsuit, head of security"
	path = /obj/item/clothing/under/rank/nullsuit/sec/hos
	allowed_roles = list("Head of Security")

/datum/gear/uniform/job_nullsuit/med
	display_name = "nullsuit, med"
	path = /obj/item/clothing/under/rank/nullsuit/med
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Field Medic")

/datum/gear/uniform/job_nullsuit/med/cmo
	display_name = "nullsuit, chief medical officer"
	path = /obj/item/clothing/under/rank/nullsuit/med/cmo
	allowed_roles = list("Chief Medical Officer")

/datum/gear/uniform/job_nullsuit/eng
	display_name = "nullsuit, eng"
	path = /obj/item/clothing/under/rank/nullsuit/eng
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Station Engineer")

/datum/gear/uniform/job_nullsuit/eng/ce
	display_name = "nullsuit, chief engineer"
	path = /obj/item/clothing/under/rank/nullsuit/eng/ce
	allowed_roles = list("Chief Engineer")

/datum/gear/uniform/job_nullsuit/sci
	display_name = "nullsuit, sci"
	path = /obj/item/clothing/under/rank/nullsuit/sci
	allowed_roles = list("Research Director", "Scientist", "Roboticist", "Xenobiologist", "Pathfinder", "Explorer")

/datum/gear/uniform/job_nullsuit/sci/rd
	display_name = "nullsuit, research director"
	path = /obj/item/clothing/under/rank/nullsuit/sci/rd
	allowed_roles = list("Research Director")

/datum/gear/uniform/job_nullsuit/cargo
	display_name = "nullsuit, cargo"
	path = /obj/item/clothing/under/rank/nullsuit/cargo
	allowed_roles = list("Quartermaster","Shaft Miner","Cargo Technician","Head of Personnel")


//VR Suit
/datum/gear/uniform/vrsuit //Pathname of this particular item in the menu.
	display_name = "vr suit" //The name of the suit as shown in the loadout menu
	path = /obj/item/clothing/under/vrsuit //Pathname of the suit which is found in custom_clothes_ch.dm

// Cargo shorts. The full-of-pockets kind, not the department
/datum/gear/uniform/cshorts
	display_name = "cargo shorts"
	path = /obj/item/clothing/under/shorts/cshorts/khaki

/datum/gear/uniform/cshorts/New()
	..()
	var/list/cargo_shorts = list(
		"Olive cargo shorts" = /obj/item/clothing/under/shorts/cshorts/olive,
		"Khaki cargo shorts" = /obj/item/clothing/under/shorts/cshorts/khaki
	)
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cargo_shorts))

/datum/gear/uniform/tacticool
	display_name = "Tacticool turtleneck"
	path = /obj/item/clothing/under/syndicate/tacticool/loadout