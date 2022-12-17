/datum/sprite_accessory/tail/taur
    var/vore_tail_sprite_variant = ""
    var/belly_variant_when_loaf = FALSE

/datum/sprite_accessory/tail/taur/wolf
	vore_tail_sprite_variant = "N"

/datum/sprite_accessory/tail/taur/ch/longvirus
	name = "Long Virus (Taur)"
	icon_state = "longvirus_s"
	extra_overlay = "longvirus_markings"
	icon_sprite_tag = "virus"
	//suit_sprites = 'icons/mob/taursuits_noodle.dmi' Aye, I've gotta sprite that shit.´

/datum/sprite_accessory/tail/taur/ch/fox
	name = "Fox (Taur, 3-color)"
	icon_state = "fox"
	extra_overlay = "fox_markings"
	extra_overlay2 = "fox_markings2"

/datum/sprite_accessory/tail/taur/ch/sectdrone
	name = "Sect Drone (Taur)"
	icon_state = "sectdrone"
	extra_overlay = "sectdrone_markings"
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	taur_belly_icon = 'icons/mob/vore/Taur_Bellies_ch.dmi'
	vore_tail_sprite_variant = "SectDrone"
	belly_variant_when_loaf = TRUE
	loaf_offset = 3

	msg_owner_disarm_run = "You quickly push %prey to the ground with your leg!"
	msg_prey_disarm_run = "%owner pushes you down to the ground with their leg!"

	msg_owner_disarm_walk = "You firmly push your leg down on %prey, painfully but harmlessly pinning them to the ground!"
	msg_prey_disarm_walk = "%owner firmly pushes their leg down on you, quite painfully but harmlessly pinning you to the ground!"

	msg_owner_harm_walk = "You methodically place your leg down upon %prey's body, slowly applying pressure, crushing them against the floor!"
	msg_prey_harm_walk = "%owner methodically places their leg upon your body, slowly applying pressure, crushing you against the floor!"

	msg_owner_grab_success = "You pin %prey down on the ground with your front leg before using your other leg to pick them up, trapping them between two of your front legs!"
	msg_prey_grab_success = "%owner pins you down on the ground with their front leg before using their other leg to pick you up, trapping you between two of their front legs!"

	msg_owner_grab_fail = "You step down onto %prey, squishing them and forcing them down to the ground!"
	msg_prey_grab_fail = "%owner steps down and squishes you with their leg, forcing you down to the ground!"

/datum/sprite_accessory/tail/taur/ch/fatsectdrone
	name = "Fat Sect Drone (Taur)"
	icon_state = "fatsectdrone"
	extra_overlay = "fatsectdrone_markings"
