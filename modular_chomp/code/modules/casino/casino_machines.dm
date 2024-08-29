/obj/machinery/chemical_dispenser/deluxe
	name = "deluxe drink dispenser"
	desc = "The premium within dispenser for drinks, its made with bluespace technology!"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "deluxe_dispenser"
	ui_title = "Deluxe Drink Dispenser"
	accept_drinking = 1
	max_catriges = 90 //Because it keeps getting borked by upstream, now gotta do it with variable until we can make more permanent solution - Jack


/obj/machinery/chemical_dispenser/deluxe
	dispense_reagents = list(
		"water", "ice", "coffee", "cream", "tea", "icetea", "cola", "spacemountainwind", "dr_gibb", "space_up", "tonic",
		"sodawater", "lemon_lime", "sugar", "orangejuice", "limejuice", "watermelonjuice", "thirteenloko", "grapesoda",
		"coffee", "cafe_latte", "soy_latte", "hot_coco", "milk", "cream", "tea", "ice", "orangejuice", "lemonjuice",
		"limejuice", "berryjuice", "mint", "lemon_lime", "sugar", "orangejuice", "limejuice", "sodawater",
		"tonic", "beer", "kahlua", "whiskey", "redwine", "vodka", "gin", "rum", "tequilla", "vermouth", "cognac",
		"ale", "mead", "bitters", "champagne", "singulo", "doctorsdelight", "nothing", "banana", "honey", "egg",
		"coco", "cherryjelly", "carrotjuice", "applejuice", "tomatojuice", "peanutbutter", "soymilk", "grenadine", "gingerale", "roy_rogers",
		"patron", "goldschlager", "gelatin", "melonliquor", "bluecuracao", "thirteenloko", "deadrum", "sake", "acidspit",
		"amasec", "beepskysmash", "atomicbomb", "nuka_cola", "threemileisland", "manhattan_proj", "psilocybin", "moonshine",
		"specialwhiskey", "unathiliquor", "winebrandy", "matcha_latte", "snaps"
		)

/obj/machinery/chemical_dispenser/deluxe/full
	spawn_cartridges = list(
			/obj/item/reagent_containers/chem_disp_cartridge/water, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/ice, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/coffee, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/cream, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/tea, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/icetea, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/cola, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/smw, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/dr_gibb, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/spaceup, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/tonic, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/sodawater, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/lemon_lime, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/sugar, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/orange, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/lime, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/watermelon, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/lemon, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/coffee, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/cafe_latte, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/soy_latte, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/hot_coco, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/milk, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/cream, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/tea, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/ice, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/mint, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/orange, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/lemon, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/lime, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/berry, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/lemon_lime, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/sugar, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/orange, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/lime, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/sodawater, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/tonic, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/beer, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/kahlua, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/whiskey, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/redwine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/vodka, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/gin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/rum, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/tequila, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/vermouth, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/cognac, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/ale, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/mead, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/champagne, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/grapesoda, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/singulo, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/doctorsdelight, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/nothing, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/banana, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/honey, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/egg, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/coco, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/cherryjelly, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/carrotjuice, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/applejuice, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/tomatojuice, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/soymilk, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/peanutbutter, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/matcha_latte, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/gelatin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/grenadine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/gingerale, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/roy_rogers, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/patron, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/goldschlager, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/melonliquor, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/bluecuracao, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/thirteenloko, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/deadrum, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/sake, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/acidspit, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/amasec, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/beepskysmash, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/atomicbomb, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/nuka_cola, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/threemileisland, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/manhattan_proj, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/psilocybin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/moonshine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/specialwhiskey, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/unathiliquor, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/winebrandy, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/snaps // CHOMPEdit - Removal of obj/item/weapon
			)
