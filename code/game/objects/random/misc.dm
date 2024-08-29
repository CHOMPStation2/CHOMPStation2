/*
// This is going to get so incredibly bloated.
// But this is where all of the "Loot" goes. Anything fun or useful that doesn't deserve its own file, pile in.
*/

/obj/random/tool
	name = "random tool"
	desc = "This is a random tool"
	icon_state = "tool"

/obj/random/tool/item_to_spawn()
	return pick(/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/weldingtool, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/weldingtool/largetank, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tool/crowbar, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
				/obj/item/multitool) // CHOMPEdit - Removal of obj/item/device

/obj/random/tool/powermaint
	name = "random powertool"
	desc = "This is a random rare powertool for maintenance"
	icon_state = "tool_2"

/obj/random/tool/powermaint/item_to_spawn()
	return pick(prob(320);/obj/random/tool,
				prob(1);/obj/item/tool/transforming/powerdrill, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/tool/transforming/jawsoflife, // CHOMPEdit - Removal of obj/item/weapon
				prob(15);/obj/item/weldingtool/electric, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/weldingtool/experimental) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/tool/power
	name = "random powertool"
	desc = "This is a random powertool"
	icon_state = "tool_2"

/obj/random/tool/power/item_to_spawn()
	return pick(/obj/item/tool/transforming/powerdrill, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tool/transforming/jawsoflife, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/weldingtool/electric, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/weldingtool/experimental) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/tool/alien
	name = "random alien tool"
	desc = "This is a random tool"
	icon_state = "tool_3"

/obj/random/tool/alien/item_to_spawn()
	return pick(/obj/item/tool/screwdriver/alien, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tool/wirecutters/alien, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/weldingtool/alien, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tool/crowbar/alien, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tool/wrench/alien, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/stack/cable_coil/alien,
				/obj/item/multitool/alien) // CHOMPEdit - Removal of obj/item/device

/obj/random/technology_scanner
	name = "random scanner"
	desc = "This is a random technology scanner."
	icon_state = "tech"

/obj/random/technology_scanner/item_to_spawn()
	return pick(prob(5);/obj/item/t_scanner, // CHOMPEdit - Removal of obj/item/device
				prob(2);/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
				prob(5);/obj/item/analyzer) // CHOMPEdit - Removal of obj/item/device

/obj/random/powercell
	name = "random powercell"
	desc = "This is a random powercell."
	icon = 'icons/obj/power_cells.dmi'
	icon_state = "random"

/obj/random/powercell/item_to_spawn()
	return pick(prob(40);/obj/item/cell, // CHOMPEdit - Removal of obj/item/weapon
				prob(25);/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
				prob(25);/obj/item/cell/high, // CHOMPEdit - Removal of obj/item/weapon
				prob(9);/obj/item/cell/super, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/cell/hyper) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/powercell/device
	name = "random device powercell"
	desc = "This is a random device powercell."
	icon_state = "random_device"

/obj/random/powercell/device/item_to_spawn()
	return pick(prob(80);/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/cell/device/hyper, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/cell/device/empproof) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/bomb_supply
	name = "bomb supply"
	desc = "This is a random bomb supply."
	icon_state = "tech"

/obj/random/bomb_supply/item_to_spawn()
	return pick(/obj/item/assembly/igniter, // CHOMPEdit - Removal of obj/item/device
				/obj/item/assembly/prox_sensor, // CHOMPEdit - Removal of obj/item/device
				/obj/item/assembly/signaler, // CHOMPEdit - Removal of obj/item/device
				/obj/item/assembly/timer, // CHOMPEdit - Removal of obj/item/device
				/obj/item/multitool) // CHOMPEdit - Removal of obj/item/device


/obj/random/toolbox
	name = "random toolbox"
	desc = "This is a random toolbox."
	icon_state = "toolbox"

/obj/random/toolbox/item_to_spawn()
	return pick(prob(6);/obj/item/storage/toolbox/mechanical, // CHOMPEdit - Removal of obj/item/weapon
				prob(6);/obj/item/storage/toolbox/electrical, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/toolbox/emergency, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/toolbox/syndicate) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/smes_coil
	name = "random smes coil"
	desc = "This is a random smes coil."
	icon_state = "cell_2"

/obj/random/smes_coil/item_to_spawn()
	return pick(prob(4);/obj/item/smes_coil, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/smes_coil/super_capacity, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/smes_coil/super_io) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/pacman
	name = "random portable generator"
	desc = "This is a random portable generator."
	icon_state = "cell_3"

/obj/random/pacman/item_to_spawn()
	return pick(prob(6);/obj/machinery/power/port_gen/pacman,
				prob(3);/obj/machinery/power/port_gen/pacman/super,
				prob(1);/obj/machinery/power/port_gen/pacman/mrs)

/obj/random/tech_supply
	name = "random tech supply"
	desc = "This is a random piece of technology supplies."
	icon = 'icons/obj/power_cells.dmi'
	icon_state = "random"
	spawn_nothing_percentage = 25

