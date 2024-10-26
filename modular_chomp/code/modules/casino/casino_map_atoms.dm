// Casino-specific mapping atoms go here. I guess associated datums too.
// Areas
/area/casino // Parent for var inheritence
	name = "\improper Casino"
	icon_state = "yellow"
	requires_power = FALSE
	dynamic_lighting = TRUE
	outdoors = FALSE
	flags = RAD_SHIELDED

// Areas for the actual casino
/area/casino/dorm1
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/dorm2
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/dorm3
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/dorm4
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/dorm5
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/dorm6
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/dorm7
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/dorm8
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/dorm9
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/dorm10
	name = "\improper Casino dorm"
	flags = RAD_SHIELDED
	soundproofed = TRUE
	limit_mob_size = FALSE
	block_suit_sensors = TRUE
	block_tracking = TRUE

/area/casino/helm
	name = "\improper Casino helm"

/area/casino/dorm_north_foyer
	name = "\improper Casino dorm north foyer"

/area/casino/dorm_south_foyer
	name = "\improper Casino dorm south foyer"

/area/casino/dorm_hall
	name = "\improper Casino dorm hallway"

/area/casino/engineering
	name = "\improper Casino engineering"

/area/casino/medical
	name = "\improper Casino medical"

/area/casino/north_foyer
	name = "\improper Casino north foyer"

/area/casino/security
	name = "\improper Casino security"

/area/casino/south_foyer
	name = "\improper Casino south foyer"

/area/casino/storage
	name = "\improper Casino storage"

/area/casino/vault
	name = "\improper Casino vault"

// Areas for outside the casino structure
/area/casino/disposals_maze
	name = "\improper Maze"

/area/casino/dragon_vault
	name = "\improper Dragon vault"

/area/casino/lodge
	name = "\improper Lodge"

/area/casino/mountains
	name = "\improper Mountains"

/area/casino/sand_maze
	name = "\improper Maze"

/area/casino/wilderness
	name = "\improper Wilderness"
	outdoors = TRUE

/area/casino/wizard_home
	name = "\improper That's pretty wizard"

// Old casino areas. Apparently we don't want these.
/*
/area/casino/casino_ship
	name = "\improper Casino Ship"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 1

/area/casino/casino_ship/wing_left
	name = "\improper Casino Ship left wing"
	icon_state = "yellow"

/area/casino/casino_ship/wing_right
	name = "\improper Casino Ship right wing"
	icon_state = "yellow"

/area/casino/casino_ship/dorms
	name = "\improper Casino Ship dorms"
	icon_state = "yellow"
	soundproofed = TRUE

/area/casino/casino_ship/cockpit
	name = "\improper Casino Ship left wing"
	icon_state = "yellow"

/area/shuttle/casino/
	name = "\improper Casino Shuttle"
	dynamic_lighting = 0
	icon_state = "shuttlegrn"
*/

// Gear dispenser datums. Organized alphabetically by typepath for your viewing pleasure.
/datum/gear_disp/casino_buried_reward
	name = "Buried treasure"
	to_spawn = list(
					/obj/item/gun/energy/kinetic_accelerator/premiumka,
					/obj/item/personal_shield_generator/belt/mining/loaded,
					/obj/item/personal_shield_generator/belt/mining/loaded,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c1000
					)

/datum/gear_disp/casino_disposals_reward
	name = "Disposals maze"
	to_spawn = list(
					/obj/item/storage/backpack/holding/duffle,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c1000
					)

/datum/gear_disp/casino_engineer_loadout
	name = "Engineer gear"
	to_spawn = list(
					/obj/item/card/id/casino,
					/obj/item/casino_platinum_chip,
					/obj/item/radio/headset/casino,
					/obj/item/pda/bar,
					/obj/item/book/codex/casino,
					/obj/item/storage/wallet/casino,
					/obj/item/flash,
					/obj/item/clothing/accessory/armband/engine,
					/obj/item/rcd/advanced/loaded,
					/obj/item/rcd_ammo/large,
					/obj/item/rcd_ammo/large,
					/obj/item/storage/belt/utility/chief/full,
					/obj/item/spacecasinocash/c1000,
					/obj/item/spacecasinocash/c500,
					)

