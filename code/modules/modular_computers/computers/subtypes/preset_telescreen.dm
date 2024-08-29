/obj/item/modular_computer/telescreen/preset/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/modular_computer/telescreen/preset/generic/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/chatclient())
	hard_drive.store_file(new/datum/computer_file/program/alarm_monitor())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor())
	hard_drive.store_file(new/datum/computer_file/program/email_client())
	set_autorun("cammon")
