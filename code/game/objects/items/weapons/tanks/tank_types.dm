/* Types of tanks!
 * Contains:
 *		Oxygen
 *		Anesthetic
 *		Air
 *		Phoron
 *		Emergency Oxygen
 */

/*
 * Oxygen
 */
/obj/item/tank/oxygen // CHOMPEdit - Removal of obj/item/weapon
	name = "oxygen tank"
	desc = "A tank of oxygen."
	icon_state = "oxygen"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD

/obj/item/tank/oxygen/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	air_contents.adjust_gas("oxygen", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/oxygen/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(loc == user && (air_contents.gas["oxygen"] < 10))
		. += "<span class='warning'>The meter on \the [src] indicates you are almost out of oxygen!</span>"

/obj/item/tank/oxygen/yellow // CHOMPEdit - Removal of obj/item/weapon
	desc = "A tank of oxygen, this one is yellow."
	icon_state = "oxygen_f"

/obj/item/tank/oxygen/red // CHOMPEdit - Removal of obj/item/weapon
	desc = "A tank of oxygen, this one is red."
	icon_state = "oxygen_fr"

/*
 * Anesthetic
 */
/obj/item/tank/anesthetic // CHOMPEdit - Removal of obj/item/weapon
	name = "anesthetic tank"
	desc = "A tank with an N2O/O2 gas mix."
	icon_state = "anesthetic"

/obj/item/tank/anesthetic/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()

	air_contents.gas["oxygen"] = (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C) * O2STANDARD
	air_contents.gas["nitrous_oxide"] = (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C) * N2STANDARD
	air_contents.update_values()

/*
 * Air
 */
/obj/item/tank/air // CHOMPEdit - Removal of obj/item/weapon
	name = "air tank"
	desc = "Mixed. Shaken, not stirred."		// CHOMP EDIT Haha funny? idk I like this description. 
	icon_state = "oxygen"

/obj/item/tank/air/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(loc == user && (air_contents.gas["oxygen"] < 1))
		. += "<span class='warning'>The meter on \the [src] indicates you are almost out of air!</span>"
		user << sound('sound/effects/alert.ogg')

/obj/item/tank/air/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	src.air_contents.adjust_multi("oxygen", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C) * O2STANDARD, "nitrogen", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C) * N2STANDARD)

/*
 * Phoron
 */
/obj/item/tank/phoron // CHOMPEdit - Removal of obj/item/weapon
	name = "phoron tank"
	desc = "Contains dangerous phoron. Do not inhale. Warning: extremely flammable."
	icon_state = "phoron"
	gauge_icon = null
	slot_flags = null	//they have no straps!

