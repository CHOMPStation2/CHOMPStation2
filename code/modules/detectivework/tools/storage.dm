/obj/item/storage/box/swabs // CHOMPEdit - Removal of obj/item/weapon
	name = "box of swab kits"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnakit"
	can_hold = list(/obj/item/forensics/swab) // CHOMPEdit - Removal of obj/item/weapon
	storage_slots = 14

/obj/item/storage/box/swabs/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	for(var/i = 1 to storage_slots) // Fill 'er up.
		new /obj/item/forensics/swab(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/evidence // CHOMPEdit - Removal of obj/item/weapon
	name = "evidence bag box"
	desc = "A box claiming to contain evidence bags."
	storage_slots = 7
	can_hold = list(/obj/item/evidencebag) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/evidence/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	for(var/i = 1 to storage_slots)
		new /obj/item/evidencebag(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/fingerprints // CHOMPEdit - Removal of obj/item/weapon
	name = "box of fingerprint cards"
	desc = "Sterilized equipment within. Do not contaminate."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnakit"
	can_hold = list(/obj/item/sample/print) // CHOMPEdit - Removal of obj/item/weapon
	storage_slots = 14

/obj/item/storage/box/fingerprints/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	for(var/i = 1 to storage_slots)
		new /obj/item/sample/print(src) // CHOMPEdit - Removal of obj/item/weapon
