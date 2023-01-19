/datum/robolimb
	var/can_be_digitigrade = FALSE //maybe move this over into more of a "does this have a custom digitigrade sprite, and if so, what is its icon file/icon name in the limb's file" when someone can be bothered making them

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