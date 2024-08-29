//crime scene kit
/obj/item/storage/briefcase/crimekit // CHOMPEdit - Removal of obj/item/weapon
	name = "crime scene kit"
	desc = "A stainless steel-plated carrycase for all your forensic needs. Feels heavy."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "case"
	storage_slots = 14
	drop_sound = 'sound/items/drop/toolbox.ogg'
	pickup_sound = 'sound/items/pickup/toolbox.ogg'

/obj/item/storage/briefcase/crimekit/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	new /obj/item/storage/box/swabs(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/storage/box/fingerprints(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/reagent_containers/spray/luminol(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/uv_light(src) // CHOMPEdit - Removal of obj/item/device
	new /obj/item/forensics/sample_kit(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/forensics/sample_kit/powder(src) // CHOMPEdit - Removal of obj/item/weapon
