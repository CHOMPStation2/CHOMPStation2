//There is already a station file, but feels wrong to put zaddat balancing changes with the restriction file, and feels wrong to lump them in with a modular station_vr so hello station_ch file

/datum/species/zaddat
	toxins_mod =    0.5 //toxins rarely come into play, and zaddat just has negatives. Along with their parasite letting them survive in their polluted planet, this seems reasonable.

//So both of this are based off Fennec foxes I belivive. Those are desert critters, giving them more warm focused levels. And for variety giving them minor brute weakness and minor burn resistant
//I also want to make a dig because fennec foxes actually make burrows and such, but I can't figure out how to do it in a way that is both flavorful but not abuseable
/datum/species/hi_zoxxen //zorrens get wierd chemistry because of their past of expirementing on themselves. Check the cataloguer for deathclaws
	chemOD_threshold =		0.75
	radiation_mod = 0.5
	brute_mod = 1.1
	burn_mod = 0.9

	cold_level_1 = 270 //Default 260 - Lower is better
	cold_level_2 = 210 //Default 200
	cold_level_3 = 120 //Default 120

	breath_cold_level_1 = 250	//Default 240 - Lower is better
	breath_cold_level_2 = 190	//Default 180
	breath_cold_level_3 = 100	//Default 100

	heat_level_1 = 400 //Default 360 - Higher is better
	heat_level_2 = 460 //Default 400
	heat_level_3 = 1080 //Default 1000

	breath_heat_level_1 = 430	//Default 380 - Higher is better
	breath_heat_level_2 = 510	//Default 450
	breath_heat_level_3 = 1200	//Default 1250

/datum/species/fl_zorren
	item_slowdown_mod = 1.2
	slowdown = -0.2
	brute_mod = 1.1
	burn_mod = 0.9

	cold_level_1 = 270 //Default 260 - Lower is better
	cold_level_2 = 210 //Default 200
	cold_level_3 = 120 //Default 120

	breath_cold_level_1 = 250	//Default 240 - Lower is better
	breath_cold_level_2 = 190	//Default 180
	breath_cold_level_3 = 100	//Default 100

	heat_level_1 = 400 //Default 360 - Higher is better
	heat_level_2 = 460 //Default 400
	heat_level_3 = 1080 //Default 1000

	breath_heat_level_1 = 430	//Default 380 - Higher is better
	breath_heat_level_2 = 510	//Default 450
	breath_heat_level_3 = 1200	//Default 1250


/datum/species/xenomorph_hybrid
	name = SPECIES_XENOMORPH_HYBRID
	name_plural = "Xenomorph Hybrids"
	icobase = 'modular_chomp/icons/mob/human_races/r_xenomorph_hybrid.dmi'
	deform = 'modular_chomp/icons/mob/human_races/r_xenomorph_hybrid.dmi'
	tail = "tail"
	icobase_tail = 1
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp) // Innate claws and bite.
	darksight = 8 // Same as Tajarans.
	ambiguous_genders = TRUE
	gluttonous = 1
	slowdown = -0.2 // Slightly faster than average.
	total_health = 150 // Takes a lot of effort to take a Xenomorph down.
	brute_mod = 0.90 // Physical damage doesn't phase them as much.
	burn_mod = 1.40 // They do NOT like fire.
	toxins_mod = 0.90 // Slightly resistant to toxins.
	radiation_mod = 0.7 // Quite resistant to radiation exposure.
	flash_mod = 1.1 // Flashes are slightly more effective.
	metabolic_rate = 1.2 // Very physically active species, thus requiring more nutritional intake.
	item_slowdown_mod = 0.90 // They carry heavy things slightly better.
	mob_size = MOB_MEDIUM // Technically doesn't even need this but still adding the override just in case.
	blood_volume = 640 // More blood to compound their high health.
	bloodloss_rate = 0.90 // Bleed slightly slower.
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_XENOLINGUA)
	name_language = LANGUAGE_XENOLINGUA
	species_language = LANGUAGE_XENOLINGUA
	color_mult = 1
	health_hud_intensity = 1.5
	chem_strength_alcohol = 1.2 // They don't handle their drinks very well.
	throwforce_absorb_threshold = 10 // Heavy.

	economic_modifier = 5 // While they aren't true Xenomorphs, they still draw a lot of social stigma, and are generally mistreated and underpaid as a result.

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "##242424"
	blood_color = "##00C202"
	base_color = "##242424"

	min_age = 18
	max_age = 300 // Big number lol

	move_trail = /obj/effect/decal/cleanable/blood/tracks/claw
	digi_allowed = TRUE
	icodigi = 'modular_chomp/icons/mob/human_races/r_digi_xeno.dmi'

	species_sounds = "Xeno"
	gender_specific_species_sounds = FALSE

	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)

	// Some Xeno parts included.
	has_organ = list(
		O_HEART =    	/obj/item/organ/internal/heart,
		O_LUNGS =    	/obj/item/organ/internal/lungs,
		O_LIVER =    	/obj/item/organ/internal/liver,
		O_BRAIN =   	/obj/item/organ/internal/brain,
		O_EYES =     	/obj/item/organ/internal/eyes,
		O_KIDNEYS =		/obj/item/organ/internal/kidneys,
		O_APPENDIX = 	/obj/item/organ/internal/appendix,
		O_STOMACH =		/obj/item/organ/internal/stomach,
		O_INTESTINE =	/obj/item/organ/internal/intestine,
		O_PLASMA =   	/obj/item/organ/internal/xenos/plasmavessel/queen,
		O_HIVE =     	/obj/item/organ/internal/xenos/hivenode,
		O_RESIN =		/obj/item/organ/internal/xenos/resinspinner/weak // Weaker weed nodes with less spread range.
		)


	heat_discomfort_level = 303.15 // 30 Celsius, not so comfortable in high temperatures.
	heat_discomfort_strings = list(
		"Our carapace bristles in the heat."
		)

	cold_discomfort_level = 263.15 // -10 Celsius, comfortable in below freezing temperatures.
	cold_discomfort_strings = list(
		"The cold bites through our carapace."
		)

	var/weeds_plasma_rate = 3 	// Plasma regen on weeds. Much lower than actual xenos.
	var/weeds_heal_rate = 0   	// Health regen on weeds. No healing unless resting.

