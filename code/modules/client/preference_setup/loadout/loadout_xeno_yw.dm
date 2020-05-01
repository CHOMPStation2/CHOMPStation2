/datum/gear/suit/zaddat
	sort_category = "Xenowear"
	whitelisted = SPECIES_ZADDAT

/datum/gear/suit/zaddat/security
	display_name = "Zaddat security shroud"
	description = "A zaddat shroud with a layer of armor, for security officers"
	sort_category = "Xenowear"
	whitelisted = SPECIES_ZADDAT
	path = /obj/item/clothing/suit/space/void/zaddat/security
	allowed_roles = list("Head of Security","Detective","Warden","Security Officer")

/datum/gear/suit/zaddat/engineer
	display_name = "Zaddat engineer shroud"
	description =  "A zaddat shroud with a extra layer of rad-shielding, for engineers"
	path = /obj/item/clothing/suit/space/void/zaddat/engineer
	sort_category = "Xenowear"
	whitelisted = SPECIES_ZADDAT
	allowed_roles = list("Chief Engineer", "Atmospheric Technician", "Station Engineer")

