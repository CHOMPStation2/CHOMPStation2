/*
Basically, each player key gets one chance per loot pile to get them phat lewt.
When they click the pile, after a delay, they 'roll' if they get anything, using chance_nothing.  If they're unlucky, they get nothing.
Otherwise, they roll up to two times, first a roll for rare things, using chance_rare.  If they succeed, they get something quite good.
If that roll fails, they do one final roll, using chance_uncommon.  If they succeed, they get something fairly useful.
If that fails again, they walk away with some common junk.

The same player cannot roll again, however other players can.  This has two benefits.  The first benefit is that someone raiding all of
maintenance will not deprive other people from a shot at loot, and that for the surface variants, it quietly encourages bringing along
buddies, to get more chances at getting cool things instead of someone going solo to hoard all the stuff.

Loot piles can be depleted, if loot_depleted is turned on.  Note that players who searched the pile already won't deplete the loot furthers when searching again.
*/

/obj/structure/loot_pile
	name = "base loot pile"
	desc = "If you can read me, this is bugged"
	description_info = "This can be searched by clicking on it and waiting a few seconds.  You might find valuable treasures or worthless junk. \
	These can only searched each once per player."
	icon = 'icons/obj/loot_piles.dmi'
	icon_state = "randompile"
	density = FALSE
	anchored = TRUE
	unacidable = TRUE

	var/list/icon_states_to_use = list() // List of icon states the pile can choose from on initialization. If empty or null, it will stay the initial icon_state.

	var/list/searched_by = list()	// Keys that have searched this loot pile, with values of searched time.
	var/allow_multiple_looting = FALSE	// If true, the same person can loot multiple times.  Mostly for debugging.
	var/busy = FALSE				// Used so you can't spamclick to loot.

	var/chance_nothing = 0			// Unlucky people might need to loot multiple spots to find things.

	var/chance_uncommon = 10		// Probability of pulling from the uncommon_loot list.
	var/chance_rare = 1				// Ditto, but for rare_loot list.
	var/loot_depletion = FALSE		// If true, loot piles can be 'depleted' after a certain number of searches by different players, where no more loot can be obtained.
	var/loot_left = 0				// When this reaches zero, and loot_depleted is true, you can't obtain anymore loot.
	var/delete_on_depletion = FALSE	// If true, and if the loot gets depleted as above, the pile is deleted.

	var/list/common_loot = list()	// Common is generally less-than-useful junk and filler, at least for maint loot piles.
	var/list/uncommon_loot = list()	// Uncommon is actually maybe some useful items, usually the reason someone bothers looking inside.
	var/list/rare_loot = list()		// Rare is really powerful, or at least unique items.

/obj/structure/loot_pile/attack_ai(var/mob/user)
	if(isrobot(user) && Adjacent(user))
		return attack_hand(user)

/obj/structure/loot_pile/attack_hand(mob/user)
	//Human mob
	if(isliving(user))
		var/mob/living/L = user

		if(busy)
			to_chat(L, "<span class='warning'>\The [src] is already being searched.</span>")
			return

		L.visible_message("[user] searches through \the [src].","<span class='notice'>You search through \the [src].</span>")

		//Do the searching
		busy = TRUE
		if(do_after(user,rand(4 SECONDS,6 SECONDS),src))
			// The loot's all gone.
			if(loot_depletion && loot_left <= 0)
				to_chat(L, "<span class='warning'>\The [src] has been picked clean.</span>")
				busy = FALSE
				return

			//You already searched this one
			if( (user.ckey in searched_by) && !allow_multiple_looting)
				to_chat(L, "<span class='warning'>You can't find anything else vaguely useful in \the [src].  Another set of eyes might, however.</span>")
				busy = FALSE
				return

			// You got unlucky.
			if(chance_nothing && prob(chance_nothing))
				to_chat(L, "<span class='warning'>Nothing in this pile really catches your eye...</span>")
				searched_by |= user.ckey
				busy = FALSE
				return

			// You found something!
			var/obj/item/loot = null
			var/span = "notice" // Blue

			if(prob(chance_rare) && rare_loot.len) // You won THE GRAND PRIZE!
				loot = produce_rare_item()
				span = "cult" // Purple and bold.

			else if(prob(chance_uncommon) && uncommon_loot.len) // Otherwise you might still get something good.
				loot = produce_uncommon_item()
				span = "alium" // Green

			else // Welp.
				loot = produce_common_item()

			//VOREstation edit - Randomized map objects were put in loot piles, so handle them...
			if(istype(loot,/obj/random))
				var/obj/random/randy = loot
				var/new_I = randy.spawn_item()
				qdel(loot)
				loot = new_I // swap it
			//VOREstation edit end

			if(loot)
				searched_by |= user.ckey
				loot.forceMove(get_turf(src))
				to_chat(L, "<span class='[span]'>You found \a [loot]!</span>")
				if(loot_depletion)
					loot_left--
					if(loot_left <= 0)
						to_chat(L, "<span class='warning'>You seem to have gotten the last of the spoils inside \the [src].</span>")
						if(delete_on_depletion)
							qdel(src)

		busy = FALSE
	else
		return ..()

