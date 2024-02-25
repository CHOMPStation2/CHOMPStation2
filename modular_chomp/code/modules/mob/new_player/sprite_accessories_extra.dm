/datum/sprite_accessory/marking/ch/anthrovirus_ra
	name = "Anthro Virus (Right Arm)"
	icon_state = "anthrovirus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_R_ARM,BP_R_HAND)
	hide_body_parts = list(BP_R_ARM,BP_R_HAND)

/datum/sprite_accessory/marking/ch/anthrovirus_la
	name = "Anthro Virus (Left Arm)"
	icon_state = "anthrovirus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_L_ARM,BP_L_HAND)
	hide_body_parts = list(BP_L_ARM,BP_L_HAND)

/datum/sprite_accessory/marking/ch/anthrovirus_rl
	name = "Anthro Virus (Right Leg)"
	icon_state = "anthrovirus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_R_LEG)
	hide_body_parts = list(BP_R_LEG)

/datum/sprite_accessory/marking/ch/anthrovirus_ll
	name = "Anthro Virus (Left Leg)"
	icon_state = "anthrovirus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_L_LEG)
	hide_body_parts = list(BP_L_LEG)

/datum/sprite_accessory/marking/ch/anthrovirus_rf
	name = "Anthro Virus (Right Foot)"
	icon_state = "anthrovirus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_R_FOOT)
	hide_body_parts = list(BP_R_FOOT)

/datum/sprite_accessory/marking/ch/anthrovirus_lf
	name = "Anthro Virus (Left Foot)"
	icon_state = "anthrovirus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_L_FOOT)
	hide_body_parts = list(BP_L_FOOT)

/datum/sprite_accessory/marking/ch/anthrovirus_t
	name = "Anthro Virus (Torso)"
	icon_state = "anthrovirus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_TORSO,BP_GROIN)
	hide_body_parts = list(BP_TORSO,BP_GROIN)

/datum/sprite_accessory/marking/ch/anthrovirus_h
	name = "Anthro Virus (Head)"
	icon_state = "anthrovirus"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY
	hide_body_parts	= list(BP_HEAD)

/datum/sprite_accessory/marking/ch/virus_ra
	name = "Bacteriophage (Right Arm)"
	icon_state = "virus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_R_ARM,BP_R_HAND)
	hide_body_parts = list(BP_R_ARM,BP_R_HAND)

/datum/sprite_accessory/marking/ch/virus_la
	name = "Bacteriophage (Left Arm)"
	icon_state = "virus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_L_ARM,BP_L_HAND)
	hide_body_parts = list(BP_L_ARM,BP_L_HAND)

/datum/sprite_accessory/marking/ch/virus_rl
	name = "Bacteriophage (Right Leg)"
	icon_state = "virus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_R_LEG,BP_R_FOOT)
	hide_body_parts = list(BP_R_LEG,BP_R_FOOT)

/datum/sprite_accessory/marking/ch/virus_ll
	name = "Bacteriophage (Left Leg)"
	icon_state = "virus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_L_LEG,BP_L_FOOT)
	hide_body_parts = list(BP_L_LEG,BP_L_FOOT)

/datum/sprite_accessory/marking/ch/virus_t
	name = "Bacteriophage (Torso)"
	icon_state = "virus"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_TORSO,BP_GROIN)
	hide_body_parts = list(BP_TORSO,BP_GROIN)

/datum/sprite_accessory/marking/ch/virus_g
	name = "Bacteriophage (Groin)"
	icon_state = "virusgroin" //this is separate so that the groin region can be hidden by the torso.
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_GROIN)
	//hide_body_parts = list(BP_GROIN) this IS pretty low, even for the groin body part.

/datum/sprite_accessory/marking/ch/virus_h
	name = "Bacteriophage (Head)"
	icon_state = "virus"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY
	hide_body_parts	= list(BP_HEAD)

/datum/sprite_accessory/marking/ch/tyranid
	name = "Tyranid Bodytype (Use with Armor)"
	icon_state = "tyranid"
	color_blend_mode = ICON_MULTIPLY
	hide_body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

/datum/sprite_accessory/marking/ch/tyranid_armor
	name = "Tyranid Bodytype (Armor)"
	icon_state = "tyranidarmor"
	color_blend_mode = ICON_MULTIPLY
	hide_body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

/datum/sprite_accessory/marking/ch/tyranid_head
	name = "Tyranid Head (Use with Armor)"
	icon_state = "tyranid"
	color_blend_mode = ICON_MULTIPLY
	hide_body_parts = list(BP_HEAD)
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ch/tyranid_head_armor
	name = "Tyranid Head (Armor)"
	icon_state = "tyranidarmor"
	color_blend_mode = ICON_MULTIPLY
	hide_body_parts = list(BP_HEAD)
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ch/tyranid_legs
	name = "Tyranid Legs (Use with Armor)"
	icon_state = "tyranid"
	color_blend_mode = ICON_MULTIPLY
	hide_body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_GROIN)

/datum/sprite_accessory/marking/ch/tyranid_legs_armor
	name = "Tyranid Legs (Armor)"
	icon_state = "tyranidarmor"
	color_blend_mode = ICON_MULTIPLY
	hide_body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_GROIN)

/datum/sprite_accessory/marking/ch/sect_drone
	name = "Sect Drone Bodytype"
	icon_state = "sectdrone"
	color_blend_mode = ICON_MULTIPLY
	hide_body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

