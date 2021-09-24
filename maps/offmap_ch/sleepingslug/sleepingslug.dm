///////////////////////////
//// Spawning and despawning
var/global/list/latejoin_sleeping_slug = list()
/obj/effect/landmark/sleeping_slug
	name = "JoinLateSleepingSlug"
	delete_me = 1

/obj/effect/landmark/sleeping_slug/New()
	latejoin_sleeping_slug += loc // Register this turf as tram latejoin.
	..()

/datum/spawnpoint/sleeping_slug
	display_name = "ITV Sleeping Slug Cryo"
	restrict_job = list("Sleeping Slug Captain", "Sleeping Slug Pilot", "Sleeping Slug Engineer", "Sleeping Slug Doctor", "Sleeping Slug Guard")
	msg = "has come out of cryostasis"
	announce_channel = "Sleeping_Slug"

/datum/spawnpoint/sleeping_slug/New()
	..()
	turfs = latejoin_sleeping_slug

/obj/machinery/cryopod/sleeping_slug
	announce_channel = "Sleeping_Slug"
	on_store_message = "has entered cryogenic storage."
	on_store_name = "ITV Sleeping Slug Cryo"
	on_enter_visible_message = "starts climbing into the"
	on_enter_occupant_message = "You feel cool air surround you. You go numb as your senses turn inward."
	on_store_visible_message_1 = "hums and hisses as it moves"
	on_store_visible_message_2 = "into cryogenic storage."

/obj/machinery/cryopod/robot/sleeping_slug
	announce_channel = "Sleeping_Slug"
	on_store_name = "ITV Sleeping Slug Robotic Storage"

/obj/effect/landmark/map_data/sleeping_slug
	height = 1

