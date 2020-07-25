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


//Added from CHOMP
/datum/gear/suit/hood
	display_name = "hooded cloak selection (Teshari)"
	path = /obj/item/clothing/suit/storage/seromi/cloak/standard
	whitelisted = SPECIES_TESHARI
	sort_category = "Xenowear"

/datum/gear/suit/hood/New()
	..()
	var/list/cloaks = list()
	for(var/cloak in typesof(/obj/item/clothing/suit/storage/hooded/teshari/standard))
		var/obj/item/clothing/suit/storage/seromi/cloak/cloak_type = cloak
		cloaks[initial(cloak_type.name)] = cloak_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cloaks))