/obj/item/clothing/under/sexybunny_white
	name = "Bunny girl suit"
	desc = "this seems to come with extra padding, exaggerating the chest some."
	icon = 'icons/inventory/uniform/item_ch.dmi'
	icon_override = 'icons/inventory/uniform/mob_ch.dmi'
	icon_state = "sexybunny_white"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/under/sexybunny_white/sexybunny_black
	icon_state = "sexybunny_black"

/obj/item/clothing/under/cohesion
	permeability_coefficient = 0  //Should have this anyway

/obj/item/clothing/under/cohesion/striped/testpartial //testing better coverage.
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/under/cohesion/striped/testfull //testing both, but with full coverage.
	body_parts_covered = HEAD|UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
