// Chomp version of a xeno. Uses the thicc sprites for the queen - has a couple little custom abilities too.
// Thanks to BlackMajor for much guidance / stealing stuff from his bigdragon mob
// 06/07/2024: Sprite changes to TGMC/CM and more castes (experimental). Increased expected sprite size from 32x32 to 48x48 and 64x64 for larger castes. - Aroliacue
// If you are not sure what a variable does, please refer to "code\modules\mob\living\simple_mob\simple_mob.dm". Everything there is commented!

// Base type (Mostly initialises as an ability-less xeno hunter)
/mob/living/simple_mob/xeno_ch
	name = "badly spawned xenomorph"
	desc = "An extraterrestrial hive-based endoparasitoid with a multi-staged life cycle. You probably shouldn't be seeing this, please contact an admin."

	icon = 'modular_chomp/icons/mob/xenomorph/xeno_ch48x48.dmi'
	vis_height = 48
	faction = "xeno"
	ui_icons = 'icons/mob/screen1_alien.dmi'
	hand_form = "claws"

//// This segment includes the intro blurb for players joining this mob and language settings. ////

	player_msg = ""
	has_langs = list(LANGUAGE_XENOLINGUA,LANGUAGE_HIVEMIND)// Text name of their language if they speak something other than galcom. They speak the first one by default.
	understands_common = 0 // Xenomorphs will not be able to understand Galcom without admin intervention.

//// This segment includes base health, damage and other special values for the Chompstation Xenomorph simplemobs. Different castes may have different values. ////

// HEALTH //
	maxHealth = 250
	health = 250
	armor = list(
				"melee" = 15,
				"bullet" = 10,
				"laser" = 5,
				"energy" = 10,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100
				)
	grab_resist = 50 // Probability check for a grab attempt to fail. 100 is full immunity.
	damage_fatigue_mult = 0 // No slowdown from low health values.
	thick_armor = TRUE // Stops injection-type attacks. No dusting xenos with supermatter syringes.

// ENVIRONMENTAL - These should stay at 0. //
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	heat_resist = 0.0
	cold_resist = 1.0
	shock_resist = 0.5
	water_resist = 1.0
	poison_resist = 1.0

// DAMAGE //
	melee_damage_lower = 15 // Keep the lower/upper values the same for consistent damage, easier to balance than RNG.
	melee_damage_upper = 15
	attack_sound = 'modular_chomp/sound/weapons/alien_claw_flesh1.ogg'
	attack_sharp = TRUE
	melee_miss_chance = 0 // Missing attacks is gay. NPC variants will have a miss chance to make them a little less punishing.

// OTHER //
	movement_cooldown = 0 // Determines movespeed. Negative values are faster.
	see_in_dark = 10 // Night vision. This value should never change.
	has_hands = TRUE // Lets Xenomorphs hold most items.

// VORE //
	vore_active = 1
	vore_capacity = 2
	vore_pounce_chance = 50
	vore_icons = null

//// This segment includes intent interactions. ////

	response_help = "pats"
	response_disarm = "tries to shove"
	response_harm = "hits"
	attacktext = list("slashed", "tailstabbed", "maimed", "bitten")
	friendly = list("nuzzles", "caresses", "headbumps against", "leans against", "nibbles affectionately on")
	speech_sounds = list(	'sound/voice/hiss1.ogg',
							'sound/voice/hiss2.ogg',
							'sound/voice/hiss3.ogg',
							'sound/voice/hiss4.ogg',
							'sound/voice/hiss5.ogg')

	can_enter_vent_with = list(	/obj/item/weapon/implant,
								/obj/item/device/radio/borg,
								/obj/item/weapon/holder,
								/obj/machinery/camera,
								/obj/belly,
								/obj/screen,
								/atom/movable/emissive_blocker,
								/obj/item/weapon/material,
								/obj/item/weapon/melee,
								/obj/item/stack/,
								/obj/item/weapon/tool,
								/obj/item/weapon/reagent_containers/food,
								/obj/item/weapon/coin,
								/obj/item/weapon/aliencoin,
								/obj/item/weapon/ore,
								/obj/item/weapon/disk/nuclear,
								/obj/item/toy,
								/obj/item/weapon/card,
								/obj/item/device/radio,
								/obj/item/device/perfect_tele_beacon,
								/obj/item/weapon/clipboard,
								/obj/item/weapon/paper,
								/obj/item/weapon/pen,
								/obj/item/canvas,
								/obj/item/paint_palette,
								/obj/item/paint_brush,
								/obj/item/device/camera,
								/obj/item/weapon/photo,
								/obj/item/device/camera_film,
								/obj/item/device/taperecorder,
								/obj/item/device/tape)

	var/xeno_build_time = 5 //time to build a structure

	//HUD
	var/datum/action/innate/xeno_ch/xeno_build/build_action = new
	var/datum/action/innate/xeno_ch/xeno_neuro/neurotox_action = new
	var/datum/action/innate/xeno_ch/xeno_acidspit/acidspit_action = new
	var/datum/action/innate/xeno_ch/xeno_corrode/corrode_action = new
	var/datum/action/innate/xeno_ch/xeno_pounce/pounce_action = new
	var/datum/action/innate/xeno_ch/xeno_spin/spin_action = new

	can_be_drop_prey = FALSE //CHOMP Add

