GLOBAL_LIST_INIT(dsi_to_species, list(SPECIES_TAJARAN = "DSI - Tajaran", SPECIES_UNATHI = "DSI - Lizard", SPECIES_SERGAL = "DSI - Sergal", SPECIES_NEVREAN = "DSI - Nevrean", \
									SPECIES_VULPKANIN = "DSI - Vulpkanin", SPECIES_AKULA = "DSI - Akula", SPECIES_VASILISSAN = "DSI - Vasilissan", SPECIES_ZORREN = "DSI - Zorren",\
									SPECIES_TESHARI = "DSI - Teshari", SPECIES_FENNEC = "DSI - Fennec"))

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
