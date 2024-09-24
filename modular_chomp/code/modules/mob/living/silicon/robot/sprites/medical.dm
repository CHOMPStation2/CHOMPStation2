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


/datum/robot_sprite/dogborg/tall/crisis/dullahan
	module_type = "Crisis"
	sprite_icon = 'modular_chomp/icons/mob/dullahanborg/dullahan_med.dmi'
	pixel_x = 0
/datum/robot_sprite/dogborg/tall/crisis/dullahan/crisis
	name = "Dullahan"
	sprite_icon_state = "dullahanmed"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/crisis/dullahan/crisisalt
	name = "Dullahan v2"
	sprite_icon_state = "dullahanmed_alt"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/smolraptor
	sprite_icon = 'modular_chomp/icons/mob/smallraptors/smolraptor_med.dmi'
	module_type = "Crisis"

/datum/robot_sprite/dogborg/smolraptor/crisis
	name = "Small Raptor"
	sprite_icon_state = "smolraptor"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")
