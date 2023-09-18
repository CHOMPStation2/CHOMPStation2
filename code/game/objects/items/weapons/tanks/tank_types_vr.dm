/obj/item/weapon/tank/emergency/phoron/double
	name = "double emergency phoron tank"
	desc = "Contains dangerous phoron. Do not inhale. Warning: extremely flammable."
	icon = 'icons/obj/tank_vr.dmi'
	icon_override = 'icons/inventory/belt/mob_vr.dmi'
	icon_state = "emergency_double_vox"
	gauge_icon = "indicator_double"
	gauge_cap = 3
	volume = 12		// CHOMP EDIT double extended

/obj/item/weapon/tank/emergency/phoron/double/Initialize() //ChompEDIT New() -> Initialize()
	. = ..()
	air_contents.adjust_gas("phoron", (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

//New icons
/obj/item/weapon/tank/oxygen
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "oxygen"
	gauge_cap = 3
	gauge_icon = "indicator_bigtank"
// /obj/item/weapon/tank/oxygen/yellow
// /obj/item/weapon/tank/oxygen/red

/obj/item/weapon/tank/anesthetic
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "anesthetic"
	gauge_cap = 3
	gauge_icon = "indicator_bigtank"

/obj/item/weapon/tank/air
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "oxygen"
	gauge_cap = 3
	gauge_icon = "indicator_bigtank"

/obj/item/weapon/tank/phoron
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "phoron"

/obj/item/weapon/tank/vox	//Can't be a child of phoron or the gas amount gets screwey.
	icon = 'icons/obj/tank_vr.dmi'
	icon_override = 'icons/inventory/back/mob_vr.dmi'
	icon_state = "phoron_vox"
	gauge_cap = 3
	gauge_icon = "indicator_double"

/obj/item/weapon/tank/emergency
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "emergency"
	gauge_icon = "indicator_smalltank"
	gauge_cap = 3

/obj/item/weapon/tank/emergency/oxygen
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "emergency"
	gauge_icon = "indicator_smalltank"
	gauge_cap = 3

/obj/item/weapon/tank/emergency/oxygen/engi
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "emergency_engi"
	gauge_icon = "indicator_engi"
	gauge_cap = 3

/obj/item/weapon/tank/emergency/oxygen/double
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "emergency_double"
	gauge_icon = "indicator_double"
	gauge_cap = 3

/obj/item/weapon/tank/emergency/nitrogen
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "emergency_nitrogen"
	gauge_icon = "indicator_smalltank"
	volume = 6			// CHOMP EDIT adds a custom volume to ensure things aren't buggy with changes
	gauge_cap = 3

/obj/item/weapon/tank/emergency/nitrogen/double
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "emergency_double_vox_old"		// CHOMP EDIT using the old red double sprite to indicate double nitrogen rather than sharing the phoron tank (cuz why share the phoron tank?)
	gauge_icon = "indicator_double"
	volume = 12		// CHOMP EDIT double extended
	gauge_cap = 3

/obj/item/weapon/tank/emergency/phoron
	icon = 'icons/obj/tank_vr.dmi'
	icon_override = 'icons/inventory/belt/mob_vr.dmi'
	icon_state = "emergency_phoron_vox"
	gauge_icon = "indicator_smalltank"
	volume = 6
	gauge_cap = 3

/obj/item/weapon/tank/nitrogen
	icon = 'icons/obj/tank_vr.dmi'
	icon_state = "oxygen_fr"
	gauge_icon = "indicator_bigtank"
	gauge_cap = 3
