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

//Medical into Crisis type merge
/datum/robot_sprite/surgical
	module_type = "Crisis"

/datum/robot_sprite/dogborg/surgical
	module_type = "Crisis"

// Tall sprites

/datum/robot_sprite/dogborg/tall/surgical
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/surgical_large.dmi'

//sprite name overwrites
/datum/robot_sprite/surgical/toiletbot
	name = "Telemachus - Surgical"

/datum/robot_sprite/surgical/sleek
	name = "WTOperator - Surgical"

/datum/robot_sprite/surgical/drone
	name = "AG Model - Surgical"

/datum/robot_sprite/surgical/glitterfly
	name = "Pyralis - Surgical"

/datum/robot_sprite/surgical/decapod
	name = "Decapod - Surgical"

/datum/robot_sprite/surgical/pneuma
	name = "Pneum - Surgical"

/datum/robot_sprite/surgical/zoomba
	name = "ZOOM-BA - Surgical"

/datum/robot_sprite/surgical/uptall
	name = "Feminine Humanoid - Surgical"

/datum/robot_sprite/dogborg/surgical/borgi
	name = "Borgi - Surgical"

/datum/robot_sprite/dogborg/surgical/drake
	name = "Drake - Surgical"

/datum/robot_sprite/dogborg/tall/surgical/raptor
	name = "Raptor V-4 - Surgical"

/datum/robot_sprite/crisis/toiletbot
	name = "Telemachus - Crisis"

/datum/robot_sprite/crisis/sleek
	name = "WTOperator - Crisis"

/datum/robot_sprite/crisis/glitterfly
	name = "Pyralis - Crisis"

/datum/robot_sprite/crisis/decapod
	name = "Decapod - Crisis"

/datum/robot_sprite/crisis/pneuma
	name = "Pneuma - Crisis"

/datum/robot_sprite/crisis/zoomba
	name = "ZOOM-BA - Crisis"

/datum/robot_sprite/crisis/uptall
	name = "Feminine Humanoid - Crisis"

/datum/robot_sprite/dogborg/crisis/borgi
	name = "Borgi - Crisis"

/datum/robot_sprite/dogborg/crisis/drake
	name = "Drake - Crisis"

/datum/robot_sprite/dogborg/tall/crisis/raptor
	name = "Raptor V-4 - Crisis"

//Added sprites
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

/datum/robot_sprite/surgical/worm
	name = "W02M - Surgical"
	sprite_icon_state = "worm-surgeon"
	has_custom_open_sprites = TRUE
	sprite_icon = 'modular_chomp/icons/mob/wormborg.dmi'
	has_vore_belly_sprites = TRUE
	has_dead_sprite = TRUE
