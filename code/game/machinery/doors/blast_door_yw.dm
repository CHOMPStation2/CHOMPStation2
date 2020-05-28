// SUBTYPE: Reactor Shroud.
// radiation proof door for use as shielding for the R-UST.
/obj/machinery/door/blast/radproof/
	name = "Reactor Shroud"
	desc = "Two massive interlocking hulks of radiation resistant metal. It looks like it could stop a tank."
	icon_state_open = "pdoor0"
	icon_state_opening = "pdoorc0"
	icon_state_closed = "pdoor1"
	icon_state_closing = "pdoorc1"
	icon_state = "pdoor1"
	maxhealth = 600
	rad_resistance = 100
	id = "EngineShroud"

/obj/machinery/door/blast/radproof/open
	icon_state = "pdoor0"
	density = 0
	opacity = 0
	rad_resistance = 0

/obj/machinery/door/blast/radproof/force_open()
	src.rad_resistance = 0
	..()

/obj/machinery/door/blast/radproof/force_close()
	src.rad_resistance = 100
	..()

/obj/machinery/button/remote/blast_door/radproof
	name = "Reactor Shroud Control"
	desc = "It the reactor shroud remotely."
	id = "EngineShroud"
