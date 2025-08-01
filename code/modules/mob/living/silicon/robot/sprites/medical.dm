// Crisis and Surgeon modules have a lot of shared sprites so they're in same file

// Both Surgeon and Crisis

// Regular sprites

/datum/robot_sprite/medical
	module_type = list("Crisis", "Surgeon")
	sprite_icon = 'icons/mob/robot/medical.dmi'

/datum/robot_sprite/medical/default
	name = DEFAULT_ROBOT_SPRITE_NAME
	default_sprite = TRUE
	sprite_icon_state = "default"

/datum/robot_sprite/medical/eyebot
	name = "Cabeiri"
	sprite_icon_state = "eyebot"

/datum/robot_sprite/medical/marina
	name = "Haruka"
	sprite_icon_state = "marina"

/datum/robot_sprite/medical/arachne
	name = "Minako"
	sprite_icon_state = "arachne"

/datum/robot_sprite/medical/tall
	name = "Usagi"
	sprite_icon_state = "tall"

/datum/robot_sprite/medical/heavy
	name = "XI-ALP"
	sprite_icon_state = "heavy"

/datum/robot_sprite/medical/old
	name = "Basic"
	sprite_icon_state = "old"
	has_eye_sprites = FALSE

/datum/robot_sprite/medical/droid
	name = "Advanced Droid"
	sprite_icon_state = "droid"

/datum/robot_sprite/medical/needles
	name = "Needles"
	sprite_icon_state = "needles"
	has_eye_sprites = FALSE

/datum/robot_sprite/medical/handy
	name = "Handy"
	sprite_icon_state = "handy"

/datum/robot_sprite/medical/insekt
	name = "Insekt"
	sprite_icon_state = "insekt"

/datum/robot_sprite/medical/tall2
	name = "Usagi-II"
	sprite_icon_state = "tall2"

/datum/robot_sprite/medical/drider
	name = "Tower"
	sprite_icon_state = "drider"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/medical/mechoid
	name = "Acheron"
	sprite_icon_state = "mechoid"

/datum/robot_sprite/medical/noble
	name = "Shellguard Noble"
	sprite_icon_state = "noble"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/surgical/worm
	name = "W02M - Surgical"
	sprite_icon_state = "worm-surgeon"
	sprite_icon = 'icons/mob/robot/wormborg.dmi'
	has_dead_sprite_overlay = FALSE
	has_custom_open_sprites = FALSE
	has_vore_belly_sprites = TRUE
	has_dead_sprite = TRUE

// Wide/dogborg sprites
/*
/datum/robot_sprite/dogborg/medical
	module_type = list("Crisis", "Surgeon")
	sprite_icon = 'icons/mob/robot/medical_wide.dmi'

		// None yet
*/
// Tall sprites
//CHOMPNote -- many of the lines in this is overriden in modular
/datum/robot_sprite/dogborg/tall/medical
	module_type = list("Crisis", "Surgeon")
	sprite_icon = 'icons/mob/robot/medical_large.dmi'

/datum/robot_sprite/dogborg/tall/medical/meka
	name = "MEKA"
	sprite_icon_state = "meka"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	has_vore_belly_sprites = FALSE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/medical/newmeka
	name = "MEKA v2"
	sprite_icon_state = "newmeka"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/medical/mmeka
	name = "NIKO"
	sprite_icon_state = "mmeka"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/medical/fmeka
	name = "NIKA"
	sprite_icon_state = "fmeka"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")

/datum/robot_sprite/dogborg/tall/medical/k4t
	name = "K4T"
	sprite_icon_state = "k4t"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	has_vore_belly_sprites = FALSE
	rest_sprite_options = list("Default", "Bellyup")

/datum/robot_sprite/dogborg/tall/medical/k4t_alt1
	name = "K4T Alt"
	sprite_icon_state = "k4t_alt1"
	has_eye_light_sprites = TRUE
	has_custom_open_sprites = TRUE
	has_vore_belly_sprites = FALSE
	rest_sprite_options = list("Default", "Bellyup")

/datum/robot_sprite/dogborg/tall/medical/dullahanmed
	sprite_icon = 'icons/mob/robot/dullahan/v1/dullahan_med.dmi'
	name = "Dullahan"
	sprite_icon_state = "dullahanmed"
	has_eye_light_sprites = TRUE
	has_rest_sprites = TRUE
	has_vore_belly_sprites = TRUE
	has_vore_belly_resting_sprites = TRUE
	has_rest_lights_sprites = TRUE
	has_rest_eyes_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")
	sprite_decals = list("breastplate","loincloth","eyecover")
	icon_x = 32
	pixel_x = 0

/datum/robot_sprite/dogborg/tall/medical/dullataurmed
	name = "Dullataur"
	sprite_icon_state = "dullataurmed"
	sprite_icon = 'icons/mob/robot/dullahan/dullataurs/dullataur.dmi'
	rest_sprite_options = list("Default")
	has_eye_light_sprites = TRUE
	has_rest_sprites = TRUE
	has_vore_belly_sprites = FALSE
	has_vore_belly_resting_sprites = FALSE
	has_rest_lights_sprites = TRUE
	has_rest_eyes_sprites = TRUE
	sprite_decals = list("breastplate")
	icon_x = 32
	pixel_x = 0