/obj/structure/loot_pile/proc/produce_common_item()
	var/path = pick(common_loot)
	return new path(src)

/obj/structure/loot_pile/proc/produce_uncommon_item()
	var/path = pick(uncommon_loot)
	return new path(src)

/obj/structure/loot_pile/proc/produce_rare_item()
	var/path = pick(rare_loot)
	return new path(src)

/obj/structure/loot_pile/Initialize()
	if(icon_states_to_use && icon_states_to_use.len)
		icon_state = pick(icon_states_to_use)
	. = ..()

// Has large amounts of possible items, most of which may or may not be useful.
/obj/structure/loot_pile/maint/junk
	name = "pile of junk"
	desc = "Lots of junk lying around.  They say one man's trash is another man's treasure."
	icon_states_to_use = list("junk_pile1", "junk_pile2", "junk_pile3", "junk_pile4", "junk_pile5")

	common_loot = list(
		/obj/item/flashlight/flare, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight/glowstick, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight/glowstick/blue, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight/glowstick/orange, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight/glowstick/red, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight/glowstick/yellow, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight/pen, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cell, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/mask/gas/clear, //Chompadd: Proper Implementation of clear gasmasks
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/mask/breath,
		/obj/item/reagent_containers/glass/rag, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/liquidfood, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/secure/briefcase, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/briefcase, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/backpack, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/backpack/satchel/norm, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/backpack/satchel, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/backpack/dufflebag, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/wallet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/shoes/galoshes,
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/shoes/laceup/grey,
		/obj/item/clothing/shoes/laceup/brown,
		/obj/item/clothing/gloves/botanic_leather,
		/obj/item/clothing/gloves/sterile/latex,
		/obj/item/clothing/gloves/white,
		/obj/item/clothing/gloves/rainbow,
		/obj/item/clothing/gloves/fyellow,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/glasses/meson,
		/obj/item/clothing/glasses/meson/prescription,
		/obj/item/clothing/glasses/welding,
		/obj/item/clothing/head/bio_hood/general,
		/obj/item/clothing/head/hardhat,
		/obj/item/clothing/head/hardhat/red,
		/obj/item/clothing/head/ushanka,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/suit/space/emergency,
		/obj/item/clothing/suit/storage/toggle/bomber,
		/obj/item/clothing/suit/bio_suit/general,
		/obj/item/clothing/suit/storage/toggle/hoodie/black,
		/obj/item/clothing/suit/storage/toggle/hoodie/blue,
		/obj/item/clothing/suit/storage/toggle/hoodie/red,
		/obj/item/clothing/suit/storage/toggle/hoodie/yellow,
		/obj/item/clothing/suit/storage/toggle/brown_jacket,
		/obj/item/clothing/suit/storage/toggle/leather_jacket,
		/obj/item/clothing/suit/storage/apron,
		/obj/item/clothing/under/color/grey,
		/obj/item/clothing/under/syndicate/tacticool,
		/obj/item/clothing/under/pants/camo,
		/obj/item/clothing/under/harness,
		/obj/item/clothing/accessory/storage/webbing,
		/obj/item/spacecash/c1, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/spacecash/c5, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/spacecash/c10, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/spacecash/c20, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/camera_assembly, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/caution,
		/obj/item/clothing/head/cone,
		/obj/item/card/emag_broken, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/camera, // CHOMPEdit - Removal of obj/item/device
		/obj/item/pda, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio/headset, // CHOMPEdit - Removal of obj/item/device
		/obj/item/paicard, // CHOMPEdit - Removal of obj/item/device
		/obj/item/reagent_containers/hypospray/autoinjector/biginjector/glucose // CHOMPEdit - Removal of obj/item/weapon
	)

	uncommon_loot = list(
		/obj/item/clothing/shoes/syndigaloshes,
		/obj/item/clothing/gloves/yellow,
		/obj/item/clothing/under/tactical,
		/obj/item/beartrap, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/storage/vest/press,
		/obj/item/material/knife/tacknife, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/butterfly/switchblade // CHOMPEdit - Removal of obj/item/weapon
	)

	rare_loot = list(
		/obj/item/clothing/suit/storage/vest/heavy/merc,
		/obj/item/clothing/shoes/boots/combat,
	)

