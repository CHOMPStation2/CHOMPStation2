/obj/item/clothing/glasses/omnihud/visor/tesh
	name = "AR V-visor"
	desc = "A modified VZR-AR visor refitted for Teshari."
	icon = 'modular_chomp/icons/inventory/eyes/mob.dmi'
	icon_override = 'modular_chomp/icons/inventory/eyes/mob.dmi'
	icon_state = "AR_visor_tesh"
	item_state = "AR_visor_tesh"
	sprite_sheets = list(SPECIES_TESHARI = 'icons/inventory/eyes/mob_teshari.dmi')


/obj/item/clothing/glasses/darksight
	name = "voidviewer goggles"
	desc = "Cryptic goggles designed for seeing beyond the viel of normality."

	icon = 'modular_chomp/icons/inventory/eyes/glasses.dmi'
	icon_override = 'modular_chomp/icons/inventory/eyes/mob.dmi'
	icon_state = "darksight"

	actions_types = list(/datum/action/item_action/toggle_goggles)

	toggleable = 1
	see_invisible = INVISIBILITY_SHADEKIN

/* //No hybridizing shadekinsight. Having it as an adminspawn is ok, but it should be specific
/obj/item/clothing/glasses/meson/darksight
	name = "optical meson scanner"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "meson"
	item_state_slots = list(slot_r_hand_str = "meson", slot_l_hand_str = "meson")
	actions_types = list(/datum/action/item_action/toggle_goggles)
	origin_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	toggleable = 1
	vision_flags = SEE_TURFS
	enables_planes = list(VIS_FULLBRIGHT, VIS_MESONS)
	see_invisible = INVISIBILITY_SHADEKIN
*/