/datum/robot_sprite/dogborg/tall/medical/dullahanmedv3
	name = "Dullahan medical v3"
	sprite_decals = list("decals")
	sprite_icon = 'icons/mob/robot/dullahan/v3/medical.dmi'
	sprite_icon_state = "dullahanmedical"
	has_eye_light_sprites = TRUE
	has_rest_sprites = TRUE
	has_vore_belly_sprites = TRUE
	rest_sprite_options = list("Default", "Sit")
	sprite_decals = list("decals")
	icon_x = 64
	pixel_x = -16

// Surgeon

// Regular sprites

/datum/robot_sprite/surgical
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/surgical.dmi'

/datum/robot_sprite/surgical/toiletbot
	name = "Telemachus - Surgical"
	sprite_icon_state = "toiletbot"

/datum/robot_sprite/surgical/sleek
	name = "WTOperator - Surgical"
	sprite_icon_state = "sleek"

/datum/robot_sprite/surgical/drone
	name = "AG Model - Surgical"
	sprite_icon_state = "drone"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/surgical/glitterfly
	name = "Pyralis - Surgical"
	sprite_icon_state = "glitterfly"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/surgical/decapod
	name = "Decapod - Surgical"
	sprite_icon_state = "decapod"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/surgical/pneuma
	name = "Pneum - Surgical"
	sprite_icon_state = "pneuma"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/surgical/zoomba
	name = "ZOOM-BA - Surgical"
	sprite_icon_state = "zoomba"
	has_dead_sprite = TRUE

/datum/robot_sprite/surgical/uptall
	name = "Feminine Humanoid - Surgical"
	sprite_icon_state = "uptall"

// Wide/dogborg sprites

/datum/robot_sprite/dogborg/surgical
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/surgical_wide.dmi'

/datum/robot_sprite/dogborg/surgical/do_equipment_glamour(var/obj/item/robot_module/module)
	..()

	if(!has_custom_equipment_sprites)
		return

	var/obj/item/shockpaddles/robot/SP = locate() in module.modules
	if(SP)
		SP.name = "paws of life"
		SP.desc = "Zappy paws. For fixing cardiac arrest."
		SP.icon = 'icons/mob/dogborg_vr.dmi'
		SP.icon_state = "defibpaddles0"
		SP.attack_verb = list("batted", "pawed", "bopped", "whapped")

/datum/robot_sprite/dogborg/surgical/vale
	name = "Traumahound"
	sprite_icon_state = "vale"
	sprite_hud_icon_state = "medihound"
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE

/datum/robot_sprite/dogborg/surgical/borgi
	name = "Borgi - Surgical"
	sprite_icon_state = "borgi"
	sprite_hud_icon_state = "medihound"
	has_eye_sprites = FALSE
	has_eye_light_sprites = TRUE
	has_dead_sprite_overlay = FALSE

/datum/robot_sprite/dogborg/surgical/drake
	name = "Drake - Surgical"
	sprite_icon_state = "drake"

// Tall sprites
//CHOMPNote -- many of the lines in this is overriden in modular
/datum/robot_sprite/dogborg/tall/surgical
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/surgical_large.dmi'

/datum/robot_sprite/dogborg/tall/surgical/do_equipment_glamour(var/obj/item/robot_module/module)
	..()

	if(!has_custom_equipment_sprites)
		return

	var/obj/item/shockpaddles/robot/SP = locate() in module.modules
	if(SP)
		SP.name = "paws of life"
		SP.desc = "Zappy paws. For fixing cardiac arrest."
		SP.icon = 'icons/mob/dogborg_vr.dmi'
		SP.icon_state = "defibpaddles0"
		SP.attack_verb = list("batted", "pawed", "bopped", "whapped")

/datum/robot_sprite/dogborg/tall/surgical/raptor
	name = "Raptor V-4 - Surgical"
	sprite_icon_state = "raptor"
	has_custom_equipment_sprites = TRUE
	rest_sprite_options = list("Default", "Bellyup")


// Crisis

// Regular sprites

/datum/robot_sprite/crisis
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/crisis.dmi'

/datum/robot_sprite/crisis/toiletbot
	name = "Telemachus - Crisis"
	sprite_icon_state = "toiletbot"

/datum/robot_sprite/crisis/sleek
	name = "WTOperator - Crisis"
	sprite_icon_state = "sleek"

/datum/robot_sprite/crisis/drone
	name = "AG Model-Med"
	sprite_icon_state = "drone-crisis"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/crisis/drone_chem
	name = "AG Model-Chem"
	sprite_icon_state = "drone-chem"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/crisis/glitterfly
	name = "Pyralis - Crisis"
	sprite_icon_state = "glitterfly"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/crisis/decapod
	name = "Decapod - Crisis"
	sprite_icon_state = "decapod"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/crisis/pneuma
	name = "Pneuma - Crisis"
	sprite_icon_state = "pneuma"
	has_custom_open_sprites = TRUE

