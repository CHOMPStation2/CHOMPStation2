/datum/robot_sprite/dogborg/mining/cat
	name = "Cat - Mining"
	sprite_icon = 'modular_chomp/icons/mob/catborg/catborg.dmi'
	sprite_icon_state = "vixmine"
	has_vore_belly_resting_sprites = TRUE
	has_eye_light_sprites = TRUE

/datum/robot_sprite/dogborg/mining/catcargo
	name = "Cat - Cargo"
	sprite_icon = 'modular_chomp/icons/mob/catborg/catborg.dmi'
	sprite_icon_state = "vixcargo"
	has_vore_belly_resting_sprites = TRUE
	has_eye_light_sprites = TRUE

/*Upstream implemented
/datum/robot_sprite/dogborg/tall/mining
	sprite_icon = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi'

/datum/robot_sprite/dogborg/raptor/mining
	module_type = "Miner"
	sprite_icon = 'modular_chomp/icons/mob/raptorborg/raptor.dmi'

/datum/robot_sprite/dogborg/raptor/mining/raptor
	name = "Raptor V-4"
	sprite_icon_state = "mineraptor"
	has_custom_equipment_sprites = TRUE
	rest_sprite_options = list("Default", "Bellyup")
*/

//sprite name overwrites
/datum/robot_sprite/dogborg/tall/mining/meka
	name = "MEKA - Mining"

/datum/robot_sprite/dogborg/tall/mining/mmeka
	name = "NIKO - Mining"

/datum/robot_sprite/dogborg/tall/mining/fmeka
	name = "NIKA - Mining"

/datum/robot_sprite/dogborg/tall/mining/k4t
	name = "K4T - Mining"

/datum/robot_sprite/dogborg/tall/mining/k4t_alt1
	name = "K4Talt - Mining"

//Upstream does not have those, if we want them, we should add them on top now
/datum/robot_sprite/dogborg/tall/mining/ch
	sprite_icon = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi'
	pixel_x = 0

/datum/robot_sprite/dogborg/tall/mining/ch/mekacargo
	name = "MEKA - Cargo"
	sprite_icon_state = "mekacargo"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = FALSE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/mining/ch/mmekacargo
	name = "NIKO - Cargo"
	sprite_icon_state = "mmekacargo"
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/mining/ch/fmekacargo
	name = "NIKA - Cargo"
	sprite_icon_state = "fmekacargo"
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/mining/ch/k4tcargo
	name = "K4T - Cargo"
	sprite_icon_state = "k4tcargo"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = FALSE
	rest_sprite_options = list("Default", "Bellyup")

/datum/robot_sprite/dogborg/tall/mining/ch/k4t_alt1cargo
	name = "K4Talt - Cargo"
	sprite_icon_state = "k4tcargo_alt1"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = FALSE
	rest_sprite_options = list("Default", "Bellyup")