///////////////////////////
//// The Sleeping Slug
/obj/effect/overmap/visitable/ship/sleeping_slug
	name = "ITV Sleeping Slug"
	icon_state = "oberth_destroyer"
	scanner_desc = @{"[i]Registration[/i]: ITV Sleeping Slug
[i]Class[/i]: Trade Ship
[i]Transponder[/i]: Transmitting (CIV)
[b]Notice[/b]: Independent trader vessel"}
	vessel_mass = 10000
	vessel_size = SHIP_SIZE_LARGE
	initial_generic_waypoints = list("sleeping_slug_v2_near_fore_port", "sleeping_slug_v2_near_fore_star", "sleeping_slug_v2_near_aft_port", "sleeping_slug_v2_near_aft_star", "sleeping_slug_v2_wing_port", "sleeping_slug_v2_wing_star")
	initial_restricted_waypoints = list("Sleeping Slug's Shuttle" = list("offmap_spawn_sleeping_slugboat"))

//	skybox_icon = 'sleeping_slug.dmi'
//	skybox_icon_state = "skybox"
//	skybox_pixel_x = 270
//	skybox_pixel_y = 60

	levels_for_distress = list(1)
	unowned_areas = list(/area/shuttle/sleeping_slugboat)

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/sleeping_slugboat
	name = "shuttle control console"
	shuttle_tag = "Sleeping Slug's Shuttle"
	req_one_access = list(access_sleeping_slug)

/obj/effect/overmap/visitable/ship/landable/sleeping_slug_boat
	name = "ITV Sleeping Slug Shuttle"
	desc = "A small shuttle from the ITV Sleeping Slug."
	vessel_mass = 100
	vessel_size = SHIP_SIZE_TINY
	shuttle = "Sleeping Slug's Shuttle"

// A shuttle lateloader landmark
/obj/effect/shuttle_landmark/shuttle_initializer/sleeping_slugboat
	name = "Sleeping Slug's shuttle bay"
	base_area = /area/sleeping_slug/hangar
	base_turf = /turf/simulated/floor/tiled/eris/dark/techfloor
	landmark_tag = "offmap_spawn_sleeping_slugboat"
	docking_controller = "sleeping_slug_boatbay"
	shuttle_type = /datum/shuttle/autodock/overmap/sleeping_slugboat

// The sleeping_slug's boat
/datum/shuttle/autodock/overmap/sleeping_slugboat
	name = "Sleeping Slug's Shuttle"
	current_location = "offmap_spawn_sleeping_slugboat"
	docking_controller_tag = "sleeping_slugboat_docker"
	shuttle_area = /area/shuttle/sleeping_slugboat
	fuel_consumption = 2
	defer_initialisation = TRUE

/area/shuttle/sleeping_slugboat
	name = "Sleeping Slug's Shuttle"
	requires_power = 1
	icon = 'icons/turf/areas_ch_sleeping_slug.dmi'
	icon_state = "green"

///////////////////////////
//// The Various Machines
/obj/machinery/telecomms/allinone/sleeping_slug
	freq_listening = list(PUB_FREQ, SLEEPING_SLUG_FREQ)


//Prevents remote control of drones
/obj/machinery/drone_fabricator/sleeping_slug
	name = "somewhat glitchy drone fabricator"
	desc = "Obtained from a derelict, it seems to work sometimes, not work sometimes, and work TOO good sometimes. Didn't come with a control console either..."
	drone_type = /mob/living/silicon/robot/drone/sleeping_slug

/mob/living/silicon/robot/drone/sleeping_slug
	foreign_droid = TRUE
	idcard_type = /obj/item/weapon/card/id/synthetic/sleeping_slug

/obj/item/weapon/card/id/synthetic/sleeping_slug
	name = "\improper Sleeping Slug synthetic ID"
	desc = "Access module for Sleeping Slug synthetics"
	icon_state = "id-robot"
	item_state = "tdgreen"
	assignment = "Sleeping Slug synthetic"

/obj/item/weapon/card/id/synthetic/sleeping_slug/Initialize()
	. = ..()
	access = list(access_sleeping_slug, access_synth)

/obj/machinery/power/smes/buildable/offmap_spawn/New()
	..(1)
	charge = 1e7
	RCon = TRUE
	input_level = input_level_max
	output_level = output_level_max
	input_attempt = TRUE

/obj/machinery/power/apc/sleeping_slug
	req_access = list()
	req_one_access = list(access_sleeping_slug)

/obj/machinery/power/apc/sleeping_slug/hyper
	cell_type = /obj/item/weapon/cell/hyper

/obj/machinery/alarm/sleeping_slug
	req_access = list()
	req_one_access = list(access_sleeping_slug)

/obj/machinery/door/firedoor/glass/sleeping_slug
	req_access = list()
	req_one_access = list(access_sleeping_slug)

/obj/machinery/door/firedoor/glass/sleeping_slug/hidden
	name = "\improper Emergency Shutter System"
	desc = "Emergency air-tight shutter, capable of sealing off breached areas. This model fits flush with the walls, and has a panel in the floor for maintenance."
	icon = 'icons/obj/doors/DoorHazardHidden.dmi'

/obj/machinery/camera/network/sleeping_slug
	network = list(NETWORK_SLEEPING_SLUG_SHIP)

/obj/machinery/photocopier/faxmachine/sleeping_slug
	department = "ITV Sleeping Slug"
	desc = "The ship's fax machine! It's a safe assumption that most of the departments listed aren't on your ship, since the ship only has one."

/obj/item/clothing/head/helmet/space/void/captain/sleeping_slug
	name = "sleeping_slug captain's voidsuit helmet"
	camera_networks = list(NETWORK_SLEEPING_SLUG_HELMETS)
/obj/item/clothing/suit/space/void/captain/sleeping_slug
	name = "sleeping_slug captain's voidsuit"

/obj/item/clothing/head/helmet/space/void/security/sleeping_slug
	name = "sleeping_slug guard's voidsuit helmet"
	camera_networks = list(NETWORK_SLEEPING_SLUG_HELMETS)
/obj/item/clothing/suit/space/void/security/sleeping_slug
	name = "sleeping_slug guard's voidsuit"

/obj/item/clothing/head/helmet/space/void/medical/sleeping_slug
	name = "sleeping_slug doctor's voidsuit helmet"
	camera_networks = list(NETWORK_SLEEPING_SLUG_HELMETS)
/obj/item/clothing/suit/space/void/medical/sleeping_slug
	name = "sleeping_slug doctor's voidsuit"

/obj/item/clothing/head/helmet/space/void/atmos/sleeping_slug
	name = "sleeping_slug engineer's voidsuit helmet"
	camera_networks = list(NETWORK_SLEEPING_SLUG_HELMETS)
/obj/item/clothing/suit/space/void/atmos/sleeping_slug
	name = "sleeping_slug engineer's voidsuit"

/obj/item/clothing/head/helmet/space/void/pilot/sleeping_slug
	name = "sleeping_slug pilot's voidsuit helmet"
	camera_networks = list(NETWORK_SLEEPING_SLUG_HELMETS)
/obj/item/clothing/suit/space/void/pilot/sleeping_slug
	name = "sleeping_slug pilot's voidsuit"

/obj/item/device/gps/command/sleeping_slugcap
	gps_tag = "SLSC"
/obj/item/device/gps/security/sleeping_slugguard
	gps_tag = "SLSG"
/obj/item/device/gps/medical/sleeping_slugmed
	gps_tag = "SLSM"
/obj/item/device/gps/engineering/sleeping_slugeng
	gps_tag = "SLSE"
/obj/item/device/gps/explorer/sleeping_slugpilot
	gps_tag = "SLSP"

/obj/structure/closet/secure_closet/sleeping_slug_captain
	name = "sleeping_slug captain's locker"
	req_access = list(access_sleeping_slug)
	closet_appearance = /decl/closet_appearance/secure_closet/sleeping_slug/captain

	starts_with = list(
		/obj/item/weapon/storage/backpack/dufflebag/captain,
		/obj/item/clothing/suit/storage/vest,
		/obj/item/weapon/melee/telebaton,
		/obj/item/device/flash,
		/obj/item/device/radio/headset/sleeping_slug,
		/obj/item/clothing/head/helmet/space/void/refurb/officer/sleeping_slug,
		/obj/item/clothing/suit/space/void/refurb/officer/sleeping_slug,
		/obj/item/weapon/tank/oxygen,
		/obj/item/device/suit_cooling_unit,
		/obj/item/device/gps/command/sleeping_slugcap
	)

/obj/structure/closet/secure_closet/sleeping_slug_guard
	name = "sleeping_slug guard's locker"
	req_access = list(access_sleeping_slug)
	closet_appearance = /decl/closet_appearance/secure_closet/sleeping_slug/guard

	starts_with = list(
		/obj/item/clothing/suit/armor/pcarrier/light,
		/obj/item/clothing/under/utility,
		/obj/item/clothing/shoes/boots/jackboots,
		/obj/item/clothing/shoes/boots/jackboots/toeless,
		/obj/item/weapon/handcuffs = 2,
		/obj/item/weapon/gun/energy/stunrevolver,
		/obj/item/clothing/accessory/armor/tag/sec,
		/obj/item/device/flash,
		/obj/item/device/flashlight/maglight,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/weapon/storage/belt/security,
		/obj/item/device/radio/headset/sleeping_slug,
		/obj/item/clothing/accessory/solgov/department/security/army,
		/obj/item/clothing/head/helmet/space/void/refurb/marine/sleeping_slug,
		/obj/item/clothing/suit/space/void/refurb/marine/sleeping_slug,
		/obj/item/weapon/tank/oxygen,
		/obj/item/device/suit_cooling_unit,
		/obj/item/device/gps/security/sleeping_slugguard,
		/obj/item/weapon/melee/baton
	)

/obj/structure/closet/secure_closet/sleeping_slug_doctor
	name = "sleeping_slug doctor's locker"
	req_access = list(access_sleeping_slug)
	closet_appearance = /decl/closet_appearance/secure_closet/sleeping_slug/doctor

	starts_with = list(
		/obj/item/clothing/under/rank/medical,
		/obj/item/clothing/under/rank/nurse,
		/obj/item/clothing/under/rank/orderly,
		/obj/item/clothing/suit/storage/toggle/labcoat/modern,
		/obj/item/clothing/suit/storage/toggle/fr_jacket,
		/obj/item/clothing/shoes/white,
		/obj/item/device/radio/headset/sleeping_slug,
		/obj/item/clothing/head/helmet/space/void/refurb/medical/alt/sleeping_slug,
		/obj/item/clothing/suit/space/void/refurb/medical/sleeping_slug,
		/obj/item/weapon/tank/oxygen,
		/obj/item/device/suit_cooling_unit,
		/obj/item/device/gps/medical/sleeping_slugmed
	)

/obj/structure/closet/secure_closet/sleeping_slug_engineer
	name = "sleeping_slug engineer's locker"
	req_access = list(access_sleeping_slug)
	closet_appearance = /decl/closet_appearance/secure_closet/sleeping_slug/engineer

	starts_with = list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/device/flashlight,
		/obj/item/weapon/extinguisher,
		/obj/item/clamp,
		/obj/item/device/radio/headset/sleeping_slug,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas,
		/obj/item/taperoll/atmos,
		/obj/item/weapon/tank/emergency/oxygen/engi,
		/obj/item/clothing/head/helmet/space/void/refurb/engineering/sleeping_slug,
		/obj/item/clothing/suit/space/void/refurb/engineering/sleeping_slug,
		/obj/item/weapon/tank/oxygen,
		/obj/item/device/suit_cooling_unit,
		/obj/item/device/gps/engineering/sleeping_slugeng
	)

