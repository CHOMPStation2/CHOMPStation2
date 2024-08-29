//NEVER USE THIS IT SUX	-PETETHEGOAT
//THE GOAT WAS RIGHT - RKF

var/global/list/cached_icons = list()

/obj/item/reagent_containers/glass/paint // CHOMPEdit - Removal of obj/item/weapon
	desc = "It's a paint bucket."
	name = "paint bucket"
	icon = 'icons/obj/items.dmi'
	icon_state = "paint_neutral"
	item_state = "paintcan"
	matter = list(MAT_STEEL = 200)
	w_class = ITEMSIZE_NORMAL
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(10,20,30,60)
	volume = 60
	unacidable = FALSE
	flags = OPENCONTAINER
	var/paint_type = "red"

/obj/item/reagent_containers/glass/paint/afterattack(turf/simulated/target, mob/user, proximity) // CHOMPEdit - Removal of obj/item/weapon
	if(!proximity) return
	if(istype(target) && reagents.total_volume > 5)
		user.visible_message("<span class='warning'>\The [target] has been splashed with something by [user]!</span>")
		reagents.trans_to_turf(target, 5)
	else
		return ..()

/obj/item/reagent_containers/glass/paint/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	.=..()
	if(paint_type)
		reagents.add_reagent("paint", volume, paint_type)

/obj/item/reagent_containers/glass/paint/red // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_red"
	paint_type = "#FF0000"

/obj/item/reagent_containers/glass/paint/yellow // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_yellow"
	paint_type = "#FFFF00"

/obj/item/reagent_containers/glass/paint/green // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_green"
	paint_type = "#00FF00"

/obj/item/reagent_containers/glass/paint/blue // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_blue"
	paint_type = "#0000FF"

/obj/item/reagent_containers/glass/paint/violet // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_violet"
	paint_type = "#FF00FF"

/obj/item/reagent_containers/glass/paint/black // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_black"
	paint_type = "#000000"

/obj/item/reagent_containers/glass/paint/grey // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_neutral"
	paint_type = "#808080"

/obj/item/reagent_containers/glass/paint/orange // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_orange"
	paint_type = "#FFA500"

/obj/item/reagent_containers/glass/paint/purple // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_purple"
	paint_type = "#A500FF"

/obj/item/reagent_containers/glass/paint/cyan // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "paint_cyan"
	paint_type = "#00FFFF"

/obj/item/reagent_containers/glass/paint/white // CHOMPEdit - Removal of obj/item/weapon
	name = "paint remover bucket"
	icon_state = "paint_white"
	paint_type = "#FFFFFF"

