// Chomp version of a xeno. Uses the thicc sprites for the queen - has a couple little custom abilities too.
// Thanks to BlackMajor for much guidance / stealing stuff from his bigdragon mob

// Base type (Mostly initialises as an ability-less xeno hunter
/mob/living/simple_mob/xeno_ch
	name = "badly spawned xenomorph"
	desc = "A chitin-covered bipedal creature with an eerie skittery nature. this one was spawned in wrong."

	icon = 'modular_chomp/icons/mob/xenos_32.dmi'
	vis_height = 32

	faction = "xeno"
	maxHealth = 200
	health = 200
	see_in_dark = 10


	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	melee_damage_lower = 8
	melee_damage_upper = 16
	grab_resist = 50

	vore_active = 1
	vore_capacity = 2
	vore_pounce_chance = 50
	vore_icons = null

	response_help = "pats"
	response_disarm = "tries to shove"
	response_harm = "hits"
	attacktext = list("slashed")
	friendly = list("nuzzles", "caresses", "headbumps against", "leans against", "nibbles affectionately on")
	speech_sounds = list(	'sound/voice/hiss1.ogg',
							'sound/voice/hiss2.ogg',
							'sound/voice/hiss3.ogg',
							'sound/voice/hiss4.ogg',
							'sound/voice/hiss5.ogg')
	has_hands = TRUE

	can_enter_vent_with = list(	/obj/item/implant,
								/obj/item/radio/borg,
								/obj/item/holder,
								/obj/machinery/camera,
								/obj/belly,
								/obj/soulgem, // CHOMPAdd
								/obj/screen,
								/atom/movable/emissive_blocker,
								/obj/item/material,
								/obj/item/melee,
								/obj/item/stack/,
								/obj/item/tool,
								/obj/item/reagent_containers/food,
								/obj/item/coin,
								/obj/item/aliencoin,
								/obj/item/ore,
								/obj/item/disk/nuclear,
								/obj/item/toy,
								/obj/item/card,
								/obj/item/radio,
								/obj/item/perfect_tele_beacon,
								/obj/item/clipboard,
								/obj/item/paper,
								/obj/item/pen,
								/obj/item/canvas,
								/obj/item/paint_palette,
								/obj/item/paint_brush,
								/obj/item/camera,
								/obj/item/photo,
								/obj/item/camera_film,
								/obj/item/taperecorder,
								/obj/item/tape)

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

/mob/living/simple_mob/xeno_ch/Login()
	. = ..()
	faction = "neutral"
	add_verb(src,/mob/living/simple_mob/xeno_ch/proc/xeno_build) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/verb/toggle_speech_sounds) //CHOMPEdit TGPanel
	build_action.Grant(src)


// Xenomorph hunter subtype
/mob/living/simple_mob/xeno_ch/hunter
	name = "xenomorph hunter"
	desc = "A chitin-covered bipedal creature with an eerie skittery nature."

	movement_cooldown = 1

	icon_dead = "alienh_dead"
	icon_living = "alienh"
	icon_rest = "alienh_sleep"
	icon_state = "alienh"

	icon_state_prepounce = "alienh_pounce"
	icon_pounce = 'modular_chomp/icons/mob/xenoleap_96.dmi'
	icon_state_pounce = "alienh_leap"
	icon_overlay_spit = "alienspit"
	icon_overlay_spit_pounce = "alienspit_leap"
	icon_pounce_x = -32
	icon_pounce_y = -32

/mob/living/simple_mob/xeno_ch/hunter/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/pounce_toggle) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/ventcrawl) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/hide) //CHOMPEdit TGPanel
	pounce_action.Grant(src)

//Xenomorph Sentinel subtype
/mob/living/simple_mob/xeno_ch/sentinel
	name = "xenomorph sentinel"
	desc = "A chitin-covered bipedal creature with an acrid scent about it."

	movement_cooldown = 1.5

	icon_dead = "aliens_dead"
	icon_living = "aliens"
	icon_rest = "aliens_sleep"
	icon_state = "aliens"

	icon_state_prepounce = "aliens_pounce"
	icon_pounce = 'modular_chomp/icons/mob/xenoleap_96.dmi'
	icon_state_pounce = "aliens_leap"
	icon_overlay_spit = "alienspit"
	icon_overlay_spit_pounce = "alienspit_leap"
	icon_pounce_x = -32
	icon_pounce_y = -32


/mob/living/simple_mob/xeno_ch/sentinel/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/pounce_toggle) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/hide) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/neurotoxin) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/acidspit) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/corrosive_acid) //CHOMPEdit TGPanel
	pounce_action.Grant(src)
	neurotox_action.Grant(src)
	acidspit_action.Grant(src)
	corrode_action.Grant(src)


//Xenomorph queen subtype
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
