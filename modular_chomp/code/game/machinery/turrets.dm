/* Combat refactor walkback
/obj/machinery/porta_turret
	health = 40				//the turret's health
	maxhealth = 40			//turrets maximal health.

/obj/machinery/porta_turret/ai_defense
	health = 125 // Since lasers do 40 each.
	maxhealth = 125

/obj/machinery/porta_turret/alien
	health = 125
	maxhealth = 125

/obj/machinery/porta_turret/industrial
	health = 100
	maxhealth = 100

/obj/machinery/porta_turret/industrial/teleport_defense
	name = "defense turret"
	desc = "This variant appears to be much more durable, with a rugged outer coating."
	req_one_access = list(access_heads)
	installation = /obj/item/gun/energy/gun/burst
	health = 125
	maxhealth = 125

*/
/obj/machinery/porta_turret/obelisk
	name = "defense obelisk"
	catalogue_data = list(/datum/category_item/catalogue/technology/turret)
	anchored = TRUE

	circuit = /obj/item/circuitboard/defenseonelisk

	catalogue_data = null

	turret_type = "obelisk"
	icon_color = "obelisk_blue"
	lethal_icon_color = "oblisk_blue"

	icon = 'modular_chomp/icons/obj/machines/defense.dmi'
	icon_state = "obelisk"

	density = TRUE
	use_power = TRUE				//this turret uses and requires power
	idle_power_usage = 50000		//when inactive, this turret takes up constant 50 Equipment power
	active_power_usage = 150000	//when active, this turret takes up constant 300 Equipment power
	power_channel = EQUIP	//drains power from the EQUIPMENT channel
	req_one_access = list(access_heads)
	blocks_emissive = EMISSIVE_BLOCK_UNIQUE


	health = 300				//the turret's health
	maxhealth = 300			//turrets maximal health.
	auto_repair = TRUE		//if 1 the turret slowly repairs itself.

	installation = /obj/item/gun/energy/pulse_rifle
	reqpower = 50000
	turret_type = "normal"
	icon_color = "blue"
	lethal_icon_color = "blue"

	shot_delay = 0.5 SECONDS	//This will delete foes

	targetting_is_configurable = FALSE
	check_arrest = TRUE
	check_records = TRUE
	check_weapons = FALSE
	check_access = FALSE
	check_anomalies = TRUE
	check_synth	 = FALSE
	check_all = FALSE
	ailock = TRUE

	lethal_is_configurable = FALSE // if false, its lethal setting cannot be changed

	timeout = 1		// When a turret pops up, then finds nothing to shoot at, this number decrements until 0, when it pops down.
	can_salvage = FALSE

/obj/item/circuitboard/defenseonelisk
	name = "paradox rift generator circuit"
	build_path = /obj/machinery/paradoxrift
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_DATA = 8, TECH_ARCANE = 3)
	req_components = list(
							/obj/item/stack/cable_coil = 30)
