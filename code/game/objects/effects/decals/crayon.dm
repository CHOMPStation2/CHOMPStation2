/obj/effect/decal/cleanable/crayon
	name = "rune"
	desc = "A rune drawn in crayon."
	icon = 'icons/obj/rune.dmi'
	plane = DIRTY_PLANE
	layer = DIRTY_LAYER
	anchored = TRUE
// CHOMPEdit Start - Pretty much all of this file changed
	var/art_type
	var/art_color
	var/art_shade

<<<<<<< HEAD
/obj/effect/decal/cleanable/crayon/Initialize(var/ml, main = "#FFFFFF",shade = "#000000",var/type = "rune", new_age = 0)
	. = ..(ml, new_age) // mapload, age
	name = type
	desc = "A [type] drawn in crayon."

	// Persistence vars.
=======
	var/art_type
	var/art_color
	var/art_shade

/obj/effect/decal/cleanable/crayon/Initialize(var/ml, main = "#FFFFFF",shade = "#000000",var/type = "rune", new_age = 0)
	name = type
	desc = "A [type] drawn in crayon."

	// Persistence vars. Unused here but used downstream. If someone updates the persistance code, it's here.
>>>>>>> 05b28bac9e (Merge pull request #16647 from Cameron653/Janihud-OP)
	art_type = type
	art_color = main
	art_shade = shade

	switch(type)
		if("rune")
			type = "rune[rand(1,6)]"
		if("graffiti")
			type = pick("amyjon","face","matt","revolution","engie","guy","end","dwarf","uboa")

<<<<<<< HEAD
	update_icon()
=======
	. = ..(ml, new_age) // mapload, age
>>>>>>> 05b28bac9e (Merge pull request #16647 from Cameron653/Janihud-OP)

/obj/effect/decal/cleanable/crayon/update_icon()
	cut_overlays()
	var/icon/mainOverlay = new/icon('icons/effects/crayondecal.dmi',"[art_type]",2.1)
	var/icon/shadeOverlay = new/icon('icons/effects/crayondecal.dmi',"[art_type]s",2.1)

	if(mainOverlay && shadeOverlay)
		mainOverlay.Blend(art_color,ICON_ADD)
		shadeOverlay.Blend(art_shade,ICON_ADD)

		add_overlay(mainOverlay)
		add_overlay(shadeOverlay)
<<<<<<< HEAD
=======

	add_janitor_hud_overlay()
>>>>>>> 05b28bac9e (Merge pull request #16647 from Cameron653/Janihud-OP)
	return
// CHOMPEdit End
