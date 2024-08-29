/obj/item/modular_computer/console/preset/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/super(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card/wired(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon

// Engineering
/obj/item/modular_computer/console/preset/engineering/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/power_monitor())
	hard_drive.store_file(new/datum/computer_file/program/supermatter_monitor())
	hard_drive.store_file(new/datum/computer_file/program/alarm_monitor())
	hard_drive.store_file(new/datum/computer_file/program/atmos_control())
	hard_drive.store_file(new/datum/computer_file/program/rcon_console())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor())
	hard_drive.store_file(new/datum/computer_file/program/shutoff_monitor())

// Medical
/obj/item/modular_computer/console/preset/medical/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/suit_sensors())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())
	set_autorun("sensormonitor")

// Research
/obj/item/modular_computer/console/preset/research/install_default_hardware()
	..()
	//ai_slot = new/obj/item/computer_hardware/ai_slot(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/modular_computer/console/preset/research/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/ntnetmonitor())
	hard_drive.store_file(new/datum/computer_file/program/nttransfer())
	hard_drive.store_file(new/datum/computer_file/program/chatclient())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor())
	//hard_drive.store_file(new/datum/computer_file/program/aidiag())
	hard_drive.store_file(new/datum/computer_file/program/email_client())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())

// Administrator
/obj/item/modular_computer/console/preset/sysadmin/install_default_hardware()
	..()
	//ai_slot = new/obj/item/computer_hardware/ai_slot(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/modular_computer/console/preset/sysadmin/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/ntnetmonitor())
	hard_drive.store_file(new/datum/computer_file/program/nttransfer())
	hard_drive.store_file(new/datum/computer_file/program/chatclient())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor())
	//hard_drive.store_file(new/datum/computer_file/program/aidiag())
	hard_drive.store_file(new/datum/computer_file/program/email_client())
	hard_drive.store_file(new/datum/computer_file/program/email_administration())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())

// Command
/obj/item/modular_computer/console/preset/command/install_default_hardware()
	..()
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/modular_computer/console/preset/command/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/chatclient())
	hard_drive.store_file(new/datum/computer_file/program/card_mod())
	hard_drive.store_file(new/datum/computer_file/program/comm())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor())
	hard_drive.store_file(new/datum/computer_file/program/email_client())

// Security
/obj/item/modular_computer/console/preset/security/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor())
	hard_drive.store_file(new/datum/computer_file/program/digitalwarrant())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())

// Civilian
/obj/item/modular_computer/console/preset/civilian/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/chatclient())
	hard_drive.store_file(new/datum/computer_file/program/nttransfer())
	hard_drive.store_file(new/datum/computer_file/program/newsbrowser())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor())
	hard_drive.store_file(new/datum/computer_file/program/email_client())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())

// ERT
/obj/item/modular_computer/console/preset/ert/install_default_hardware()
	..()
	//ai_slot = new/obj/item/computer_hardware/ai_slot(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/modular_computer/console/preset/ert/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/nttransfer())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor/ert())
	hard_drive.store_file(new/datum/computer_file/program/alarm_monitor())
	hard_drive.store_file(new/datum/computer_file/program/comm())
	//hard_drive.store_file(new/datum/computer_file/program/aidiag())

// Mercenary
/obj/item/modular_computer/console/preset/mercenary/
	computer_emagged = TRUE

/obj/item/modular_computer/console/preset/mercenary/install_default_hardware()
	..()
	//ai_slot = new/obj/item/computer_hardware/ai_slot(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/modular_computer/console/preset/mercenary/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor/hacked())
	hard_drive.store_file(new/datum/computer_file/program/alarm_monitor())
	//hard_drive.store_file(new/datum/computer_file/program/aidiag())

// Merchant
/obj/item/modular_computer/console/preset/merchant/install_default_programs()
	..()
	//hard_drive.store_file(new/datum/computer_file/program/merchant())
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())
