// Mail goodies
/datum/job/
	var/list/mail_goodies = list()		  // Goodies that can be received via the mail system
	var/exclusive_mail_goodies = FALSE	  // If this job's mail goodies compete with generic goodies.
	var/mail_color = "#FFF"

/datum/alt_title/
	var/list/mail_goodies = list()

// Get mail goodies
/datum/job/proc/get_mail_goodies(mob/recipient, var/alt_title)
	var/list/goodies = list()
	goodies |= mail_goodies

	if(alt_titles && alt_titles)
		var/typepath = alt_titles[alt_title]
		if(typepath)
			var/datum/alt_title/A = new typepath()
			if(A.mail_goodies)
				goodies |= A.mail_goodies
	return goodies

// Get mail colour
/datum/job/proc/get_mail_color(mob/recipient)
	return mail_color

// Assistant

/datum/job/intern
	mail_goodies = list(
		/obj/item/weapon/cell/device = 200,
		/obj/item/weapon/cell = 175,
		/obj/item/weapon/storage/belt/utility = 150,
		/obj/item/weapon/cell/high = 125,
		/obj/item/weapon/tool/wrench = 125,
		/obj/item/weapon/tool/screwdriver = 125,
		/obj/item/weapon/cell/device/hyper = 50,
		/obj/item/weapon/cell/hyper = 50,
	)
	mail_color = COMMS_COLOR_ENTERTAIN

/datum/alt_title/intern_eng
	mail_goodies = list(
		/obj/item/weapon/cell/device = 200,
		/obj/item/weapon/cell = 175,
		/obj/item/weapon/storage/belt/utility = 150,
		/obj/item/weapon/cell/high = 125,
		/obj/item/weapon/tool/wrench = 125,
		/obj/item/weapon/tool/screwdriver = 125,
		/obj/item/device/geiger = 100
	)

/datum/alt_title/intern_med
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/burn = 200,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/trauma = 200,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/detox = 200,
		/obj/item/stack/medical/ointment = 100,
		/obj/item/stack/medical/bruise_pack = 100,
		/obj/item/weapon/storage/pill_bottle/paracetamol = 100,
		/obj/item/weapon/storage/pill_bottle/blood_regen = 50,
		/obj/item/weapon/storage/pill_bottle/assorted = 50,
	)

/datum/alt_title/intern_sci
	mail_goodies = list(
		/obj/item/weapon/cell/device = 200,
		/obj/item/weapon/cell = 175,
		/obj/item/weapon/storage/belt/utility = 150,
		/obj/item/weapon/cell/high = 125,
		/obj/item/weapon/tool/wrench = 125,
		/obj/item/weapon/tool/screwdriver = 125,
		/obj/item/weapon/cell/device/hyper = 50,
		/obj/item/weapon/cell/hyper = 50,
	)

/datum/alt_title/intern_sec
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/donut/plain = 200,
		/obj/item/poster/custom = 200,
		/obj/item/device/ticket_printer = 200,
		/obj/item/device/holowarrant = 200,
		/obj/item/device/retail_scanner/security = 100,
		/obj/item/taperoll/police = 100
	)

/datum/alt_title/intern_crg
	mail_goodies = list(
		/obj/item/weapon/wrapping_paper = 200,
		/obj/item/weapon/form_printer = 200,
		/obj/item/poster/custom = 200,
		/obj/item/stack/material/wood{amount = 10} = 100,
		/obj/item/stack/material/steel{amount = 10} = 100,
		/obj/item/weapon/pickaxe = 100,
		/obj/item/stack/marker_beacon = 100,
	)

/datum/alt_title/intern_exp
	mail_goodies = list(
		/obj/item/weapon/storage/mre/menu2 = 800,
		/obj/item/device/binoculars/spyglass = 150,
		/obj/item/weapon/cell/device/hyper = 50,
	)