/obj/random/tech_supply/item_to_spawn()
	return pick(prob(3);/obj/random/powercell,
				prob(2);/obj/random/technology_scanner,
				prob(1);/obj/item/packageWrap, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/random/bomb_supply,
				prob(1);/obj/item/extinguisher, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/clothing/gloves/fyellow,
				prob(3);/obj/item/stack/cable_coil/random,
				prob(2);/obj/random/toolbox,
				prob(2);/obj/item/storage/belt/utility, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/belt/utility/full, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/random/tool,
				prob(2);/obj/item/tape_roll, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/taperoll/engineering,
				prob(1);/obj/item/taperoll/atmos,
				prob(1);/obj/item/flashlight/maglight) // CHOMPEdit - Removal of obj/item/device

/obj/random/tech_supply/nofail
	name = "guaranteed random tech supply"
	spawn_nothing_percentage = 0

/obj/random/tech_supply/component
	name = "random tech component"
	desc = "This is a random machine component."
	icon_state = "tech"

/obj/random/tech_supply/component/item_to_spawn()
	return pick(prob(3);/obj/item/stock_parts/gear, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/stock_parts/console_screen, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/stock_parts/spring, // CHOMPEdit - Removal of obj/item/weapon
		prob(3);/obj/item/stock_parts/capacitor, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/stock_parts/capacitor/adv, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/stock_parts/capacitor/super, // CHOMPEdit - Removal of obj/item/weapon
		prob(3);/obj/item/stock_parts/manipulator, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/stock_parts/manipulator/nano, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/stock_parts/manipulator/pico, // CHOMPEdit - Removal of obj/item/weapon
		prob(3);/obj/item/stock_parts/matter_bin, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/stock_parts/matter_bin/adv, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/stock_parts/matter_bin/super, // CHOMPEdit - Removal of obj/item/weapon
		prob(3);/obj/item/stock_parts/scanning_module, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/stock_parts/scanning_module/adv, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/stock_parts/scanning_module/phasic) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/tech_supply/component/nofail
	name = "guaranteed random tech component"
	spawn_nothing_percentage = 0

/obj/random/medical
	name = "Random Medicine"
	desc = "This is a random medical item."
	icon_state = "medical"

/obj/random/medical/item_to_spawn()
	return pick(prob(21);/obj/random/medical/lite,
				prob(5);/obj/random/medical/pillbottle,
				prob(1);/obj/item/storage/pill_bottle/tramadol, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/pill_bottle/antitox, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/pill_bottle/carbon, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/bodybag/cryobag,
				prob(5);/obj/item/reagent_containers/syringe/antitoxin, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/reagent_containers/syringe/antiviral, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/reagent_containers/syringe/inaprovaline, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/reagent_containers/hypospray, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/box/freezer, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/stack/nanopaste)

/obj/random/medical/pillbottle
	name = "Random Pill Bottle"
	desc = "This is a random pill bottle."
	icon_state = "pillbottle"

/obj/random/medical/pillbottle/item_to_spawn()
	return pick(prob(1);/obj/item/storage/pill_bottle/spaceacillin, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/pill_bottle/dermaline, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/pill_bottle/dexalin_plus, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/pill_bottle/bicaridine, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/pill_bottle/blood_regen) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/medical/lite
	name = "Random Medicine"
	desc = "This is a random simple medical item."
	icon_state = "medical"
	spawn_nothing_percentage = 25

/obj/random/medical/lite/item_to_spawn()
	return pick(prob(4);/obj/item/stack/medical/bruise_pack,
				prob(4);/obj/item/stack/medical/ointment,
				prob(2);/obj/item/stack/medical/advanced/bruise_pack,
				prob(2);/obj/item/stack/medical/advanced/ointment,
				prob(1);/obj/item/stack/medical/splint,
				prob(4);/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
				prob(1);/obj/item/bodybag,
				prob(3);/obj/item/reagent_containers/hypospray/autoinjector, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/pill_bottle/kelotane, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/pill_bottle/antitox) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/firstaid
	name = "Random First Aid Kit"
	desc = "This is a random first aid kit."
	icon_state = "medicalkit"

/obj/random/firstaid/item_to_spawn()
	return pick(prob(10);/obj/item/storage/firstaid/regular, // CHOMPEdit - Removal of obj/item/weapon
				prob(8);/obj/item/storage/firstaid/toxin, // CHOMPEdit - Removal of obj/item/weapon
				prob(8);/obj/item/storage/firstaid/o2, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/storage/firstaid/adv, //VOREStation Edit: 6 to 4 // CHOMPEdit - Removal of obj/item/weapon
				prob(8);/obj/item/storage/firstaid/fire, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/denecrotizer/medical, //VOREStation Add, // CHOMPEdit - Removal of obj/item/device
				prob(1);/obj/item/storage/firstaid/combat, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/firstaid/experimental) //CHOMPadd // CHOMPEdit - Removal of obj/item/weapon

/obj/random/contraband
	name = "Random Illegal Item"
	desc = "Hot Stuff."
	icon_state = "sus"
	spawn_nothing_percentage = 50

