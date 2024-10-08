/obj/item/material/twohanded/baseballbat/foam/New(var/newloc)
	..(newloc,"foam")

/obj/item/material/sword/foam
	attack_verb = list("bonked","whacked")
	force_divisor = 1
	unbreakable = 1
	damtype = HALLOSS

/obj/item/material/twohanded/baseballbat/foam
	attack_verb = list("bonked","whacked")
	force_wielded = 1
	force_divisor = 1
	unbreakable = 1
	damtype = HALLOSS

/obj/item/material/sword/foam/New(var/newloc)
	..(newloc,"foam")

/obj/item/material/twohanded/spear/foam
	attack_verb = list("bonked","whacked")
	force_wielded = 1
	force_divisor = 1
	damtype = HALLOSS
	applies_material_colour = 1
	base_icon = "spear_mask"
	icon_state = "spear_mask0"
	unbreakable = 1
/obj/item/material/twohanded/spear/foam/New(var/newloc)
	..(newloc,"foam")

/obj/item/material/twohanded/fireaxe/foam
	attack_verb = list("bonked","whacked")
	force_wielded = 1
	force_divisor = 1
	damtype = HALLOSS
	applies_material_colour = 1
	base_icon = "fireaxe_mask"
	icon_state = "fireaxe_mask0"
	unbreakable = 1

/obj/item/material/twohanded/fireaxe/foam/New(var/newloc)
	..(newloc,"foam")

/obj/item/material/twohanded/fireaxe/foam/afterattack()
	return