/datum/alt_title/server
	mail_goodies = list(
		/obj/item/weapon/tray = 200,
		/obj/item/weapon/material/kitchen/utensil/fork = 200,
		/obj/item/weapon/material/knife/plastic = 200,
		/obj/item/weapon/reagent_containers/food/snacks/tofu = 200,
		/obj/item/weapon/reagent_containers/food/snacks/candy_corn = 200,
	)

/datum/alt_title/assistant

// Visitor

/datum/job/assistant

/datum/alt_title/guest

/datum/alt_title/traveler

// Cargo

/datum/job/qm
	mail_goodies = list(
		/obj/item/stack/material/plasteel{amount = 10} = 125,
		/obj/item/stack/material/marble{amount = 10} = 125,
		/obj/item/stack/material/wood{amount = 10} = 125,
		/obj/item/stack/material/steel{amount = 10} = 125,
		/obj/item/stack/material/glass{amount = 10} = 125,
		/obj/item/weapon/coin/silver = 100,
		/obj/item/weapon/pen/fountain8 = 100,
		/obj/item/stack/material/durasteel{amount = 5} = 75,
		/obj/item/stack/material/diamond{amount = 3} = 75,
		/obj/item/toy/plushie/borgplushie/drake/mine = 25,
	)
	mail_color = COMMS_COLOR_SUPPLY

/datum/job/cargo_tech
	mail_goodies = list(
		/obj/item/pizzavoucher = 375,
		/obj/item/poster/custom = 200,
		/obj/item/stack/material/steel{amount = 10} = 150,
		/obj/item/stack/material/glass{amount = 10} = 150,
		/obj/item/stack/material/wood{amount = 10} = 150,
		/obj/item/weapon/coin/silver = 50
	)
	mail_color = COMMS_COLOR_SUPPLY

/datum/alt_title/disposal_sorter
	mail_goodies = list(
		/obj/item/clothing/gloves/black = 300,
		/obj/item/weapon/reagent_containers/spray/sterilizine = 300,
		/obj/item/weapon/storage/bag/trash = 300,
		/obj/item/weapon/coin/silver = 80,
		/obj/item/weapon/storage/bag/trash/holding = 20
	)

/datum/alt_title/mailman
	mail_goodies = list(
		/obj/item/poster/custom = 300,
		/obj/item/weapon/wrapping_paper = 300,
		/obj/item/pizzavoucher = 300,
		/obj/item/weapon/coin/silver = 100,
	)

/datum/job/mining
	mail_goodies = list(
		/obj/item/weapon/plastique/seismic/locked = 150,
		/obj/item/stack/marker_beacon/ten = 150,
		/obj/item/weapon/pickaxe/diamond = 125,
		/obj/item/device/perfect_tele/one_beacon = 125,
		/obj/item/clothing/shoes/bhop = 125,
		/obj/item/weapon/inducer = 125,
		/obj/item/weapon/pickaxe/advdrill = 100,
		/obj/item/weapon/storage/bag/ore/holding = 100
	)
	mail_color = COMMS_COLOR_SUPPLY

/datum/alt_title/drill_tech
	mail_goodies = list(
		/obj/item/stack/marker_beacon/ten = 250,
		/obj/item/device/perfect_tele/one_beacon = 125,
		/obj/item/clothing/shoes/bhop = 125,
		/obj/item/weapon/inducer = 125,
		/obj/item/weapon/stock_parts/manipulator/nano = 50,
		/obj/item/weapon/stock_parts/capacitor/adv = 50,
		/obj/item/weapon/stock_parts/scanning_module/adv = 50,
		/obj/item/weapon/stock_parts/micro_laser/high = 50,
		/obj/item/weapon/stock_parts/matter_bin/super = 10,
		/obj/item/weapon/stock_parts/manipulator/pico = 10,
		/obj/item/weapon/stock_parts/capacitor/super = 10,
		/obj/item/weapon/stock_parts/scanning_module/phasic = 10,
		/obj/item/weapon/stock_parts/micro_laser/ultra = 10
	)

// Civilian

