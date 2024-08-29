/obj/item/material/twohanded/baseballbat // CHOMPEdit - Removal of obj/item/weapon
	name = "bat"
	desc = "HOME RUN!"
	icon_state = "metalbat0"
	base_icon = "metalbat"
	throwforce = 7
	attack_verb = list("smashed", "beaten", "slammed", "smacked", "struck", "battered", "bonked")
	hitsound = 'sound/weapons/genhit3.ogg'
	default_material = "wood"
	force_divisor = 1.1           // 22 when wielded with weight 20 (steel)
	unwielded_force_divisor = 0.7 // 15 when unwielded based on above.
	dulled_divisor = 0.75		  // A "dull" bat is still gonna hurt
	slot_flags = SLOT_BACK

//Predefined materials go here.
/obj/item/material/twohanded/baseballbat/metal/New(var/newloc) // CHOMPEdit - Removal of obj/item/weapon
	..(newloc,"steel")

/obj/item/material/twohanded/baseballbat/uranium/New(var/newloc) // CHOMPEdit - Removal of obj/item/weapon
	..(newloc,"uranium")

/obj/item/material/twohanded/baseballbat/gold/New(var/newloc) // CHOMPEdit - Removal of obj/item/weapon
	..(newloc,"gold")

/obj/item/material/twohanded/baseballbat/platinum/New(var/newloc) // CHOMPEdit - Removal of obj/item/weapon
	..(newloc,"platinum")

/obj/item/material/twohanded/baseballbat/diamond/New(var/newloc) // CHOMPEdit - Removal of obj/item/weapon
	..(newloc,"diamond")