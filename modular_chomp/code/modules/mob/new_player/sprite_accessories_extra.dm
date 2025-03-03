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

/datum/sprite_accessory/marking/ch/breasts
	name = "Breasts"
	icon_state = "breasts"
	body_parts = list(BP_TORSO)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/breasts/smooth
	name = "Smooth Breasts"
	icon_state = "breasts_smooth"

/datum/sprite_accessory/marking/ch/breasts/reptile
	name = "Reptile Breasts"
	icon_state = "breasts_reptile"

/datum/sprite_accessory/marking/ch/firstdragon_upperjaw
	name = "Dragon Upper Jaw 1"
	icon_state = "firstdragon_upperjaw"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY


/datum/sprite_accessory/marking/ch/firstdragon_lowerjaw
	name = "Dragon Lower Jaw 1"
	icon_state = "firstdragon_lowerjaw"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/scaled_belly
	name = "Scaled Belly"
	icon_state = "scaled_belly"
	body_parts = list(BP_TORSO,BP_GROIN,BP_L_LEG,BP_R_LEG)
	color_blend_mode = ICON_MULTIPLY
	digitigrade_acceptance = MARKING_ALL_LEGS
	digitigrade_icon = 'icons/mob/human_races/markings_ch.dmi'


/datum/sprite_accessory/marking/ch/trex_upperjaw
	name = "T-Rex Upper Jaw"
	icon_state = "trex_upperjaw"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/trex_lowerjaw
	name = "T-Rex Lower Jaw"
	icon_state = "trex_lowerjaw"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/crocodile_upperjaw
	name = "Crocodile Upper Jaw"
	icon_state = "crocodile_upperjaw"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/crocodile_lowerjaw
	name = "Crocodile Lower Jaw"
	icon_state = "crocodile_lowerjaw"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY


/datum/sprite_accessory/marking/ch/crocodile_neck
	name = "Crocodile Neck"
	icon_state = "crocodile_neck"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/bovine_snout
	name = "Bovine Snout"
	icon_state = "bovine_snout"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/bovine_nose
	name = "Bovine Nose"
	icon_state = "bovine_nose"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/horse_head
	name = "Horse Snout"
	icon_state = "horse_head"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/horse_muzzle
	name = "Horse Muzzle"
	icon_state = "horse_muzzle"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/horse_eyes
	name = "Horse Eyes"
	icon_state = "horse_eyes"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/horse_fringe
	name = "Horse Fringe"
	icon_state = "horse_fringe"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/smallchubbybelly
	name = "Chubby Belly, Small"
	icon_state = "smallchubbybelly"
	body_parts = list(BP_TORSO,BP_GROIN,BP_L_HAND,BP_R_HAND)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/six_pack
	name = "Six Pack"
	icon_state = "six_pack"
	hide_body_parts = list(BP_L_LEG,BP_R_LEG,BP_GROIN)
	body_parts = list(BP_TORSO,BP_GROIN)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/hippo_upperjaw
	name = "Hippo Upper Jaw"
	icon_state = "hippo_upperjaw"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/marking/ch/hippo_lowerjaw
	name = "Hippo Lower Jaw"
	icon_state = "hippo_lowerjaw"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY


/datum/sprite_accessory/marking/ch/sloog_head
	name = "sloog head"
	icon = 'modular_chomp/icons/mob/human_races/sprite_accessories/sloog.dmi'
	icon_state = "sloog"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY
	// placed in seperate dmi till normal one is functional.


/// NEW XENOMORPH SPRITE_ACCESSORIES - Basesprites borrowed from Citadel and tidied up by Makkinindorn, should blend a bit more nicely. ///

/datum/sprite_accessory/marking/ch/xenomorph // This is just here to create an easy-to-follow typepath.
	icon = 'icons/mob/human_races/markings_ch.dmi'
	color_blend_mode = ICON_MULTIPLY
	species_allowed = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJARAN, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE) // Anyone can use these.

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

/datum/sprite_accessory/marking/ch/xenomorph/digi_legs
	name = "Xenomorph legs (digitigrade)"
	icon = 'icons/mob/human_races/markings_digi.dmi'
	icon_state = "xeno_digi"
	digitigrade_acceptance = MARKING_DIGITIGRADE_ONLY
	body_parts = list(BP_R_LEG, BP_L_LEG) //This needs BP_L_FOOT AND BP_R_FOOT added to it but the sprite has to be split for that. And it's an upstream .dmi. So you will have to fix it upstream.
	hide_body_parts = list(BP_L_LEG, BP_L_FOOT, BP_R_LEG, BP_R_FOOT)

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

// WHISKIES //

/datum/sprite_accessory/marking/ch/mole_whiskers
	name = "mole whiskers"
	icon_state = "molewhiskers"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

// SNOOT //

/datum/sprite_accessory/marking/ch/vulp_lips
	name = "face, vulp (Lips)"
	icon_state = "vulp_lips"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

// SHROOM //

/datum/sprite_accessory/marking/ch/shroomhead
	name = "Mushroom Head (Base)"
	icon_state = "mushroom_head"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

// SHROOM UNDER //

/datum/sprite_accessory/marking/ch/shroomhead_under
	name = "Mushroom Head (Under)"
	icon_state = "mushroom_head_under"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

// SHROOM TOP //

/datum/sprite_accessory/marking/ch/shroomhead_top
	name = "Mushroom Head (Top)"
	icon_state = "mushroom_head_top"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY

// SHROOM SPOTS //

/datum/sprite_accessory/marking/ch/shroomhead_spots
	name = "Mushroom Head (Spots)"
	icon_state = "mushroom_head_spots"
	body_parts = list(BP_HEAD)
	color_blend_mode = ICON_MULTIPLY
