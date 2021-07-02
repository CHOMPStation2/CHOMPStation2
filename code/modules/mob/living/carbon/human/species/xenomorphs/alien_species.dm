//Stand-in until this is made more lore-friendly.
/datum/species/xenos
	name = SPECIES_GENA //CHOMPedit
	name_plural = "Genaprawns" //CHOMPedit

	default_language = "Xenolingua" //CHOMPedit
	language = "Hivemind"
	assisted_langs = list()
	unarmed_types = list(/datum/unarmed_attack/claws/strong/xeno, /datum/unarmed_attack/bite/strong/xeno)
	hud_type = /datum/hud_data/alien
	rarity_value = 3

	male_scream_sound = list('sound/effects/mob_effects/x_scream1.ogg','sound/effects/mob_effects/x_scream2.ogg','sound/effects/mob_effects/x_scream3.ogg') //CHOMPedit SCREE
	female_scream_sound = list('sound/effects/mob_effects/x_scream1.ogg','sound/effects/mob_effects/x_scream2.ogg','sound/effects/mob_effects/x_scream3.ogg') //CHOMPedit SCREE

	darksight = 10 //CHOMPedit. Added darksight
	vision_flags = SEE_SELF|SEE_MOBS|SEE_TURFS //CHOMPedit trying to make xenos see properly

	pixel_offset_x = -16 //CHOMPedit. I literally had to make a different form of pixel_x just for this species, fuck my life


	icon_template = 'icons/mob/human_races/xenos/template.dmi' //CHOMPedit. Add icon template for 64x64 sprites

	has_fine_manipulation = 0
	siemens_coefficient = 0
	gluttonous = 2

	brute_mod = 0.65 //CHOMPedit. Edited brute vulnerability
	burn_mod = 1.50  //CHOMPedit. Edited burn vulnerability

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	flags =  NO_SCAN | NO_PAIN | NO_SLIP | NO_POISON | NO_MINOR_CUT | NO_INFECT | NO_DEFIB
	spawn_flags = SPECIES_IS_RESTRICTED

	reagent_tag = IS_XENOS

	blood_color = "#05EE05"
	flesh_color = "#282846"
	gibbed_anim = "gibbed-a"
	dusted_anim = "dust-a"
	death_message = "lets out a piercing multi-toned screech, green blood bubbling from its maw as it ceases." //CHOMPedit. Changed message.
	death_sound = 'sound/voice/hiss6.ogg'

	damage_overlays = null //CHOMPedit. They don't have overlays yet, if someone wants to add some then be my guest
	damage_mask = null //CHOMPedit.
	blood_mask = null //CHOMPedit.

	speech_sounds = list('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg')
	speech_chance = 100

	virus_immune = 1

	breath_type = null
	poison_type = null

	has_organ = list(
		O_HEART =    /obj/item/organ/internal/heart,
		O_BRAIN =    /obj/item/organ/internal/brain/xeno,
		O_PLASMA =   /obj/item/organ/internal/xenos/plasmavessel,
		O_HIVE =     /obj/item/organ/internal/xenos/hivenode,
		O_NUTRIENT = /obj/item/organ/internal/diona/nutrients,
		O_STOMACH =		/obj/item/organ/internal/stomach/xeno,
		O_INTESTINE =	/obj/item/organ/internal/intestine/xeno
		)

	bump_flag = ALIEN
	swap_flags = ~HEAVY
	push_flags = (~HEAVY) ^ ROBOT

	var/alien_number = 0
	var/caste_name = "creature" // Used to update alien name.
	var/weeds_heal_rate = 1     // Health regen on weeds.
	var/weeds_plasma_rate = 5   // Plasma regen on weeds.

	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest/unseverable/xeno),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/unseverable/xeno),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/unseverable/xeno),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/unseverable/xeno),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/unseverable/xeno),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/unseverable/xeno),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/unseverable/xeno),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/unseverable/xeno),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/unseverable/xeno),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/unseverable/xeno),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/unseverable/xeno)
		)

/datum/species/xenos/get_bodytype()
	return SPECIES_GENA //CHOMPedit

/datum/species/xenos/get_random_name()
	return "Genaprawn [caste_name] ([alien_number])" //CHOMPedit

/datum/species/xenos/can_understand(var/mob/other)
	if(istype(other, /mob/living/carbon/alien/larva))
		return TRUE
	return FALSE

/datum/species/xenos/hug(var/mob/living/carbon/human/H,var/mob/living/target)
	H.visible_message("<span class='notice'>[H] caresses [target] with its eldritch arm.</span>", \
					"<span class='notice'>You caress [target] with your eldritch arm.</span>") //CHOMPedit. Changed messages

/datum/species/xenos/handle_post_spawn(var/mob/living/carbon/human/H)

	if(H.mind)
		H.mind.assigned_role = "Alien"
		H.mind.special_role = "Alien"

	alien_number++ //Keep track of how many aliens we've had so far.
	H.real_name = "Genaprawn [caste_name] ([alien_number])" //CHOMPedit
	H.name = H.real_name

	..()

