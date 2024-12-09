/datum/robolimb
	var/no_icon = FALSE //specifically for DSI things, makes it so it doesn't override the species icons
	var/can_be_digitigrade = FALSE //used for skipping the icon if it can be digitigrade - maybe turn this into more of a 'use this icon/iconstate' instead later, when actual prosthetic digi icons get made

/datum/robolimb/valehoundhead
	company = "VALE Hound- Head"
	desc = "A VALE hound head meant for synthetics."
	icon = 'icons/mob/human_races/cyberlimbs/vale/vale_head.dmi' //Sprited by: Skits
	skin_tone = 1
	parts = list(BP_HEAD)

/datum/robolimb/dsi_tajaran
	can_be_digitigrade = TRUE

/datum/robolimb/dsi_lizard
	can_be_digitigrade = TRUE

/datum/robolimb/dsi_sergal
	can_be_digitigrade = TRUE

/datum/robolimb/dsi_nevrean
	can_be_digitigrade = TRUE

/datum/robolimb/dsi_vulpkanin
	can_be_digitigrade = TRUE

/datum/robolimb/dsi_akula
	can_be_digitigrade = TRUE

/datum/robolimb/dsi_spider
	can_be_digitigrade = TRUE

/datum/robolimb/dsi_zorren
	can_be_digitigrade = TRUE

/datum/robolimb/dsi_fennec
	can_be_digitigrade = TRUE

/datum/robolimb/dsi_teshari/New()
	. = ..()
	species_cannot_use -= SPECIES_PROTEAN


/datum/robolimb/dsi_other
	company = "DSI - Adaptive"
	desc = "This limb has a  realistic design and squish. By Darkside Incorperated."
	blood_color = "#ffe2ff"
	lifelike = 1
	unavailable_to_build = 1
	skin_tone = 1
	no_icon = TRUE

/datum/robolimb/hellscout
	company = "Erebus - Hellscout"
	desc = "Sleek and lightweight aluminum casings, accented with dark silicone."
	icon = 'icons/mob/human_races/cyberlimbs/erebus/hellscout.dmi'
	unavailable_to_build = 0

//ported from citRP

/datum/robolimb/spectre
	company = "Hoffman Tech - RACS Spectre "
	desc = "A simple robotic limb design used for the Hoffman Tech RASC Spectre. A lightweight robotic chassis ideal for exploration and security duties."
	icon = 'icons/mob/human_races/cyberlimbs/cit/hoffman_tech/spectre.dmi'
	unavailable_to_build = TRUE

/datum/robolimb/braincase
	company = "cortexCases - MMI"
	desc = "A solid, transparent case to hold your important bits in with style."
	icon = 'icons/mob/human_races/cyberlimbs/cit/cortex/braincase.dmi'
	unavailable_to_build = TRUE
	parts = list(BP_HEAD)

///obj/item/disk/limb/braincase
//	company = "cortexCases - MMI"

/datum/robolimb/posicase
	company = "cortexCases - Posi"
	desc = "A solid, transparent case to hold your important bits in with style."
	icon = 'icons/mob/human_races/cyberlimbs/cit/cortex/posicase.dmi'
	unavailable_to_build = TRUE
	parts = list(BP_HEAD)

///obj/item/disk/limb/posicase
//	company = "cortexCases - Posi"

/datum/robolimb/antares
	company = "Antares Robotics"
	desc = "Mustard-yellow industrial limb. Heavyset and thick."
	icon = 'icons/mob/human_races/cyberlimbs/cit/antares/antares_main.dmi'
	unavailable_to_build = TRUE
	monitor_styles = standard_monitor_styles

///obj/item/disk/limb/antares
//	company = "Antares Robotics"

/datum/robolimb/replika
	company = "Replikant"
	desc = "An advanced biomechanical prosthetic with pegs for feet."
	icon = 'icons/mob/human_races/cyberlimbs/cit/replikant/replikant.dmi'
	lifelike = 1
	modular_bodyparts = MODULAR_BODYPART_PROSTHETIC
	parts = list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
