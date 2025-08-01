///GENDER CHANGE REAGENTS////

/datum/reagent/change_drug //base chemical
	name = REAGENT_AMORPHOROVIR //always the same name
	id = REAGENT_ID_AMORPHOROVIR
	metabolism = 100 //set high enough that it does not process multiple times(delay implemented below)
	description = "the bloods DNA in this seems aggressive"
	taste_description = "this shouldn't be here" //unobtainable ingame
	color = "#7F0000"
	var/gender_change = null //set the gender variable here so we can set it to others in varients
	supply_conversion_value = REFINERYEXPORT_VALUE_COMMON
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/change_drug/male //inherits base chemical properties listed above
	name = REAGENT_ANDROROVIR
	id = REAGENT_ID_ANDROROVIR //unique ID for each varient
	taste_description = "old spice odor blocker and body wash"
	reagent_state = LIQUID
	description = \
		"A medical concoction, capable of rapidly altering genetic and physical structure of the body. This one seems\
		to realign the target's gender to be male."
	color = "#428AFF"
	gender_change = "male"
	scannable = 1

/datum/reagent/change_drug/female
	name = REAGENT_GYNOROVIR
	id = REAGENT_ID_GYNOROVIR
	description = \
		"A medical concoction, capable of rapidly altering genetic and physical structure of the body. This one seems\
		to realign the target's gender to be female."
	taste_description = "spiced honey"
	reagent_state = LIQUID
	color = "#FFA0FA"
	gender_change = "female"
	scannable = 1

/datum/reagent/change_drug/intersex
	name = REAGENT_ANDROGYNOROVIR
	id = REAGENT_ID_ANDROGYNOROVIR
	description = \
		"A medical concoction, capable of rapidly altering genetic and physical structure of the body. This one seems\
		to realign the target's gender to be mixed."
	taste_description = "something salty and sweet"
	reagent_state = LIQUID
	color = "#CB9EFF"
	gender_change = "plural"
	scannable = 1

/datum/reagent/change_drug/affect_blood(var/mob/living/carbon/human/M, var/alien, var/removed)
	if (!(alien == IS_DIONA || M.gender == gender_change || M.gender_change_cooldown == 1) && M.allow_spontaneous_tf)
		//set not to bug them because the chem is activating
		M.gender_change_cooldown = 1
		M.visible_message(
			span_notice("[M] suddenly twitches as some of their features seem to contort and reshape."),
			span_notice("You lose focus as warmth spreads throughout your chest and abdomen.")
		)
		//wait 30 seconds, growth takes time yo
		spawn(300)
			//allow it to bug them again now that we've waited
			M.gender_change_cooldown = 0
			//check if they want this to happen for pref sake
			if (alert(M,"This chemical will change your gender, proceed?", "Warning", "Yes", "No") == "Yes")
				M.change_gender_identity(gender_change)
				M.change_gender(gender_change)
				to_chat(M, span_warning("You feel like a new person."))

//Chemist expansion
//deathblood
/datum/reagent/cleansingagent
	name = REAGENT_CLEANSINGAGENT
	id = REAGENT_ID_CLEANSINGAGENT
	description = "An agent that purges one's body of toxins."
	reagent_state = LIQUID
	color = "#225722"
	scannable = 1
	overdose = REAGENTS_OVERDOSE
	overdose_mod = 0
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/cleansingagent/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1 * M.species.chem_strength_heal
	if(alien == IS_SLIME)
		chem_effective = 0.66
	if(alien != IS_DIONA)
		M.druggy = max(M.druggy, 5)
		M.adjustToxLoss(-6 * removed * chem_effective)
		M.radiation = max(M.radiation - 15 * removed * M.species.chem_strength_heal, 0)
		M.accumulated_rads = max(M.accumulated_rads - 15 * removed * M.species.chem_strength_heal, 0)

