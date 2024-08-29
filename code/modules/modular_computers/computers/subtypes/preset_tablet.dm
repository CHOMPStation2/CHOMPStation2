/obj/item/modular_computer/tablet/preset/custom_loadout/cheap/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit/small(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/micro(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module/nano(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()

/obj/item/modular_computer/tablet/preset/custom_loadout/advanced/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit/small(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/small(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card/advanced(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()

/obj/item/modular_computer/tablet/preset/custom_loadout/standard/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit/small(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/small(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module/micro(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()