// Contains mostly useless garbage.
/obj/structure/loot_pile/maint/trash
	name = "pile of trash"
	desc = "Lots of garbage in one place.  Might be able to find something if you're in the mood for dumpster diving."
	icon_states_to_use = list("trash_pile1", "trash_pile2")

	common_loot = list(
		/obj/item/trash/candle,
		/obj/item/trash/candy,
		/obj/item/trash/candy/proteinbar,
		/obj/item/trash/candy/gums,
		/obj/item/trash/cheesie,
		/obj/item/trash/chips,
		/obj/item/trash/chips/bbq,
		/obj/item/trash/liquidfood,
		/obj/item/trash/pistachios,
		/obj/item/trash/plate,
		/obj/item/trash/popcorn,
		/obj/item/trash/raisins,
		/obj/item/trash/semki,
		/obj/item/trash/snack_bowl,
		/obj/item/trash/sosjerky,
		/obj/item/trash/syndi_cakes,
		/obj/item/trash/tastybread,
		/obj/item/trash/coffee,
		/obj/item/trash/tray,
		/obj/item/trash/unajerky,
		/obj/item/trash/waffles,
		/obj/item/reagent_containers/food/snacks/xenomeat/spidermeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/mysterysoup, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/old/hotdog, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pizzabox/old,
		/obj/item/ammo_casing/spent,
		/obj/item/stack/rods{amount = 5},
		/obj/item/stack/material/steel{amount = 5},
		/obj/item/stack/material/cardboard{amount = 5},
		/obj/item/poster,
		/obj/item/poster/custom,
		/obj/item/newspaper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper/crumpled, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper/crumpled/bloody // CHOMPEdit - Removal of obj/item/weapon
	)

	uncommon_loot = list(
		/obj/item/reagent_containers/syringe/steroid, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/zoom, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/happy, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/pill_bottle/paracetamol //VOREStation Edit // CHOMPEdit - Removal of obj/item/weapon
	)

// Contains loads of different types of boxes, which may have items inside!
/obj/structure/loot_pile/maint/boxfort
	name = "pile of boxes"
	desc = "A large pile of boxes sits here."
	density = TRUE
	icon_states_to_use = list("boxfort")

	common_loot = list(
		/obj/item/storage/box, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/beakers, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/botanydisk, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/cups, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/disks, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/donkpockets, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/donut, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/donut/empty, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/evidence, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/lights/mixed, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/lights/tubes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/lights/bulbs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/injectors, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/masks, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/ids, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/mousetraps, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/syringes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/survival, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/gloves, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/PDAs // CHOMPEdit - Removal of obj/item/weapon
	)

	uncommon_loot = list(
		/obj/item/storage/box/sinpockets, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ammo_magazine/ammo_box/b12g/practice,
		/obj/item/ammo_magazine/ammo_box/b12g/blank,
		/obj/item/storage/box/smokes, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/metalfoam, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/handcuffs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/seccarts // CHOMPEdit - Removal of obj/item/weapon
	)

	rare_loot = list(
		/obj/item/storage/box/flashbangs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/empslite, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ammo_magazine/ammo_box/b12g/flash,
		/obj/item/ammo_magazine/ammo_box/b12g/stunshell,
		/obj/item/storage/box/teargas // CHOMPEdit - Removal of obj/item/weapon
	)