/datum/reagent/purifyingagent
	name = REAGENT_PURIFYINGAGENT
	id = REAGENT_ID_PURIFYINGAGENT
	description = "An agent that purges one's body of rads and toxins."
	reagent_state = LIQUID
	color = "#225722"
	scannable = 1
	overdose = REAGENTS_OVERDOSE
	overdose_mod = 0
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/purifyingagent/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1 * M.species.chem_strength_heal
	if(alien == IS_SLIME)
		chem_effective = 0.66
	if(alien != IS_DIONA)
		M.adjustToxLoss(-6 * removed * chem_effective)
		M.radiation = max(M.radiation - 15 * removed * M.species.chem_strength_heal, 0)
		M.accumulated_rads = max(M.accumulated_rads - 15 * removed * M.species.chem_strength_heal, 0)

//liquid fire
/datum/reagent/burncard
	name = REAGENT_BURNCARD
	id = REAGENT_ID_BURNCARD
	description = "A more powerful variation of bicard that also burns the subject."
	taste_description = "bitterness"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#BF0000"
	overdose = REAGENTS_OVERDOSE * 0.2
	overdose_mod = 1.25
	scannable = 1
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/burncard/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1 * M.species.chem_strength_heal
	if(alien == IS_SLIME)
		chem_effective = 0.75
	if(alien != IS_DIONA)
		M.heal_organ_damage(13 * removed * chem_effective, 0)
		M.adjustFireLoss(1 * removed)

