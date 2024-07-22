// Wide/dogborg sprites

/datum/robot_sprite/dogborg/janitor
	module_type = "Janitor"
	sprite_icon = 'icons/mob/robot/janitor_wide.dmi'

/datum/robot_sprite/dogborg/janitor/cat
	name = "Cat"
	sprite_icon = 'modular_chomp/icons/mob/catborg/catborg.dmi'
	sprite_icon_state = "vixjani"
	has_vore_belly_resting_sprites = TRUE
	has_eye_light_sprites = TRUE


/datum/robot_sprite/dogborg/tall/dullahanjanitormodule
	module_type = "Janitor"
	sprite_icon = 'modular_chomp/icons/mob/dullahanborg/dullahan_jani.dmi'


/datum/robot_sprite/dogborg/tall/dullahanjanitormodule/dullahanjanitor
	name = "Dullahan"
	sprite_icon_state = "dullahanjani"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")
	pixel_x = 0

/datum/robot_sprite/dogborg/tall/dullahanjanitormodule/dullahanjanitoralt
	name = "Dullahan v2"
	sprite_icon_state = "dullahanjani_alt"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")
	pixel_x = 0
