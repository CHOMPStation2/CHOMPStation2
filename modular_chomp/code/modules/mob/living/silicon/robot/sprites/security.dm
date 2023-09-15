/datum/robot_sprite/dogborg/security/vale2
	name = "Secborg model V-3"
	sprite_icon = 'modular_chomp/icons/mob/widerobot_ch.dmi'
	sprite_icon_state = "secvale"
	sprite_hud_icon_state = "k9"
	has_eye_light_sprites = TRUE
	has_laser_sprite = FALSE //Missing from the dmi
	has_taser_sprite = FALSE //ditto

/datum/robot_sprite/dogborg/security/cat
	name = "Cat"
	sprite_icon = 'modular_chomp/icons/mob/catborg/catborg.dmi'
	sprite_icon_state = "vixsec"
	sprite_hud_icon_state = "k9"
	has_eye_light_sprites = TRUE
	has_laser_sprite = FALSE //Missing from the dmi
	has_taser_sprite = FALSE //ditto

// Tall sprites

/datum/robot_sprite/dogborg/tall/security
	module_type = "Security"
	sprite_icon = 'icons/mob/robot/security_large.dmi'

/datum/robot_sprite/dogborg/raptor/security
	module_type = "Security"
	sprite_icon = 'modular_chomp/icons/mob/raptorborg/raptor.dmi'

/datum/robot_sprite/dogborg/raptor/security/raptor
	sprite_icon_state = "secraptor"

/datum/robot_sprite/dogborg/tall/security/meka
	sprite_icon_state = "mekasec"
	has_vore_belly_sprites = TRUE
	belly_light_list = list("sleeper")

/datum/robot_sprite/dogborg/tall/security/mmeka
	sprite_icon_state = "mmekasec"
	has_vore_belly_sprites = TRUE
	belly_light_list = list("sleeper")

/datum/robot_sprite/dogborg/tall/security/fmeka
	sprite_icon_state = "fmekasec"
	has_vore_belly_sprites = TRUE
	belly_light_list = list("sleeper")

/datum/robot_sprite/dogborg/tall/security/k4t
	sprite_icon_state = "k4tsec"
	has_vore_belly_sprites = FALSE