// One of the more useful maint piles, contains electrical components.
/obj/structure/loot_pile/maint/technical
	name = "broken machine"
	desc = "A destroyed machine with unknown purpose, and doesn't look like it can be fixed.  It might still have some functional components?"
	density = TRUE
	icon_states_to_use = list("technical_pile1", "technical_pile2", "technical_pile3")

	common_loot = list(
		/obj/item/stock_parts/gear, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/console_screen, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/spring, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/capacitor, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/capacitor/adv, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/capacitor/super, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/manipulator, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/manipulator/nano, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/manipulator/pico, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/matter_bin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/matter_bin/adv, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/matter_bin/super, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/scanning_module, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/scanning_module/adv, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/scanning_module/phasic, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/subspace/amplifier, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/subspace/analyzer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/subspace/ansible, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/subspace/crystal, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/subspace/sub_filter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/subspace/transmitter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stock_parts/subspace/treatment, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/frame,
		/obj/item/broken_device/random,
		/obj/item/borg/upgrade/utility/restart,
		/obj/item/cell, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/high, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/broken, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/arcade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/autolathe, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/atmos_alert, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/airalarm, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/fax, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/jukebox, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/batteryrack, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/message_monitor, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/rcon_console, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/smes_coil, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cartridge/engineering, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/analyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/healthanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/robotanalyzer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/lightreplacer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/hailer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/gps, // CHOMPEdit - Removal of obj/item/device
		/obj/item/geiger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/mass_spectrometer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/mining_scanner/advanced, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/multitool, // CHOMPEdit - Removal of obj/item/device
		/obj/item/mecha_parts/mecha_equipment/generator,
		/obj/item/mecha_parts/mecha_equipment/tool/cable_layer,
		/obj/item/mecha_parts/mecha_equipment/tool/drill,
		/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp,
		/obj/item/mecha_parts/mecha_equipment/tool/passenger,
		/obj/item/mecha_parts/mecha_equipment/tool/sleeper,
		/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun,
		/obj/item/robot_parts/robot_component/binary_communication_device,
		/obj/item/robot_parts/robot_component/armour,
		/obj/item/robot_parts/robot_component/actuator,
		/obj/item/robot_parts/robot_component/camera,
		/obj/item/robot_parts/robot_component/diagnosis_unit,
		/obj/item/robot_parts/robot_component/radio
	)

	uncommon_loot = list(
		/obj/item/cell/super, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/security, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/circuitboard/crew, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/aiModule/reset, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/smes_coil/super_capacity, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/smes_coil/super_io, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cartridge/captain, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/disk/integrated_circuit/upgrade/advanced, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tvcamera, // CHOMPEdit - Removal of obj/item/device
		/obj/item/universal_translator, // CHOMPEdit - Removal of obj/item/device
		/obj/item/aicard, // CHOMPEdit - Removal of obj/item/device
		/obj/item/borg/upgrade/advanced/jetpack,
		/obj/item/borg/upgrade/advanced/advhealth,
		/obj/item/borg/upgrade/basic/vtec,
		/obj/item/borg/upgrade/restricted/tasercooler,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser,
		/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill,
		/obj/item/rig_module/device/drill,
		/obj/item/rig_module/device/plasmacutter,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/device/orescanner,
		/obj/item/rig_module/device/anomaly_scanner,
		/obj/item/rig_module/datajack,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/vision/sechud,
		/obj/item/rig_module/sprinter
	)

	rare_loot = list(
		/obj/item/cell/hyper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/aiModule/freeform, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/aiModule/asimov, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/aiModule/paladin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/aiModule/safeguard, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/disposable_teleporter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	)


// Surface base type
/obj/structure/loot_pile/surface
	// Surface loot piles are considerably harder and more dangerous to reach, so you're more likely to get rare things.
	chance_uncommon = 20
	chance_rare = 5
	loot_depletion = TRUE
	loot_left = 5 // This is to prevent people from asking the whole station to go down to some alien ruin to get massive amounts of phat lewt.

// Base type for alien piles.
/obj/structure/loot_pile/surface/alien
	name = "alien pod"
	desc = "A pod which looks bigger on the inside. Something quite shiny might be inside?"
	icon_state = "alien_pile1"

/obj/structure/loot_pile/surface/alien
	common_loot = list(
		/obj/item/prop/alien/junk
	)

// May contain alien tools.
/obj/structure/loot_pile/surface/alien/engineering
	uncommon_loot = list(
		/obj/item/multitool/alien, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/cable_coil/alien,
		/obj/item/tool/crowbar/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench/alien // CHOMPEdit - Removal of obj/item/weapon
	)
	rare_loot = list(
		/obj/item/storage/belt/utility/alien/full // CHOMPEdit - Removal of obj/item/weapon
	)

