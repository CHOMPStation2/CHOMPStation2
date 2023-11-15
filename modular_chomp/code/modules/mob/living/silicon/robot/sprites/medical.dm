//probably have alot of duplicated sprites with my lazy way of moving the surgeon sprites into crisis
/*Upstream implemented
/datum/robot_sprite/medical
	module_type = list("Crisis", "Surgeon")
	sprite_icon = 'icons/mob/robot/medical.dmi'


/datum/robot_sprite/dogborg/tall/medical
	module_type = list("Crisis", "Surgeon")
	sprite_icon = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi'

/datum/robot_sprite/dogborg/tall/medical/meka
	sprite_icon_state = "mekamed"
	has_vore_belly_sprites = TRUE		// These have R/G belly icons, but they're the same. Im adding them in as colored because
	has_sleeper_light_indicator = TRUE	// they were the only meka icons to not have a belly icon without the red/green color system.
										// Maybe someone plans to come back later and add them? This will give that support I guess. -Reo
/datum/robot_sprite/dogborg/tall/medical/mmeka
	sprite_icon_state = "mmekamed"
	has_vore_belly_sprites = TRUE
	has_sleeper_light_indicator = TRUE

/datum/robot_sprite/dogborg/tall/medical/fmeka
	sprite_icon_state = "fmekamed"
	has_vore_belly_sprites = TRUE
	has_sleeper_light_indicator = TRUE

/datum/robot_sprite/dogborg/tall/medical/k4t
	sprite_icon_state = "k4tmed"
	has_vore_belly_sprites = FALSE

/datum/robot_sprite/dogborg/tall/medical/k4t_alt1
	sprite_icon_state = "k4tmed_alt1"
	has_vore_belly_sprites = FALSE

*/
// Surgeon

// Regular sprites

/datum/robot_sprite/surgical
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/surgical.dmi'

/datum/robot_sprite/dogborg/surgical
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/surgical_wide.dmi'

// Tall sprites

/datum/robot_sprite/dogborg/tall/surgical
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/surgical_large.dmi'

/datum/robot_sprite/dogborg/raptor/surgical
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/surgical_large.dmi'

/datum/robot_sprite/dogborg/raptor/surgical/raptor
	name = "Raptor V-4 - Surgical"
	sprite_icon_state = "raptor"
	has_custom_equipment_sprites = TRUE
	rest_sprite_options = list("Default", "Bellyup")

/datum/robot_sprite/dogborg/crisis/vale2
	name = "Mediborg Model V-3"
	sprite_icon = 'modular_chomp/icons/mob/widerobot_ch.dmi'
	sprite_icon_state = "vale2"
	sprite_hud_icon_state = "medihound"
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE

/datum/robot_sprite/dogborg/crisis/cat
	name = "Cat"
	sprite_icon = 'modular_chomp/icons/mob/catborg/catborg.dmi'
	sprite_icon_state = "vixmed"
	has_vore_belly_resting_sprites = TRUE
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE

// Tall sprites

/datum/robot_sprite/dogborg/raptor/crisis
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/crisis_large.dmi'


/datum/robot_sprite/dogborg/raptor/crisis/raptor
	name = "Raptor V-4 - Crisis"
	sprite_icon_state = "medraptor"
	has_custom_equipment_sprites = TRUE
	rest_sprite_options = list("Default", "Bellyup")
