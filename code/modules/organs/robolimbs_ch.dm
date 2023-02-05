GLOBAL_LIST_INIT(dsi_to_species, list(SPECIES_TAJARAN = "DSI - Tajaran", SPECIES_UNATHI = "DSI - Lizard", SPECIES_SERGAL = "DSI - Sergal", SPECIES_NEVREAN = "DSI - Nevrean", \
									SPECIES_VULPKANIN = "DSI - Vulpkanin", SPECIES_AKULA = "DSI - Akula", SPECIES_VASILISSAN = "DSI - Vasilissan", SPECIES_ZORREN = "DSI - Zorren",\
									SPECIES_TESHARI = "DSI - Teshari", SPECIES_FENNEC = "DSI - Fennec"))

/datum/robolimb
	var/no_icon = FALSE //specifically for DSI things, makes it so it doesn't override the species icons
	//var/has_digitigrade_icon = FALSE //make this a thing

/datum/robolimb/valehoundhead
	company = "VALE Hound- Head"
	desc = "A VALE hound head meant for synthetics."
	icon = 'icons/mob/human_races/cyberlimbs/vale/vale_head.dmi' //Sprited by: Skits
	skin_tone = 1
	parts = list(BP_HEAD)

/datum/robolimb/dsi_tajaran
	no_icon = TRUE

/datum/robolimb/dsi_lizard
	no_icon = TRUE

/datum/robolimb/dsi_sergal
	no_icon = TRUE

/datum/robolimb/dsi_nevrean
	no_icon = TRUE

/datum/robolimb/dsi_vulpkanin
	no_icon = TRUE

/datum/robolimb/dsi_akula
	no_icon = TRUE

/datum/robolimb/dsi_spider
	no_icon = TRUE

/datum/robolimb/dsi_zorren
	no_icon = TRUE

/datum/robolimb/dsi_fennec
	no_icon = TRUE

/datum/robolimb/dsi_teshari
	no_icon = TRUE

/datum/robolimb/dsi_teshari/New()
	. = ..()
	species_cannot_use -= SPECIES_PROTEAN


/datum/robolimb/dsi_other
	company = "DSI - Synthetic"
	desc = "This limb has a  realistic design and squish. By Darkside Incorperated."
	blood_color = "#ffe2ff"
	lifelike = 1
	unavailable_to_build = 1
	skin_tone = 1
	no_icon = TRUE
