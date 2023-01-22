/datum/supply_pack/munitions/expeditionguns //CHOMP Edit begin: Re-appropriating this whole block. Changing frontier phasers to phaseguns.
	name = "Exploration phasegun (station-locked) crate"
	contains = list(
			/obj/item/weapon/gun/energy/locked/phasegun/pistol = 2,
			/obj/item/weapon/gun/energy/locked/phasegun/rifle = 2,
			/obj/item/weapon/gun/energy/locked/phasegun =  2
			)
	cost = 35
	containertype = /obj/structure/closet/crate/secure
	containername = "phasegun crate"
	access = access_explorer

/datum/supply_pack/munitions/expeditioncannon
	name = "Exploration phasecannon (station-locked) crate"
	contains = list(
			/obj/item/weapon/gun/energy/locked/phasegun/cannon = 1
			)
	cost = 50
	containertype = /obj/structure/closet/crate/secure
	containername = "phasegun cannon crate"
	access = access_explorer 
//CHOMP Edit end

/datum/supply_pack/munitions/ofd_charge_emp
	name = "OFD Charge - EMP"
	contains = list(
			/obj/structure/ship_munition/disperser_charge/emp
			)
	cost = 35
	containertype = /obj/structure/closet/crate/large/secure/heph
	containername = "EMP disperser charge crate"
	access = access_security

/datum/supply_pack/munitions/ofd_charge_explosive
	name = "OFD Charge - Explosive"
	contains = list(
			/obj/structure/ship_munition/disperser_charge/explosive
			)
	cost = 35
	containertype = /obj/structure/closet/crate/large/secure/heph
	containername = "Explosive disperser charge crate"
	access = access_security

/datum/supply_pack/munitions/ofd_charge_incendiary
	name = "OFD Charge - Incendiary"
	contains = list(
			/obj/structure/ship_munition/disperser_charge/fire
			)
	cost = 35
	containertype = /obj/structure/closet/crate/large/secure/heph
	containername = "Incendiary disperser charge crate"
	access = access_security

/datum/supply_pack/munitions/ofd_charge_mining
	name = "OFD Charge - Mining"
	contains = list(
			/obj/structure/ship_munition/disperser_charge/mining
			)
	cost = 35
	containertype = /obj/structure/closet/crate/large/secure/heph
	containername = "Mining disperser charge crate"
	access = access_security

/datum/supply_pack/munitions/longsword
	name = "Weapons - Melee -Longsword (Steel)"
	contains = list(
			/obj/item/weapon/material/twohanded/longsword=2
			)
	cost = 50
	containertype = /obj/structure/closet/crate/secure
	containername = "longsword"
	access = access_armory
