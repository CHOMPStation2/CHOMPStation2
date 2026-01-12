/obj/item/cell/device/weapon/recharge/cult
	name = "occult cell"
	desc = "An alien technology that produces energy seemingly out of nowhere, perhaps from another realm?"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "soulstone2"
	charge = 300
	maxcharge = 300
	charge_amount = 300
	charge_delay = 50

/obj/item/paper/astral_event
	name = "Astral Collective Note"
	info = "Signals from outside the building is sparse."

/obj/item/prop/astral_event
	name = "strange keycard"
	desc = "An alien keycard."
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state = "keycard_a"
	w_class = ITEMSIZE_SMALL

/obj/item/prop/astral_event/Initialize(mapload)
	var/obj/item/gps/on/our_gps = new(src)
	our_gps.gps_tag = "error"
	. = ..()

/obj/item/prop/astral_event/a
	icon_state = "keycard_a"

/obj/item/prop/astral_event/b
	icon_state = "keycard_b"

/obj/item/prop/astral_event/c
	icon_state = "keycard_c"

/obj/item/prop/astral_event/d
	icon_state = "keycard_d"

/obj/item/prop/astral_event/e
	icon_state = "keycard_e"

/obj/item/paper/astral_event/warning
	name = "Warning"
	info = "They are coming, stay within your base."

/obj/item/paper/astral_event/traitor
	name = "Astral Collective Note"
	info = "One of us turned traitor, utilzing the Divine Instrument: Waipre. They tossed the Apocalypse Keys to the winds. Five of them are located within this system. Lucky three appear within the same region, however those from the realm of chaos appear to be gathering around them."

/obj/item/paper/astral_event/keycards
	name = "Apocalypse Keys"
	info = "From the Rebirth Origin we located several powerful artifacts, and a strange wealth of information. One involves this keycards, and time capsules left behind in case of the end times. We have 15 keys, however the location of the time capsules has not been recovered as of writing this. One suggested reentering the valley collapse point."

/obj/item/paper/astral_event/rebirth
	name = "Reborn"
	info = "We were on the edge of death. Our heads left for the stars unknown, as we struggled to run, but soon they would drag us back into their embrace. They had found a hidden paradise, far from the others. We could rebuild, a new name being chosen for the new us."

/obj/item/paper/astral_event/warpie
	name = "Divine Instrument: Waipre"
	info = "A powerful tool, capable of warping mass amount of people, and objects through space. This feature is also useable at range, letting us warp others across planets whilst being planets away from either. Unfortunately, it is tied within the Rebirth Origin, and the power draw is limited but this only slows us down."

/obj/item/paper/astral_event/ignai
	name = "Divine Instrument: Ignai"
	info = "Found within what we assume was a melted building, the metal around the object still liquid. It is capable of creating extreme heat, only our high quality mechas able to handle the heat. We have been able to deconstruct and reconstruct it, attempts are being made to replicate it."

/obj/item/paper/astral_event/marktwo
	name = "Mark 2"
	info = "This is Authorization for the Ignai Replica and Fertda Replica to be applied to the clean up mecha."