/datum/sprite_accessory/marking/ch/sect_drone_eyes
	name = "Sect Drone Eyes"
	icon_state = "sectdrone_eyes"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ch/thickneck
	name = "Thick Neck"
	icon_state = "thickneck"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/thickerneck
	name = "Thicker Neck"
	icon_state = "thickerneck"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/thickthroat
	name = "Thick Throat"
	icon_state = "thickthroat"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/fangs2
	name = "Forward Fangs"
	icon_state = "fangs2"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/fangs3
	name = "Further Forward Fangs"
	icon_state = "fangs3"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/normeyes
	name = "Normal Eyes"
	icon_state = "normeyes"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/bignostrils
	name = "Big Nostrils"
	icon_state = "bignostrils"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/// NEW XENOMORPH SPRITE_ACCESSORIES - Basesprites borrowed from Citadel and tidied up by Makkinindorn, should blend a bit more nicely. ///

/datum/sprite_accessory/marking/ch/xenomorph // This is just here to create an easy-to-follow typepath.
	icon = 'icons/mob/human_races/markings_ch.dmi'
	color_blend_mode = ICON_MULTIPLY
	species_allowed = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE) // Anyone can use these.

// LIMBS //

/datum/sprite_accessory/marking/ch/xenomorph/xeno_r_arm
	name = "Xenomorph right arm"
	icon_state = "xeno"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_l_arm
	name = "Xenomorph left arm"
	icon_state = "xeno"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_r_leg
	name = "Xenomorph right leg"
	icon_state = "xeno"
	body_parts = list(BP_R_LEG)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_l_leg
	name = "Xenomorph left leg"
	icon_state = "xeno"
	body_parts = list(BP_L_LEG)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_r_hand
	name = "Xenomorph right hand"
	icon_state = "xeno"
	body_parts = list(BP_R_HAND)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_l_hand
	name = "Xenomorph left hand"
	icon_state = "xeno"
	body_parts = list(BP_L_HAND)

// DIGI LEGS //

/datum/sprite_accessory/marking/ch/xenomorph/digi_r_leg
	name = "Xenomorph right leg (digitigrade)"
	icon = 'icons/mob/human_races/markings_digi.dmi'
	icon_state = "xeno_digi"
	digitigrade_acceptance = MARKING_DIGITIGRADE_ONLY
	body_parts = list(BP_R_LEG, BP_R_FOOT)

/datum/sprite_accessory/marking/ch/xenomorph/digi_r_leg_hidden
	name = "Xenomorph right leg (digitigrade, hide)"
	icon = 'icons/mob/human_races/markings_digi.dmi'
	icon_state = "xeno_digi"
	digitigrade_acceptance = MARKING_DIGITIGRADE_ONLY
	body_parts = list(BP_R_LEG, BP_R_FOOT)
	hide_body_parts = list(BP_R_LEG, BP_R_FOOT)

/datum/sprite_accessory/marking/ch/xenomorph/digi_l_leg
	name = "Xenomorph left leg (digitigrade)"
	icon = 'icons/mob/human_races/markings_digi.dmi'
	icon_state = "xeno_digi"
	digitigrade_acceptance = MARKING_DIGITIGRADE_ONLY
	body_parts = list(BP_L_LEG, BP_L_FOOT)

/datum/sprite_accessory/marking/ch/xenomorph/digi_l_leg_hidden
	name = "Xenomorph left leg (digitigrade, hide)"
	icon = 'icons/mob/human_races/markings_digi.dmi'
	icon_state = "xeno_digi"
	digitigrade_acceptance = MARKING_DIGITIGRADE_ONLY
	body_parts = list(BP_L_LEG, BP_L_FOOT)
	hide_body_parts = list(BP_L_LEG, BP_L_FOOT)


// TORSOS //

/datum/sprite_accessory/marking/ch/xenomorph/xeno_chest_m
	name = "Xenomorph chest (male)"
	icon_state = "xeno"
	body_parts = list(BP_TORSO)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_chest_f
	name = "Xenomorph chest (female)"
	icon_state = "xeno_f"
	body_parts = list(BP_TORSO)

// HEADS //

/datum/sprite_accessory/marking/ch/xenomorph/xeno_headcrest_standard
	name = "Xenomorph headcrest (drone)"
	icon_state = "xeno_drone"
	body_parts = list(BP_HEAD)
	hide_body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_headcrest_royal
	name = "Xenomorph headcrest (royal)"
	icon_state = "xeno_royal"
	body_parts = list(BP_HEAD)
	hide_body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_headcrest_warrior
	name = "Xenomorph headcrest (warrior)"
	icon_state = "xeno_warrior"
	body_parts = list(BP_HEAD)
	hide_body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_headcrest_hollywood
	name = "Xenomorph headcrest (hollywood)"
	icon_state = "xeno_hollywood"
	body_parts = list(BP_HEAD)
	hide_body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_headcrest_queen
	name = "Xenomorph headcrest (queen)"
	icon_state = "xeno_queen"
	body_parts = list(BP_HEAD)
	hide_body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_headcrest_queen_striped
	name = "Xenomorph headcrest (queen, striped)"
	icon_state = "xeno_queen_striped"
	body_parts = list(BP_HEAD)
	hide_body_parts = list(BP_HEAD)

// TEETH //

/datum/sprite_accessory/marking/ch/xenomorph/xeno_teeth
	name = "Xenomorph teeth (standard)"
	icon_state = "xeno_teeth"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ch/xenomorph/xeno_teeth_queen
	name = "Xenomorph teeth (queen)"
	icon_state = "xeno_teeth_queen"
	body_parts = list(BP_HEAD)