/datum/job/bartender
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/metaglass/metapint = 300,
		/obj/item/weapon/reagent_containers/glass/bottle/nothing = 250,
		/obj/item/weapon/reagent_containers/glass/bottle/gelatin = 250,
		/obj/item/stack/material/uranium = 150,
		/obj/item/weapon/reagent_containers/chem_disp_cartridge/nothing = 25,
		/obj/item/weapon/reagent_containers/chem_disp_cartridge/gelatin = 25,
	)
	mail_color = COMMS_COLOR_SERVICE

/datum/alt_title/barista
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/metaglass/metapint = 300,
		/obj/item/weapon/reagent_containers/glass/bottle/gelatin = 225,
		/obj/item/weapon/reagent_containers/food/drinks/smallmilk = 225,
		/obj/item/weapon/reagent_containers/glass/bottle/cinnamonpowder = 100,
		/obj/item/weapon/reagent_containers/food/drinks/teapot = 100,
		/obj/item/weapon/reagent_containers/chem_disp_cartridge/gelatin = 50,
	)

/datum/job/chef
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/condiment/soysauce = 250,
		/obj/item/weapon/reagent_containers/food/drinks/smallmilk = 250,
		/obj/item/weapon/reagent_containers/glass/bottle/cakebatter = 200,
		/obj/item/weapon/reagent_containers/food/snacks/cuttlefish = 200,
		/obj/item/weapon/reagent_containers/glass/bottle/cinnamonpowder = 100
	)
	mail_color = COMMS_COLOR_SERVICE

/datum/job/hydro
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/glass/bottle/eznutrient = 200,
		/obj/item/weapon/reagent_containers/glass/bottle/left4zed = 200,
		/obj/item/weapon/reagent_containers/glass/bottle/robustharvest = 200,
		/obj/item/weapon/reagent_containers/spray/plantbgone = 150,
		/obj/item/weapon/reagent_containers/glass/bottle/diethylamine = 100,
		/obj/item/weapon/gun/energy/floragun = 75,
		/obj/item/weapon/grenade/chem_grenade/antiweed = 75
	)
	mail_color = COMMS_COLOR_SERVICE

/datum/job/janitor
	mail_goodies = list(
		/obj/item/weapon/storage/box/lights/mixed = 200,
		/obj/item/weapon/reagent_containers/spray/cleaner = 200,
		/obj/item/device/lightreplacer = 150,
		/obj/item/device/lightpainter = 150,
		/obj/item/weapon/soap = 100,
		/obj/item/weapon/grenade/chem_grenade/cleaner = 100,
		/obj/item/weapon/reagent_containers/spray/chemsprayer/hosed = 50,
		/obj/item/weapon/storage/bag/trash/holding = 25,
		/obj/item/toy/plushie/borgplushie/drake/jani = 25,
	)
	mail_color = COMMS_COLOR_SERVICE

/datum/job/librarian
	mail_goodies = list(
		/obj/item/weapon/form_printer = 250,
		/obj/item/weapon/book/manual/wizzoffguide = 100,
		/obj/item/weapon/book/bundle/custom_library/fiction/ghostship = 100,
		/obj/item/weapon/book/bundle/custom_library/reference/ThermodynamicReactionsandResearch = 100,
		/obj/item/weapon/book/bundle/custom_library/nonfiction/riseandfallofpersianempire = 100,
		/obj/item/weapon/book/bundle/custom_library/nonfiction/skrelliancastesystem = 100,
		/obj/item/weapon/book/codex/lore/robutt = 95,
		/obj/item/weapon/book/codex/lore/news = 95,
		/obj/item/weapon/pen/fountain3 = 50,
		/obj/item/weapon/reagent_containers/food/snacks/egg = 10
	)
	mail_color = COMMS_COLOR_SERVICE

/datum/job/lawyer
	mail_goodies = list(
		/obj/item/weapon/pen/fountain8 = 800,
		/obj/item/weapon/form_printer = 200,
	)
	mail_color = COMMS_COLOR_SERVICE

