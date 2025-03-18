/obj/item/kinetic_crusher/glaive
	name = "kinetic glaive"
	icon_state = "crusher-glaive"
	force = 20
	detonation_damage = 20 // 40
	backstab_bonus = 30 // 60
	reach = 2
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_NORMAL
	requires_wield = FALSE

/obj/item/pickaxe/anamolous
	name = "strange pickaxe"
	icon_state = "ppickaxe"
	item_state = "ppickaxe"
	digspeed = 2
	throwforce = 25.0
	origin_tech = list(TECH_MATERIAL = 3)
	desc = "This oddly lightweight pickaxe seems rather sturdy."


/obj/item/kinetic_crusher
	requires_wield = FALSE