/datum/species/xenos/handle_environment_special(var/mob/living/carbon/human/H)

	var/turf/T = H.loc
	if(!T) return
	var/datum/gas_mixture/environment = T.return_air()
	if(!environment) return

	if(environment.gas["phoron"] > 0 || locate(/obj/effect/alien/weeds) in T)
		if(!regenerate(H))
			var/obj/item/organ/internal/xenos/plasmavessel/P = H.internal_organs_by_name[O_PLASMA]
			P.stored_plasma += weeds_plasma_rate
			P.stored_plasma = min(max(P.stored_plasma,0),P.max_plasma)
	..()

/datum/species/xenos/proc/regenerate(var/mob/living/carbon/human/H)
	var/heal_rate = weeds_heal_rate
	var/mend_prob = 10
	if (!H.resting)
		heal_rate = weeds_heal_rate / 3
		mend_prob = 1

	//first heal damages
	if (H.getBruteLoss() || H.getFireLoss() || H.getOxyLoss() || H.getToxLoss())
		H.adjustBruteLoss(-heal_rate)
		H.adjustFireLoss(-heal_rate)
		H.adjustOxyLoss(-heal_rate)
		H.adjustToxLoss(-heal_rate)
		if (prob(5))
			to_chat(H, "<span class='alien'>You feel a soothing sensation come over you...</span>")
		return 1

	//next internal organs
	for(var/obj/item/organ/I in H.internal_organs)
		if(I.damage > 0)
			I.damage = max(I.damage - heal_rate, 0)
			if (prob(5))
				to_chat(H, "<span class='alien'>You feel a soothing sensation within your [I.parent_organ]...</span>")
			return 1

	//next mend broken bones, approx 10 ticks each
	for(var/obj/item/organ/external/E in H.bad_external_organs)
		if (E.status & ORGAN_BROKEN)
			if (prob(mend_prob))
				if (E.mend_fracture())
					to_chat(H, "<span class='alien'>You feel something mend itself inside your [E.name].</span>")
			return 1

	return 0
//CHOMPedit removed infection images, since they do not exist anymore.

/datum/species/xenos/drone
	name = SPECIES_GENA_DRONE //CHOMPedit
	caste_name = "drone"
	weeds_plasma_rate = 15
	slowdown = 1
	tail = null //CHOMPedit. Set to null
	rarity_value = 5

	icobase = 'icons/mob/human_races/xenos/r_xenos_drone.dmi'
	deform =  'icons/mob/human_races/xenos/r_xenos_drone.dmi'

	has_organ = list(
		O_HEART =		/obj/item/organ/internal/heart,
		O_BRAIN =		/obj/item/organ/internal/brain/xeno,
		O_PLASMA =		/obj/item/organ/internal/xenos/plasmavessel/queen,
		O_ACID =		/obj/item/organ/internal/xenos/acidgland,
		O_HIVE =		/obj/item/organ/internal/xenos/hivenode,
		O_RESIN =		/obj/item/organ/internal/xenos/resinspinner,
		O_NUTRIENT =	/obj/item/organ/internal/diona/nutrients,
		O_STOMACH =		/obj/item/organ/internal/stomach/xeno,
		O_INTESTINE =	/obj/item/organ/internal/intestine/xeno
		)

	inherent_verbs = list(
		/mob/living/proc/ventcrawl,
		/mob/living/carbon/human/proc/regurgitate,
		/mob/living/carbon/human/proc/plant,
		/mob/living/carbon/human/proc/transfer_plasma,
		/mob/living/carbon/human/proc/evolve,
		/mob/living/carbon/human/proc/resin,
		/mob/living/carbon/human/proc/corrosive_acid
		)

/datum/species/xenos/drone/handle_post_spawn(var/mob/living/carbon/human/H)

	var/mob/living/carbon/human/A = H
	if(!istype(A))
		return ..()
	..()

/datum/species/xenos/hunter
	name = SPECIES_GENA_HUNTER //CHOMPedit
	weeds_plasma_rate = 5
	caste_name = "hunter"
	slowdown = -2
	total_health = 150
	tail = null //CHOMPedit. Set to null

	icobase = 'icons/mob/human_races/xenos/r_xenos_hunter.dmi'
	deform =  'icons/mob/human_races/xenos/r_xenos_hunter.dmi'

	has_organ = list(
		O_HEART =    /obj/item/organ/internal/heart,
		O_BRAIN =    /obj/item/organ/internal/brain/xeno,
		O_PLASMA =   /obj/item/organ/internal/xenos/plasmavessel/hunter,
		O_HIVE =     /obj/item/organ/internal/xenos/hivenode,
		O_NUTRIENT = /obj/item/organ/internal/diona/nutrients,
		O_STOMACH =		/obj/item/organ/internal/stomach/xeno,
		O_INTESTINE =	/obj/item/organ/internal/intestine/xeno
		)

	inherent_verbs = list(
		/mob/living/proc/ventcrawl,
		/mob/living/carbon/human/proc/tackle,
		/mob/living/carbon/human/proc/gut,
		/mob/living/carbon/human/proc/leap,
		/mob/living/carbon/human/proc/psychic_whisper,
		/mob/living/carbon/human/proc/regurgitate
		)