/datum/job/chaplain
	mail_goodies = list(
		/obj/item/weapon/storage/fancy/candle_box = 340,
		/obj/item/weapon/storage/fancy/whitecandle_box = 330,
		/obj/item/weapon/storage/fancy/blackcandle_box = 330
	)
	mail_color = COMMS_COLOR_SERVICE

/datum/job/entertainer
		// These need new goodes...
	mail_goodies = list(
		/obj/random/instrument = 600,
		/obj/item/weapon/storage/pill_bottle/dice_nerd = 400,
	)
	mail_color = COMMS_COLOR_SERVICE

/datum/alt_title/clown
	mail_goodies = list(
		/obj/fruitspawner/banana = 200,
		/obj/item/weapon/pen/crayon/rainbow = 200,
		/obj/item/weapon/bikehorn = 200,
		/obj/item/weapon/soap/rainbow_soap = 100,
		/obj/item/weapon/reagent_containers/spray/waterflower = 100,
		/obj/item/weapon/reagent_containers/glass/bottle/lube = 100,
		/obj/item/weapon/reagent_containers/food/snacks/pie = 100
	)

/datum/alt_title/mime
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/bottle/wine = 250,
		/obj/item/weapon/reagent_containers/glass/bottle/nothing = 250,
		/obj/item/weapon/reagent_containers/food/snacks/baguette = 200,
		/obj/item/weapon/pen/crayon/mime = 200
	)
/datum/job/entrepreneur // Same for these guys! What could they get?
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/coffee = 1000, // For now, they'll get extra on coffee.
	)
	mail_color = COMMS_COLOR_SERVICE

/datum/alt_title/paranormal_investigator
	mail_goodies = list(
		/obj/item/weapon/storage/fancy/candle_box = 340,
		/obj/item/weapon/storage/fancy/whitecandle_box = 330,
		/obj/item/weapon/storage/fancy/blackcandle_box = 330
	)

// Command

/datum/job/captain
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/drinks/bottle/specialwhiskey = 250,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne = 250,
		/obj/item/weapon/storage/fancy/cigar/havana = 250,
		/obj/item/weapon/form_printer = 200,
		/obj/item/weapon/pen/fountain6 = 50
	)
	mail_color = COMMS_COLOR_COMMAND

/datum/job/hop
	mail_goodies = list( // Need to check what these could get...
		/obj/item/weapon/pen/fountain6 = 650,
		/obj/item/weapon/form_printer = 200,
		/obj/item/toy/figure/corgi = 150
	)
	mail_color = COMMS_COLOR_COMMAND

/datum/job/secretary
	mail_goodies = list(
		/obj/item/weapon/form_printer = 225,
		/obj/item/toy/figure/cmo = 175,
		/obj/item/toy/figure/ce = 175,
		/obj/item/toy/figure/rd = 175,
		/obj/item/toy/figure/hos = 150,
		/obj/item/toy/figure/hop = 125,
		/obj/item/toy/figure/captain = 50,
		/obj/item/weapon/pen/fountain6 = 25
	)
	mail_color = COMMS_COLOR_COMMAND

// Engineering

/datum/job/chief_engineer
	mail_goodies = list(
		/obj/item/stack/material/steel{amount = 15} = 225,
		/obj/item/stack/material/lead{amount = 10} = 175,
		/obj/item/stack/material/glass/reinforced{amount = 10} = 150,
		/obj/item/weapon/rcd_ammo = 150,
		/obj/item/stack/material/plasteel{amount = 10} = 125,
		/obj/item/stack/material/phoron{amount = 5} = 100,
		/obj/item/weapon/pen/fountain6 = 50,
		/obj/item/toy/plushie/borgplushie/drake/eng = 25,
	)
	mail_color = COMMS_COLOR_COMMAND