/obj/random/contraband/item_to_spawn()
	return pick(prob(6);/obj/item/storage/pill_bottle/paracetamol, //VOREStation Edit, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/storage/pill_bottle/happy, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/storage/pill_bottle/zoom, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/material/butterfly, // CHOMPEdit - Removal of obj/item/weapon
				prob(6);/obj/item/material/butterflyblade, // CHOMPEdit - Removal of obj/item/weapon
				prob(6);/obj/item/material/butterflyhandle, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/material/butterfly/switchblade, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/clothing/gloves/knuckledusters,
				prob(1);/obj/item/material/knife/tacknife, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/clothing/suit/storage/vest/heavy/merc,
				prob(1);/obj/item/beartrap, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/handcuffs, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/handcuffs/legcuffs, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/reagent_containers/syringe/drugs, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/reagent_containers/syringe/steroid) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/contraband/nofail
	name = "Guaranteed Random Illegal Item"
	spawn_nothing_percentage = 0

/obj/random/cash
	name = "random currency"
	desc = "LOADSAMONEY!"
	icon = 'icons/obj/items.dmi'
	icon_state = "spacecash1"

/obj/random/cash/item_to_spawn()
	return pick(prob(320);/obj/random/maintenance/clean,
				prob(12);/obj/item/spacecash/c1, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/spacecash/c5, // CHOMPEdit - Removal of obj/item/weapon
				prob(8);/obj/item/spacecash/c10, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/spacecash/c20, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/spacecash/c50, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/spacecash/c100) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/cash/big
	name = "random currency pile"
	desc = "DOSH!"
	icon = 'icons/obj/items.dmi'
	icon_state = "spacecash100"

/obj/random/cash/big/item_to_spawn()
	return pick(prob(64);/obj/item/spacecash/c10, // CHOMPEdit - Removal of obj/item/weapon
				prob(32);/obj/item/spacecash/c20, // CHOMPEdit - Removal of obj/item/weapon
				prob(16);/obj/item/spacecash/c50, // CHOMPEdit - Removal of obj/item/weapon
				prob(8);/obj/item/spacecash/c100, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/spacecash/c200, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/spacecash/c500, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/spacecash/c1000) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/cash/huge
	name = "random huge currency pile"
	desc = "LOOK AT MY WAD!"
	icon = 'icons/obj/items.dmi'
	icon_state = "spacecash1000"

/obj/random/cash/huge/item_to_spawn()
	return pick(prob(15);/obj/item/spacecash/c200, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/spacecash/c500, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/spacecash/c1000) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/soap
	name = "Random Soap (All)"
	desc = "This is a random bar of soap. Includes special types."
	icon = 'icons/obj/soap.dmi'
	icon_state = "rainbow_soap"

/obj/random/soap/item_to_spawn()
	return pick(/obj/item/soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/nanotrasen, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/deluxe, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/syndie, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/space_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/space_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/water_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/fire_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/rainbow_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/diamond_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/uranium_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/silver_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/brown_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/white_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/grey_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/pink_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/purple_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/blue_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/cyan_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/green_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/yellow_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/orange_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/red_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/golden_soap) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/soap_common
	name = "Random Soap (Common)"
	desc = "This is a random bar of soap. Only has the basic types; no NT, deluxe, or syndisoap."
	icon = 'icons/obj/soap.dmi'
	icon_state = "rainbow_soap"

/obj/random/soap_common/item_to_spawn()
	return pick(/obj/item/soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/space_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/space_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/water_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/fire_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/rainbow_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/diamond_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/uranium_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/silver_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/brown_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/white_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/grey_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/pink_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/purple_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/blue_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/cyan_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/green_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/yellow_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/orange_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/red_soap, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/soap/golden_soap) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/drinkbottle
	name = "random drink"
	desc = "This is a random drink."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "whiskeybottle1"

/obj/random/drinkbottle/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/drinks/bottle/whiskey, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/gin, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/specialwhiskey, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/vodka, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/tequilla, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/absinthe, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/wine, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/cognac, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/rum, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/patron, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/vermouth, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/goldschlager, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/kahlua, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/melonliquor, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/bluecuracao, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/grenadine, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/sake, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/champagne, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/peppermintschnapps, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/peachschnapps, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/lemonadeschnapps, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/jager, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/small/cider, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/small/litebeer, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/small/beer, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/small/beer/silverdragon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/bottle/small/beer/meteor) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/drinksoft
	name = "random soft drink"
	desc = "This is a random (once) carbonated beverage drinks can."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "cola"

/obj/random/drinksoft/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/drinks/cans/cola, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/waterbottle, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/thirteenloko, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/dr_gibb, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/dr_gibb_diet, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/starkist, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/space_up, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/lemon_lime, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/iced_tea, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/grape_juice, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/tonic, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/sodawater, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/gingerale, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/cans/root_beer) // CHOMPEdit - Removal of obj/item/weapon


/obj/random/snack
	name = "random snack"
	desc = "This is a random snackfood. Probably still safe to eat?"
	icon = 'icons/obj/food_snacks.dmi'
	icon_state = "tastybread"