/datum/species/xenomorph_hybrid/handle_environment_special(var/mob/living/carbon/human/H)

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

/datum/species/xenomorph_hybrid/proc/regenerate(var/mob/living/carbon/human/H)
	var/heal_rate = weeds_heal_rate
	var/mend_prob = 3 // Much lower than regular xenos.
	if (!H.resting)
		heal_rate = weeds_heal_rate / 2 // Much lower than regular xenos.
		mend_prob = 1

	//first heal damages
	if (H.getBruteLoss() || H.getFireLoss() || H.getOxyLoss() || H.getToxLoss())
		H.adjustBruteLoss(-heal_rate)
		H.adjustFireLoss(-heal_rate)
		H.adjustOxyLoss(-heal_rate)
		H.adjustToxLoss(-heal_rate)
		if (prob(5))
			to_chat(H, "<span class='alien'>A soothing sensation falls over us...</span>")
		return 1

	//next internal organs
	for(var/obj/item/organ/I in H.internal_organs)
		if(I.damage > 0)
			I.damage = max(I.damage - heal_rate, 0)
			if (prob(5))
				to_chat(H, "<span class='alien'>We feel a soothing sensation within our [I.parent_organ]...</span>")
			return 1

	//next mend broken bones, approx 10 ticks each
	for(var/obj/item/organ/external/E in H.bad_external_organs)
		if (E.status & ORGAN_BROKEN)
			if (prob(mend_prob))
				if (E.mend_fracture())
					to_chat(H, "<span class='alien'>We feel something mend within our [E.name].</span>")
			return 1

	return 0

/// WEAKER XENOMORPH HYBRID ABILITIES / ORGANS. ///

// ABILITIES //

/mob/living/carbon/human/proc/plant_weak()
	set name = "Plant Weeds (50)"
	set desc = "Plants some alien weeds."
	set category = "Abilities"

	if(check_alien_ability(50,1,O_RESIN))
		visible_message("<span class='alium'><B>[src] has planted some alien weeds!</B></span>")
		new /obj/effect/alien/weeds/node/weak(get_turf(src), null, "#321D37")	// Aliens.dm for weed node origin.
	return

/* /mob/living/carbon/human/proc/check_plasma_amount(mob/living/carbon/human/M as mob in oview())
	set name = "Check Plasma Reserves"
	set category = "Abilities"

	var/obj/item/organ/internal/xenos/plasmavessel/I = M.internal_organs_by_name[O_PLASMA]
	if(!istype(I))
		to_chat(M, "<span class='alium'>Our plasma vessel is missing!</span>")
		return
	else
		to_chat(M, "Your plasma reserves are at [I.stored_plasma]/[I.max_plasma].")
	return */ // Not working, will fix later probably.

// ORGANS //

/obj/item/organ/internal/xenos/resinspinner/weak
	name = "resin spinner"
	parent_organ = BP_HEAD
	icon_state = "xenode"
	organ_tag = O_RESIN

	organ_verbs = list(
		/mob/living/carbon/human/proc/resin,
		/mob/living/carbon/human/proc/plant_weak,
//		/mob/living/carbon/human/proc/check_plasma_amount
		)