/datum/job/engineer
	mail_goodies = list(
		/obj/item/stack/material/steel{amount = 10} = 235,
		/obj/item/stack/material/lead{amount = 10} = 235,
		/obj/item/stack/material/glass/reinforced{amount = 10} = 235,
		/obj/item/weapon/rcd_ammo = 155,
		/obj/item/stack/material/plasteel{amount = 10} = 100,
		/obj/item/weapon/tool/screwdriver/power = 10,
		/obj/item/weapon/tool/wirecutters/power = 10,
		/obj/item/weapon/weldingtool/experimental = 10,
		/obj/item/weapon/tool/wrench/power = 10,
	)
	mail_color = COMMS_COLOR_ENGINEER

/datum/alt_title/electrician
	mail_goodies = list(
		/obj/item/weapon/storage/box/lights/mixed = 250,
		/obj/item/stack/cable_coil = 250,
		/obj/item/clothing/gloves/yellow = 200,
		/obj/item/stack/cable_coil/heavyduty = 210,
		/obj/item/weapon/tool/screwdriver/power = 10,
		/obj/item/weapon/tool/wirecutters/power = 10,
		/obj/item/weapon/weldingtool/experimental = 10,
		/obj/item/weapon/tool/wrench/power = 10,
	)

/datum/job/atmos
	mail_goodies = list(
		/obj/item/stack/material/steel{amount = 10} = 330,
		/obj/item/device/analyzer = 300,
		/obj/item/weapon/holosign_creator/combifan = 230,
		/obj/item/weapon/pipe_dispenser = 130,
		/obj/item/weapon/tool/screwdriver/power = 10,
		/obj/item/weapon/tool/wirecutters/power = 10,
		/obj/item/weapon/weldingtool/experimental = 10,
	)
	mail_color = COMMS_COLOR_ENGINEER

// Exploration

/datum/job/pathfinder
	mail_goodies = list(
		/obj/item/device/binoculars/spyglass = 300,
		/obj/item/device/cataloguer/advanced = 200,
		/obj/item/weapon/storage/mre/menu2 = 150,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/brute = 100,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/burn = 100,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/toxin = 100,
		/obj/item/weapon/cell/device/hyper = 100,
		/obj/item/device/flashlight/slime = 50,
	)
	mail_color = "#274d0a"

/datum/job/pilot
	mail_goodies = list(
		/obj/item/weapon/storage/mre/menu2 = 400,
		/obj/item/weapon/tank/air = 250,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/brute = 100,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/burn = 100,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/toxin = 100,
		/obj/item/weapon/cell/device/hyper = 50,
	)
	mail_color = "#274d0a"

/datum/job/explorer
	mail_goodies = list(
		/obj/item/weapon/storage/mre/menu2 = 500,
		/obj/item/device/binoculars/spyglass = 150,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/brute = 100,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/burn = 100,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/toxin = 100,
		/obj/item/weapon/cell/device/hyper = 50,
	)
	mail_color = "#274d0a"

/datum/job/sar
	mail_goodies = list(
		/obj/item/weapon/storage/mre/menu2 = 500,
		/obj/item/weapon/storage/pill_bottle/antitox = 100,
		/obj/item/weapon/storage/pill_bottle/dexalin_plus = 100,
		/obj/item/weapon/storage/pill_bottle/kelotane = 100,
		/obj/item/weapon/storage/firstaid/adv = 75,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/brute = 25,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/burn = 25,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/toxin = 25,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/purity = 10,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/pain = 10,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/organ = 10,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/combat = 5,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/clotting = 5,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/healing_nanites = 5,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/bonemed = 5
	)
	mail_color = "#274d0a"

// Medical
/datum/job/cmo
	mail_goodies = list(
		/obj/item/device/healthanalyzer/advanced = 270,
		/obj/item/weapon/reagent_containers/hypospray = 250,
		/obj/item/weapon/reagent_containers/blood/OMinus = 250,
		/obj/item/weapon/pen/fountain6 = 75,
		/obj/item/weapon/surgical/scalpel/manager = 20,
		/obj/item/weapon/surgical/circular_saw/manager = 20,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/bonemed = 20,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/clotting = 20,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/organ = 20,
		/obj/item/toy/plushie/borgplushie/medihound = 20,
		/obj/item/weapon/reagent_containers/pill/healing_nanites = 15,
	)
	mail_color = COMMS_COLOR_COMMAND

