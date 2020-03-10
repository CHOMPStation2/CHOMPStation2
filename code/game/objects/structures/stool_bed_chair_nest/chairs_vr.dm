/obj/structure/bed/chair/sofa
	name = "sofa"
	desc = "A padded, comfy sofa. Great for lazing on."
	icon = 'icons/obj/furniture_ch.dmi' //CHOMPstation edit: Improving on the sofas by making them visually change with padding
	base_icon = "sofamiddle"
	icon_state = "sofamiddle"	//CHOMPstation edit: preview in map maker

/obj/structure/bed/chair/sofa/left
	base_icon = "sofaend_left"
	icon_state = "sofaend_left"	//CHOMPstation edit: preview in map maker

/obj/structure/bed/chair/sofa/right
	base_icon = "sofaend_right"
	icon_state = "sofaend_right"	//CHOMPstation edit: preview in map maker

/obj/structure/bed/chair/sofa/corner
	base_icon = "sofacorner"
	icon_state = "sofacorner"	//CHOMPstation edit: preview in map maker

/obj/structure/bed/chair/sofa/corner/update_layer()
	if(src.dir == NORTH || src.dir == WEST)
		plane = MOB_PLANE
		layer = MOB_LAYER + 0.1
	else
		reset_plane_and_layer()