/datum/reagent/burncard/overdose(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	var/wound_heal = 3 * removed
	M.eye_blurry = min(M.eye_blurry + wound_heal, 250)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		for(var/obj/item/organ/external/O in H.bad_external_organs)
			for(var/datum/wound/W in O.wounds)
				if(W.bleeding())
					W.damage = max(W.damage - wound_heal, 0)
					if(W.damage <= 0)
						O.wounds -= W
				if(W.internal)
					W.damage = max(W.damage - wound_heal, 0)
					if(W.damage <= 0)
						O.wounds -= W

/datum/reagent/flamecure
	name = REAGENT_FLAMECURE
	id = REAGENT_ID_FLAMECURE
	description = "Used to rapidly clot internal hemorrhages by burning the wounded areas"
	reagent_state = LIQUID
	color = "#4246C7"
	overdose = REAGENTS_OVERDOSE * 0.5
	scannable = 1
	var/repair_strength = 9
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/flamecure/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	M.eye_blurry = min(M.eye_blurry + (repair_strength * removed), 250)
	M.heal_organ_damage(0, -1 * removed)
	if(ishuman(M))
		M.heal_organ_damage(0, -1 * removed)
		var/mob/living/carbon/human/H = M
		var/wound_heal = removed * repair_strength
		for(var/obj/item/organ/external/O in H.bad_external_organs)
			for(var/datum/wound/W in O.wounds)
				if(W.bleeding())
					W.damage = max(W.damage - wound_heal, 0)
					if(W.damage <= 0)
						O.wounds -= W
				if(W.internal)
					W.damage = max(W.damage - wound_heal, 0)
					if(W.damage <= 0)
						O.wounds -= W

//neoliquidfire
/datum/reagent/neotane
	name = REAGENT_NEOTANE
	id = REAGENT_ID_NEOTANE
	description = "An advancement of kelotane that scars and breaks apart the user's flesh to remove the burnt tissue."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#FF6600"
	overdose = REAGENTS_OVERDOSE * 0.2
	scannable = 1
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/neotane/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1 * M.species.chem_strength_heal
	if(alien == IS_SLIME)
		chem_effective = 0.5
		M.adjustBruteLoss(3 * removed)
	if(alien != IS_DIONA)
		M.heal_organ_damage(0, 13 * removed * chem_effective)
		M.adjustBruteLoss(1 * removed)

/datum/reagent/bloodsealer
	name = REAGENT_BLOODSEALER
	id = REAGENT_ID_BLOODSEALER
	description = "A strange chemical that will stablize bloodflow by burning the subject"
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#00BFFF"
	overdose = REAGENTS_OVERDOSE
	scannable = 1
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/bloodsealer/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.add_chemical_effect(CE_STABLE, 25)
		M.heal_organ_damage(0, -1 * removed)

//meteroidliquid
/datum/reagent/livingagent
	name = REAGENT_LIVINGAGENT
	id = REAGENT_ID_LIVINGAGENT
	description = "Fill the body with life, while making it more senstive to stimulus."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#8040FF"
	scannable = 1
	overdose = REAGENTS_OVERDOSE * 3
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/livingagent/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.druggy = max(M.druggy, 5)
	M.Confuse(5)
	//YW ADDITIONS END

/datum/reagent/livingagent/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		var/chem_effective = 1 * M.species.chem_strength_heal
		if(alien == IS_SLIME)
			chem_effective = 0.5
		M.adjustOxyLoss(-4 * removed * chem_effective)
		M.heal_organ_damage(2 * removed, 2 * removed * chem_effective)
		M.adjustToxLoss(-3 * removed * chem_effective)
		M.add_chemical_effect(CE_PAINKILLER, -20 * M.species.chem_strength_pain)

/datum/reagent/performancepeaker
	name = REAGENT_PERFORMANCEPEAKER
	id = REAGENT_ID_PERFORMANCEPEAKER
	description = "A chemical created to bring a body to peak condition except it's highly toxic"
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#006666"
	scannable = 1
	overdose = REAGENTS_OVERDOSE * 0.5
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/performancepeaker/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.add_chemical_effect(CE_SPEEDBOOST, 0.5)
	M.AdjustParalysis(-1)
	M.AdjustStunned(-1)
	M.AdjustWeakened(-1)
	M.add_chemical_effect(CE_PAINKILLER, 10 * M.species.chem_strength_pain)
	M.adjustToxLoss(15 * removed)

//advanced crafting
//tier 1
/datum/reagent/souldew
	name = REAGENT_SOULDEW
	id = REAGENT_ID_SOULDEW
	description = "An experimental drug that solely works upon dead bodies"
	taste_description = "ash"
	reagent_state = LIQUID
	color = "#666699"
	scannable = 1
	overdose = REAGENTS_OVERDOSE * 2
	affects_dead = TRUE
	mrate_static = TRUE
	metabolism = 0.5
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/souldew/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1 * M.species.chem_strength_heal
	if(M.stat == DEAD)
		M.adjustOxyLoss(-3 * removed * chem_effective)
		M.heal_organ_damage(3 * removed * chem_effective, 3 * removed * chem_effective)
		M.adjustToxLoss(-3 * removed * chem_effective)

/datum/reagent/quadcord
	name = REAGENT_QUADCORD
	id = REAGENT_ID_QUADCORD
	description = "An experimental drug that is meant to further enhance tricord"
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#FF3399"
	scannable = 1
	overdose = REAGENTS_OVERDOSE * 2
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI
/datum/reagent/quadcord/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		var/chem_effective = 1 * M.species.chem_strength_heal
		if(alien == IS_SLIME)
			chem_effective = 0.5
		M.adjustOxyLoss(-0.5 * removed * chem_effective)
		M.heal_organ_damage(0.5 * removed * chem_effective, 0.5 * removed * chem_effective)
		M.adjustToxLoss(-0.5 * removed * chem_effective)
		M.adjustBrainLoss(-1 * removed * chem_effective)

//tier 2


/datum/reagent/curea
	name = REAGENT_CUREA
	id = REAGENT_ID_CUREA
	description = "An experimental that removes many ailments, such as poison and stiffening of muscles via frost"
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#660066"
	scannable = 1
	overdose = REAGENTS_OVERDOSE * 0.5
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/curea/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.remove_a_modifier_of_type(/datum/modifier/poisoned)
	M.remove_a_modifier_of_type(/datum/modifier/chilled)
	M.remove_a_modifier_of_type(/datum/modifier/doomed)
	M.remove_a_modifier_of_type(/datum/modifier/invulnerable)
	M.remove_a_modifier_of_type(/datum/modifier/elemental_vulnerability)
	M.remove_a_modifier_of_type(/datum/modifier/grievous_wounds)
	M.remove_a_modifier_of_type(/datum/modifier/deep_wounds)
	M.remove_a_modifier_of_type(/datum/modifier/hivebot_weaken)
	M.remove_a_modifier_of_type(/datum/modifier/fire)
	M.remove_a_modifier_of_type(/datum/modifier/berserk_exhaustion)
	M.remove_a_modifier_of_type(/datum/modifier/entangled)
	M.remove_a_modifier_of_type(/datum/modifier/wizfire)
	M.remove_a_modifier_of_type(/datum/modifier/wizpoison)

//tier 3
/datum/reagent/modapplying/liquidhealer
	name = REAGENT_LIQUIDHEALER
	id = REAGENT_ID_LIQUIDHEALER
	description = "An experimental drug that mimics rapid regeneration seen in squishy creatures."
	taste_description = "sweet"
	reagent_state = LIQUID
	color = "#00CCFF"
	scannable = 1
	overdose = REAGENTS_OVERDOSE * 0.5
	modifier_to_add = /datum/modifier/liquidhealer
	modifier_duration = 3 SECONDS
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/modifier/liquidhealer
	name = REAGENT_ID_LIQUIDHEALER
	desc = "You are filled with an overwhelming healing."

	on_created_text = span_critical("You feel your body's natural healing quick into overdrive!")
	on_expired_text = span_notice("Your body returns to normal.")

	incoming_healing_percent = 1.2

/datum/modifier/liquidhealer/tick()
	if(holder.stat == DEAD)
		expire()

	if(ishuman(holder)) // Robolimbs need this code sadly.
		var/mob/living/carbon/human/H = holder
		for(var/obj/item/organ/external/E in H.organs)
			var/obj/item/organ/external/O = E
			O.heal_damage(1, 1, 0, 1)
	else
		holder.adjustBruteLoss(-1)
		holder.adjustFireLoss(-1)

	holder.adjustToxLoss(-1)
	holder.adjustOxyLoss(-1)
	holder.adjustCloneLoss(-1)


/datum/reagent/phoenixbreath
	name = REAGENT_PHOENIXBREATH
	id = REAGENT_ID_PHOENIXBREATH
	description = "An improvement on the original soul dew chemical"
	taste_description = "ash"
	reagent_state = LIQUID
	color = "#FFFFFF"
	scannable = 1
	overdose = REAGENTS_OVERDOSE
	affects_dead = TRUE
	mrate_static = TRUE
	metabolism = 0.5
	supply_conversion_value = REFINERYEXPORT_VALUE_HIGHREFINED
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/phoenixbreath/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1 * M.species.chem_strength_heal
	if(M.stat == DEAD)
		M.adjustOxyLoss(-3 * removed * chem_effective)
		M.heal_organ_damage(4 * removed * chem_effective, 4 * removed * chem_effective)
		M.adjustToxLoss(-3 * removed * chem_effective)
	M.adjustOxyLoss(-2 * removed * chem_effective)
	M.heal_organ_damage(4 * removed * chem_effective, 4 * removed * chem_effective)
	M.adjustToxLoss(-2 * removed * chem_effective)
	M.add_chemical_effect(CE_PAINKILLER, 10 * M.species.chem_strength_pain)

/datum/reagent/dryagent
	name = REAGENT_DRYAGENT
	id = REAGENT_ID_DRYAGENT
	description = "A desiccant. Can be used to dry things."
	taste_description = "dryness"
	reagent_state = LIQUID
	color = "#A70FFF"
	scannable = 1
	overdose = REAGENTS_OVERDOSE
	supply_conversion_value = REFINERYEXPORT_VALUE_PROCESSED
	industrial_use = REFINERYEXPORT_REASON_INDUSTRY

/datum/reagent/dryagent/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1 * M.species.chem_strength_heal
	if(alien == IS_SLIME)
		chem_effective = 1.25
		M.adjustFireLoss(2 * removed * chem_effective) // Why are you giving this to Prometheans or Dionas. You're going to DRY them.

/datum/reagent/dryagent/touch_obj(obj/O, amount)
	if(istype(O, /obj/item/clothing/shoes/galoshes) && O.loc)
		new /obj/item/clothing/shoes/dry_galoshes(O.loc)
		qdel(O)
		remove_self(10)

/datum/reagent/dryagent/touch_turf(var/turf/T)
	..()
	if(volume >= 5)
		if(istype(T, /turf/simulated/floor))
			var/turf/simulated/floor/F = T
			if(F.wet)
				F.wet = 0
	return
