/datum/trait/positive/linguist/xenochimera
	name = "Xenochimera: Master Linguist"
	desc = "You've managed to learn more languages as a result of consuming other species! You are able to learn many more languages than others."
	var_changes = list("num_alternate_languages" = 12)
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOCHIMERA)
	cost = 0
	category = 0
	
/datum/trait/positive/rad_resistance/xenochimera
	name = "Xenochimera: Radiation Resistance"
	desc = "You are generally more resistant to radiation, and it dissipates faster from your body, thanks to your focused evolutionary efforts."
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOCHIMERA)
	cost = 0
	category = 0
	var_changes = list("radiation_mod" = 0.65, "rad_removal_mod" = 3.5, "rad_levels" = list("safe" = 20, "danger_1" = 75, "danger_2" = 100, "danger_3" = 200))

/datum/trait/positive/rad_resistance_extreme/xenochimera
	name = "Xenochimera: Extreme Radiation Resistance"
	desc = "You are much more resistant to radiation, and it dissipates much faster from your body, thanks to your focused evolutionary efforts."
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOCHIMERA)
	cost = 0
	category = 0
	var_changes = list("radiation_mod" = 0.5, "rad_removal_mod" = 5, "rad_levels" = list("safe" = 40, "danger_1" = 100, "danger_2" = 150, "danger_3" = 250))
	
/datum/trait/negative/light_sensitivity/xenochimera
	name = "Xenochimera: Photosensitivity"
	desc = "You have trouble dealing with sudden flashes of light, taking some time for you to recover. The effects of flashes from cameras and security equipment leaves you stunned for some time."
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOCHIMERA)
	cost = 0
	category = 0
	var_changes = list("flash_mod" = 1.5)

/datum/trait/negative/light_sensitivity_plus/xenochimera
	name = "Xenochimera: Extreme Photosensitivity"
	desc = "You have trouble dealing with sudden flashes of light, taking quite a long time for you to be able to recover. The effects of flashes from cameras and security equipment leave you stunned for some time."
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOCHIMERA)
	cost = 0
	category = 0
	var_changes = list("flash_mod" = 2.0)