/obj/item/tank/phoron/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	src.air_contents.adjust_gas("phoron", (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/phoron/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	..()

	if (istype(W, /obj/item/flamethrower)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/flamethrower/F = W // CHOMPEdit - Removal of obj/item/weapon
		if ((!F.status)||(F.ptank))	return
		src.master = F
		F.ptank = src
		user.remove_from_mob(src)
		src.loc = F
	return

/obj/item/tank/vox	//Can't be a child of phoron or the gas amount gets screwey. // CHOMPEdit - Removal of obj/item/weapon
	name = "phoron tank"
	desc = "Contains dangerous phoron. Do not inhale. Warning: extremely flammable."
	icon_state = "phoron_vox"
	gauge_icon = "indicator_bigtank"		// CHOMP EDIT fixes indicator to ensure there's never a buggy outcome 
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	slot_flags = SLOT_BACK	//these ones have straps!

/obj/item/tank/vox/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	air_contents.adjust_gas("phoron", (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C)) //VOREStation Edit

/obj/item/tank/phoron/pressurized // CHOMPEdit - Removal of obj/item/weapon
	name = "fuel can"
	icon_state = "phoron_vox"
	w_class = ITEMSIZE_NORMAL

/obj/item/tank/phoron/pressurized/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	adjust_scale(0.8)
	air_contents.adjust_gas("phoron", (7*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/*
 * Emergency Oxygen
 */

/obj/item/tank/emergency // CHOMPEdit - Removal of obj/item/weapon
	name = "emergency tank"
	icon_state = "emergency"
	gauge_icon = "indicator_smalltank"		// CHOMP EDIT fixes indicator to ensure there's never a buggy outcome
	gauge_cap = 4
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_SMALL
	force = 4
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	volume = 2 //Tiny. Real life equivalents only have 21 breaths of oxygen in them. They're EMERGENCY tanks anyway -errorage (dangercon 2011)

/obj/item/tank/emergency/oxygen // CHOMPEdit - Removal of obj/item/weapon
	name = "emergency oxygen tank"
	desc = "Used for emergencies. Contains very little oxygen, so try to conserve it until you actually need it."
	icon_state = "emergency"
	gauge_icon = "indicator_smalltank"		// CHOMP EDIT fixes indicator to ensure there's never a buggy outcome

/obj/item/tank/emergency/oxygen/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	src.air_contents.adjust_gas("oxygen", (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/oxygen/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(loc == user && (air_contents.gas["oxygen"] < 0.2))
		. += "<span class='danger'>The meter on the [src.name] indicates you are almost out of air!</span>"
		user << sound('sound/effects/alert.ogg')

/obj/item/tank/emergency/oxygen/engi // CHOMPEdit - Removal of obj/item/weapon
	name = "extended-capacity emergency oxygen tank"
	icon_state = "emergency_engi"
	volume = 6

/obj/item/tank/emergency/oxygen/double // CHOMPEdit - Removal of obj/item/weapon
	name = "double emergency oxygen tank"
	icon_state = "emergency_double"
	gauge_icon = "indicator_double"			// CHOMP EDIT proper gauge icon
	volume = 12 					// CHOMP EDIT Double Expanded

/obj/item/tank/stasis/oxygen // Stasis bags need to have initial pressure within safe bounds for human atmospheric pressure (NOT breath pressure) // CHOMPEdit - Removal of obj/item/weapon
	name = "stasis oxygen tank"
	desc = "Oxygen tank included in most stasis bag designs."
	icon = 'icons/obj/tank_ch.dmi'			// CHOMP ADD Adds a unique icon to the oxygen tank in stasis bags.
	icon_state = "stasis_oxygen"			// CHOMP ADD
	gauge_icon = "indicator_stasis"			// CHOMP ADD
	volume = 10

/obj/item/tank/stasis/oxygen/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	src.air_contents.adjust_gas("oxygen", (3*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/nitrogen // CHOMPEdit - Removal of obj/item/weapon
	name = "emergency nitrogen tank"
	desc = "An emergency nitrogen tank."			// CHOMP EDIT They get their own :)
	icon_state = "emergency_nitrogen"				// :)
	gauge_icon = "indicator_smalltank"				// :)

/obj/item/tank/emergency/nitrogen/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	src.air_contents.adjust_gas("nitrogen", (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/nitrogen/double // CHOMPEdit - Removal of obj/item/weapon
	name = "double emergency nitrogen tank"
	icon_state = "emergency_double_vox_old"			// CHOMP EDIT Nitrogen double gets its OWN sprite >:3c
	gauge_icon = "indicator_double"					// <3
	volume = 12			// CHOMP EDIT Double Expanded

/obj/item/tank/emergency/phoron // CHOMPEdit - Removal of obj/item/weapon
	name = "emergency phoron tank"
	desc = "An emergency phoron tank."  			// CHOMP EDIT You get a unique sprite!
	icon_state = "emergency_phoron_vox"				// And you get a unique sprite!
	gauge_icon = "indicator_smalltank"				// Look under your chairs! You all get unique sprites!

/obj/item/tank/emergency/phoron/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	src.air_contents.adjust_gas("phoron", (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/phoron/double // CHOMPEdit - Removal of obj/item/weapon
	name = "double emergency phoron tank"
	icon_state = "emergency_double_vox"				// CHOMP EDIT Unique sprites. :)
	gauge_icon = "indicator_double"					// Ensuring unique sprite stuff ig.
	volume = 10

/*
 * Nitrogen
 */
/obj/item/tank/nitrogen // CHOMPEdit - Removal of obj/item/weapon
	name = "nitrogen tank"
	desc = "A tank of nitrogen."
	icon_state = "oxygen_fr"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD

/obj/item/tank/nitrogen/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	src.air_contents.adjust_gas("nitrogen", (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C)) //CHOMPedit

/obj/item/tank/nitrogen/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(loc == user && (air_contents.gas["nitrogen"] < 10))
		. += "<span class='danger'>The meter on \the [src] indicates you are almost out of nitrogen!</span>"
		//playsound(user, 'sound/effects/alert.ogg', 50, 1)

/obj/item/tank/stasis/nitro_cryo // Synthmorph bags need to have initial pressure within safe bounds for human atmospheric pressure, but low temperature to stop unwanted degredation. // CHOMPEdit - Removal of obj/item/weapon
	name = "stasis cryogenic nitrogen tank"
	desc = "Cryogenic Nitrogen tank included in most synthmorph bag designs."
	icon = 'icons/obj/tank_ch.dmi'		// CHOMP ADD Adds a stasis sprite unique to this icon.
	icon_state = "stasis_nitrogen"		// CHOMP ADD
	gauge_icon = "indicator_stasis"		// CHOMP ADD
	volume = 10

/obj/item/tank/stasis/nitro_cryo/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	src.air_contents.adjust_gas_temp("nitrogen", (3*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*TN60C), TN60C)