/mob/living/simple_mob/xeno_ch/Initialize()
	..()
	src.adjust_nutrition(src.max_nutrition)
	sight |= SEE_MOBS
//    set_footsteps(FOOTSTEP_MOB_CLAW)

/mob/living/simple_mob/xeno_ch/Login()
	. = ..()
	faction = "neutral"
	add_verb(src,/mob/living/simple_mob/verb/toggle_speech_sounds)

//
/// XENOS ///
//


////// TIER ONE XENOMORPH CASTES //////


/// XENOMORPH LARVA /// - A baby Xenomorph. D'awwh!

/mob/living/simple_mob/xeno_ch/larva
	name = "xenomorph larva"
	desc = "An extraterrestrial hive-based endoparasitoid with a multi-staged life cycle. This one appears to be smaller and more agile than the rest."

	icon = 'modular_chomp/icons/mob/xenomorph/xeno_ch32x32.dmi'
	icon_dead = "Larva Dead"
	icon_living = "Larva Moving"
	icon_rest = "Larva Sleeping"
	icon_state = "Larva Moving"
	vis_height = 32

	maxHealth = 50
	health = 50
	armor = list(
				"melee" = 0,
				"bullet" = 0,
				"laser" = 0,
				"energy" = 0,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)
	grab_resist = 0

	melee_damage_lower = 5
	melee_damage_upper = 5

	movement_cooldown = -1

/mob/living/simple_mob/xeno_ch/larva/Login()
	. = ..()
	add_verb(src,/mob/living/proc/hide)

/// XENOMORPH DRONE /// - The Drone's primary role is to build the hive and assist other castes where needed.

/mob/living/simple_mob/xeno_ch/drone
	name = "xenomorph drone"
	desc = "An extraterrestrial hive-based endoparasitoid with a multi-staged life cycle. This one appears to be smaller and more agile than the rest."

	movement_cooldown = -0.2

	icon_dead = "Drone Dead"
	icon_living = "Drone Walking"
	icon_rest = "Drone Sleeping"
	icon_state = "Drone Walking"
	pixel_x = -10
	default_pixel_x = -10

/mob/living/simple_mob/xeno_ch/drone/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/xeno_ch/proc/xeno_build)
	add_verb(src,/mob/living/simple_mob/proc/corrosive_acid)
	build_action.Grant(src)
	corrode_action.Grant(src)

/// XENOMORPH DEFENDER /// - The Defender serves as a tough bulwark, protecting other, less durable castes.

/// XENOMORPH HUNTER /// - The Hunter's role in the hive is as the name suggests: They aggressively and stealthily hunt down targets, usually lone crewmembers.

/mob/living/simple_mob/xeno_ch/hunter
	name = "xenomorph hunter"
	desc = "An extraterrestrial hive-based endoparasitoid with a multi-staged life cycle. This one appears to be smaller and more agile than the rest."

	maxHealth = 200
	health = 200
	armor = list(
				"melee" = 25,
				"bullet" = 30,
				"laser" = 20,
				"energy" = 15,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100
				)

	movement_cooldown = -0.5

	melee_damage_lower = 18
	melee_damage_upper = 18

	icon_dead = "Hunter Dead"
	icon_living = "Hunter Walking"
	icon_rest = "Hunter Sleeping"
	icon_state = "Hunter Walking"

	icon_state_prepounce = "Hunter Running"
	icon_pounce = 'modular_chomp/icons/mob/xenomorph/xeno_ch48x48.dmi'
	icon_state_pounce = "Hunter Running"
	icon_overlay_spit = "alienspit"
	icon_overlay_spit_pounce = "alienspit_leap"

/mob/living/simple_mob/xeno_ch/hunter/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/pounce_toggle)
	add_verb(src,/mob/living/proc/ventcrawl)
	add_verb(src,/mob/living/proc/hide)
	pounce_action.Grant(src)

/// XENOMORPH SENTINEL /// - The Sentinel serves as a flexible, ranged offensive/defensive caste.

/mob/living/simple_mob/xeno_ch/sentinel
	name = "xenomorph sentinel"
	desc = "A chitin-covered bipedal creature with an acrid scent about it."

	maxHealth = 230
	health = 230
	armor = list(
				"melee" = 25,
				"bullet" = 30,
				"laser" = 20,
				"energy" = 15,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100
				)

	melee_damage_lower = 13
	melee_damage_upper = 13

	icon_dead = "Sentinel Dead"
	icon_living = "Sentinel Walking"
	icon_rest = "Sentinel Sleeping"
	icon_state = "Sentinel Walking"
	pixel_x = -10
	default_pixel_x = -10

