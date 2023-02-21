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
