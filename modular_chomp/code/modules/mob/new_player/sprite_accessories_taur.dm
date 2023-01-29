/datum/sprite_accessory/tail/taur
    var/vore_tail_sprite_variant = ""
    var/belly_variant_when_loaf = FALSE

/datum/sprite_accessory/tail/taur/wolf
	vore_tail_sprite_variant = "N"

/datum/sprite_accessory/tail/taur/ch
	icon = 'icons/mob/vore/taurs_ch.dmi'//Parent which allows us to not need to set icon every time.

/datum/sprite_accessory/tail/taur/ch/zorgoia
	name = "Zorgoia (Taur)"
	icon_state = "zorgoia"
	extra_overlay = "zorgoia_fluff"

/datum/sprite_accessory/tail/taur/ch/zorgoia/fat
	name = "Zorgoia (Fat Taur)"
	extra_overlay = "zorgoia_fat"

/datum/sprite_accessory/tail/taur/ch/redpanda
	name = "Red Panda (Taur)"
	icon_state = "redpanda"

/datum/sprite_accessory/tail/taur/ch/redpandadc
	name = "Red Panda (Taur dual-color)"
	icon_state = "redpanda_dc"
	extra_overlay = "redpanda_dc_markings"

/datum/sprite_accessory/tail/taur/ch/wolf/fatwolf_2c/fatwolfalt
	name = "Fat Wolf 3-color-alt (Taur)"
	icon_state = "fatwolfalt_s"
	extra_overlay = "fatwolfalt_markings1"
	extra_overlay2 = "fatwolfalt_markings2"
	icon_sprite_tag = "wolf"

/datum/sprite_accessory/tail/taur/ch/naga/alt
	name = "Naga alt (Taur)"
	icon_state = "naga_alt_s"
	suit_sprites = 'modular_chomp/icons/mob/taursuits_naga_ch.dmi'

	msg_owner_help_walk = "You carefully slither around %prey."
	msg_prey_help_walk = "%owner's huge tail slithers past beside you!"

	msg_owner_help_run = "You carefully slither around %prey."
	msg_prey_help_run = "%owner's huge tail slithers past beside you!"

	msg_owner_disarm_run = "Your tail slides over %prey, pushing them down to the ground!"
	msg_prey_disarm_run = "%owner's tail slides over you, forcing you down to the ground!"

	msg_owner_disarm_walk = "You push down on %prey with your tail, pinning them down under you!"
	msg_prey_disarm_walk = "%owner pushes down on you with their tail, pinning you down below them!"

	msg_owner_harm_run = "Your heavy tail carelessly slides past %prey, crushing them!"
	msg_prey_harm_run = "%owner quickly goes over your body, carelessly crushing you with their heavy tail!"

	msg_owner_harm_walk = "Your heavy tail slowly and methodically slides down upon %prey, crushing against the floor below!"
	msg_prey_harm_walk = "%owner's thick, heavy tail slowly and methodically slides down upon your body, mercilessly crushing you into the floor below!"

	msg_owner_grab_success = "You slither over %prey with your large, thick tail, smushing them against the ground before coiling up around them, trapping them within the tight confines of your tail!"
	msg_prey_grab_success = "%owner slithers over you with their large, thick tail, smushing you against the ground before coiling up around you, trapping you within the tight confines of their tail!"

	msg_owner_grab_fail = "You squish %prey under your large, thick tail, forcing them onto the ground!"
	msg_prey_grab_fail = "%owner pins you under their large, thick tail, forcing you onto the ground!"

	msg_prey_stepunder = "You jump over %prey's thick tail."
	msg_owner_stepunder = "%owner bounds over your tail."


/datum/sprite_accessory/tail/taur/ch/naga/alt_2c
	name = "Naga dual-color alt (Taur)"
	icon_state = "naga_alt_s"
	extra_overlay = "naga_alt_markings"
	suit_sprites = 'modular_chomp/icons/mob/taursuits_naga_ch.dmi'

/datum/sprite_accessory/tail/taur/ch/horse/scoli
	name = "Scolipede (Taur)"
	icon_state = "scoli_s"
	extra_overlay = "scoli_markings1"
	extra_overlay2 = "scoli_markings2"

/datum/sprite_accessory/tail/taur/ch/sergal/wheaties
	name = "Sergal (Taur)"
	icon_state = "sergwheat"
	icon_sprite_tag = "wolf"
	vore_tail_sprite_variant = "N"

/datum/sprite_accessory/tail/taur/ch/sergal/fatwheaties
	name = "Fat Sergal (Taur)"
	icon_state = "fatsergal"
	icon_sprite_tag = "wolf"

/datum/sprite_accessory/tail/taur/ch/sergal/wheaties_2c
	name = "Sergal (Taur, dual-color)"
	icon_state = "sergwheat"
	extra_overlay = "sergwheat_markings"
	icon_sprite_tag = "wolf"
	vore_tail_sprite_variant = "N"

/datum/sprite_accessory/tail/taur/ch/sergal/fatwheaties_2c
	name = "Fat Sergal (Taur, dual-color)"
	icon_state = "fatsergal"
	extra_overlay = "sergwheat_markings"
	icon_sprite_tag = "wolf"

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
