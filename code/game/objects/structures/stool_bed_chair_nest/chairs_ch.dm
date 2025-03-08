
/obj/structure/bed/chair/comfy			// Making the premade chairs not have the basic chair visible, sometime make the constructed ones work as well
	icon = 'icons/obj/furniture_ch.dmi'
	icon_state = "comfychair"
	base_icon = "comfychair"

/obj/structure/bed/chair/oldsofa //Original Paradise port kept in the event players like these couches.
	name = "sofa"
	desc = "It's a couch. It looks kinda dingy."
	icon = 'icons/obj/furniture_ch.dmi'
	icon_state = "sofamiddleOLD"
	base_icon = "sofamiddleOLD"
	applies_material_colour = 0

/obj/structure/bed/chair/oldsofa/left
	icon_state = "sofaend_leftOLD"
	base_icon = "sofaend_leftOLD"

/obj/structure/bed/chair/oldsofa/right
	icon_state = "sofaend_rightOLD"
	base_icon = "sofaend_rightOLD"

/obj/structure/bed/chair/oldsofa/corner
	icon_state = "sofacornerOLD"
	base_icon = "sofacornerOLD"

/obj/structure/bed/chair/sofa/sif_ora/Initialize(mapload,var/newmaterial)
	. = ..(mapload,MAT_SIFWOOD,MAT_CARPET_ORANGE)

/obj/structure/bed/chair/sofa/left/sif_ora/Initialize(mapload,var/newmaterial)
	. = ..(mapload,MAT_SIFWOOD,MAT_CARPET_ORANGE)

/obj/structure/bed/chair/sofa/right/sif_ora/Initialize(mapload,var/newmaterial)
	. = ..(mapload,MAT_SIFWOOD,MAT_CARPET_ORANGE)

/obj/structure/bed/chair/sofa/corner/sif_ora/Initialize(mapload,var/newmaterial)
	. = ..(mapload,MAT_SIFWOOD,MAT_CARPET_ORANGE)