/datum/job/doctor
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/syringe/antiviral = 200,
		/obj/item/weapon/reagent_containers/spray/sterilizine = 200,
		/obj/item/weapon/storage/pill_bottle/tramadol = 125,
		/obj/item/weapon/storage/pill_bottle/antitox = 125,
		/obj/item/weapon/reagent_containers/blood/OMinus = 125,
		/obj/item/device/healthanalyzer/improved = 150,
		/obj/item/weapon/storage/pill_bottle/neotane = 10,
		/obj/item/weapon/storage/pill_bottle/burncard = 10,
		/obj/item/weapon/storage/pill_bottle/flamecure = 10,
		/obj/item/weapon/storage/pill_bottle/purifyingagent = 10,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/clotting = 10
	)
	mail_color = COMMS_COLOR_MEDICAL

/datum/alt_title/surgeon
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/spray/sterilizine = 300,
		/obj/item/device/healthanalyzer/improved = 170,
		/obj/item/weapon/reagent_containers/blood/OMinus = 170,
		/obj/item/stack/medical/advanced/bruise_pack = 150,
		/obj/item/stack/medical/advanced/ointment = 150,
		/obj/item/weapon/surgical/bone_clamp = 20,
		/obj/item/weapon/surgical/scalpel/manager = 20,
		/obj/item/weapon/surgical/circular_saw/manager = 20,
	)

/datum/alt_title/virologist
	mail_goodies = list(
		/obj/item/weapon/virusdish/random = 200,
		/obj/item/weapon/storage/pill_bottle/spaceacillin = 150,
		/obj/item/clothing/mask/surgical = 150,
		/obj/item/clothing/gloves/sterile/latex = 150,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/toxin = 100,
		/obj/item/weapon/reagent_containers/blood/OMinus = 100,
	)

/datum/job/chemist
	mail_goodies = list(
		/obj/item/weapon/storage/pill_bottle = 235,
		/obj/item/weapon/reagent_containers/glass/beaker/large = 210,
		/obj/item/weapon/reagent_containers/pill/hyronalin = 210,
		/obj/item/weapon/reagent_containers/pill/carthatoline = 210,
		/obj/item/stack/material/phoron{amount = 5} = 120,
		/obj/item/weapon/reagent_containers/pill/healing_nanites = 15
	)
	mail_color = COMMS_COLOR_MEDICAL

/datum/job/psychiatrist
	mail_goodies = list(
		/obj/item/toy/plushie/carp = 225,
		/obj/item/toy/plushie/blue_fox = 225,
		/obj/item/toy/plushie/orange_cat = 200,
		/obj/item/toy/plushie/borgplushie/drake/jani = 200,
		/obj/item/toy/plushie/shark = 75,
		/obj/item/weapon/storage/pill_bottle/happy = 50,
		/obj/item/weapon/storage/pill_bottle/citalopram = 50
	)
	mail_color = COMMS_COLOR_MEDICAL

/datum/job/geneticist
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/monkeycube = 600,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/toxin = 200,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/purity = 200,
	)
	mail_color = COMMS_COLOR_MEDICAL


/datum/job/paramedic
	mail_goodies = list(
		/obj/item/stack/medical/bruise_pack = 200,
		/obj/item/stack/medical/ointment = 200,
		/obj/item/stack/medical/advanced/bruise_pack = 175,
		/obj/item/stack/medical/advanced/ointment = 175,
		/obj/item/weapon/reagent_containers/syringe/antiviral = 100,
		/obj/item/weapon/storage/pill_bottle/tramadol = 100,
		/obj/item/weapon/storage/pill_bottle/neotane = 10,
		/obj/item/weapon/storage/pill_bottle/burncard = 10,
		/obj/item/weapon/storage/pill_bottle/flamecure = 10,
		/obj/item/weapon/storage/pill_bottle/purifyingagent = 10,
		/obj/item/weapon/reagent_containers/pill/myelamine = 10
	)
	mail_color = COMMS_COLOR_MEDICAL