// May contain alien surgery equipment or powerful medication.
/obj/structure/loot_pile/surface/alien/medical
	uncommon_loot = list(
		/obj/item/surgical/FixOVein/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/bone_clamp/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/cautery/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/circular_saw/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/hemostat/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/retractor/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/scalpel/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/surgicaldrill/alien // CHOMPEdit - Removal of obj/item/weapon
	)
	rare_loot = list(
		/obj/item/storage/belt/medical/alien // CHOMPEdit - Removal of obj/item/weapon
	)

// May contain powercells or alien weaponry.
/obj/structure/loot_pile/surface/alien/security
	uncommon_loot = list(
		/obj/item/cell/device/weapon/recharge/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/armor/alien,
		/obj/item/clothing/head/helmet/alien
	)
	rare_loot = list(
		/obj/item/clothing/suit/armor/alien/tank,
		/obj/item/gun/energy/alien // CHOMPEdit - Removal of obj/item/weapon
	)

// The pile found at the very end, and as such has the best loot.
/obj/structure/loot_pile/surface/alien/end
	chance_uncommon = 30
	chance_rare = 10

	common_loot = list(
		/obj/item/multitool/alien, // CHOMPEdit - Removal of obj/item/device
		/obj/item/stack/cable_coil/alien,
		/obj/item/tool/crowbar/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/FixOVein/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/bone_clamp/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/cautery/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/circular_saw/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/hemostat/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/retractor/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/scalpel/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/surgicaldrill/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device/weapon/recharge/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/armor/alien,
		/obj/item/clothing/head/helmet/alien,
		/obj/item/gun/energy/alien // CHOMPEdit - Removal of obj/item/weapon
	)
	uncommon_loot = list(
		/obj/item/storage/belt/medical/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/utility/alien/full, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/armor/alien/tank,
		/obj/item/clothing/head/helmet/alien/tank,
	)

/obj/structure/loot_pile/surface/bones
    name = "bone pile"
    desc = "A pile of various dusty bones. Your graverobbing instincts tell you there might be valuables here."
    icon = 'icons/obj/bones.dmi'
    icon_state = "bonepile"
    delete_on_depletion = TRUE

    common_loot = list(
        /obj/item/bone, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/bone/skull, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/bone/skull/tajaran, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/bone/skull/unathi, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/bone/skull/unknown, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/bone/leg, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/bone/arm, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/bone/ribs, // CHOMPEdit - Removal of obj/item/weapon
    )
    uncommon_loot = list(
        /obj/item/coin/gold, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/coin/silver, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/deck/tarot, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/flame/lighter/zippo/gold, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/flame/lighter/zippo/black, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/material/knife/tacknife/survival, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/material/knife/tacknife/combatknife, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/material/knife/machete/hatchet, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/material/knife/butch, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/storage/wallet/random, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/clothing/accessory/bracelet/material/gold,
        /obj/item/clothing/accessory/bracelet/material/silver,
        /obj/item/clothing/accessory/locket,
        /obj/item/clothing/accessory/poncho/blue,
        /obj/item/clothing/shoes/boots/cowboy,
        /obj/item/clothing/suit/storage/toggle/bomber,
        /obj/item/clothing/under/frontier,
        /obj/item/clothing/under/overalls,
        /obj/item/clothing/under/pants/classicjeans/ripped,
        /obj/item/clothing/under/sl_suit
    )
    rare_loot = list(
        /obj/item/storage/belt/utility/alien/full, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/gun/projectile/revolver, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/gun/projectile/sec, // CHOMPEdit - Removal of obj/item/weapon
        /obj/item/gun/launcher/crossbow // CHOMPEdit - Removal of obj/item/weapon
    )

