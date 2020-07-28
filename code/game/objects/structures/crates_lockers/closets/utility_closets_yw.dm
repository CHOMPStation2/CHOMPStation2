/obj/structure/closet/shuttleemerg //wall mounted fire closet
	name = "emergency repairs closet"
	desc = "It's a storage unit for emergency repair supplies."
	closet_appearance = /decl/closet_appearance/wall/autolok/shuttleemerg
	plane = TURF_PLANE
	layer = ABOVE_TURF_LAYER
	anchored = 1
	density = 0
	wall_mounted = 1

	starts_with = list(
		/obj/item/weapon/module/power_control,
		/obj/item/weapon/storage/toolbox/mechanical ,
		/obj/item/device/flashlight,
		/obj/item/weapon/tank/oxygen/red,
		/obj/item/weapon/storage/briefcase/inflatable,
		/obj/item/clothing/head/helmet/space/emergency,
		/obj/item/clothing/suit/space/emergency)

/obj/structure/closet/medical
	name = "medical supply closet"
	desc = "May or may not contain medical junk."
	closet_appearance = /decl/closet_appearance/medical_yw