/obj/structure/closet/secure_closet/sleeping_slug_pilot
	name = "sleeping_slug pilot's locker"
	req_access = list(access_sleeping_slug)
	closet_appearance = /decl/closet_appearance/secure_closet/sleeping_slug/pilot

	starts_with = list(
		/obj/item/weapon/material/knife/tacknife/survival,
		/obj/item/clothing/head/pilot,
		/obj/item/clothing/under/rank/pilot1,
		/obj/item/clothing/suit/storage/toggle/bomber/pilot,
		/obj/item/clothing/gloves/fingerless,
		/obj/item/weapon/reagent_containers/food/snacks/liquidfood,
		/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle,
		/obj/item/device/radio,
		/obj/item/clothing/under/utility/blue,
		/obj/item/clothing/accessory/solgov/specialty/pilot,
		/obj/item/clothing/shoes/boots/jackboots,
		/obj/item/clothing/shoes/boots/jackboots/toeless,
		/obj/item/device/radio/headset/sleeping_slug,
		/obj/item/device/flashlight/color/orange,
		/obj/item/clothing/head/helmet/space/void/refurb/pilot/sleeping_slug,
		/obj/item/clothing/suit/space/void/refurb/pilot/sleeping_slug,
		/obj/item/weapon/tank/oxygen,
		/obj/item/device/suit_cooling_unit,
		/obj/item/device/gps/explorer/sleeping_slugpilot
	)