// Subtype for mecha and mecha accessories. These might not always be on the surface.
/obj/structure/loot_pile/mecha
	name = "pod wreckage"
	desc = "The ruins of some unfortunate pod. Perhaps something is salvageable."
	icon = 'icons/mecha/mecha.dmi'
	icon_state = "engineering_pod-broken"
	density = TRUE
	anchored = FALSE // In case a dead mecha-mob dies in a bad spot.

	chance_uncommon = 20
	chance_rare = 10

	loot_depletion = TRUE
	loot_left = 9

	common_loot = list(
		/obj/random/tool,
		/obj/random/tool,
		/obj/random/tool,
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/random/tech_supply/component,
		/obj/random/tech_supply/component,
		/obj/effect/decal/remains/lizard,
		/obj/effect/decal/remains/mouse,
		/obj/effect/decal/remains/robot,
		/obj/item/stack/material/steel{amount = 40}
		)

	uncommon_loot = list(
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/taser,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser,
		/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp,
		/obj/item/mecha_parts/mecha_equipment/tool/drill,
		/obj/item/mecha_parts/mecha_equipment/generator
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser,
		/obj/item/mecha_parts/mecha_equipment/generator/nuclear,
		/obj/item/mecha_parts/mecha_equipment/tool/jetpack
		)

//Stuff you may find attached to a ripley.
/obj/structure/loot_pile/mecha/ripley
	name = "ripley wreckage"
	desc = "The ruins of some unfortunate ripley. Perhaps something is salvageable."
	icon_state = "ripley-broken"

	common_loot = list(
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/item/stack/material/steel{amount = 25},
		/obj/item/stack/material/glass{amount = 10},
		/obj/item/stack/material/plasteel{amount = 5},
		/obj/item/mecha_parts/chassis/ripley,
		/obj/item/mecha_parts/part/ripley_torso,
		/obj/item/mecha_parts/part/ripley_left_arm,
		/obj/item/mecha_parts/part/ripley_right_arm,
		/obj/item/mecha_parts/part/ripley_left_leg,
		/obj/item/mecha_parts/part/ripley_right_leg,
		/obj/item/kit/paint/ripley, // CHOMPEdit - Removal of obj/item/device
		/obj/item/kit/paint/ripley/flames_red, // CHOMPEdit - Removal of obj/item/device
		/obj/item/kit/paint/ripley/flames_blue // CHOMPEdit - Removal of obj/item/device
		)

	uncommon_loot = list(
		/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp,
		/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill,
		/obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster,
		/obj/item/mecha_parts/mecha_equipment/tool/extinguisher,
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/gravcatapult,
		/obj/item/mecha_parts/mecha_equipment/tool/rcd,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/flamer/rigged
		)

/obj/structure/loot_pile/mecha/ripley/firefighter
	icon_state = "firefighter-broken"

/obj/structure/loot_pile/mecha/ripley/random_sprite
	icon_states_to_use = list("ripley-broken", "firefighter-broken", "ripley-broken-old")

//Death-Ripley, same common, but more combat-exosuit-based
/obj/structure/loot_pile/mecha/deathripley
	name = "strange ripley wreckage"
	icon_state = "deathripley-broken"

	common_loot = list(
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/item/stack/material/steel{amount = 40},
		/obj/item/stack/material/glass{amount = 20},
		/obj/item/stack/material/plasteel{amount = 10},
		/obj/item/mecha_parts/chassis/ripley,
		/obj/item/mecha_parts/part/ripley_torso,
		/obj/item/mecha_parts/part/ripley_left_arm,
		/obj/item/mecha_parts/part/ripley_right_arm,
		/obj/item/mecha_parts/part/ripley_left_leg,
		/obj/item/mecha_parts/part/ripley_right_leg,
		/obj/item/kit/paint/ripley/death // CHOMPEdit - Removal of obj/item/device
		)

	uncommon_loot = list(
		/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/safety,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser,
		/obj/item/mecha_parts/mecha_equipment/repair_droid,
		/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/tool/rcd,
		/obj/item/mecha_parts/mecha_equipment/wormhole_generator,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/flamer/rigged
		)

/obj/structure/loot_pile/mecha/odysseus
	name = "odysseus wreckage"
	desc = "The ruins of some unfortunate odysseus. Perhaps something is salvageable."
	icon_state = "odysseus-broken"

	common_loot = list(
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/item/stack/material/steel{amount = 25},
		/obj/item/stack/material/glass{amount = 10},
		/obj/item/stack/material/plasteel{amount = 5},
		/obj/item/mecha_parts/chassis/odysseus,
		/obj/item/mecha_parts/part/odysseus_head,
		/obj/item/mecha_parts/part/odysseus_torso,
		/obj/item/mecha_parts/part/odysseus_left_arm,
		/obj/item/mecha_parts/part/odysseus_right_arm,
		/obj/item/mecha_parts/part/odysseus_left_leg,
		/obj/item/mecha_parts/part/odysseus_right_leg
		)

	uncommon_loot = list(
		/obj/item/mecha_parts/mecha_equipment/tool/sleeper,
		/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun,
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/flare,
		/obj/item/mecha_parts/mecha_equipment/tool/extinguisher,
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/gravcatapult,
		/obj/item/mecha_parts/mecha_equipment/anticcw_armor_booster,
		/obj/item/mecha_parts/mecha_equipment/shocker
		)

