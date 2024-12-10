/obj/item/stack/material/glass
	name = "glass"
	icon_state = "sheet-glass" //CHOMPedit - replace materials update
	default_type = "glass"
	no_variants = FALSE
	drop_sound = 'sound/items/drop/glass.ogg'
	pickup_sound = 'sound/items/pickup/glass.ogg'
	apply_colour = TRUE

/obj/item/stack/material/glass/reinforced
	name = "reinforced glass"
<<<<<<< HEAD
	icon_state = "sheet-rglass" //CHOMPedit - replace materials update
	default_type = "rglass"
=======
	icon_state = "sheet-rtransparent"
	default_type = MAT_RGLASS
>>>>>>> af544e406f (Merge pull request #16674 from Kashargul/reagentToDefines)
	no_variants = FALSE
	apply_colour = TRUE

/obj/item/stack/material/glass/phoronglass
	name = MAT_PGLASS
	desc = "This sheet is special platinum-glass alloy designed to withstand large temperatures"
	singular_name = "borosilicate glass sheet"
<<<<<<< HEAD
	icon_state = "sheet-phoronglass" //CHOMPedit - replace materials update
	default_type = "borosilicate glass"
=======
	icon_state = "sheet-transparent"
	default_type = MAT_PGLASS
>>>>>>> af544e406f (Merge pull request #16674 from Kashargul/reagentToDefines)
	no_variants = FALSE
	apply_colour = TRUE

/obj/item/stack/material/glass/phoronrglass
	name = MAT_RPGLASS
	desc = "This sheet is special platinum-glass alloy designed to withstand large temperatures. It is reinforced with few rods."
	singular_name = "reinforced borosilicate glass sheet"
<<<<<<< HEAD
	icon_state = "sheet-phoronrglass" //CHOMPedit - replace materials update
	default_type = "reinforced borosilicate glass"
=======
	icon_state = "sheet-rtransparent"
	default_type = MAT_RPGLASS
>>>>>>> af544e406f (Merge pull request #16674 from Kashargul/reagentToDefines)
	no_variants = FALSE
	apply_colour = TRUE
