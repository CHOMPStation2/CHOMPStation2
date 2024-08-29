
/obj/item/pda/medical // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/medical // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-m"

/obj/item/pda/viro // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/medical // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-v"

/obj/item/pda/engineering // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/engineering // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-e"

/obj/item/pda/security // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/security // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-s"

/obj/item/pda/detective // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/detective // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-det"

/obj/item/pda/warden // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/security // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-warden"

/obj/item/pda/janitor // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/janitor // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-j"
	ttone = "slip"

/obj/item/pda/science // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/signal/science // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-tox"
	ttone = "boom"

/obj/item/pda/clown // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/clown // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-clown"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. The surface is coated with polytetrafluoroethylene and banana drippings."
	ttone = "honk"

/obj/item/pda/mime // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/mime // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-mime"

/obj/item/pda/mime/New() // CHOMPEdit - Removal of obj/item/device
	. = ..()
	var/datum/data/pda/app/M = find_program(/datum/data/pda/app/messenger)
	if(M)
		M.notify_silent = TRUE

/obj/item/pda/heads // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/head // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-h"

/obj/item/pda/heads/hop // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/hop // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-hop"

/obj/item/pda/heads/hos // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/hos // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-hos"

/obj/item/pda/heads/ce // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/ce // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-ce"

/obj/item/pda/heads/cmo // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/cmo // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-cmo"

/obj/item/pda/heads/rd // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/rd // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-rd"

/obj/item/pda/captain // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/captain // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-c"
	detonate = 0
	//toff = 1

/obj/item/pda/ert // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/captain // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-h"
	detonate = 0
//	hidden = 1

/obj/item/pda/cargo // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/quartermaster // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-cargo"

/obj/item/pda/quartermaster // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/quartermaster // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-q"

/obj/item/pda/shaftminer // CHOMPEdit - Removal of obj/item/device
	icon_state = "pda-miner"
	default_cartridge = /obj/item/cartridge/miner // CHOMPEdit - Removal of obj/item/weapon

/obj/item/pda/syndicate // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/syndicate // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-syn"
//	name = "Military PDA" // Vorestation Edit
//	owner = "John Doe"
	hidden = 1

/obj/item/pda/chaplain // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/service // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-holy"
	ttone = "holy"

/obj/item/pda/lawyer // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/lawyer // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-lawyer"
	ttone = "..."

/obj/item/pda/botanist // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/service // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-hydro"

/obj/item/pda/roboticist // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/signal/science // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-robot"

/obj/item/pda/librarian // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/service // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-libb"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. This is model is a WGW-11 series e-reader."
	model_name = "Thinktronic 5290 WGW-11 Series E-reader and Personal Data Assistant"

/obj/item/pda/librarian/New() // CHOMPEdit - Removal of obj/item/device
	. = ..()
	var/datum/data/pda/app/M = find_program(/datum/data/pda/app/messenger)
	if(M)
		M.notify_silent = TRUE //Quiet in the library!

/obj/item/pda/clear // CHOMPEdit - Removal of obj/item/device
	icon_state = "pda-transp"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. This is model is a special edition with a transparent case."
	model_name = "Thinktronic 5230 Personal Data Assistant Deluxe Special Max Turbo Limited Edition"

/obj/item/pda/chef // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/service // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-chef"

/obj/item/pda/bar // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/service // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-bar"

/obj/item/pda/atmos // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/atmos // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-atmo"

/obj/item/pda/chemist // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/chemistry // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-chem"

/obj/item/pda/geneticist // CHOMPEdit - Removal of obj/item/device
	default_cartridge = /obj/item/cartridge/medical // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "pda-gene"


// Used for the PDA multicaster, which mirrors messages sent to it to a specific department,
/obj/item/pda/multicaster // CHOMPEdit - Removal of obj/item/device
	ownjob = "Relay"
	icon_state = "NONE"
	detonate = 0
	spam_proof = TRUE // Spam messages don't actually work and its difficult to disable these.
	programs = list(
		new/datum/data/pda/app/messenger/multicast
	)
	var/list/cartridges_to_send_to = list()

/obj/item/pda/multicaster/command/New() // CHOMPEdit - Removal of obj/item/device
	..()
	owner = "Command Department"
	name = "Command Department (Relay)"
	cartridges_to_send_to = command_cartridges

/obj/item/pda/multicaster/security/New() // CHOMPEdit - Removal of obj/item/device
	..()
	owner = "Security Department"
	name = "Security Department (Relay)"
	cartridges_to_send_to = security_cartridges

/obj/item/pda/multicaster/engineering/New() // CHOMPEdit - Removal of obj/item/device
	..()
	owner = "Engineering Department"
	name = "Engineering Department (Relay)"
	cartridges_to_send_to = engineering_cartridges

/obj/item/pda/multicaster/medical/New() // CHOMPEdit - Removal of obj/item/device
	..()
	owner = "Medical Department"
	name = "Medical Department (Relay)"
	cartridges_to_send_to = medical_cartridges

/obj/item/pda/multicaster/research/New() // CHOMPEdit - Removal of obj/item/device
	..()
	owner = "Research Department"
	name = "Research Department (Relay)"
	cartridges_to_send_to = research_cartridges

/obj/item/pda/multicaster/cargo/New() // CHOMPEdit - Removal of obj/item/device
	..()
	owner = "Cargo Department"
	name = "Cargo Department (Relay)"
	cartridges_to_send_to = cargo_cartridges

/obj/item/pda/multicaster/civilian/New() // CHOMPEdit - Removal of obj/item/device
	..()
	owner = "Civilian Services Department"
	name = "Civilian Services Department (Relay)"
	cartridges_to_send_to = civilian_cartridges

/obj/item/pda/clown/Crossed(atom/movable/AM as mob|obj) //Clown PDA is slippery. // CHOMPEdit - Removal of obj/item/device
	if(AM.is_incorporeal())
		return
	if (istype(AM, /mob/living))
		var/mob/living/M = AM

		if(M.slip("the PDA",8) && M.real_name != src.owner && istype(src.cartridge, /obj/item/cartridge/clown)) // CHOMPEdit - Removal of obj/item/weapon
			if(src.cartridge.charges < 5)
				src.cartridge.charges++

//Some spare PDAs in a box
/obj/item/storage/box/PDAs // CHOMPEdit - Removal of obj/item/weapon
	name = "box of spare PDAs"
	desc = "A box of spare PDA microcomputers."
	icon = 'icons/obj/pda.dmi'
	icon_state = "pdabox"

/obj/item/storage/box/PDAs/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	new /obj/item/pda(src) // CHOMPEdit - Removal of obj/item/device
	new /obj/item/pda(src) // CHOMPEdit - Removal of obj/item/device
	new /obj/item/pda(src) // CHOMPEdit - Removal of obj/item/device
	new /obj/item/pda(src) // CHOMPEdit - Removal of obj/item/device
	new /obj/item/cartridge/head(src) // CHOMPEdit - Removal of obj/item/weapon

	var/newcart = pick(	/obj/item/cartridge/engineering, // CHOMPEdit - Removal of obj/item/weapon
						/obj/item/cartridge/security, // CHOMPEdit - Removal of obj/item/weapon
						/obj/item/cartridge/medical, // CHOMPEdit - Removal of obj/item/weapon
						/obj/item/cartridge/signal/science, // CHOMPEdit - Removal of obj/item/weapon
						/obj/item/cartridge/quartermaster) // CHOMPEdit - Removal of obj/item/weapon
	new newcart(src)