/obj/structure/loot_pile/mecha/odysseus/murdysseus
	icon_state = "murdysseus-broken"

/obj/structure/loot_pile/mecha/hoverpod
	name = "hoverpod wreckage"
	desc = "The ruins of some unfortunate hoverpod. Perhaps something is salvageable."
	icon_state = "engineering_pod"

/obj/structure/loot_pile/mecha/gygax
	name = "gygax wreckage"
	desc = "The ruins of some unfortunate gygax. Perhaps something is salvageable."
	icon_state = "gygax-broken"

	common_loot = list(
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/item/stack/material/steel{amount = 25},
		/obj/item/stack/material/glass{amount = 10},
		/obj/item/stack/material/plasteel{amount = 5},
		/obj/item/mecha_parts/chassis/gygax,
		/obj/item/mecha_parts/part/gygax_head,
		/obj/item/mecha_parts/part/gygax_torso,
		/obj/item/mecha_parts/part/gygax_left_arm,
		/obj/item/mecha_parts/part/gygax_right_arm,
		/obj/item/mecha_parts/part/gygax_left_leg,
		/obj/item/mecha_parts/part/gygax_right_leg,
		/obj/item/mecha_parts/part/gygax_armour
		)

	uncommon_loot = list(
		/obj/item/mecha_parts/mecha_equipment/shocker,
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/grenade,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/taser,
		/obj/item/kit/paint/gygax, // CHOMPEdit - Removal of obj/item/device
		/obj/item/kit/paint/gygax/darkgygax, // CHOMPEdit - Removal of obj/item/device
		/obj/item/kit/paint/gygax/recitence // CHOMPEdit - Removal of obj/item/device
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay,
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg,
		/obj/item/mecha_parts/mecha_equipment/repair_droid,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy
		)

/obj/structure/loot_pile/mecha/gygax/dark
	icon_state = "darkgygax-broken"

// Todo: Better loot.
/obj/structure/loot_pile/mecha/gygax/dark/adv
	icon_state = "darkgygax_adv-broken"
	icon_scale_x = 1.5
	icon_scale_y = 1.5
	pixel_y = 8

/obj/structure/loot_pile/mecha/gygax/medgax
	icon_state = "medgax-broken"

/obj/structure/loot_pile/mecha/durand
	name = "durand wreckage"
	desc = "The ruins of some unfortunate durand. Perhaps something is salvageable."
	icon_state = "durand-broken"

	common_loot = list(
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/item/stack/material/steel{amount = 25},
		/obj/item/stack/material/glass{amount = 10},
		/obj/item/stack/material/plasteel{amount = 5},
		/obj/item/mecha_parts/chassis/durand,
		/obj/item/mecha_parts/part/durand_head,
		/obj/item/mecha_parts/part/durand_torso,
		/obj/item/mecha_parts/part/durand_left_arm,
		/obj/item/mecha_parts/part/durand_right_arm,
		/obj/item/mecha_parts/part/durand_left_leg,
		/obj/item/mecha_parts/part/durand_right_leg,
		/obj/item/mecha_parts/part/durand_armour
		)

	uncommon_loot = list(
		/obj/item/mecha_parts/mecha_equipment/shocker,
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/grenade,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser,
		/obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster,
		/obj/item/kit/paint/durand, // CHOMPEdit - Removal of obj/item/device
		/obj/item/kit/paint/durand/seraph, // CHOMPEdit - Removal of obj/item/device
		/obj/item/kit/paint/durand/phazon // CHOMPEdit - Removal of obj/item/device
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay,
		/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot,
		/obj/item/mecha_parts/mecha_equipment/repair_droid,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy
		)

/obj/structure/loot_pile/mecha/marauder
	name = "marauder wreckage"
	desc = "The ruins of some unfortunate marauder. Perhaps something is salvagable."
	icon_state = "marauder-broken"
	// Todo: Better loot.

