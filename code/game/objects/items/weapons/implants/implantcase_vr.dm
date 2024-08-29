/obj/item/implantcase/vrlanguage // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'language'"
	desc = "A case containing a language implant."
	icon_state = "implantcase-r"

/obj/item/implantcase/vrlanguage/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/vrlanguage( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return