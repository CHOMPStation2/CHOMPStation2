/obj/item/modular_computer/tablet/preset/custom_loadout/rugged
	name = "rugged tablet computer"
	desc = "A rugged tablet computer."
	icon = 'icons/obj/modular_tablet.dmi'
	icon_state = "rugged"
	icon_state_unpowered = "rugged"
	max_damage = 300
	broken_damage = 200

/obj/item/modular_computer/tablet/preset/custom_loadout/rugged/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit/small(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/small(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module/micro(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()

/obj/item/modular_computer/tablet/preset/custom_loadout/elite
	name = "elite tablet computer"
	desc = "A more expensive tablet computer."
	icon = 'icons/obj/modular_tablet.dmi'
	icon_state = "elite"
	icon_state_unpowered = "elite"

/obj/item/modular_computer/tablet/preset/custom_loadout/elite/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit/small(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/small(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card/advanced(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()

/obj/item/modular_computer/tablet/preset/custom_loadout/hybrid
	name = "hybrid tablet computer"
	desc = "A human/alien hybrid tech tablet computer."
	icon = 'icons/obj/modular_tablet.dmi'
	icon_state = "hybrid"
	icon_state_unpowered = "hybrid"

/obj/item/modular_computer/tablet/preset/custom_loadout/hybrid/install_default_hardware()
	..()
	processor_unit = new/obj/item/computer_hardware/processor_unit/photonic/small(src) // CHOMPEdit - Removal of obj/item/weapon
	tesla_link = new/obj/item/computer_hardware/tesla_link(src) // CHOMPEdit - Removal of obj/item/weapon
	hard_drive = new/obj/item/computer_hardware/hard_drive/small(src) // CHOMPEdit - Removal of obj/item/weapon
	network_card = new/obj/item/computer_hardware/network_card/advanced(src) // CHOMPEdit - Removal of obj/item/weapon
	nano_printer = new/obj/item/computer_hardware/nano_printer(src) // CHOMPEdit - Removal of obj/item/weapon
	card_slot = new/obj/item/computer_hardware/card_slot(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module = new/obj/item/computer_hardware/battery_module/lambda(src) // CHOMPEdit - Removal of obj/item/weapon
	battery_module.charge_to_full()
