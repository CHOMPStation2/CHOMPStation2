/datum/gear/uniform/job_sec/flightsuit
	display_name = "security flight suit"
	path = /obj/item/clothing/under/sec_flight_suit
	allowed_roles = list(JOB_WARDEN,JOB_DETECTIVE,JOB_SECURITY_OFFICER,JOB_HEAD_OF_SECURITY,JOB_BLUESHIELD_GUARD)


// Trekie things
//TOS
/datum/gear/uniform/job_trek/sec/tos
	display_name = "TOS uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec
	allowed_roles = list(JOB_WARDEN,JOB_DETECTIVE,JOB_SECURITY_OFFICER,JOB_HEAD_OF_SECURITY,JOB_BLUESHIELD_GUARD)

//TNG
/datum/gear/uniform/job_trek/sec/tng
	display_name = "TNG uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec/next
	allowed_roles = list(JOB_WARDEN,JOB_DETECTIVE,JOB_SECURITY_OFFICER,JOB_HEAD_OF_SECURITY,JOB_BLUESHIELD_GUARD)

//VOY
/datum/gear/uniform/job_trek/sec/voy
	display_name = "VOY uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec/voy
	allowed_roles = list(JOB_WARDEN,JOB_DETECTIVE,JOB_SECURITY_OFFICER,JOB_HEAD_OF_SECURITY,JOB_BLUESHIELD_GUARD)

//DS9
/datum/gear/uniform/job_trek/sec/ds9
	display_name = "DS9 uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec/ds9
	allowed_roles = list(JOB_WARDEN,JOB_DETECTIVE,JOB_SECURITY_OFFICER,JOB_HEAD_OF_SECURITY,JOB_BLUESHIELD_GUARD)

//ENT
/datum/gear/uniform/job_trek/sec/ent
	display_name = "ENT uniform, sec"
	path = /obj/item/clothing/under/rank/trek/sec/ent
	allowed_roles = list(JOB_WARDEN,JOB_DETECTIVE,JOB_SECURITY_OFFICER,JOB_HEAD_OF_SECURITY,JOB_BLUESHIELD_GUARD)


//Nullsuits (Zero Suits)
/datum/gear/uniform/job_nullsuit/civ
	display_name = "nullsuit, civilian"
	path = /obj/item/clothing/under/rank/nullsuit/civ

/datum/gear/uniform/job_nullsuit/cmd
	display_name = "nullsuit, cmd"
	path = /obj/item/clothing/under/rank/nullsuit/cmd
	allowed_roles = list(JOB_HEAD_OF_SECURITY,JOB_SITE_MANAGER,JOB_HEAD_OF_PERSONNEL,JOB_CHIEF_ENGINEER,JOB_RESEARCH_DIRECTOR,JOB_CHIEF_MEDICAL_OFFICER,JOB_BLUESHIELD_GUARD)

/datum/gear/uniform/job_nullsuit/sec
	display_name = "nullsuit, sec"
	path = /obj/item/clothing/under/rank/nullsuit/sec
	allowed_roles = list(JOB_HEAD_OF_SECURITY, JOB_WARDEN, JOB_DETECTIVE, JOB_SECURITY_OFFICER,JOB_BLUESHIELD_GUARD)

/datum/gear/uniform/job_nullsuit/sec/hos
	display_name = "nullsuit, head of security"
	path = /obj/item/clothing/under/rank/nullsuit/sec/hos
	allowed_roles = list(JOB_HEAD_OF_SECURITY)

/datum/gear/uniform/job_nullsuit/med
	display_name = "nullsuit, med"
	path = /obj/item/clothing/under/rank/nullsuit/med
	allowed_roles = list(JOB_CHIEF_MEDICAL_OFFICER,JOB_MEDICAL_DOCTOR,JOB_CHEMIST,JOB_PARAMEDIC,JOB_GENETICIST,JOB_FIELD_MEDIC)

/datum/gear/uniform/job_nullsuit/med/cmo
	display_name = "nullsuit, chief medical officer"
	path = /obj/item/clothing/under/rank/nullsuit/med/cmo
	allowed_roles = list(JOB_CHIEF_MEDICAL_OFFICER)

/datum/gear/uniform/job_nullsuit/eng
	display_name = "nullsuit, eng"
	path = /obj/item/clothing/under/rank/nullsuit/eng
	allowed_roles = list(JOB_CHIEF_ENGINEER,JOB_ATMOSPHERIC_TECHNICIAN,JOB_ENGINEER)

/datum/gear/uniform/job_nullsuit/eng/ce
	display_name = "nullsuit, chief engineer"
	path = /obj/item/clothing/under/rank/nullsuit/eng/ce
	allowed_roles = list(JOB_CHIEF_ENGINEER)

/datum/gear/uniform/job_nullsuit/sci
	display_name = "nullsuit, sci"
	path = /obj/item/clothing/under/rank/nullsuit/sci
	allowed_roles = list(JOB_RESEARCH_DIRECTOR, JOB_SCIENTIST, JOB_ROBOTICIST, JOB_XENOBIOLOGIST, JOB_PATHFINDER, JOB_EXPLORER)

/datum/gear/uniform/job_nullsuit/sci/rd
	display_name = "nullsuit, research director"
	path = /obj/item/clothing/under/rank/nullsuit/sci/rd
	allowed_roles = list(JOB_RESEARCH_DIRECTOR)

/datum/gear/uniform/job_nullsuit/cargo
	display_name = "nullsuit, cargo"
	path = /obj/item/clothing/under/rank/nullsuit/cargo
	allowed_roles = list(JOB_QUARTERMASTER,JOB_SHAFT_MINER,JOB_CARGO_TECHNICIAN,JOB_HEAD_OF_PERSONNEL)


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
