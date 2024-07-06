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

/mob/living/simple_mob/xeno_ch/Initialize(mapload)
    .=..()
    LoadComponent(/datum/component/squeak, list('modular_chomp/sound/effects/footstep/hardclaw1.ogg'), 50)

/mob/living/simple_mob/xeno_ch/Login()
	. = ..()
	faction = "neutral"
	add_verb(src,/mob/living/simple_mob/verb/toggle_speech_sounds) //CHOMPEdit TGPanel

////// TIER ONE XENOMORPH CASTES //////

/// XENOMORPH LARVA /// - WIP

/// XENOMORPH DRONE /// - WIP

/// XENOMORPH DEFENDER /// - WIP

/// XENOMORPH HUNTER /// - The Hunter's role in the hive is as the name suggests: They aggressively and stealthily hunt down targets, usually lone crewmembers.

/mob/living/simple_mob/xeno_ch/hunter
	name = "xenomorph hunter"
	desc = "An extraterrestrial hive-based endoparasitoid with a multi-staged life cycle. This one appears to be smaller and more agile than the rest."

	movement_cooldown = -0.2

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
	add_verb(src,/mob/living/simple_mob/proc/pounce_toggle) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/ventcrawl) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/hide) //CHOMPEdit TGPanel
	pounce_action.Grant(src)

/// XENOMORPH SENTINEL /// - The Sentinel serves as a flexible, ranged offensive/defensive caste.

/mob/living/simple_mob/xeno_ch/sentinel
	name = "xenomorph sentinel"
	desc = "A chitin-covered bipedal creature with an acrid scent about it."

	movement_cooldown = 1.5

	icon_dead = "aliens_dead"
	icon_living = "aliens"
	icon_rest = "aliens_sleep"
	icon_state = "aliens"

/mob/living/simple_mob/xeno_ch/sentinel/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/neurotoxin) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/acidspit) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/corrosive_acid) //CHOMPEdit TGPanel
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
	desc = "A towering chitin-covered bipedal creature with a rather intimidating aura about them."

	icon_dead = "alienq_dead"
	icon_living = "alienq"
	icon_rest = "alienq_sleep"
	icon_state = "alienq"
	icon = 'modular_chomp/icons/mob/xenoqueen_64.dmi'
	vis_height = 64
	pixel_x = -16
	default_pixel_x = -16
	pixel_y = 0
	default_pixel_y = 0

	maxHealth = 600
	health = 600

	movement_cooldown = 2

/mob/living/simple_mob/xeno_ch/queen/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/neurotoxin) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/acidspit) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/corrosive_acid) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/speen) //CHOMPEdit TGPanel
	neurotox_action.Grant(src)
	acidspit_action.Grant(src)
	corrode_action.Grant(src)
	spin_action.Grant(src)

/mob/living/simple_mob/xeno_ch/queen/maid
	name = "xenomorph maid queen"
	desc = "A towering chitin-covered bipedal creature with a rather intimidating aura about them... though, they seem to be wearing an interesting outfit."

	icon_dead = "alienqmaid_dead"
	icon_living = "alienqmaid"
	icon_rest = "alienqmaid_sleep"
	icon_state = "alienqmaid"

/// XENOMORPH KING /// - The King assists the Queen in leading the hive, and is a very powerful combatant in its own right.

/// XENOMORPH DESTROYER /// - Adminbus WIP