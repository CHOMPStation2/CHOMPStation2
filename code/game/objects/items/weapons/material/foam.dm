/obj/item/weapon/material/twohanded/baseballbat/foam/Initialize(var/ml)
	. = ..(ml, "foam")

/obj/item/weapon/material/sword/foam
	attack_verb = list("bonked","whacked")
	force_divisor = 1
	unbreakable = 1
	damtype = HALLOSS

/obj/item/weapon/material/twohanded/baseballbat/foam
	attack_verb = list("bonked","whacked")
	force_wielded = 1
	force_divisor = 1
	unbreakable = 1
	damtype = HALLOSS

/obj/item/weapon/material/sword/foam/Initialize(var/ml)
	. = ..(ml, "foam")

/obj/item/weapon/material/twohanded/spear/foam
	attack_verb = list("bonked","whacked")
	force_wielded = 1
	force_divisor = 1
	damtype = HALLOSS
	applies_material_colour = 1
	base_icon = "spear_mask"
	icon_state = "spear_mask0"
	unbreakable = 1
<<<<<<< HEAD
/obj/item/weapon/material/twohanded/spear/foam/New(var/newloc)
	..(newloc,"foam")
=======

/obj/item/weapon/material/twohanded/spear/foam/Initialize(var/ml)
	. = ..(ml, "foam")
>>>>>>> 5b45f17809... Merge pull request #11826 from VOREStation/upstream-merge-8298

/obj/item/weapon/material/twohanded/fireaxe/foam
	attack_verb = list("bonked","whacked")
	force_wielded = 1
	force_divisor = 1
	damtype = HALLOSS
	applies_material_colour = 1
	base_icon = "fireaxe_mask"
	icon_state = "fireaxe_mask0"
	unbreakable = 1

/obj/item/weapon/material/twohanded/fireaxe/foam/Initialize(var/ml)
	. = ..(ml,"foam")

/obj/item/weapon/material/twohanded/fireaxe/foam/afterattack()
	return