/obj/random/snack/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/snacks/candy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/proteinbar, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/gummy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/donor, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy_corn, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/chips, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/chips/bbq, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cookiesnack, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/fruitbar, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/chocolatebar, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/chocolatepiece, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/chocolatepiece/white, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/chocolatepiece/truffle, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/chocolateegg, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/plain, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/plain/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/pink, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/pink/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/purple, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/purple/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/green, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/green/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/beige, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/beige/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/choc, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/choc/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/blue/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/yellow, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/yellow/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/olive, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/olive/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/homer, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/homer/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/choc_sprinkles, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/choc_sprinkles/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/tuna, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/pistachios, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/semki, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb01, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb02, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb03, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb04, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb05, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb06, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb07, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb08, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb09, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cb10, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donkpocket, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/muffin, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/soylentgreen, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/soylenviridians, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/popcorn, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/sosjerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/no_raisin, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/packaged/spacetwinkie, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cheesiehonkers, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/poppypretzel, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/baguette, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/carrotfries, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candiedapple, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/admints, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/tastybread, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/liquidfood, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/liquidprotein, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/liquidvitamin, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/skrellsnacks, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/unajerky, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/croissant, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/sugarcookie, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/drinks/dry_ramen) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/meat
	name = "random meat"
	desc = "This is a random slab of meat."
	icon = 'icons/obj/food.dmi'
	icon_state = "meat"

/obj/random/meat/item_to_spawn()
	return pick(prob(60);/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/reagent_containers/food/snacks/xenomeat/spidermeat, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/reagent_containers/food/snacks/bearmeat, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/reagent_containers/food/snacks/meat/syntiflesh, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/reagent_containers/food/snacks/meat/human, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/reagent_containers/food/snacks/meat/monkey, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/reagent_containers/food/snacks/meat/corgi, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/reagent_containers/food/snacks/xenomeat) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/pizzabox
	name = "random pizza box"
	desc = "This is a random pizza box."
	icon = 'icons/obj/food.dmi'
	icon_state = "pizzabox1"

/obj/random/pizzabox/item_to_spawn()
	return pick(/obj/item/pizzabox/margherita,
				/obj/item/pizzabox/mushroom,
				/obj/item/pizzabox/meat,
				/obj/item/pizzabox/vegetable,
				/obj/item/pizzabox/pineapple)

/obj/random/pizzabox/supplypack
	drop_get_turf = FALSE

/obj/random/material //Random materials for building stuff
	name = "random material"
	desc = "This is a random material."
	icon_state = "material"

/obj/random/material/item_to_spawn()
	return pick(/obj/item/stack/material/steel{amount = 10},
				/obj/item/stack/material/glass{amount = 10},
				/obj/item/stack/material/glass/reinforced{amount = 10},
				/obj/item/stack/material/plastic{amount = 10},
				/obj/item/stack/material/wood{amount = 10},
				/obj/item/stack/material/wood/sif{amount = 10},
				/obj/item/stack/material/cardboard{amount = 10},
				/obj/item/stack/rods{amount = 10},
				/obj/item/stack/material/sandstone{amount = 10},
				/obj/item/stack/material/marble{amount = 10},
				/obj/item/stack/material/plasteel{amount = 10})

/obj/random/material/refined //Random materials for building stuff
	name = "random refined material"
	desc = "This is a random refined metal."
	icon_state = "material_2"

/obj/random/material/refined/item_to_spawn()
	return pick(/obj/item/stack/material/steel{amount = 10},
				/obj/item/stack/material/glass{amount = 10},
				/obj/item/stack/material/glass/reinforced{amount = 5},
				/obj/item/stack/material/glass/phoronglass{amount = 5},
				/obj/item/stack/material/glass/phoronrglass{amount = 5},
				/obj/item/stack/material/plasteel{amount = 5},
				/obj/item/stack/material/durasteel{amount = 5},
				/obj/item/stack/material/gold{amount = 5},
				/obj/item/stack/material/iron{amount = 10},
				/obj/item/stack/material/copper{amount = 10},
				/obj/item/stack/material/aluminium{amount = 10},
				/obj/item/stack/material/lead{amount = 10},
				/obj/item/stack/material/diamond{amount = 3},
				/obj/item/stack/material/deuterium{amount = 5},
				/obj/item/stack/material/uranium{amount = 5},
				/obj/item/stack/material/phoron{amount = 5},
				/obj/item/stack/material/silver{amount = 5},
				/obj/item/stack/material/platinum{amount = 5},
				/obj/item/stack/material/mhydrogen{amount = 3},
				/obj/item/stack/material/osmium{amount = 3},
				/obj/item/stack/material/titanium{amount = 5},
				/obj/item/stack/material/tritium{amount = 3},
				/obj/item/stack/material/verdantium{amount = 2})

/obj/random/material/precious //Precious metals, go figure
	name = "random precious metal"
	desc = "This is a small stack of a random precious metal."
	icon_state = "material_3"

/obj/random/material/precious/item_to_spawn()
	return pick(/obj/item/stack/material/gold{amount = 5},
				/obj/item/stack/material/copper{amount = 5},
				/obj/item/stack/material/silver{amount = 5},
				/obj/item/stack/material/platinum{amount = 5},
				/obj/item/stack/material/osmium{amount = 5})

/obj/random/tank
	name = "random tank"
	desc = "This is a tank."
	icon = 'icons/obj/tank.dmi'
	icon_state = "canister"

