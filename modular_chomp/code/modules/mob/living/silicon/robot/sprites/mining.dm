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

//sprite name overwrites
/datum/robot_sprite/dogborg/tall/mining/meka
	name = "MEKA - Mining"

/datum/robot_sprite/dogborg/tall/mining/newmeka
	name = "MEKA v2 - Mining"

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

/datum/robot_sprite/dogborg/tall/mining/dullahan
	sprite_icon = 'modular_chomp/icons/mob/dullahanborg/dullahan_mine.dmi'
	pixel_x = 0

/datum/robot_sprite/dogborg/tall/mining/dullahan/miner
	name = "Dullahan Mining unit"
	sprite_icon_state = "dullahanmine"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/mining/dullahan/mineralt
	name = "Dullahan Mining unit v2"
	sprite_icon_state = "dullahanmine_alt"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/mining/dullahancarg
	sprite_icon = 'modular_chomp/icons/mob/dullahanborg/dullahan_cargo.dmi'
	pixel_x = 0

/datum/robot_sprite/dogborg/tall/mining/dullahancarg/cargo
	name = "Dullahan Cargo"
	sprite_icon_state = "dullahancargo"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/mining/dullahancarg/cargoalt
	name = "Dullahan Cargo v2"
	sprite_icon_state = "dullahancargo_alt"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/mining/smolraptorminer
	sprite_icon = 'modular_chomp/icons/mob/smallraptors/smolraptor_min.dmi'

/datum/robot_sprite/dogborg/mining/smolraptorcargo
	sprite_icon = 'modular_chomp/icons/mob/smallraptors/smolraptor_car.dmi'


/datum/robot_sprite/dogborg/mining/smolraptorminer/miner
	name = "Small Raptor Miner"
	sprite_icon_state = "smolraptor"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/mining/smolraptorcargo/cargo
	name = "Small Raptor Cargo"
	sprite_icon_state = "smolraptor"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")
