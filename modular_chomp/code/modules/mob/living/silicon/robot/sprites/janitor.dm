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


/datum/robot_sprite/dogborg/tall/janitor/dullahan
	module_type = "Janitor"
	sprite_icon = 'modular_chomp/icons/mob/dullahanborg/dullahan_jani.dmi'
	pixel_x = 0

/datum/robot_sprite/dogborg/tall/janitor/dullahan/janitor
	name = "Dullahan"
	sprite_icon_state = "dullahanjani"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/janitor/dullahan/janitoralt
	name = "Dullahan v2"
	sprite_icon_state = "dullahanjani_alt"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/smolraptorjanitorsprite
	sprite_icon = 'modular_chomp/icons/mob/smallraptors/smolraptor_jani.dmi'
	module_type = "Janitor"

/datum/robot_sprite/dogborg/smolraptorjanitorsprite/smolraptorjani
	name = "Small Raptor"
	sprite_icon_state = "smolraptor"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")
