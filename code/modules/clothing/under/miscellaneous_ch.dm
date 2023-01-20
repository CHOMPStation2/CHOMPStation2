/obj/item/clothing/under/sexybunny_white
	name = "Bunny girl suit"
	desc = "this seems to come with extra padding, exaggerating the chest some."
	icon = 'icons/inventory/uniform/item_ch.dmi'
	icon_override = 'icons/inventory/uniform/mob_ch.dmi'
	icon_state = "sexybunny_white"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/under/sexybunny_white/sexybunny_black
	icon_state = "sexybunny_black"

/obj/item/clothing/under/cohesion/decal/test  //Testing both at once.
	water_protection = 1
	permeability_coefficient = 0

/obj/item/clothing/under/cohesion/striped/test
	permeability_coefficient = 0  //Test for if this affects water or not.

/obj/item/clothing/under/cohesion/hazard/test
	water_protection = 1  //Test for if this even does anything, as it's referenced a bunch in the defense code and promethean code.

/obj/item/clothing/under/cohesion/striped/testfull //testing both, but with full coverage.
	water_protection = 1
	permeability_coefficient = 0
	body_parts_covered = HEAD|FACE|EYES|UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/under/cohesion/striped/testfull //testing both, but without as full coverage.
	water_protection = 1
	permeability_coefficient = 0
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