/obj/random/tank/item_to_spawn()
	return pick(prob(5);/obj/item/tank/oxygen, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/tank/oxygen/yellow, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/tank/oxygen/red, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/tank/air, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/tank/emergency/oxygen, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/tank/emergency/oxygen/engi, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/tank/emergency/oxygen/double, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/suit_cooling_unit) // CHOMPEdit - Removal of obj/item/device

/obj/random/cigarettes
	name = "random cigarettes"
	desc = "This is a cigarette."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "cigpacket"

/obj/random/cigarettes/item_to_spawn()
	return pick(prob(5);/obj/item/storage/fancy/cigarettes, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/storage/fancy/cigarettes/dromedaryco, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/storage/fancy/cigarettes/killthroat, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/storage/fancy/cigarettes/luckystars, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/storage/fancy/cigarettes/jerichos, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/storage/fancy/cigarettes/menthols, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/storage/fancy/cigarettes/carcinomas, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/storage/fancy/cigarettes/professionals, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/fancy/cigar, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/clothing/mask/smokable/cigarette/cigar,
				prob(1);/obj/item/clothing/mask/smokable/cigarette/cigar/cohiba,
				prob(1);/obj/item/clothing/mask/smokable/cigarette/cigar/havana)

/obj/random/coin
	name = "random coin"
	desc = "This is a coin spawn."
	icon = 'icons/misc/mark.dmi'
	icon_state = "rup"

/obj/random/coin/item_to_spawn()
	return pick(prob(5);/obj/item/coin/silver, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/coin/iron, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/coin/gold, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/coin/phoron, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/coin/uranium, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/coin/platinum, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/coin/diamond) // CHOMPEdit - Removal of obj/item/weapon

//VOREStation Add Start
/obj/random/coin/sometimes
	spawn_nothing_percentage = 66

//VOREStation Add End

/obj/random/action_figure
	name = "random action figure"
	desc = "This is a random action figure."
	icon = 'icons/obj/toy.dmi'
	icon_state = "assistant"

/obj/random/action_figure/item_to_spawn()
	return pick(/obj/item/toy/figure/cmo,
				/obj/item/toy/figure/assistant,
				/obj/item/toy/figure/atmos,
				/obj/item/toy/figure/bartender,
				/obj/item/toy/figure/borg,
				/obj/item/toy/figure/gardener,
				/obj/item/toy/figure/captain,
				/obj/item/toy/figure/cargotech,
				/obj/item/toy/figure/ce,
				/obj/item/toy/figure/chaplain,
				/obj/item/toy/figure/chef,
				/obj/item/toy/figure/chemist,
				/obj/item/toy/figure/clown,
				/obj/item/toy/figure/corgi,
				/obj/item/toy/figure/detective,
				/obj/item/toy/figure/dsquad,
				/obj/item/toy/figure/engineer,
				/obj/item/toy/figure/geneticist,
				/obj/item/toy/figure/hop,
				/obj/item/toy/figure/hos,
				/obj/item/toy/figure/qm,
				/obj/item/toy/figure/janitor,
				/obj/item/toy/figure/agent,
				/obj/item/toy/figure/librarian,
				/obj/item/toy/figure/md,
				/obj/item/toy/figure/mime,
				/obj/item/toy/figure/miner,
				/obj/item/toy/figure/ninja,
				/obj/item/toy/figure/wizard,
				/obj/item/toy/figure/rd,
				/obj/item/toy/figure/roboticist,
				/obj/item/toy/figure/scientist,
				/obj/item/toy/figure/syndie,
				/obj/item/toy/figure/secofficer,
				/obj/item/toy/figure/warden,
				/obj/item/toy/figure/psychologist,
				/obj/item/toy/figure/paramedic,
				/obj/item/toy/figure/ert,
				//chompstation Add start
				/obj/item/toy/figure/station,
				/obj/item/toy/sif)
				//chompstation Add end


/obj/random/plushie
	name = "random plushie"
	desc = "This is a random plushie."
	icon = 'icons/obj/toy.dmi'
	icon_state = "nymphplushie"