/obj/machinery/vending/medical_sleeping_slug //Not a subtype for *reasons*
	name = "NanoMed Plus"
	desc = "Medical drug dispenser."
	icon_state = "med"
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;Ping!"
	req_access = list(access_sleeping_slug)
	products = list(/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 4,/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/stoxin = 4,/obj/item/weapon/reagent_containers/glass/bottle/toxin = 4,
					/obj/item/weapon/reagent_containers/syringe/antiviral = 4,/obj/item/weapon/reagent_containers/syringe = 12,
					/obj/item/device/healthanalyzer = 5,/obj/item/weapon/reagent_containers/glass/beaker = 4, /obj/item/weapon/reagent_containers/dropper = 2,
					/obj/item/stack/medical/advanced/bruise_pack = 6, /obj/item/stack/medical/advanced/ointment = 6, /obj/item/stack/medical/splint = 4,
					/obj/item/weapon/storage/pill_bottle/carbon = 2, /obj/item/weapon/storage/box/khcrystal = 4, /obj/item/clothing/glasses/omnihud/med = 4,
					/obj/item/device/glasses_kit = 1,  /obj/item/weapon/storage/quickdraw/syringe_case = 4)
	contraband = list(/obj/item/weapon/reagent_containers/pill/tox = 3,/obj/item/weapon/reagent_containers/pill/stox = 4,/obj/item/weapon/reagent_containers/pill/antitox = 6)
	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	req_log_access = access_sleeping_slug
	has_logs = 1

///////////////////////////
//// Computers
// Sleeping Slug helmet cameras
/datum/computer_file/program/camera_monitor/sleeping_slug_helmet
	filename = "talhcammon"
	filedesc = "Helmet Camera Monitoring (Sleeping Slug)"
	extended_desc = "This program allows remote access to Sleeping Slug helmet camera systems."
	size = 4 //Smaller because limited scope
	tguimodule_path = /datum/tgui_module/camera/ntos/sleeping_slug_helmet
	required_access = access_sleeping_slug

