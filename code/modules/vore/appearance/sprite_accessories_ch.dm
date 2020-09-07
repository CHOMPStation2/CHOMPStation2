//EARS
/datum/sprite_accessory/ears/alien_slug
	name = "Alien slug ears"
	desc = "The ears of a slug from space"
	icon = 'icons/mob/vore/ears_ch.dmi'
	icon_state = "alien_slug"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/zorgoia
	name = "Zorgoia"
	desc = "Ears only the slinkiest of noodles can have!"
	icon = 'icons/mob/vore/ears_ch.dmi'
	icon_state = "zorgoia"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/ears/vale
	name = "VALE Model Ear Coloring"
	desc = ""
	icon = 'icons/mob/vore/ears_ch.dmi'
	icon_state = "valeears"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

//TAILS
/datum/sprite_accessory/tail/alien_slug
	name = "Alien slug tail"
	desc = "The tail of a slug from space"
	icon = 'icons/mob/vore/tails_ch.dmi'
	icon_state = "alien_slug"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "alien_slug_markings"

/datum/sprite_accessory/tail/snaketail_stripes
	name = "snake tail with stripes, dual-color"
	desc = ""
	icon = 'icons/mob/vore/tails_ch.dmi'
	icon_state = "snaketail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "snaketail_stripes"

/datum/sprite_accessory/tail/zorgoia
	name = "Zorgoia tail, dual-color"
	desc = ""
	icon = 'icons/mob/vore/tails_ch.dmi'
	icon_state = "zorgoia"
	extra_overlay = "zorgoia_fluff"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/tail/vale_tail
	name = "Vale Tail, dual color (vwag)"
	desc = ""
	icon = 'icons/mob/vore/tails_ch.dmi'
	icon_state = "valetail"
	ani_state = "valetail_w"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	extra_overlay = "valetail_mark"
	extra_overlay_w = "valetail_mark_w"

//WINGS

/datum/sprite_accessory/wing/snagc
	name = "xenomorph backplate, colorable"
	desc = ""
	icon = 'icons/mob/vore/wings_ch.dmi'
	icon_state = "csnag-backplate"
	do_colouration = 1

/datum/sprite_accessory/wing/snail //We should some day make a variable to make some wings not be able to fly
	name = "Snail shell"
	desc = ""
	icon = 'icons/mob/vore/wings_ch.dmi'
	icon_state = "snail_shell"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY


//TAURS - Apparently we still havent remade our taur files!

/datum/sprite_accessory/tail/taur/zorgoia
	name = "Zorgoia (Taur)"
	icon = 'icons/mob/vore/taurs_ch.dmi'
	icon_state = "zorgoia"
	extra_overlay = "zorgoia_fluff"

/datum/sprite_accessory/tail/taur/zorgoia/fat
	name = "Zorgoia (Fat Taur)"
	extra_overlay = "zorgoia_fat"