/obj/random/plushie/item_to_spawn()
	return pick(/obj/item/toy/plushie/nymph,
				/obj/item/toy/plushie/mouse,
				/obj/item/toy/plushie/kitten,
				/obj/item/toy/plushie/lizard,
				/obj/item/toy/plushie/black_cat,
				/obj/item/toy/plushie/black_fox,
				/obj/item/toy/plushie/blue_fox,
				/obj/random/carp_plushie,
				/obj/item/toy/plushie/coffee_fox,
				/obj/item/toy/plushie/corgi,
				/obj/item/toy/plushie/crimson_fox,
				/obj/item/toy/plushie/deer,
				/obj/item/toy/plushie/girly_corgi,
				/obj/item/toy/plushie/grey_cat,
				/obj/item/toy/plushie/marble_fox,
				/obj/item/toy/plushie/octopus,
				/obj/item/toy/plushie/orange_cat,
				/obj/item/toy/plushie/orange_fox,
				/obj/item/toy/plushie/pink_fox,
				/obj/item/toy/plushie/purple_fox,
				/obj/item/toy/plushie/red_fox,
				/obj/item/toy/plushie/robo_corgi,
				/obj/item/toy/plushie/siamese_cat,
				/obj/item/toy/plushie/spider,
				/obj/item/toy/plushie/tabby_cat,
				/obj/item/toy/plushie/tuxedo_cat,
				/obj/item/toy/plushie/white_cat,
				//VOREStation Add Start
				/obj/item/toy/plushie/lizardplushie,
				/obj/item/toy/plushie/lizardplushie/kobold,
//				/obj/item/toy/plushie/lizardplushie/resh, //CHOMPedit
				/obj/item/toy/plushie/slimeplushie,
				/obj/item/toy/plushie/box,
				/obj/item/toy/plushie/borgplushie,
				/obj/item/toy/plushie/borgplushie/medihound,
				/obj/item/toy/plushie/borgplushie/scrubpuppy,
				/obj/item/toy/plushie/foxbear,
				/obj/item/toy/plushie/nukeplushie,
				/obj/item/toy/plushie/otter,
				/obj/item/toy/plushie/vox,
				/obj/item/toy/plushie/shark,
				pick(list(/obj/item/toy/plushie/borgplushie/drake/sec,
							/obj/item/toy/plushie/borgplushie/drake/med,
							/obj/item/toy/plushie/borgplushie/drake/sci,
							/obj/item/toy/plushie/borgplushie/drake/jani,
							/obj/item/toy/plushie/borgplushie/drake/eng,
							/obj/item/toy/plushie/borgplushie/drake/mine,
							/obj/item/toy/plushie/borgplushie/drake/trauma)),
				//VOREStation Add End
				//YawnWider Add Start
				/obj/item/toy/plushie/teshari/_yw,
				/obj/item/toy/plushie/teshari/w_yw,
				/obj/item/toy/plushie/teshari/b_yw,
				/obj/item/toy/plushie/teshari/y_yw,
				//YawnWider Add End
				//CHOMPStation Add Start
				/obj/item/toy/plushie/red_dragon,
				/obj/item/toy/plushie/green_dragon,
				/obj/item/toy/plushie/purple_dragon,
				/obj/item/toy/plushie/white_eastdragon,
				/obj/item/toy/plushie/red_eastdragon,
				/obj/item/toy/plushie/green_eastdragon,
				/obj/item/toy/plushie/gold_eastdragon,
				/obj/item/toy/plushie/teppi,
				/obj/item/toy/plushie/teppi/alt)
				//CHOMPStation Add End

/obj/random/plushielarge
	name = "random large plushie"
	desc = "This is a randomn large plushie."
	icon = 'icons/obj/toy.dmi'
	icon_state = "droneplushie"

/obj/random/plushielarge/item_to_spawn()
	return pick(/obj/structure/plushie/ian,
				/obj/structure/plushie/drone,
				/obj/structure/plushie/carp,
				/obj/structure/plushie/beepsky)

/obj/random/toy
	name = "random toy"
	desc = "This is a random toy."
	icon = 'icons/obj/toy.dmi'
	icon_state = "ship"

/obj/random/toy/item_to_spawn()
	return pick(/obj/item/toy/bosunwhistle,
				/obj/item/toy/plushie/therapy/red,
				/obj/item/toy/plushie/therapy/purple,
				/obj/item/toy/plushie/therapy/blue,
				/obj/item/toy/plushie/therapy/yellow,
				/obj/item/toy/plushie/therapy/orange,
				/obj/item/toy/plushie/therapy/green,
				/obj/item/toy/cultsword,
				/obj/item/toy/katana,
				/obj/item/toy/snappop,
				/obj/item/toy/sword,
				/obj/item/toy/balloon,
				/obj/item/gun/projectile/revolver/toy/crossbow, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/toy/blink,
				/obj/item/reagent_containers/spray/waterflower, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/toy/eight_ball,
				/obj/item/toy/eight_ball/conch,
				/obj/item/toy/mecha/ripley,
				/obj/item/toy/mecha/fireripley,
				/obj/item/toy/mecha/deathripley,
				/obj/item/toy/mecha/gygax,
				/obj/item/toy/mecha/durand,
				/obj/item/toy/mecha/honk,
				/obj/item/toy/mecha/marauder,
				/obj/item/toy/mecha/seraph,
				/obj/item/toy/mecha/mauler,
				/obj/item/toy/mecha/odysseus,
				/obj/item/toy/mecha/phazon,
				/obj/item/toy/monster_bait) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mouseremains
	name = "random mouseremains"
	desc = "For use with mouse spawners."
	icon = 'icons/obj/assemblies/new_assemblies.dmi'
	icon_state = "mousetrap"

/obj/random/mouseremains/item_to_spawn()
	return pick(/obj/item/assembly/mousetrap, // CHOMPEdit - Removal of obj/item/device
				/obj/item/assembly/mousetrap/armed, // CHOMPEdit - Removal of obj/item/device
				/obj/effect/decal/cleanable/bug_remains,
				/obj/effect/decal/cleanable/ash,
				/obj/item/trash/cigbutt,
				/obj/item/trash/cigbutt/cigarbutt,
				/obj/effect/decal/remains/mouse)

/obj/random/janusmodule
	name = "random janus circuit"
	desc = "A random (possibly broken) Janus module."
	icon_state = "tech_2"

