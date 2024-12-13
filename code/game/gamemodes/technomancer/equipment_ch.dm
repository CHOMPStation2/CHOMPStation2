/obj/item/clothing/glasses/monocoole
	name = "The Monocoole"
	desc = "One heck of a stylish monocle. This one lets you see a little farther..."
	icon_state = "monocle"
	actions_types = list(/datum/action/item_action/toggle_goggles)
	origin_tech = list(TECH_MAGNET = 6, TECH_ENGINEERING = 6)
	toggleable = 1
	vision_flags = SEE_TURFS|SEE_MOBS|SEE_OBJS
	prescription = 1 // So two versions of these aren't needed.