// Science

/datum/job/rd
	mail_goodies = list(
		/obj/item/stack/material/steel{amount = 15} = 300,
		/obj/item/stack/material/plasteel{amount = 10} = 250,
		/obj/item/weapon/cell/super = 155,
		/obj/item/weapon/cell/hyper = 125,
		/obj/item/weapon/pen/fountain6 = 75,
		/obj/item/toy/plushie/borgplushie/drake/sci = 20,
		/obj/item/weapon/stock_parts/matter_bin/hyper = 15,
		/obj/item/weapon/stock_parts/manipulator/hyper = 15,
		/obj/item/weapon/stock_parts/capacitor/hyper = 15,
		/obj/item/weapon/stock_parts/scanning_module/hyper = 15,
		/obj/item/weapon/stock_parts/micro_laser/hyper = 15
	)
	mail_color = COMMS_COLOR_COMMAND

/datum/job/scientist
	mail_goodies = list(
		/obj/item/stack/material/steel{amount = 10} = 250,
		/obj/item/stack/material/glass{amount = 10} = 200,
		/obj/item/weapon/cell/super = 100,
		/obj/item/weapon/cell/hyper = 100,
		/obj/item/stack/material/plasteel{amount = 10} = 70,
		/obj/item/weapon/stock_parts/matter_bin/adv = 45,
		/obj/item/weapon/stock_parts/manipulator/nano = 45,
		/obj/item/weapon/stock_parts/capacitor/adv = 45,
		/obj/item/weapon/stock_parts/scanning_module/adv = 45,
		/obj/item/weapon/stock_parts/micro_laser/high = 45,
		/obj/item/stack/nanopaste/advanced = 30,
		/obj/item/weapon/stock_parts/matter_bin/super = 5,
		/obj/item/weapon/stock_parts/manipulator/pico = 5,
		/obj/item/weapon/stock_parts/capacitor/super = 5,
		/obj/item/weapon/stock_parts/scanning_module/phasic = 5,
		/obj/item/weapon/stock_parts/micro_laser/ultra = 5
	)
	mail_color = COMMS_COLOR_SCIENCE

/datum/job/xenobiologist
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/monkeycube = 780,
		/obj/item/clothing/head/helmet = 100,
		/obj/item/weapon/melee/baton/slime = 100,
		/obj/item/weapon/xenobio/monkey_gun = 20
	)
	mail_color = COMMS_COLOR_SCIENCE

/datum/job/roboticist
	mail_goodies = list(
		/obj/item/trash/rkibble = 200,
		/obj/item/stack/material/steel{amount = 10} = 150,
		/obj/item/device/robotanalyzer = 125,
		/obj/item/stack/nanopaste/advanced = 85,
		/obj/item/device/kit/paint/ripley = 55,
		/obj/item/device/kit/paint/gygax = 55,
		/obj/item/device/kit/paint/durand = 55,
		/obj/item/device/kit/paint/ripley/death = 45,
		/obj/item/device/kit/paint/durand/seraph = 45,
		/obj/item/device/kit/paint/durand/phazon = 45,
		/obj/item/device/kit/paint/gygax/darkgygax = 30,
		/obj/item/device/kit/paint/ripley/flames_red = 30,
		/obj/item/device/kit/paint/gygax/recitence = 25,
		/obj/item/device/kit/paint/ripley/flames_blue = 25,
		/obj/item/weapon/tool/screwdriver/power = 10,
		/obj/item/weapon/tool/wirecutters/power = 10,
		/obj/item/weapon/weldingtool/experimental = 10,
	)
	mail_color = COMMS_COLOR_SCIENCE

