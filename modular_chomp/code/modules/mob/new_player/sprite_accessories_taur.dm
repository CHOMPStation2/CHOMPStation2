/datum/sprite_accessory/tail
    var/vore_tail_sprite_variant = ""
    var/belly_variant_when_loaf = FALSE
    var/fullness_icons = 0
    var/struggle_anim = FALSE
    var/bellies_icon_path = 'modular_chomp/icons/mob/vore/Taur_Bellies.dmi'

/datum/sprite_accessory/tail/taur/wolf
	vore_tail_sprite_variant = "N"
	fullness_icons = 3

/datum/sprite_accessory/tail/taur/naga/naga_2c
	vore_tail_sprite_variant = "Naga"
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/horse
	vore_tail_sprite_variant = "Horse"
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/cow
	vore_tail_sprite_variant = "Cow"
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/lizard
	vore_tail_sprite_variant = "Lizard"
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/lizard/synthlizard
	vore_tail_sprite_variant = "SynthLiz"
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/feline
	vore_tail_sprite_variant = "Feline"
	belly_variant_when_loaf = TRUE
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/slug
	vore_tail_sprite_variant = "Slug"
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/drake
	vore_tail_sprite_variant = "Drake"
	belly_variant_when_loaf = TRUE
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/otie
	vore_tail_sprite_variant = "Otie"
	belly_variant_when_loaf = TRUE
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/deer
	vore_tail_sprite_variant = "Deer"
	belly_variant_when_loaf = TRUE
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/skunk
	vore_tail_sprite_variant = "Skunk"
	belly_variant_when_loaf = TRUE
	fullness_icons = 1

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
	vore_tail_sprite_variant = "NagaAlt"
	fullness_icons = 1

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


/datum/sprite_accessory/tail/taur/ch/naga/alt/second
	name = "Naga dual-color alt (Taur)"
	extra_overlay = "naga_alt_markings"

/datum/sprite_accessory/tail/taur/ch/naga/synthnaga
	name = "Synthetic Naga dual-color (Taur)"
	icon_state = "synthnaga"
	extra_overlay = "synthnaga_belly"

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
	fullness_icons = 3

/datum/sprite_accessory/tail/taur/ch/sergal/fatwheaties
	name = "Fat Sergal (Taur)"
	icon_state = "fatsergal"
	icon_sprite_tag = "wolf"
	vore_tail_sprite_variant = "N"
	fullness_icons = 3

/datum/sprite_accessory/tail/taur/ch/sergal/wheaties_2c
	name = "Sergal (Taur, dual-color)"
	icon_state = "sergwheat"
	extra_overlay = "sergwheat_markings"
	icon_sprite_tag = "wolf"
	vore_tail_sprite_variant = "N"
	fullness_icons = 3

/datum/sprite_accessory/tail/taur/ch/sergal/fatwheaties_2c
	name = "Fat Sergal (Taur, dual-color)"
	icon_state = "fatsergal"
	extra_overlay = "sergwheat_markings"
	icon_sprite_tag = "wolf"
	vore_tail_sprite_variant = "N"
	fullness_icons = 3

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
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 4

/datum/sprite_accessory/tail/taur/ch/sectdrone
	name = "Sect Drone (Taur)"
	icon_state = "sectdrone"
	extra_overlay = "sectdrone_markings"
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	vore_tail_sprite_variant = "SectDrone"
	belly_variant_when_loaf = TRUE
	loaf_offset = 3
	fullness_icons = 3

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

/datum/sprite_accessory/tail/taur/ch/kitsune
	name = "Kitsune (Taur)"
	icon_state = "kitsune"

/datum/sprite_accessory/tail/taur/ch/cow_alt
	name = "Cow Alt (Taur dual-color)"
	icon_state = "cow_alt"
	extra_overlay = "cow_alt_2"
	vore_tail_sprite_variant = "CowAlt"
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/ch/bigleggy
	name = "Big Leggies"
	icon_state = "bigleggy"
	extra_overlay = "bigleggy_markings"
	vore_tail_sprite_variant = "bigleggy"
	fullness_icons = 3
	ani_state = "bigleggy_stanced"
	extra_overlay_w = "bigleggy_markings_stanced"

/datum/sprite_accessory/tail/taur/ch/bigleggy/canine
	name = "Big Leggies (Canine Tail)"
	extra_overlay2 = "bigleggy_canine"
	extra_overlay2_w = "bigleggy_canine"

/datum/sprite_accessory/tail/taur/ch/bigleggy/feline
	name = "Big Leggies (Feline Tail)"
	extra_overlay2 = "bigleggy_feline"
	extra_overlay2_w = "bigleggy_feline"

/datum/sprite_accessory/tail/taur/ch/bigleggy/reptile
	name = "Big Leggies (Reptile Tail)"
	extra_overlay2 = "bigleggy_reptile"
	extra_overlay2_w = "bigleggy_reptile"

/datum/sprite_accessory/tail/taur/ch/bigleggy/snake
	name = "Big Leggies (Snake Tail)"
	extra_overlay2 = "bigleggy_snake"
	extra_overlay2_w = "bigleggy_snake"

/datum/sprite_accessory/tail/taur/ch/bigleggy/fox
	name = "Big Leggies (Fox Tail)"
	extra_overlay2 = "bigleggy_vulpine"
	extra_overlay2_w = "bigleggy_vulpine"

/datum/sprite_accessory/tail/taur/ch/bigleggy/bird
	name = "Big Leggies (Bird)"
	icon_state = "bigleggy"
	extra_overlay = "bigleggy_m_bird"
	extra_overlay2 = "bigleggy_bird"
	extra_overlay_w = "bigleggy_m_bird_stanced"
	extra_overlay2_w = "bigleggy_bird"

/datum/sprite_accessory/tail/taur/drake/extended //Sub-pathing drake taur so we can steal their cloaks
	name = "Fat Drake Extended (Taur)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	icon_state = "extended_fatdrake"
	extra_overlay = "extended_fatdrake_markings"
	extra_overlay2 = "extended_fatdrake_markings2"

	can_loaf = FALSE //Soon
	icon_loaf = 'icons/mob/vore/taurs_vr_loaf.dmi'
	loaf_offset = 6

/datum/sprite_accessory/tail/taur/ch/bigleggy/AlienSlug
	name = "Big Leggies (Alien Slug Tail)"
	icon_state = "bigleggy_full_alienslug"
	extra_overlay = "bigleggy_alienslug"
	extra_overlay_w = "bigleggy_alienslug"
	extra_overlay2 = "bigleggy_alienslug_m"
	extra_overlay2_w = "bigleggy_alienslug_m"
