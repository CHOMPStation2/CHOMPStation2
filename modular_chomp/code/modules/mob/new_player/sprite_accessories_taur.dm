/datum/sprite_accessory/tail/taur/ch
	icon = 'icons/mob/vore/taurs_ch.dmi'//Parent which allows us to not need to set icon every time.

/datum/sprite_accessory/tail/taur/ch/zorgoia
	name = "Zorgoia (Taur)"
	icon_state = "zorgoia"
	extra_overlay = "zorgoia_fluff"

/datum/sprite_accessory/tail/taur/ch/zorgoia/fat
	name = "Zorgoia (Fat Taur)"
	icon_state = "zorgoia_fat"
	extra_overlay = "zorgoia_fat_overlay"

/datum/sprite_accessory/tail/taur/ch/sergal/wheaties_2c
	name = "Sergal (Taur, dual-color)"
	icon_state = "sergwheat"
	extra_overlay = "sergwheat_markings"
	icon_sprite_tag = "wolf"
	vore_tail_sprite_variant = "N"
	fullness_icons = 3
	struggle_anim = TRUE

/datum/sprite_accessory/tail/taur/ch/sergal/fatwheaties_2c
	name = "Fat Sergal (Taur, dual-color)"
	icon_state = "fatsergal"
	extra_overlay = "sergwheat_markings"
	icon_sprite_tag = "wolf"
	vore_tail_sprite_variant = "N"
	fullness_icons = 3
	struggle_anim = TRUE


/datum/sprite_accessory/tail/taur/ch/fox
	name = "Fox (Taur, 3-color)"
	icon_state = "fox"
	extra_overlay = "fox_markings"
	extra_overlay2 = "fox_markings2"
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 4

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

/datum/sprite_accessory/tail/taur/ch/bigleggy/plug
	name = "Big Leggies (Plug Tail)"
	extra_overlay2 = "bigleggy_plug"
	extra_overlay2_w = "bigleggy_plug"

/datum/sprite_accessory/tail/taur/drake/extended //Sub-pathing drake taur so we can steal their cloaks
	name = "Fat Drake Extended (Taur)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	icon_state = "extended_fatdrake"
	extra_overlay = "extended_fatdrake_markings"
	extra_overlay2 = "extended_fatdrake_markings2"
	fullness_icons = 2
	can_loaf = TRUE //Soon //Actually, NOW
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 5

/datum/sprite_accessory/tail/taur/ch/bigleggy/AlienSlug
	name = "Big Leggies (Alien Slug Tail)"
	icon_state = "bigleggy_full_alienslug"
	extra_overlay = "bigleggy_alienslug"
	extra_overlay_w = "bigleggy_alienslug"
	extra_overlay2 = "bigleggy_alienslug_m"
	extra_overlay2_w = "bigleggy_alienslug_m"

/datum/sprite_accessory/tail/taur/naga/alt_3c // Dirty readjustment of the suit_sprites path for experimentation because I dunno a better way to do this.
	suit_sprites = 'icons/mob/taursuits_naga_alt_ch.dmi'
	vore_tail_sprite_variant = "Naga3Piece"
	fullness_icons = 1

/datum/sprite_accessory/tail/taur/drake/spotty
	name = "Spotted Drake (Taur, Tricolor)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	icon_state = "spotteddrake_s"
	extra_overlay = "spotteddrake_markings"
	extra_overlay_w = "spotteddrake_markings"
	extra_overlay2 = "spotteddrake_markings_2"
	extra_overlay2_w = "spotteddrake_markings_2"
	suit_sprites = 'icons/mob/taursuits_drake_ch.dmi'
	icon_sprite_tag = "drake"
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 6

/datum/sprite_accessory/tail/taur/drake/fat/spotty
	name = "Fat Spotted Drake (Taur, Tricolor)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	vore_tail_sprite_variant = "FatDrake"
	icon_state = "fatspotteddrake_s"
	extra_overlay = "fatspotteddrake_markings"
	extra_overlay_w = "fatspotteddrake_markings"
	extra_overlay2 = "fatspotteddrake_markings_2"
	extra_overlay2_w = "fatspotteddrake_markings_2"
	fullness_icons = 2
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 6

/datum/sprite_accessory/tail/taur/lizard/spotty
	name = "Spotted Lizard (Taur, Tricolor)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	icon_state = "spottedlizard_s"
	extra_overlay = "spottedlizard_markings"
	extra_overlay_w = "spottedlizard_markings"
	extra_overlay2 = "spottedlizard_markings_2"
	extra_overlay2_w = "spottedlizard_markings_2"
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 5

/datum/sprite_accessory/tail/taur/lizard/fat/spotty
	name = "Fat Spotted Lizard (Taur, Tricolor)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	icon_state = "fatspottedlizard_s"
	extra_overlay = "fatspottedlizard_markings"
	extra_overlay_w = "fatspottedlizard_markings"
	extra_overlay2 = "fatspottedlizard_markings_2"
	extra_overlay2_w = "fatspottedlizard_markings_2"
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 3

/datum/sprite_accessory/tail/taur/drake/extended/spotty
	name = "Fat Spotted Drake Extended (Taur)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	vore_tail_sprite_variant = "FatDrake"
	icon_state = "spottedextended_fatdrake"
	extra_overlay = "spottedextended_fatdrake_markings"
	extra_overlay_w = "spottedextended_fatdrake_markings"
	extra_overlay2 = "spottedextended_fatdrake_markings_2"
	extra_overlay2_w = "spottedextended_fatdrake_markings_2"
	fullness_icons = 2
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 5

/datum/sprite_accessory/tail/taur/drake/extended_alt
	name = "Drake Extended (Taur)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	vore_tail_sprite_variant = "Drake"
	icon_state = "extended_drake"
	extra_overlay = "extended_drake_markings"
	extra_overlay_w = "extended_drake_markings"
	extra_overlay2 = "extended_drake_markings_2"
	extra_overlay2_w = "extended_drake_markings_2"
	fullness_icons = 3
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 5

/datum/sprite_accessory/tail/taur/drake/extended_alt/spotted
	name = "Spotted Drake Extended (Taur)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	vore_tail_sprite_variant = "Drake"
	icon_state = "spottedextended_drake"
	extra_overlay = "spottedextended_drake_markings"
	extra_overlay_w = "spottedextended_drake_markings"
	extra_overlay2 = "spottedextended_drake_markings_2"
	extra_overlay2_w = "spottedextended_drake_markings_2"
	fullness_icons = 3
	can_loaf = TRUE
	icon_loaf = 'icons/mob/vore/taurs_ch_loaf.dmi'
	loaf_offset = 5

/datum/sprite_accessory/tail/taur/longtail
	//hide body parts list() makes it so no limbs are hidden
	//made its own child so we can reuse this
	offset_x = -16
	hide_body_parts = list()


/datum/sprite_accessory/tail/taur/longtail/dragonmaidtail_ch
	name = "Dragon maid Tail"
	icon = 'modular_chomp/icons/mob/vore/Tails64x32.dmi'
	icon_state = "Dragon_maid_tail"
	fullness_icons = 3
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/taur/ch/sloog
	name = "Sloog (Taur)"
	icon_state = "sloog"
	extra_overlay = "sloog_glowstripe"
	extra_overlay_w = "sloog_glowstripe"
	can_loaf = FALSE
