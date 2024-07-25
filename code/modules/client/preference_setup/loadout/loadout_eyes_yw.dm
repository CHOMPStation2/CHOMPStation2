/datum/gear/eyes/arglasses/sec
	display_name = "AR-S Security glasses"
	path = /obj/item/clothing/glasses/omnihud/sec
	allowed_roles = list("Security Officer","Head of Security","Warden","Detective","Blueshield Guard","Security Pilot")

/datum/gear/eyes/arglasses/eng
	display_name = "AR-E Engineering glasses"
	path = /obj/item/clothing/glasses/omnihud/eng
	allowed_roles = list("Engineer","Chief Engineer","Atmospheric Technician") // CHOMPedit: Allows AR-E Glasses to actually be used.

/datum/gear/eyes/arglasses/med
	display_name = "AR-M Medical glasses"
	path = /obj/item/clothing/glasses/omnihud/med
	allowed_roles = list("Medical Doctor","Chief Medical Officer","Chemist","Paramedic","Geneticist", "Psychiatrist", "Field Medic")

/datum/gear/eyes/arglasses/all
	display_name = "AR-B Command glasses"
	path = /obj/item/clothing/glasses/omnihud/all
	cost = 2
	allowed_roles = list("Site Manager","Head of Personnel","Blueshield Guard")
