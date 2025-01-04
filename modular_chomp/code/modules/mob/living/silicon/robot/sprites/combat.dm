/datum/robot_sprite/dogborg/tall/combat/ch
	module_type = "Combat"
	sprite_icon = 'modular_chomp/icons/mob/tallborg/tallrobots.dmi'
	pixel_x = 0

/datum/robot_sprite/dogborg/tall/combat/ch/meka
	name = "MEKA"
	sprite_icon_state = "mekasyndi"
	has_vore_belly_sprites = TRUE

/datum/robot_sprite/dogborg/tall/combat/ch/mmeka
	name = "NIKO"
	sprite_icon_state = "mmekasyndi"
	has_vore_belly_sprites = TRUE

/datum/robot_sprite/dogborg/tall/combat/ch/fmeka
	name = "NIKA"
	sprite_icon_state = "fmekasyndi"
	has_vore_belly_sprites = TRUE

/datum/robot_sprite/dogborg/tall/combat/ch/k4t
	name = "K4T"
	sprite_icon_state = "k4tsyndi"
	has_vore_belly_sprites = FALSE

//Using our own category wide here not to interfere with upstream in case they add wide sprites under just dogborg.
/datum/robot_sprite/dogborg/wide/combat
	module_type = "Combat"
	has_custom_equipment_sprites = TRUE
	has_eye_sprites = FALSE

/datum/robot_sprite/dogborg/wide/combat/blade/do_equipment_glamour(var/obj/item/robot_module/module)
	if(!has_custom_equipment_sprites)
		return

	..()

	var/obj/item/melee/robotic/blade/CBB = locate() in module.modules
	if(CBB)
		CBB.name = "combat saw"
		CBB.desc = "A high frequency blade attached to the end of a cyborg's tail. It appears to be extremely sharp."
	var/obj/item/melee/robotic/borg_combat_shocker/BCS = locate() in module.modules
	if(BCS)
		BCS.name = "combat jaws"
		BCS.desc = "Shockingly chompy!"
		BCS.icon_state = "ertjaws"
		BCS.hitsound = 'sound/weapons/bite.ogg'
		BCS.attack_verb = list("chomped", "bit", "ripped", "mauled", "enforced")
		BCS.dogborg = TRUE

/datum/robot_sprite/dogborg/wide/combat/blade
	sprite_icon = 'modular_chomp/icons/mob/widerobot_ch.dmi'
	name = "Blade"
	sprite_icon_state = "blade"
	sprite_hud_icon_state = "ert"
	rest_sprite_options = list()
	sprite_flags = ROBOT_HAS_LASER_SPRITE | ROBOT_HAS_DISABLER_SPRITE | ROBOT_HAS_DAGGER_SPRITE
