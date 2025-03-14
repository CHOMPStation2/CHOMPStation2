/obj/item/rig/ch/clockwork
	name = "brass box"
	suit_type = "clockwork"
	desc = "A subtly vibrating box made out of brass. It has some buttons and switches on one side, and what looks like vents on another."
	icon = 'modular_chomp/icons/obj/rig_modules_ch.dmi'
	icon_state = "clockwork_rig"
	slot_flags = SLOT_BELT
	armor = list(melee = 70, bullet = 55, laser = 65, energy = 65, bomb = 65, bio = 0, rad = 100)
	slowdown = 2
	offline_slowdown = 4
	offline_vision_restriction = 1
	emp_protection = 40
	siemens_coefficient= 0.75
	rigsuit_max_pressure = 8 * ONE_ATMOSPHERE
	rigsuit_min_pressure = 0

	chest_type = /obj/item/clothing/suit/space/rig/ch/clockwork
	helm_type = /obj/item/clothing/head/helmet/space/rig/ch/clockwork
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/ch/clockwork
	boot_type = /obj/item/clothing/shoes/magboots/rig/ch/clockwork
	cell_type =  /obj/item/cell/clockwork

	allowed = list(POCKET_GENERIC, POCKET_ALL_TANKS, POCKET_SUIT_REGULATORS, POCKET_MINING, POCKET_ENGINEERING, POCKET_HEAVYTOOLS, POCKET_BAYSUIT,  /obj/item/storage/backpack, /obj/item/ratvarian_spear
		)

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		)


	req_access = list()
	req_one_access = list()

/obj/item/clothing/suit/space/rig/ch/clockwork
	name = "cuirass"
	icon = 'icons/obj/clothing/spacesuits_ch.dmi'
	icon_state = "clockwork_rig"
	desc = "A bulky cuirass made of brass."

/obj/item/clothing/head/helmet/space/rig/ch/clockwork
	name = "helmet"
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_state = "clockwork_rig"
	desc = "A heavy helmet made of brass."

/obj/item/clothing/gloves/gauntlets/rig/ch/clockwork
	name = "gauntlets"
	icon = 'icons/obj/clothing/gloves_ch.dmi'
	icon_state = "clockwork_rig"

	desc = "Heavy, shock-resistant gauntlets with brass reinforcement."
	siemens_coefficient = 0

/obj/item/clothing/shoes/magboots/rig/ch/clockwork
	name = "treads"
	icon = 'icons/obj/clothing/shoes_ch.dmi'
	icon_state = "clockwork_rig"

	desc = "Industrial boots made of brass. They're very heavy."

/obj/item/cell/clockwork //using the stats of a precursor void cell until someone's motivated to port and make the suit use clockcult global power
	name = "hierophant ansible"
	desc = "A curiously cold brass doodad. It seems as though it really doesn't appreciate being held. Due to it's size and the apparent electrical arc, it might be useful as a battery?"
	origin_tech = list(TECH_POWER = 8, TECH_ENGINEERING = 6)
	icon = 'modular_chomp/icons/obj/clockwork_objects.dmi'
	icon_state = "hierophant_ansible"
	maxcharge = 4800 //same stats as a void cell, but slower at recharging itself
	charge_amount = 120
	self_recharge = TRUE
	charge_delay = 50
	matter = null
	standard_overlays = FALSE