/datum/gear_disp/casino_gosling_loadout
	name = "Gosling gear"
	to_spawn = list(
					/obj/item/card/id/casino,
					/obj/item/casino_platinum_chip,
					/obj/item/radio/headset/casino,
					/obj/item/pda/bar,
					/obj/item/book/codex/casino,
					/obj/item/storage/wallet/casino,
					/obj/item/flash,
					/obj/item/modular_computer/tablet/preset/custom_loadout/hybrid,
					/obj/item/spacecasinocash/c1000,
					/obj/item/spacecasinocash/c500
					)

/datum/gear_disp/casino_ice_reward
	name = "Ice maze"
	to_spawn = list(
					/obj/item/flashlight/slime,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c500
					)

/datum/gear_disp/casino_kururak_reward
	name = "Kururak"
	to_spawn = list(
					/obj/item/reagent_containers/pill/healing_nanites,
					/obj/item/stack/nanopaste/advanced,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c200
					)

/datum/gear_disp/casino_medical_loadout
	name = "Medical gear"
	to_spawn = list(
					/obj/item/card/id/casino,
					/obj/item/casino_platinum_chip,
					/obj/item/radio/headset/casino,
					/obj/item/pda/bar,
					/obj/item/book/codex/casino,
					/obj/item/storage/wallet/casino,
					/obj/item/flash,
					/obj/item/clothing/accessory/armband/medblue,
					/obj/item/clothing/accessory/holster/hip,
					/obj/item/gun/projectile/cell_loaded/medical,
					/obj/item/ammo_magazine/cell_mag/medical/advanced,
					/obj/item/storage/belt/medical/holding,
					/obj/item/spacecasinocash/c1000,
					/obj/item/spacecasinocash/c500
					)

/datum/gear_disp/casino_otie_reward
	name = "Otie"
	to_spawn = list(
					/obj/item/grenade/spawnergrenade/casino/otie,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c500,
					/obj/item/spacecash/c200
					)

/datum/gear_disp/casino_patron_loadout
	name = "Patron gear"
	to_spawn = list(
					/obj/item/book/codex/casino,
					/obj/item/storage/wallet/casino,
					/obj/item/spacecasinocash/c1,
					/obj/structure/event/present,
					/obj/item/toy/nanotrasenballoon,
					/obj/item/pen/chameleon,
					/obj/item/chameleon,
					/obj/item/capture_crystal/basic
					)

/datum/gear_disp/casino_pred_loadout
	name = "Predator gear"
	to_spawn = list(
					/obj/item/clothing/shoes/boots/speed,
					/obj/item/gun/energy/netgun,
					/obj/item/clothing/accessory/poncho/thermal/red,
					/obj/item/clothing/suit/space/void/autolok,
					/obj/item/storage/pill_bottle/healing_nanites,
					/obj/item/tank/emergency/oxygen/double,
					/obj/item/perfect_tele/frontier/unknown/one,
					/obj/item/cell/device/weapon/recharge
					)

/datum/gear_disp/casino_reception_loadout
	name = "Reception gear"
	to_spawn = list(
					/obj/item/card/id/casino/both,
					/obj/item/casino_platinum_chip,
					/obj/item/radio/headset/casino,
					/obj/item/pda/bar,
					/obj/item/book/codex/casino,
					/obj/item/storage/wallet/casino,
					/obj/item/flash,
					/obj/item/modular_computer/laptop/preset/custom_loadout/hybrid,
					/obj/item/spacecasinocash/c1000,
					/obj/item/spacecasinocash/c500
					)

/datum/gear_disp/casino_sand_reward
	name = "Sand maze"
	to_spawn = list(
					/obj/item/clothing/shoes/bhop,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c1000
					)