/obj/random/janusmodule/item_to_spawn()
	return pick(subtypesof(/obj/item/circuitboard/mecha/imperion)) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/curseditem
	name = "random cursed item"
	desc = "For use in dungeons."
	icon = 'icons/obj/storage.dmi'
	icon_state = "red"

/obj/random/curseditem/item_to_spawn()
	var/possible_object_paths = list(/obj/item/paper/carbon/cursedform) // CHOMPEdit - Removal of obj/item/weapon
	possible_object_paths |= subtypesof(/obj/item/clothing/head/psy_crown)
	return pick(possible_object_paths)

//Random MRE stuff

/obj/random/mre
	name = "random MRE"
	desc = "This is a random single MRE."
	icon = 'icons/obj/food.dmi'
	icon_state = "mre"
	drop_get_turf = FALSE

/obj/random/mre/item_to_spawn()
	return pick(/obj/item/storage/mre, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mre/menu2, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mre/menu3, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mre/menu4, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mre/menu5, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mre/menu6, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mre/menu7, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mre/menu8, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mre/menu9, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mre/menu10) // CHOMPEdit - Removal of obj/item/weapon


/obj/random/mre/main
	name = "random MRE main course"
	desc = "This is a random main course for MREs."
	icon_state = "pouch"
	drop_get_turf = FALSE

/obj/random/mre/main/item_to_spawn()
	return pick(/obj/item/storage/mrebag, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mrebag/menu2, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mrebag/menu3, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mrebag/menu4, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mrebag/menu5, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mrebag/menu6, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mrebag/menu7, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/mrebag/menu8) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/side
	name = "random MRE side dish"
	desc = "This is a random side dish for MREs."
	icon_state = "pouch"
	drop_get_turf = FALSE

/obj/random/mre/side/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/snacks/tossedsalad, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/boiledrice, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/poppypretzel, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/twobread, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/jelliedtoast) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/dessert
	name = "random MRE dessert"
	desc = "This is a random dessert for MREs."
	icon_state = "pouch"
	drop_get_turf = FALSE

/obj/random/mre/dessert/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/snacks/candy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/candy/proteinbar, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/plain, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/plain/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/chocolatebar, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/cookie) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/dessert/vegan
	name = "random vegan MRE dessert"
	desc = "This is a random vegan dessert for MREs."

/obj/random/mre/dessert/vegan/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/snacks/candy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/chocolatebar, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/donut/plain/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/drink
	name = "random MRE drink"
	desc = "This is a random drink for MREs."
	icon_state = "packet"
	drop_get_turf = FALSE

/obj/random/mre/drink/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/condiment/small/packet/coffee, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/tea, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/cocoa, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/grape, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/orange, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/watermelon, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/apple) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/spread
	name = "random MRE spread"
	desc = "This is a random spread packet for MREs."
	icon_state = "packet"
	drop_get_turf = FALSE

/obj/random/mre/spread/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/condiment/small/packet/jelly, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/honey) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/spread/vegan
	name = "random vegan MRE spread"
	desc = "This is a random vegan spread packet for MREs"

/obj/random/mre/spread/vegan/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/condiment/small/packet/jelly) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/sauce
	name = "random MRE sauce"
	desc = "This is a random sauce packet for MREs."
	icon_state = "packet"
	drop_get_turf = FALSE

/obj/random/mre/sauce/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/condiment/small/packet/salt, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/pepper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/sugar, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/capsaicin, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/ketchup, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/mayo, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/soy) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/sauce/vegan/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/condiment/small/packet/salt, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/pepper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/sugar, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/soy) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/sauce/sugarfree/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/condiment/small/packet/salt, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/pepper, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/capsaicin, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/ketchup, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/mayo, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/soy) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/mre/sauce/crayon/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/condiment/small/packet/crayon/generic, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/crayon/red, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/crayon/orange, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/crayon/yellow, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/crayon/green, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/crayon/blue, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/crayon/purple, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/crayon/grey, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/reagent_containers/food/condiment/small/packet/crayon/brown) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/thermalponcho
	name = "random thermal poncho"
	desc = "This is a thermal poncho spawn."
	icon = 'icons/inventory/accessory/item.dmi'
	icon_state = "classicponcho"

/obj/random/thermalponcho/item_to_spawn()
	return pick(prob(5);/obj/item/clothing/accessory/poncho/thermal,
				prob(3);/obj/item/clothing/accessory/poncho/thermal/red,
				prob(3);/obj/item/clothing/accessory/poncho/thermal/green,
				prob(3);/obj/item/clothing/accessory/poncho/thermal/purple,
				prob(3);/obj/item/clothing/accessory/poncho/thermal/blue)

/obj/random/pouch
	name = "Random Storage Pouch"
	desc = "This is a random storage pouch."
	icon = 'icons/inventory/pockets/item.dmi'
	icon_state = "random"