/datum/robot_sprite/crisis/zoomba
	name = "ZOOM-BA - Crisis"
	sprite_icon_state = "zoomba"
	has_dead_sprite = TRUE

/datum/robot_sprite/crisis/uptall
	name = "Feminine Humanoid - Crisis"
	sprite_icon_state = "uptall"

// Wide/dogborg sprites

/datum/robot_sprite/dogborg/crisis
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/crisis_wide.dmi'

/* //Handled by the normal belly code now.
/datum/robot_sprite/dogborg/crisis/get_belly_overlay(var/mob/living/silicon/robot/ourborg)
	if(has_sleeper_light_indicator)
		if(ourborg.sleeper_state == 2 && !(ourborg.vore_selected?.silicon_belly_overlay_preference == "Vorebelly")) return "[sprite_icon_state]-sleeper_g"
		else return "[sprite_icon_state]-sleeper_r"
	else
		return ..()
*/
/datum/robot_sprite/dogborg/crisis/do_equipment_glamour(var/obj/item/robot_module/module)
	..()

	if(!has_custom_equipment_sprites)
		return

	var/obj/item/shockpaddles/robot/SP = locate() in module.modules
	if(SP)
		SP.name = "paws of life"
		SP.desc = "Zappy paws. For fixing cardiac arrest."
		SP.icon = 'icons/mob/dogborg_vr.dmi'
		SP.icon_state = "defibpaddles0"
		SP.attack_verb = list("batted", "pawed", "bopped", "whapped")

/datum/robot_sprite/dogborg/crisis/hound
	name = "Medihound"
	sprite_icon_state = "hound"
	sprite_hud_icon_state = "medihound"
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE

/datum/robot_sprite/dogborg/crisis/hounddark
	name = "Medihound Dark"
	sprite_icon_state = "hounddark"
	sprite_hud_icon_state = "medihound"
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE

/datum/robot_sprite/dogborg/crisis/vale
	name = "Medihound V2"
	sprite_icon_state = "vale"
	sprite_hud_icon_state = "medihound"
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE

/datum/robot_sprite/dogborg/crisis/borgi
	name = "Borgi - Crisis"
	sprite_icon_state = "borgi"
	sprite_hud_icon_state = "medihound"
	has_eye_sprites = FALSE
	has_eye_light_sprites = TRUE
	has_dead_sprite_overlay = FALSE

/datum/robot_sprite/dogborg/crisis/drake
	name = "Drake - Crisis"
	sprite_icon_state = "drake"

// Tall sprites

/datum/robot_sprite/dogborg/tall/crisis
	module_type = "Crisis"
	sprite_icon = 'icons/mob/robot/crisis_large.dmi'

/datum/robot_sprite/dogborg/tall/crisis/do_equipment_glamour(var/obj/item/robot_module/module)
	..()

	if(!has_custom_equipment_sprites)
		return
	var/obj/item/shockpaddles/robot/SP = locate() in module.modules
	if(SP)
		SP.name = "paws of life"
		SP.desc = "Zappy paws. For fixing cardiac arrest."
		SP.icon = 'icons/mob/dogborg_vr.dmi'
		SP.icon_state = "defibpaddles0"
		SP.attack_verb = list("batted", "pawed", "bopped", "whapped")

/datum/robot_sprite/dogborg/tall/crisis/raptor
	name = "Raptor V-4 - Crisis"
	sprite_icon_state = "raptor"
	has_custom_equipment_sprites = TRUE
	rest_sprite_options = list("Default", "Bellyup")

/datum/robot_sprite/dogborg/crisis/cat
	name = "Cat"
	sprite_icon = 'icons/mob/robot/catborg_variant.dmi'
	sprite_icon_state = "vixmed"
	has_vore_belly_resting_sprites = TRUE
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE
	has_dead_sprite_overlay = FALSE

//Medical into Crisis type merge
/datum/robot_sprite/surgical
	module_type = "Crisis"

/datum/robot_sprite/dogborg/surgical
	module_type = "Crisis"

//Added sprites
/datum/robot_sprite/dogborg/crisis/vale2
	name = "Mediborg Model V-3"
	sprite_icon = 'icons/mob/robot/widerobot/widerobot.dmi'
	sprite_icon_state = "vale2"
	sprite_hud_icon_state = "medihound"
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE
	rest_sprite_options = list("Default")

/datum/robot_sprite/dogborg/crisis/cat
	name = "Cat"
	sprite_icon = 'icons/mob/robot/catborg_variant.dmi'
	sprite_icon_state = "vixmed"
	has_vore_belly_resting_sprites = TRUE
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = TRUE

/datum/robot_sprite/dogborg/crisis/smolraptor
	sprite_icon = 'icons/mob/robot/smallraptors/smolraptor_med.dmi'
	name = "Small Raptor"
	sprite_icon_state = "smolraptor"
	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	has_dead_sprite_overlay = FALSE
	rest_sprite_options = list("Default", "Sit", "Bellyup")

/datum/robot_sprite/dogborg/crisis/smolraptor/alt
	name = "Small Raptor Alt"
	sprite_icon_state = "smolraptor_alt"