/datum/job/xenobotanist
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/glass/bottle/mutagen = 350,
		/obj/item/weapon/reagent_containers/glass/bottle/diethylamine = 350,
		/obj/item/weapon/reagent_containers/spray/plantbgone = 150,
		/obj/item/weapon/gun/energy/floragun = 100,
		/obj/item/weapon/grenade/chem_grenade/antiweed = 50
	)
	mail_color = COMMS_COLOR_SCIENCE

// Security

/datum/job/hos
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/donut/homer = 200,
		/obj/item/clothing/mask/smokable/cigarette/cigar/havana = 165,
		/obj/item/weapon/grenade/concussion = 150,
		/obj/item/weapon/grenade/chem_grenade/teargas = 125,
		/obj/item/weapon/grenade/shooter/rubber = 75,
		/obj/item/weapon/storage/box/handcuffs = 75,
		/obj/item/weapon/pen/fountain6 = 50,
		/obj/item/ammo_magazine/ammo_box/b12g/stunshell = 50,
		/obj/item/ammo_magazine/m45 = 50,
		/obj/item/ammo_magazine/m9mmt = 50,
		/obj/item/toy/plushie/borgplushie/drake/sec = 10
	)
	mail_color = COMMS_COLOR_COMMAND

/datum/job/warden
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/donut/homer = 250,
		/obj/item/clothing/mask/smokable/cigarette/cigar/havana = 165,
		/obj/item/weapon/grenade/concussion = 150,
		/obj/item/weapon/grenade/chem_grenade/teargas = 150,
		/obj/item/weapon/grenade/shooter/rubber = 125,
		/obj/item/weapon/storage/box/handcuffs = 100,
		/obj/item/ammo_magazine/ammo_box/b12g/stunshell = 20,
		/obj/item/ammo_magazine/m45 = 20,
		/obj/item/ammo_magazine/m9mmt = 20,
	)
	mail_color = COMMS_COLOR_SECURITY

/datum/job/detective
	mail_goodies = list(
		/obj/item/weapon/storage/box/matches = 200,
		/obj/item/weapon/storage/fancy/cigarettes = 100,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey = 100,
		/obj/item/weapon/storage/fancy/cigarettes/dromedaryco = 75,
		/obj/item/weapon/storage/fancy/cigarettes/killthroat = 75,
		/obj/item/weapon/storage/fancy/cigarettes/luckystars = 75,
		/obj/item/weapon/storage/fancy/cigarettes/jerichos = 75,
		/obj/item/weapon/storage/fancy/cigarettes/menthols = 75,
		/obj/item/weapon/storage/fancy/cigarettes/carcinomas = 75,
		/obj/item/weapon/storage/fancy/cigarettes/professionals = 75,
		/obj/item/weapon/storage/fancy/cigar/havana = 25,
		/obj/item/weapon/flame/lighter/supermatter/syndismzippo = 20,
		/obj/item/clothing/mask/smokable/cigarette/cigar = 10,
		/obj/item/clothing/mask/smokable/cigarette/cigar/cohiba = 10,
		/obj/item/clothing/mask/smokable/cigarette/cigar/havana = 10
	)
	mail_color = COMMS_COLOR_SECURITY

/datum/job/officer
	mail_goodies = list(
		/obj/item/weapon/reagent_containers/food/snacks/donut/olive = 175,
		/obj/item/weapon/reagent_containers/food/snacks/donut/homer/jelly = 155,
		/obj/item/weapon/reagent_containers/food/snacks/donut/purple = 155,
		/obj/item/weapon/reagent_containers/food/snacks/donut/plain = 155,
		/obj/item/weapon/handcuffs = 75,
		/obj/item/device/hailer = 75,
		/obj/item/ammo_magazine/m9mmt/rubber = 50,
		/obj/item/ammo_magazine/ammo_box/b12g/beanbag = 50,
		/obj/item/ammo_magazine/ammo_box/b12g = 25,
		/obj/item/ammo_magazine/ammo_box/b12g/pellet = 25,
		/obj/item/ammo_magazine/m45/rubber = 25,
		/obj/item/ammo_magazine/m45/flash = 25,
	)
	mail_color = COMMS_COLOR_SECURITY