/obj/structure/loot_pile/mecha/marauder/seraph
	name = "seraph wreckage"
	desc = "The ruins of some unfortunate seraph. Perhaps something is salvagable."
	icon_state = "seraph-broken"

/obj/structure/loot_pile/mecha/marauder/mauler
	name = "mauler wreckage"
	desc = "The ruins of some unfortunate mauler. Perhaps something is salvagable."
	icon_state = "mauler-broken"

/obj/structure/loot_pile/mecha/phazon
	name = "phazon wreckage"
	desc = "The ruins of some unfortunate phazon. Perhaps something is salvageable."
	icon_state = "phazon-broken"

	common_loot = list(
		/obj/item/storage/toolbox/syndicate/powertools, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stack/material/plasteel{amount = 20},
		/obj/item/stack/material/durasteel{amount = 10},
		/obj/item/mecha_parts/chassis/phazon,
		/obj/item/mecha_parts/part/phazon_head,
		/obj/item/mecha_parts/part/phazon_torso,
		/obj/item/mecha_parts/part/phazon_left_arm,
		/obj/item/mecha_parts/part/phazon_right_arm,
		/obj/item/mecha_parts/part/phazon_left_leg,
		/obj/item/mecha_parts/part/phazon_right_leg
		)

	uncommon_loot = list(
		/obj/item/mecha_parts/mecha_equipment/shocker,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/flamer/rigged,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy,
		/obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster
		)

	rare_loot = list(
		/obj/item/mecha_parts/mecha_equipment/tesla_energy_relay,
		/obj/item/mecha_parts/mecha_equipment/weapon/energy/ion,
		/obj/item/mecha_parts/mecha_equipment/repair_droid,
		/obj/item/mecha_parts/mecha_equipment/teleporter
		)

/obj/structure/loot_pile/surface/drone
	name = "drone wreckage"
	desc = "The ruins of some unfortunate drone. Perhaps something is salvageable."
	icon = 'icons/mob/animal.dmi'
	icon_state = "drone_dead"

// Since the actual drone loot is a bit stupid in how it is handled, this is a sparse and empty list with items I don't exactly want in it. But until we can get the proper items in . . .

	common_loot = list(
		/obj/random/tool,
		/obj/item/stack/cable_coil/random,
		/obj/random/tank,
		/obj/random/tech_supply/component,
		/obj/item/stack/material/steel{amount = 25},
		/obj/item/stack/material/glass{amount = 10},
		/obj/item/stack/material/plasteel{amount = 5},
		/obj/item/cell, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/material/shard // CHOMPEdit - Removal of obj/item/weapon
		)

	uncommon_loot = list(
		/obj/item/cell/high, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/robot_parts/robot_component/actuator,
		/obj/item/robot_parts/robot_component/armour,
		/obj/item/robot_parts/robot_component/binary_communication_device,
		/obj/item/robot_parts/robot_component/camera,
		/obj/item/robot_parts/robot_component/diagnosis_unit,
		/obj/item/robot_parts/robot_component/radio
		)

	rare_loot = list(
		/obj/item/cell/super, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/borg/upgrade/utility/restart,
		/obj/item/borg/upgrade/advanced/jetpack,
		/obj/item/borg/upgrade/restricted/tasercooler,
		/obj/item/borg/upgrade/basic/syndicate,
		/obj/item/borg/upgrade/basic/vtec
		)

// Contains old mediciation, most of it unidentified and has a good chance of being useless.
/obj/structure/loot_pile/surface/medicine_cabinet
	name = "abandoned medicine cabinet"
	desc = "An old cabinet, it might still have something of use inside."
	icon_state = "medicine_cabinet"
	density = FALSE
	chance_uncommon = 0
	chance_rare = 0

	common_loot = list(
		/obj/random/unidentified_medicine/old_medicine
	)

// Like the above but has way better odds, in exchange for being in a place still inhabited (or was recently).
/obj/structure/loot_pile/surface/medicine_cabinet/fresh
	name = "medicine cabinet"
	desc = "A cabinet designed to hold medicine, it might still have something of use inside."
	icon_state = "medicine_cabinet"
	density = FALSE

	common_loot = list(
		/obj/random/unidentified_medicine/fresh_medicine
	)