// Sleeping Slug ship cameras
/datum/computer_file/program/camera_monitor/sleeping_slug_ship
	filename = "talscammon"
	filedesc = "Ship Camera Monitoring (Sleeping Slug)"
	extended_desc = "This program allows remote access to the Sleeping Slug's camera system."
	size = 10 //Smaller because limited scope
	tguimodule_path = /datum/tgui_module/camera/ntos/sleeping_slug_ship
	required_access = access_sleeping_slug

/datum/tgui_module/camera/ntos/sleeping_slug_ship
	name = "Sleeping Slug Ship Camera Monitor"
/datum/tgui_module/camera/ntos/sleeping_slug_ship/New(host)
	. = ..(host, list(NETWORK_SLEEPING_SLUG_SHIP, NETWORK_THUNDER))

/datum/tgui_module/camera/ntos/sleeping_slug_helmet
	name = "Sleeping Slug Helmet Camera Monitor"
/datum/tgui_module/camera/ntos/sleeping_slug_helmet/New(host)
	. = ..(host, list(NETWORK_SLEEPING_SLUG_HELMETS))

/datum/computer_file/program/power_monitor/sleeping_slug
	filename = "tpowermonitor"
	filedesc = "Power Monitoring (Sleeping Slug)"
	required_access = access_sleeping_slug
/datum/computer_file/program/alarm_monitor/sleeping_slug
	filename = "talarmmonitoreng"
	filedesc = "Alarm Monitoring (Sleeping Slug)"
	required_access = access_sleeping_slug
/datum/computer_file/program/rcon_console/sleeping_slug
	filename = "trconconsole"
	filedesc = "RCON Remote Control (Sleeping Slug)"
	required_access = access_sleeping_slug
/datum/computer_file/program/atmos_control/sleeping_slug
	filename = "tatmoscontrol"
	filedesc = "Atmosphere Control (Sleeping Slug)"
	required_access = access_sleeping_slug
/datum/computer_file/program/suit_sensors/sleeping_slug
	filename = "tsensormonitor"
	filedesc = "Suit Sensors Monitoring (Sleeping Slug)"
	required_access = access_sleeping_slug

// Modular computer/console presets
/obj/item/modular_computer/laptop/preset/custom_loadout/standard/sleeping_slug/pilot
	name = "pilot's laptop"

/obj/item/modular_computer/laptop/preset/custom_loadout/standard/sleeping_slug/pilot/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/ship_nav())

/obj/item/modular_computer/laptop/preset/custom_loadout/standard/sleeping_slug/engineer
	name = "engineer's laptop"

/obj/item/modular_computer/laptop/preset/custom_loadout/standard/sleeping_slug/engineer/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/power_monitor/sleeping_slug())
	hard_drive.store_file(new/datum/computer_file/program/alarm_monitor/sleeping_slug())
	hard_drive.store_file(new/datum/computer_file/program/rcon_console/sleeping_slug())
	hard_drive.store_file(new/datum/computer_file/program/atmos_control/sleeping_slug())

/obj/item/modular_computer/laptop/preset/custom_loadout/standard/sleeping_slug/security
	name = "guard's laptop"

/obj/item/modular_computer/laptop/preset/custom_loadout/standard/sleeping_slug/security/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor/sleeping_slug_ship())

/obj/item/modular_computer/laptop/preset/custom_loadout/standard/sleeping_slug/medical
	name = "doctor's laptop"

/obj/item/modular_computer/laptop/preset/custom_loadout/standard/sleeping_slug/medical/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/suit_sensors/sleeping_slug())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor/sleeping_slug_helmet())
	set_autorun("tsensormonitor")

//Generic modular consoles scattered around
/obj/item/modular_computer/console/preset/sleeping_slug
	name = "sleeping_slug modular computer"

/obj/item/modular_computer/console/preset/sleeping_slug/install_default_hardware()
	..()
	processor_unit = new/obj/item/weapon/computer_hardware/processor_unit(src)
	tesla_link = new/obj/item/weapon/computer_hardware/tesla_link(src)
	hard_drive = new/obj/item/weapon/computer_hardware/hard_drive/super(src)
	network_card = new/obj/item/weapon/computer_hardware/network_card/wired(src)
	nano_printer = new/obj/item/weapon/computer_hardware/nano_printer(src)

