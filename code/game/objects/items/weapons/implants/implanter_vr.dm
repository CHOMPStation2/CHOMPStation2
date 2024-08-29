//Vorestation universal translator implant.

/obj/item/implanter/vrlanguage // CHOMPEdit - Removal of obj/item/weapon
	name = "implanter-language"

/obj/item/implanter/vrlanguage/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/vrlanguage( src ) // CHOMPEdit - Removal of obj/item/weapon
	..()
	update()
	return
