//Ratvarian spear: A relatively fragile spear from the Celestial Derelict. Deals extreme damage to silicons and enemy cultists, but doesn't last long when summoned.
/obj/item/ratvarian_spear
	name = "ratvarian spear"
	desc = "A razor-sharp spear made of brass. It thrums with barely-contained energy."
	icon = 'modular_chomp/icons/obj/clockwork_objects.dmi'
	icon_state = "ratvarian_spear"
	item_state = "ratvarian_spear"
	item_icons = list(slot_l_hand_str = 'modular_chomp/icons/mob/items/clockwork_lefthand.dmi', slot_r_hand_str = 'modular_chomp/icons/mob/items/clockwork_righthand.dmi')
	force = 20
	throwforce = 30
	armor_penetration = 10
	sharp = TRUE
	edge = TRUE
	attack_verb = list("stabbed", "poked", "slashed")
	hitsound = 'sound/weapons/bladeslice.ogg'
	w_class = ITEMSIZE_HUGE