/obj/item/modular_computer/console/preset/sleeping_slug/install_default_programs()
	..()
	hard_drive.store_file(new/datum/computer_file/program/power_monitor/sleeping_slug())
	hard_drive.store_file(new/datum/computer_file/program/alarm_monitor/sleeping_slug())
	hard_drive.store_file(new/datum/computer_file/program/rcon_console/sleeping_slug())
	hard_drive.store_file(new/datum/computer_file/program/atmos_control/sleeping_slug())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor/sleeping_slug_ship())
	hard_drive.store_file(new/datum/computer_file/program/suit_sensors/sleeping_slug())
	hard_drive.store_file(new/datum/computer_file/program/camera_monitor/sleeping_slug_helmet())

/obj/effect/shuttle_landmark/premade/sleeping_slug_v2_near_fore_port
	name = "Near ITV Sleeping Slug (Fore-Port)"
	landmark_tag = "sleeping_slug_v2_near_fore_port"

/obj/effect/shuttle_landmark/premade/sleeping_slug_v2_near_fore_star
	name = "Near ITV Sleeping Slug (Fore-Starboard)"
	landmark_tag = "sleeping_slug_v2_near_fore_star"

/obj/effect/shuttle_landmark/premade/sleeping_slug_v2_near_aft_port
	name = "Near ITV Sleeping Slug (Aft-Port)"
	landmark_tag = "sleeping_slug_v2_near_aft_port"

/obj/effect/shuttle_landmark/premade/sleeping_slug_v2_near_aft_star
	name = "Near ITV Sleeping Slug (Aft-Starboard)"
	landmark_tag = "sleeping_slug_v2_near_aft_star"

/obj/effect/shuttle_landmark/premade/sleeping_slug_v2_wing_port
	name = "ITV Sleeping Slug (Port Wingtip)"
	landmark_tag = "sleeping_slug_v2_wing_port"

/obj/effect/shuttle_landmark/premade/sleeping_slug_v2_wing_star
	name = "ITV Sleeping Slug (Starboard Wingtip)"
	landmark_tag = "sleeping_slug_v2_wing_star"

/obj/random/multiple/corp_crate/sleeping_slug_cargo
	name = "random corporate crate (sleeping_slug)"
	desc = "A random corporate crate with thematic contents. No weapons, no SAARE cashbox, 50% chance to not appear."
	icon = 'icons/obj/storage.dmi'
	spawn_nothing_percentage = 50
	icon_state = "crate"

/obj/random/multiple/ore_pile/sleeping_slug
	name = "random ore pile (sleeping_slug)"
	desc = "A pile of random ores. High chance of a larger pile of common ores, lower chances of small piles of rarer ores. No verdantium, reduced item counts vs normal ore craes."
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore_clown"


/obj/random/multiple/ore_pile/sleeping_slug/item_to_spawn()
	return pick(
			prob(10);list(
				/obj/item/weapon/ore/coal,
				/obj/item/weapon/ore/coal,
				/obj/item/weapon/ore/coal,
				/obj/item/weapon/ore/coal,
				/obj/item/weapon/ore/coal,
				/obj/item/weapon/ore/coal,
				/obj/item/weapon/ore/coal,
				/obj/item/weapon/ore/coal,
				/obj/item/weapon/ore/coal,
				/obj/item/weapon/ore/coal
			),
			prob(3);list(
				/obj/item/weapon/ore/diamond,
				/obj/item/weapon/ore/diamond
			),
			prob(15);list(
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass,
				/obj/item/weapon/ore/glass
			),
			prob(5);list(
				/obj/item/weapon/ore/gold,
				/obj/item/weapon/ore/gold,
				/obj/item/weapon/ore/gold,
				/obj/item/weapon/ore/gold,
				/obj/item/weapon/ore/gold
			),
			prob(2);list(
				/obj/item/weapon/ore/hydrogen
			),
			prob(10);list(
				/obj/item/weapon/ore/iron,
				/obj/item/weapon/ore/iron,
				/obj/item/weapon/ore/iron,
				/obj/item/weapon/ore/iron,
				/obj/item/weapon/ore/iron,
				/obj/item/weapon/ore/iron,
				/obj/item/weapon/ore/iron,
				/obj/item/weapon/ore/iron,
				/obj/item/weapon/ore/iron,
				/obj/item/weapon/ore/iron
			),
			prob(10);list(
				/obj/item/weapon/ore/lead,
				/obj/item/weapon/ore/lead,
				/obj/item/weapon/ore/lead,
				/obj/item/weapon/ore/lead,
				/obj/item/weapon/ore/lead,
				/obj/item/weapon/ore/lead,
				/obj/item/weapon/ore/lead,
				/obj/item/weapon/ore/lead,
				/obj/item/weapon/ore/lead,
				/obj/item/weapon/ore/lead
			),
			prob(5);list(
				/obj/item/weapon/ore/marble,
				/obj/item/weapon/ore/marble,
				/obj/item/weapon/ore/marble,
				/obj/item/weapon/ore/marble
			),
			prob(3);list(
				/obj/item/weapon/ore/osmium,
				/obj/item/weapon/ore/osmium
			),
			prob(5);list(
				/obj/item/weapon/ore/phoron,
				/obj/item/weapon/ore/phoron,
				/obj/item/weapon/ore/phoron,
				/obj/item/weapon/ore/phoron
			),
			prob(5);list(
				/obj/item/weapon/ore/silver,
				/obj/item/weapon/ore/silver,
				/obj/item/weapon/ore/silver,
				/obj/item/weapon/ore/silver
			),
			prob(3);list(
				/obj/item/weapon/ore/uranium,
				/obj/item/weapon/ore/uranium
			),
		)

