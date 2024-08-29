/obj/item/modular_computer/laptop/preset/custom_loadout/cheap/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit/small(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card/(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module/advanced(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()

/obj/item/modular_computer/laptop/preset/custom_loadout/advanced/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/advanced(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card/advanced(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module/advanced(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()

/obj/item/modular_computer/laptop/preset/custom_loadout/standard/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card/(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module/advanced(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()

/obj/item/modular_computer/laptop/preset/custom_loadout/elite
	icon_state_unpowered = "adv-laptop-open"
	icon_state = "adv-laptop-open"
	icon_state_closed = "adv-laptop-closed"

/obj/item/modular_computer/laptop/preset/custom_loadout/elite/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/super(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card/advanced(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module/super(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()
