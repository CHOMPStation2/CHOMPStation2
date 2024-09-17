/datum/gear/uniform/victsuit
	description = "A victorian style suit, fancy!"
	display_name = "Victorian suit selection"

/datum/gear/uniform/victsuit/New()
	..()
	var/list/victsuits = list()
	for(var/suitvict in (typesof(/obj/item/clothing/under/yw/victsuit) - typesof(/obj/item/clothing/under/yw/victsuit/victdress)))
		var/obj/item/clothing/under/yw/victsuit/suitvict_type = suitvict
		victsuits[initial(suitvict_type.name)] = suitvict_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(victsuits))

/datum/gear/uniform/victdress
	description = "A victorian style dress, fancy!"
	display_name = "Victorian dress, Black"
	path = /obj/item/clothing/under/yw/victsuit/victdress

/datum/gear/uniform/redvictdress
	description = "A victorian style dress, fancy!"
	display_name = "Victorian Dress, Red"
	path = /obj/item/clothing/under/yw/victsuit/victdress/red

/datum/gear/uniform/pilot1
	display_name = "NT Pilot Uniform"
	description = "A blue and grey NanoTrasen flight suit. Warm and practical, it feels cozy. Includes harness and webbing."
	path = /obj/item/clothing/under/rank/pilot1
	cost = 2 //base cost 1 + accessory 1
	allowed_roles = list(JOB_PILOT,JOB_SECURITY_PILOT)

/datum/gear/uniform/pilot2
	display_name = "NT Pilot Uniform, Alt."
	description = "A dark blue NanoTrasen flight suit. Warm and practical, several patches are scattered across it. Includes harness and webbing."
	path = /obj/item/clothing/under/rank/pilot2
	cost = 2 //base cost 1 + accessory 1
	allowed_roles = list(JOB_PILOT,JOB_SECURITY_PILOT)

/datum/gear/uniform/combatpilot
	display_name = JOB_SECURITY_PILOT + " Uniform"
	description = "A lightweight uniform intended for vehicle and powersuit operators, designed to allow free movement and maximum comfort in hot, cramped cockpits. Comes prefitted with a harness and webbing for gear."
	path = /obj/item/clothing/under/rank/khi/sec/pilot
	cost = 2 //base cost 1 + accessory 1
	allowed_roles = list(JOB_PILOT,JOB_SECURITY_PILOT) //CHOMPEDIT: Adding this to pilots as well