/obj/random/pouch/item_to_spawn()
	return pick(
		prob(10);/obj/item/storage/pouch, // medium // CHOMPEdit - Removal of obj/item/weapon
		prob(3);/obj/item/storage/pouch/large, // CHOMPEdit - Removal of obj/item/weapon
		prob(8);/obj/item/storage/pouch/small, // CHOMPEdit - Removal of obj/item/weapon
		prob(5);/obj/item/storage/pouch/ammo, // CHOMPEdit - Removal of obj/item/weapon
		prob(5);/obj/item/storage/pouch/eng_tool, // CHOMPEdit - Removal of obj/item/weapon
		prob(5);/obj/item/storage/pouch/eng_supply, // CHOMPEdit - Removal of obj/item/weapon
		prob(5);/obj/item/storage/pouch/eng_parts, // CHOMPEdit - Removal of obj/item/weapon
		prob(5);/obj/item/storage/pouch/medical, // CHOMPEdit - Removal of obj/item/weapon
		prob(5);/obj/item/storage/pouch/flares/full_flare, // CHOMPEdit - Removal of obj/item/weapon
		prob(5);/obj/item/storage/pouch/flares/full_glow, // CHOMPEdit - Removal of obj/item/weapon
		prob(5);/obj/item/storage/pouch/holster, // CHOMPEdit - Removal of obj/item/weapon
		prob(5);/obj/item/storage/pouch/baton/full, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/storage/pouch/holding // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/random/flashlight
	name = "Random Flashlight"
	desc = "This is a random storage pouch."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "random_flashlight"

/obj/random/flashlight/item_to_spawn()
	return pick(
		prob(8);/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		prob(6);/obj/item/flashlight/color, // CHOMPEdit - Removal of obj/item/device
		prob(6);/obj/item/flashlight/color/green, // CHOMPEdit - Removal of obj/item/device
		prob(6);/obj/item/flashlight/color/purple, // CHOMPEdit - Removal of obj/item/device
		prob(6);/obj/item/flashlight/color/red, // CHOMPEdit - Removal of obj/item/device
		prob(6);/obj/item/flashlight/color/orange, // CHOMPEdit - Removal of obj/item/device
		prob(6);/obj/item/flashlight/color/yellow, // CHOMPEdit - Removal of obj/item/device
		prob(2);/obj/item/flashlight/maglight // CHOMPEdit - Removal of obj/item/device
	)

/obj/random/mug
	name = "Random Mug"
	desc = "This is a random coffee mug."
	icon = 'icons/obj/drinks_mugs.dmi'
	icon_state = "coffeecup_spawner"

/obj/random/mug/item_to_spawn()
	return pick(/obj/item/reagent_containers/food/drinks/glass2/coffeemug, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/sol, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/fleet, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/fivearrows, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/psc, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/alma, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/almp, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/nt, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/metal/wulf, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/gilthari, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/zeng, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/wt, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/aether, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/bishop, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/oculum, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/one, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/puni, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/heart, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/pawn, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/diona, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/britcup, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/flame, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/blue, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/black, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/green, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/green/dark, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/rainbow, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/food/drinks/glass2/coffeemug/metal) //CHOMPedit: deleted talon mug // CHOMPEdit - Removal of obj/item/weapon

/obj/random/donkpocketbox
	name = "Random Donk-pocket Box"
	desc = "This is a random Donk-pocket Box."
	icon = 'icons/obj/boxes.dmi'
	icon_state = "donkpocket_spawner"

/obj/random/donkpocketbox/item_to_spawn()
	return pick(/obj/item/storage/box/donkpockets, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets/spicy, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets/teriyaki, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets/pizza, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets/honk, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets/gondola, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/box/donkpockets/berry) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/bluespace
	name = "Random Bluespace Item"
	desc = "This is a random Bluespace item."
	icon_state = "bluespace"

/obj/random/bluespace/item_to_spawn()
	return pick(
		prob(20);/obj/item/gun/energy/sizegun, // CHOMPEdit - Removal of obj/item/weapon
		prob(20);/obj/item/slow_sizegun, // CHOMPEdit - Removal of obj/item/device
		prob(20);/obj/item/clothing/accessory/collar/shock/bluespace,
		prob(4);/obj/item/reagent_containers/glass/beaker/bluespace, // CHOMPEdit - Removal of obj/item/weapon
		prob(4);/obj/item/bodysnatcher, // CHOMPEdit - Removal of obj/item/device
		prob(10);/obj/item/clothing/under/hyperfiber,
		prob(10);/obj/item/clothing/under/hyperfiber/bluespace,
		prob(20);/obj/item/implant/sizecontrol, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/storage/bag/ore/holding, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/storage/backpack/holding, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/storage/backpack/holding/duffle, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/storage/bag/trash/holding, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/storage/pouch/holding, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/storage/belt/medical/holding, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/storage/belt/utility/holding, // CHOMPEdit - Removal of obj/item/weapon
		prob(2);/obj/item/perfect_tele, // CHOMPEdit - Removal of obj/item/device
		prob(8);/obj/item/capture_crystal/random,
		prob(10);/obj/item/bluespace_harpoon, // CHOMPEdit - Removal of obj/item/weapon
		prob(10);/obj/item/bluespace_crystal, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/clothing/glasses/graviton,
		prob(10);/obj/item/cracker, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/cracker/shrinking, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/cracker/growing, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/cracker/invisibility, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/cracker/drugged, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/cracker/knockover, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/cracker/vore, // CHOMPEdit - Removal of obj/item/weapon
		prob(1);/obj/item/cracker/money // CHOMPEdit - Removal of obj/item/weapon
	)