/mob/living/simple_mob/xeno_ch/sentinel/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/neurotoxin)
	add_verb(src,/mob/living/simple_mob/proc/acidspit)
	add_verb(src,/mob/living/simple_mob/proc/corrosive_acid)
	neurotox_action.Grant(src)
	acidspit_action.Grant(src)
	corrode_action.Grant(src)


////// TIER TWO XENOMORPH CASTES //////


/// XENOMORPH WARRIOR /// - WIP

/// XENOMORPH SPITTER /// - WIP

/// XENOMORPH HIVELORD /// - WIP


////// TIER THREE XENOMORPH CASTES //////


/// XENOMORPH CHARGER /// - WIP

/// XENOMORPH PRAETORIAN /// - WIP


////// HIVE LEADER CASTES //////


/// XENOMORPH QUEEN /// - The Queen leads and expands the hive.

/mob/living/simple_mob/xeno_ch/queen
	name = "xenomorph queen"
	desc = "An extraterrestrial hive-based endoparasitoid with a multi-staged life cycle. Covered in glossy-black chitin, gargantuan in size and bearing an enormous crest, there's no doubt that this is the Queen of the hive."

	icon_dead = "Queen Dead"
	icon_living = "Queen Walking"
	icon_rest = "Queen Sleeping"
	icon_state = "Queen Walking"
	icon = 'modular_chomp/icons/mob/xenomorph/xeno_ch2x2.dmi'
	vis_height = 64
	pixel_x = -16
	default_pixel_x = -16
	pixel_y = 0
	default_pixel_y = 0

	maxHealth = 600
	health = 600
	grab_resist = 100
	armor = list(
				"melee" = 35,
				"bullet" = 40,
				"laser" = 30,
				"energy" = 25,
				"bomb" = 60,
				"bio" = 100,
				"rad" = 100
				)

	movement_cooldown = 0.5

	melee_damage_lower = 22
	melee_damage_upper = 22

/mob/living/simple_mob/xeno_ch/queen/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/acidspit)
	add_verb(src,/mob/living/simple_mob/proc/corrosive_acid)
	add_verb(src,/mob/living/simple_mob/proc/speen)
	add_verb(src,/mob/living/simple_mob/xeno_ch/proc/xeno_build)
	add_verb(src,/mob/living/simple_mob/proc/lay_egg)
	acidspit_action.Grant(src)
	corrode_action.Grant(src)
	spin_action.Grant(src)
	build_action.Grant(src)

/// XENOMORPH KING /// - The King assists the Queen in leading the hive, and is a very powerful combatant in its own right.

/mob/living/simple_mob/xeno_ch/king
	name = "xenomorph king"
	desc = "An extraterrestrial hive-based endoparasitoid with a multi-staged life cycle."

	icon_dead = "Red King Dead"
	icon_living = "Red King Walking"
	icon_rest = "Red King Sleeping"
	icon_state = "Red King Walking"
	icon = 'modular_chomp/icons/mob/xenomorph/xeno_ch2x2.dmi'
	vis_height = 64
	pixel_x = -16
	default_pixel_x = -16
	pixel_y = 0
	default_pixel_y = 0

	maxHealth = 750
	health = 750
	grab_resist = 100
	armor = list(
				"melee" = 45,
				"bullet" = 50,
				"laser" = 40,
				"energy" = 25,
				"bomb" = 80,
				"bio" = 100,
				"rad" = 100
				)

	movement_cooldown = 0.5

	melee_damage_lower = 25
	melee_damage_upper = 25

/mob/living/simple_mob/xeno_ch/king/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/corrosive_acid)
	add_verb(src,/mob/living/simple_mob/proc/speen)
	add_verb(src,/mob/living/simple_mob/xeno_ch/proc/xeno_build)
	corrode_action.Grant(src)
	spin_action.Grant(src)
	build_action.Grant(src)

/// XENOMORPH DESTROYER /// - Adminbus, do not spawn in under normal circumstances

/mob/living/simple_mob/xeno_ch/destroyer
	name = "xenomorph destroyer"
	desc = "An absolutely gargantuan, chitin-and-spike-covered creature. Running away seems like a good idea."

	icon_dead = "Destroyer Dead"
	icon_living = "Destroyer Walking"
	icon_rest = "Destroyer Sleeping"
	icon_state = "Destroyer Walking"
	icon = 'modular_chomp/icons/mob/xenomorph/xeno_ch2x2.dmi'
	vis_height = 64
	pixel_x = -16
	default_pixel_x = -16
	pixel_y = 0
	default_pixel_y = 0

	maxHealth = 1000
	health = 1000
	grab_resist = 100
	armor = list(
				"melee" = 50,
				"bullet" = 50,
				"laser" = 50,
				"energy" = 50,
				"bomb" = 80,
				"bio" = 100,
				"rad" = 100
				)

	movement_cooldown = 0

	melee_damage_lower = 30
	melee_damage_upper = 30

/mob/living/simple_mob/xeno_ch/destroyer/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/speen)
	spin_action.Grant(src)