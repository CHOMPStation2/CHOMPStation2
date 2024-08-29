var/list/command_cartridges = list(
	/obj/item/cartridge/captain, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/hop, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/hos, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/ce, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/rd, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/cmo, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/head, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/lawyer // Internal Affaris, // CHOMPEdit - Removal of obj/item/weapon
	)

var/list/security_cartridges = list(
	/obj/item/cartridge/security, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/detective, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/hos // CHOMPEdit - Removal of obj/item/weapon
	)

var/list/engineering_cartridges = list(
	/obj/item/cartridge/engineering, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/atmos, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/ce // CHOMPEdit - Removal of obj/item/weapon
	)

var/list/medical_cartridges = list(
	/obj/item/cartridge/medical, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/chemistry, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/cmo // CHOMPEdit - Removal of obj/item/weapon
	)

var/list/research_cartridges = list(
	/obj/item/cartridge/signal/science, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/rd // CHOMPEdit - Removal of obj/item/weapon
	)

var/list/cargo_cartridges = list(
	/obj/item/cartridge/quartermaster, // This also covers cargo-techs, apparently, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/miner, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/hop // CHOMPEdit - Removal of obj/item/weapon
	)

var/list/civilian_cartridges = list(
	/obj/item/cartridge/janitor, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/service, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/cartridge/hop // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/cartridge // CHOMPEdit - Removal of obj/item/weapon
	name = "generic cartridge"
	desc = "A data cartridge for portable microcomputers."
	icon = 'icons/obj/pda.dmi'
	icon_state = "cart"
	item_state = "electronic"
	w_class = ITEMSIZE_TINY
	drop_sound = 'sound/items/drop/component.ogg'
	pickup_sound = 'sound/items/pickup/component.ogg'

	var/obj/item/radio/integrated/radio = null

	var/charges = 0

	var/list/stored_data = list()
	var/list/programs = list()
	var/list/messenger_plugins = list()

/obj/item/cartridge/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	QDEL_NULL(radio)
	QDEL_LIST(programs)
	QDEL_LIST(messenger_plugins)
	return ..()

/obj/item/cartridge/proc/update_programs(obj/item/pda/pda) // CHOMPEdit - Removal of obj/item/weapon // CHOMPEdit - Removal of obj/item/device
	for(var/datum/data/pda/P as anything in programs)
		P.pda = pda
	for(var/datum/data/pda/messenger_plugin/P as anything in messenger_plugins)
		P.pda = pda

/obj/item/cartridge/engineering // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Power-ON cartridge"
	icon_state = "cart-e"
	programs = list(
		new/datum/data/pda/app/power,
		new/datum/data/pda/utility/scanmode/halogen)

/obj/item/cartridge/atmos // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper BreatheDeep cartridge"
	icon_state = "cart-a"
	programs = list(new/datum/data/pda/utility/scanmode/gas)

/obj/item/cartridge/medical // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Med-U cartridge"
	icon_state = "cart-m"
	programs = list(
		new/datum/data/pda/app/crew_records/medical,
		new/datum/data/pda/utility/scanmode/medical)

/obj/item/cartridge/chemistry // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper ChemWhiz cartridge"
	icon_state = "cart-chem"
	programs = list(
		new/datum/data/pda/app/crew_records/medical,
		new/datum/data/pda/utility/scanmode/medical,
		new/datum/data/pda/utility/scanmode/reagent)

/obj/item/cartridge/security // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper R.O.B.U.S.T. cartridge"
	icon_state = "cart-s"
	programs = list(
		new/datum/data/pda/app/crew_records/security)

/obj/item/cartridge/detective // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper D.E.T.E.C.T. cartridge"
	icon_state = "cart-s"
	programs = list(
		new/datum/data/pda/app/crew_records/medical,
		new/datum/data/pda/utility/scanmode/medical,

		new/datum/data/pda/app/crew_records/security)


/obj/item/cartridge/janitor // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper CustodiPRO cartridge"
	desc = "The ultimate in clean-room design."
	icon_state = "cart-j"
	programs = list(new/datum/data/pda/app/janitor)

/obj/item/cartridge/lawyer // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper P.R.O.V.E. cartridge"
	icon_state = "cart-s"
	programs = list(new/datum/data/pda/app/crew_records/security)

/obj/item/cartridge/clown // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Honkworks 5.0 cartridge"
	icon_state = "cart-clown"
	charges = 5
	programs = list(new/datum/data/pda/utility/honk)
	messenger_plugins = list(new/datum/data/pda/messenger_plugin/virus/clown)

/obj/item/cartridge/mime // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Gestur-O 1000 cartridge"
	icon_state = "cart-mi"
	charges = 5
	messenger_plugins = list(new/datum/data/pda/messenger_plugin/virus/mime)

/obj/item/cartridge/service // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Serv-U Pro cartridge"
	desc = "A data cartridge designed to serve YOU!"

/obj/item/cartridge/signal // CHOMPEdit - Removal of obj/item/weapon
	name = "generic signaler cartridge"
	desc = "A data cartridge with an integrated radio signaler module."
	programs = list(new/datum/data/pda/app/signaller)

/obj/item/cartridge/signal/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	radio = new /obj/item/radio/integrated/signal(src)
	. = ..()

/obj/item/cartridge/signal/science // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Signal Ace 2 cartridge"
	desc = "Complete with integrated radio signaler!"
	icon_state = "cart-tox"
	programs = list(
		new/datum/data/pda/utility/scanmode/gas,

		new/datum/data/pda/utility/scanmode/reagent,

		new/datum/data/pda/app/signaller)

/obj/item/cartridge/quartermaster // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Space Parts & Space Vendors cartridge"
	desc = "Perfect for the Quartermaster on the go!"
	icon_state = "cart-q"
	programs = list(
		new/datum/data/pda/app/supply)

/obj/item/cartridge/miner // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Drill-Jockey 4.5 cartridge"
	desc = "It's covered in some sort of sand."
	icon_state = "cart-q"

/obj/item/cartridge/head // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Easy-Record DELUXE cartridge"
	icon_state = "cart-h"
	programs = list(new/datum/data/pda/app/status_display)

/obj/item/cartridge/hop // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper HumanResources9001 cartridge"
	icon_state = "cart-h"
	programs = list(
		new/datum/data/pda/app/crew_records/security,

		new/datum/data/pda/app/janitor,

		new/datum/data/pda/app/supply,

		new/datum/data/pda/app/status_display)

/obj/item/cartridge/hos // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper R.O.B.U.S.T. DELUXE cartridge"
	icon_state = "cart-hos"
	programs = list(
		new/datum/data/pda/app/crew_records/security,

		new/datum/data/pda/app/status_display)

/obj/item/cartridge/ce // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Power-On DELUXE cartridge"
	icon_state = "cart-ce"
	programs = list(
		new/datum/data/pda/app/power,
		new/datum/data/pda/utility/scanmode/halogen,

		new/datum/data/pda/utility/scanmode/gas,

		new/datum/data/pda/app/status_display)

/obj/item/cartridge/cmo // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Med-U DELUXE cartridge"
	icon_state = "cart-cmo"
	programs = list(
		new/datum/data/pda/app/crew_records/medical,
		new/datum/data/pda/utility/scanmode/medical,

		new/datum/data/pda/utility/scanmode/reagent,

		new/datum/data/pda/app/status_display)

/obj/item/cartridge/rd // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Signal Ace DELUXE cartridge"
	icon_state = "cart-rd"
	programs = list(
		new/datum/data/pda/utility/scanmode/gas,

		new/datum/data/pda/utility/scanmode/reagent,

		new/datum/data/pda/app/signaller,

		new/datum/data/pda/app/status_display)

/obj/item/cartridge/rd/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	radio = new /obj/item/radio/integrated/signal(src)
	. = ..()

/obj/item/cartridge/captain // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Value-PAK cartridge"
	desc = "Now with 200% more value!"
	icon_state = "cart-c"
	programs = list(
		new/datum/data/pda/app/power,
		new/datum/data/pda/utility/scanmode/halogen,

		new/datum/data/pda/utility/scanmode/gas,

		new/datum/data/pda/app/crew_records/medical,
		new/datum/data/pda/utility/scanmode/medical,

		new/datum/data/pda/utility/scanmode/reagent,

		new/datum/data/pda/app/crew_records/security,

		new/datum/data/pda/app/janitor,

		new/datum/data/pda/app/supply,

		new/datum/data/pda/app/status_display)

/obj/item/cartridge/syndicate // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper Detomatix cartridge"
	icon_state = "cart"
	var/initial_remote_door_id = "smindicate" //Make sure this matches the syndicate shuttle's shield/door id!!	//don't ask about the name, testing.
	charges = 4
	programs = list(new/datum/data/pda/utility/toggle_door)
	messenger_plugins = list(new/datum/data/pda/messenger_plugin/virus/detonate)

/obj/item/cartridge/syndicate/New() // CHOMPEdit - Removal of obj/item/weapon
	var/datum/data/pda/utility/toggle_door/D = programs[1]
	if(istype(D))
		D.remote_door_id = initial_remote_door_id

/obj/item/cartridge/proc/post_status(var/command, var/data1, var/data2) // CHOMPEdit - Removal of obj/item/weapon

	var/datum/radio_frequency/frequency = radio_controller.return_frequency(1435)
	if(!frequency) return

	var/datum/signal/status_signal = new
	status_signal.source = src
	status_signal.transmission_method = TRANSMISSION_RADIO
	status_signal.data["command"] = command

	switch(command)
		if("message")
			status_signal.data["msg1"] = data1
			status_signal.data["msg2"] = data2
			if(loc)
				var/obj/item/PDA = loc
				var/mob/user = PDA.fingerprintslast
				log_admin("STATUS: [user] set status screen with [PDA]. Message: [data1] [data2]")
				message_admins("STATUS: [user] set status screen with [PDA]. Message: [data1] [data2]")

		if("alert")
			status_signal.data["picture_state"] = data1

	frequency.post_signal(src, status_signal)

/obj/item/cartridge/frame // CHOMPEdit - Removal of obj/item/weapon
	name = "F.R.A.M.E. cartridge"
	icon_state = "cart"
	charges = 5
	messenger_plugins = list(new/datum/data/pda/messenger_plugin/virus/frame)
