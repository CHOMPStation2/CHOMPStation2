/datum/gear/suit/pcarrier // No protection until inserted with plates, purely for cosmetic purposes.
	display_name = "Plate Carrier selection (Security/Exploration)"
	path = /obj/item/clothing/suit/armor/pcarrier
	allowed_roles = list("Head of Security", "Warden", "Security Officer", "Pathfinder", "Field Medic", "Explorer")
	cost = 2

/datum/gear/suit/pcarrier/New()
	..()
	var/list/pcarriers = list(
	"Black Plate Carrier" = /obj/item/clothing/suit/armor/pcarrier,
	"Navy Plate Carrier" = /obj/item/clothing/suit/armor/pcarrier/navy,
	"Blue Plate Carrier" = /obj/item/clothing/suit/armor/pcarrier/blue,
	"Light Blue Plate Carrier" = /obj/item/clothing/suit/armor/pcarrier/press,
	"Green Plate Carrier" = /obj/item/clothing/suit/armor/pcarrier/green,
	"Tan Plate Carrier" = /obj/item/clothing/suit/armor/pcarrier/tan
	)
	gear_tweaks += new/datum/gear_tweak/path(pcarriers)