/obj/random/multiple/corp_crate/sleeping_slug_cargo/item_to_spawn()
	return pick(
			prob(10);list(
				/obj/random/tank,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/aether //AETHER AIRSUPPLY
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/multiple/voidsuit/vintage,
				/obj/random/tank,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/aether //AETHER OLDSUITS
			),
			prob(10);list(
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/random/mre,
				/obj/structure/closet/crate/centauri //CENTAURI MRES
			),
			prob(10);list(
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/random/drinksoft,
				/obj/structure/closet/crate/freezer/centauri //CENTAURI SODA
			),
			prob(10);list(
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/random/snack,
				/obj/structure/closet/crate/freezer/centauri //CENTAURI SNACKS
			),
			prob(10);list(
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/random/powercell,
				/obj/structure/closet/crate/einstein //EINSTEIN BATTERYPACK
			),
			prob(5);list(
				/obj/item/weapon/circuitboard/smes,
				/obj/random/smes_coil,
				/obj/random/smes_coil,
				/obj/structure/closet/crate/focalpoint //FOCAL SMES
			),
			prob(10);list(
				/obj/item/weapon/module/power_control,
				/obj/item/stack/cable_coil,
				/obj/item/frame/apc,
				/obj/item/weapon/cell/apc,
				/obj/structure/closet/crate/focalpoint //FOCAL APC
			),
			prob(5);list(
				/obj/random/drinkbottle,
				/obj/random/drinkbottle,
				/obj/random/drinkbottle,
				/obj/random/cigarettes,
				/obj/random/cigarettes,
				/obj/random/cigarettes,
				/obj/structure/closet/crate/gilthari //GILTHARI LUXURY
			),
			prob(10);list(
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/random/tech_supply/component/nofail,
				/obj/structure/closet/crate/grayson //GRAYSON TECH
			),
			prob(15);list(
				/obj/random/multiple/ore_pile/sleeping_slug,
				/obj/random/multiple/ore_pile/sleeping_slug,
				/obj/random/multiple/ore_pile/sleeping_slug,
				/obj/structure/closet/crate/grayson //GRAYSON ORES (TALON-ADJUSTED)
			),
			prob(10);list(
				/obj/random/material,
				/obj/random/material,
				/obj/random/material,
				/obj/structure/closet/crate/grayson //GRAYSON MATS (TALON-ADJUSTED)
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/security,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/secure/heph //HEPH SUIT (so people don't get huffy at sleeping_slug trying to sell "NT property" to NT...)
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/medical,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/secure/veymed //VM SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/mining,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/grayson //GRAYSON SUIT
			),
			prob(5);list(
				/obj/random/multiple/voidsuit/engineering,
				/obj/random/tank,
				/obj/item/clothing/mask/breath,
				/obj/structure/closet/crate/xion //XION SUIT
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/medical,
				/obj/random/medical,
				/obj/random/medical,
				/obj/random/medical/lite,
				/obj/random/medical/lite,
				/obj/structure/closet/crate/veymed //VM GRABBAG
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/firstaid,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/structure/closet/crate/veymed //VM FAKS
			),
			prob(10);list(
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/random/tech_supply/nofail,
				/obj/structure/closet/crate/xion //XION SUPPLY
			),
			prob(10);list(
				/obj/random/firstaid,
				/obj/random/medical,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/lite,
				/obj/random/medical/lite,
				/obj/structure/closet/crate/zenghu //ZENGHU GRABBAG
			),
			prob(10);list(
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/medical/pillbottle,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/random/unidentified_medicine/fresh_medicine,
				/obj/structure/closet/crate/zenghu //ZENGHU PILLS
			),
			prob(10);list(
				/obj/item/device/toner,
				/obj/item/device/toner,
				/obj/item/device/toner,
				/obj/item/weapon/clipboard,
				/obj/item/weapon/clipboard,
				/obj/item/weapon/pen/red,
				/obj/item/weapon/pen/blue,
				/obj/item/weapon/pen/blue,
				/obj/item/device/camera_film,
				/obj/item/weapon/folder/blue,
				/obj/item/weapon/folder/red,
				/obj/item/weapon/folder/yellow,
				/obj/item/weapon/hand_labeler,
				/obj/item/weapon/tape_roll,
				/obj/item/weapon/paper_bin,
				/obj/item/sticky_pad/random,
				/obj/structure/closet/crate/ummarcar //UMMARCAR OFFICE TRASH
			),
			prob(5);list(
				/obj/item/weapon/reagent_containers/food/snacks/unajerky,
				/obj/item/weapon/reagent_containers/food/snacks/unajerky,
				/obj/item/weapon/reagent_containers/food/snacks/unajerky,
				/obj/item/weapon/reagent_containers/food/snacks/unajerky,
				/obj/item/weapon/reagent_containers/food/snacks/unajerky,
				/obj/item/weapon/reagent_containers/food/snacks/unajerky,
				/obj/item/weapon/reagent_containers/food/snacks/unajerky,
				/obj/item/weapon/reagent_containers/food/snacks/unajerky,
				/obj/structure/closet/crate/unathi //UNAJERKY
			),
			prob(10);list(
				/obj/item/weapon/reagent_containers/glass/bucket,
				/obj/item/weapon/mop,
				/obj/item/clothing/under/rank/janitor,
				/obj/item/weapon/cartridge/janitor,
				/obj/item/clothing/gloves/black,
				/obj/item/clothing/head/soft/purple,
				/obj/item/weapon/storage/belt/janitor,
				/obj/item/clothing/shoes/galoshes,
				/obj/item/weapon/storage/bag/trash,
				/obj/item/device/lightreplacer,
				/obj/item/weapon/reagent_containers/spray/cleaner,
				/obj/item/weapon/reagent_containers/glass/rag,
				/obj/item/weapon/grenade/chem_grenade/cleaner,
				/obj/item/weapon/grenade/chem_grenade/cleaner,
				/obj/item/weapon/grenade/chem_grenade/cleaner,
				/obj/structure/closet/crate/galaksi //GALAKSI JANITOR SUPPLIES
			),
			prob(5);list(
				/obj/item/weapon/reagent_containers/food/snacks/candy/gummy,
				/obj/item/weapon/reagent_containers/food/snacks/candy/gummy,
				/obj/item/weapon/reagent_containers/food/snacks/candy/gummy,
				/obj/item/weapon/reagent_containers/food/snacks/candy/gummy,
				/obj/item/weapon/reagent_containers/food/snacks/candy/gummy,
				/obj/item/weapon/reagent_containers/food/snacks/candy/gummy,
				/obj/item/weapon/reagent_containers/food/snacks/candy/gummy,
				/obj/item/weapon/reagent_containers/food/snacks/candy/gummy,
				/obj/structure/closet/crate/allico //GUMMIES
			),
			prob(2);list(
				/obj/item/weapon/tank/phoron/pressurized,
				/obj/item/weapon/tank/phoron/pressurized,
				/obj/structure/closet/crate/secure/phoron //HQ FUEL TANKS
			)
		)