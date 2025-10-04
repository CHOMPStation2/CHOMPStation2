/datum/material/valhollide //buffed protection and reflectivity
	protectiveness = 70
	reflectivity = 0.75


/datum/material/morphium //buffed protection
	protectiveness = 65

//disable this when this is ported upstream
/datum/material/weathered_agate
	name = MAT_EAGATE
	display_name = "energized agate"
	use_name = "energized agate"
	icon_colour = "#FF3300"
	stack_type = /obj/item/stack/material/weathered_agate
	flags = MATERIAL_UNMELTABLE
	cut_delay = 60
	reflectivity = 0
	conductivity = 1
	shard_type = SHARD_SHARD
	tableslam_noise = 'sound/effects/Glasshit.ogg'
	stack_origin_tech = list(TECH_ARCANE = 1)
	sheet_singular_name = "gem"
	sheet_plural_name = "gems"
	supply_conversion_value = 15
	icon_base = "stone"
	table_icon_base = "stone"


/obj/item/stack/material/weathered_agate
	name = MAT_EAGATE
	icon_state = "sheet-diamond"
	singular_name = "weathered agate"
	default_type = MAT_EAGATE
