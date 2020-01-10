/datum/sprite_accessory/marking/ch
	icon = 'icons/mob/human_races/markings_ch.dmi'
	orca_head
		name = "Orca head"
		icon = 'icons/mob/vore/wings_yw.dmi'
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
		species_allowed = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_ZORREN_FLAT, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE) //This lets all races use the default hairstyles.

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

/datum/sprite_accessory/tail/special/orca_tail
	name = "Orca Tail"
	desc = ""
	icon_state = "sharktail_s"
	extra_overlay = "orca_tail"
	do_colouration = 1
	color_blend_mode = ICON_MULTIPLY
	species_allowed = list(SPECIES_AKULA)
