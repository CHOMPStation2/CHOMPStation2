/datum/sprite_accessory/marking/ch
	icon = 'icons/mob/human_races/markings_ch.dmi'
	orca_head
		name = "Orca head"
		icon_state = "orca_head"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_AKULA)

	orca_body
		name = "Orca body(female)"
		icon_state = "orca_body"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_AKULA)

	orca_legs
		name = "Orca legs"
		icon_state = "orca_leg"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG)
		species_allowed = list(SPECIES_AKULA)

	orca_arms
		name = "Orca arms"
		icon_state = "orca_arm"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_ARM,BP_R_ARM)
		species_allowed = list(SPECIES_AKULA)

	zangoose_belly
		name = "Mongoose Cat Belly Marking"
		icon_state = "test"
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE) //This lets all races use the default hairstyles.

	head_paint_front
		name = "Head Paint Front"
		icon_state = "paintfront"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	head_paint_back
		name = "Head Paint"
		icon_state = "paint"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	athena_lights
		name = "Hephaestus - Athena lights"
		icon_state = "athena"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_TORSO,BP_HEAD)

	athena_panels
		name = "Hephaestus - Athena FBP Panels"
		icon_state = "athena_p"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	athena_panels_body
		name = "Hephaestus - Athena FBP Panels (body)"
		icon_state = "athena_p"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

	athena_panels_head
		name = "Hephaestus - Athena FBP Panels (head)"
		icon_state = "athena_p"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	rook_lights
		name = "Bishop - Rook lights"
		icon_state = "rook-l"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	rook_lights_body
		name = "Bishop - Rook lights (body)"
		icon_state = "rook-l"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

	rook_lights_head
		name = "Bishop - Rook lights (head)"
		icon_state = "rook-l"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	grointojaw
		name = "Groin to mouth marking"
		icon_state = "grointojaw"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO, BP_HEAD, BP_GROIN)

	vale_eyes
		name = "VALE Eyes"
		icon_state = "vale_eyes"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vale_belly
		name = "VALE Belly"
		icon_state = "vale_belly"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO, BP_GROIN)

	vale_back
		name = "VALE Back"
		icon_state = "vale_back"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_TORSO)

	vulp_skull
		name = "Vulp Skullface"
		icon_state = "vulpskull"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	manedwolf1
		name = "Maned Wolf Primary Markings"
		icon_state = "manedwolf1"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD,BP_TORSO,BP_R_ARM,BP_L_ARM,BP_R_HAND,BP_L_HAND,BP_R_LEG,BP_L_LEG,BP_R_FOOT,BP_L_FOOT)

	manedwolf2
		name = "Maned Wolf Secondary Markings"
		icon_state = "manedwolf2"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD,BP_TORSO,BP_GROIN)

	voxbeak2
		name = "Vox Beak (Normal)"
		icon_state = "vox_beak"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	voxtalons
		name = "Vox Talons"
		icon_state = "vox_talons"
		color_blend_mode = ICON_MULTIPLY
		body_parts = list(BP_R_ARM,BP_L_ARM,BP_R_HAND,BP_L_HAND,BP_R_LEG,BP_L_LEG,BP_R_FOOT,BP_L_FOOT)

/datum/sprite_accessory/tail/special/orca_tail
	name = "Orca Tail"
	desc = ""
	icon_state = "sharktail_s"
	extra_overlay = "orca_tail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	species_allowed = list(SPECIES_AKULA)

//TFF 16/1/20 - Cotton hair backport
/datum/sprite_accessory/hair/ch
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	cotton
		name = "Cotton"
		icon_state = "hair_cotton"


	unshavenreversemohawk
		name = "Mohawk Reverse Unshaven"
		icon_state = "hair_unshaven_reversemohawk"

// Extra colorable options for Vox
/datum/sprite_accessory/hair/vox_afro_color
	name = "Vox Afro, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_afro"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_crestedquills_color
	name = "Vox Crested Quills, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_crestedquills"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_empquills_color
	name = "Vox Emperor Quills, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_emperorquills"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_hairhorns_color
	name = "Vox Hair Horns, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_horns"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_keelquills_color
	name = "Vox Keel Quills, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_keelquills"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_keetquills_color
	name = "Vox Keet Quills, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_keetquills"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_kingly_color
	name = "Vox Kingly Quills, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_kingly"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_mohawk_color
	name = "Vox Mohawk, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_mohawk"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_nights_color
	name = "Vox Night Quills, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_nights"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_razorclipped_color
	name = "Vox Razor Clipped, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_razorclipped"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_razor_color
	name = "Vox Razor, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_razor"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_shortquills_color
	name = "Vox Short Quills, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_shortquills"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_tielquills_color
	name = "Vox Tiel Quills, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_tielquills"
	species_allowed = list(SPECIES_VOX)

/datum/sprite_accessory/hair/vox_yasuquills_color
	name = "Vox Yasu Quills, Colorable"
	icon = 'icons/mob/human_face_ch.dmi'
	icon_add = 'icons/mob/human_face_ch_add.dmi'
	icon_state = "hair_vox_yasu"
	species_allowed = list(SPECIES_VOX)