/datum/gear_disp/casino_security_loadout
	name = "Security gear"
	to_spawn = list(
					/obj/item/card/id/casino,
					/obj/item/casino_platinum_chip,
					/obj/item/radio/headset/casino,
					/obj/item/pda/bar,
					/obj/item/book/codex/casino,
					/obj/item/storage/wallet/casino,
					/obj/item/flash,
					/obj/item/clothing/accessory/armband,
					/obj/item/clothing/accessory/holster/hip/black,
					/obj/item/gun/projectile/cell_loaded/combat/prototype,
					/obj/item/ammo_magazine/cell_mag/advanced,
					/obj/item/storage/belt/security/tactical,
					/obj/item/spacecasinocash/c1000,
					/obj/item/spacecasinocash/c500
					)

/datum/gear_disp/casino_spider_reward
	name = "Spider"
	to_spawn = list(
					/obj/item/mapping_unit,
					/obj/item/clothing/gloves/ring/buzzer/toy,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c500
					)


/datum/gear_disp/casino_stomach_reward
	name = "Stomach"
	to_spawn = list(
					/obj/item/organ/internal/stomach,
					/obj/item/clothing/accessory/pride/vore,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c1000
					)

/datum/gear_disp/casino_wizard_reward
	name = "Wizard"
	to_spawn = list(
					/obj/item/spellbook/oneuse/smoke,
					/obj/item/spacecash/c1000,
					/obj/item/spacecash/c500,
					/obj/item/spacecash/c200
					)

// Gear dispensers
/obj/machinery/gear_dispenser/casino_buried_reward
	name = "container"
	dispenses = list(/datum/gear_disp/casino_buried_reward)

/obj/machinery/gear_dispenser/casino_disposals_reward
	name = "container"
	dispenses = list(/datum/gear_disp/casino_disposals_reward)

/obj/machinery/gear_dispenser/casino_engineer_loadout
	name = "engineer equipment"
	dispenses = list(/datum/gear_disp/casino_engineer_loadout)

/obj/machinery/gear_dispenser/casino_gosling_loadout
	name = "gosling equipment"
	dispenses = list(/datum/gear_disp/casino_gosling_loadout)

/obj/machinery/gear_dispenser/casino_ice_reward
	name = "container"
	dispenses = list(/datum/gear_disp/casino_ice_reward)

/obj/machinery/gear_dispenser/casino_kururak_reward
	name = "container"
	dispenses = list(/datum/gear_disp/casino_kururak_reward)

/obj/machinery/gear_dispenser/casino_medical_loadout
	name = "medical equipment"
	dispenses = list(/datum/gear_disp/casino_medical_loadout)

/obj/machinery/gear_dispenser/casino_otie_reward
	name = "container"
	dispenses = list(/datum/gear_disp/casino_otie_reward)

/obj/machinery/gear_dispenser/casino_patron_loadout
	name = "patron gear"
	dispenses = list(/datum/gear_disp/casino_patron_loadout)

/obj/machinery/gear_dispenser/casino_pred_loadout
	name = "container"
	dispenses = list(/datum/gear_disp/casino_pred_loadout)

/obj/machinery/gear_dispenser/casino_reception_loadout
	name = "reception equipment"
	dispenses = list(/datum/gear_disp/casino_reception_loadout)

/obj/machinery/gear_dispenser/casino_sand_reward
	name = "container"
	dispenses = list(/datum/gear_disp/casino_sand_reward)

/obj/machinery/gear_dispenser/casino_security_loadout
	name = "security equipment"
	dispenses = list(/datum/gear_disp/casino_security_loadout)

/obj/machinery/gear_dispenser/casino_spider_reward
	name = "container"
	dispenses = list(/datum/gear_disp/casino_spider_reward)

/obj/machinery/gear_dispenser/casino_stomach_reward
	name = "container"
	dispenses = list(/datum/gear_disp/casino_stomach_reward)

/obj/machinery/gear_dispenser/casino_wizard_reward
	name = "container"
	dispenses = list(/datum/gear_disp/casino_wizard_reward)
