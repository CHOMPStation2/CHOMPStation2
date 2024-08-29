/obj/item/pda // CHOMPEdit - Removal of obj/item/device
	var/delete_id = FALSE			//Guaranteed deletion of ID upon deletion of PDA

/obj/item/pda/multicaster/exploration/New() // CHOMPEdit - Removal of obj/item/device
	..()
	owner = "Exploration Department" //CHOMP keep explo
	name = "Exploration Department (Relay)" //CHOMP keep explo
	cartridges_to_send_to = exploration_cartridges

/obj/item/pda/centcom // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/captain // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-h"
	detonate = 0
//	hidden = 1

/obj/item/pda/pathfinder // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/explorer // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-transp"			//Might as well let this sprite actually get seen, otherwise it's going to be hidden forever.

/obj/item/pda/explorer // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/explorer // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-explore"			//Explorer's can get the PF's old style instead, rather than re-using the detective PDA

/obj/item/pda/sar // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/sar // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-sar"			//Gives FM's a distinct PDA of their own, rather than sharing with the bridge-secretary & CCO's.

/obj/item/pda/pilot // CHOMPEdit - Removal of obj/item/device
	icon_state = "pda-pilot"		//New sprites, but still no ROM cartridge or anything