/datum/species/xenos/sentinel
	name = SPECIES_GENA_SENTINEL //CHOMPedit
	weeds_plasma_rate = 10
	caste_name = "sentinel"
	slowdown = 0
	total_health = 200
	tail = null //CHOMPedit. Set to null

	icobase = 'icons/mob/human_races/xenos/r_xenos_sentinel.dmi'
	deform =  'icons/mob/human_races/xenos/r_xenos_sentinel.dmi'

	has_organ = list(
		O_HEART =    /obj/item/organ/internal/heart,
		O_BRAIN =    /obj/item/organ/internal/brain/xeno,
		O_PLASMA =   /obj/item/organ/internal/xenos/plasmavessel/sentinel,
		O_ACID =     /obj/item/organ/internal/xenos/acidgland,
		O_HIVE =     /obj/item/organ/internal/xenos/hivenode,
		O_NUTRIENT = /obj/item/organ/internal/diona/nutrients,
		O_STOMACH =		/obj/item/organ/internal/stomach/xeno,
		O_INTESTINE =	/obj/item/organ/internal/intestine/xeno
		)

	inherent_verbs = list(
		/mob/living/proc/ventcrawl,
		/mob/living/carbon/human/proc/tackle,
		/mob/living/carbon/human/proc/regurgitate,
		/mob/living/carbon/human/proc/transfer_plasma,
		/mob/living/carbon/human/proc/corrosive_acid,
		/mob/living/carbon/human/proc/neurotoxin,
		/mob/living/carbon/human/proc/acidspit
		)

/datum/species/xenos/queen

	name = SPECIES_GENA_QUEEN //CHOMPedit
	total_health = 300 //CHOMPedit. Queen is chonk
	weeds_heal_rate = 5
	weeds_plasma_rate = 20
	caste_name = "queen"
	slowdown = 4
	tail = null //CHOMPedit. Set to null
	rarity_value = 10

	icobase = 'icons/mob/human_races/xenos/r_xenos_queen.dmi'
	deform =  'icons/mob/human_races/xenos/r_xenos_queen.dmi'

	unarmed_types = list(/datum/unarmed_attack/claws/strong/xeno/queen, /datum/unarmed_attack/bite/strong/xeno)

	has_organ = list(
		O_HEART =    /obj/item/organ/internal/heart,
		O_BRAIN =    /obj/item/organ/internal/brain/xeno,
		O_EGG =      /obj/item/organ/internal/xenos/eggsac,
		O_PLASMA =   /obj/item/organ/internal/xenos/plasmavessel/queen,
		O_ACID =     /obj/item/organ/internal/xenos/acidgland,
		O_HIVE =     /obj/item/organ/internal/xenos/hivenode,
		O_RESIN =    /obj/item/organ/internal/xenos/resinspinner,
		O_NUTRIENT = /obj/item/organ/internal/diona/nutrients,
		O_STOMACH =		/obj/item/organ/internal/stomach/xeno,
		O_INTESTINE =	/obj/item/organ/internal/intestine/xeno
		)

	inherent_verbs = list(
		/mob/living/proc/ventcrawl,
		/mob/living/carbon/human/proc/psychic_whisper,
		/mob/living/carbon/human/proc/regurgitate,
		/mob/living/carbon/human/proc/lay_egg,
		/mob/living/carbon/human/proc/plant,
		/mob/living/carbon/human/proc/transfer_plasma,
		/mob/living/carbon/human/proc/corrosive_acid,
		/mob/living/carbon/human/proc/neurotoxin,
		/mob/living/carbon/human/proc/acidspit,
		/mob/living/carbon/human/proc/resin
		)

/datum/species/xenos/queen/handle_login_special(var/mob/living/carbon/human/H)
	..()
	// Make sure only one official queen exists at any point.
	if(!alien_queen_exists(1,H))
		H.real_name = "Genaprawn queen ([alien_number])" //CHOMPedit
		H.name = H.real_name
	else
		H.real_name = "Genaprawn princess ([alien_number])" //CHOMPedit
		H.name = H.real_name

/datum/hud_data/alien

	icon = 'icons/mob/screen1_alien.dmi'
	has_a_intent =  1
	has_m_intent =  1
	has_warnings =  1
	has_hands =     1
	has_drop =      1
	has_throw =     1
	has_resist =    1
	has_pressure =  0
	has_nutrition = 0
	has_bodytemp =  0
	has_internals = 0

	gear = list(
		"storage1" =     list("loc" = ui_storage1,  "name" = "Left Pocket",  "slot" = slot_l_store,   "state" = "pocket"),
		"storage2" =     list("loc" = ui_storage2,  "name" = "Right Pocket", "slot" = slot_r_store,   "state" = "pocket"),
		) //CHOMPedit removed head and outer layer item slots, since they caused a slew of problems with xenomorphs
