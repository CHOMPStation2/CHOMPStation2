/datum/disease/infection_hivemind
	name = "Binding Plague"
	medical_name = "Undetermined"
	max_stages = 4
	spread_text = "On contact"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_FLUIDS | DISEASE_SPREAD_CONTACT
	virus_modifiers = NEEDS_ALL_CURES
	cure_text = REAGENT_ID_CYANIDE
	cures = list(REAGENT_SYNAPTIZINE, REAGENT_SPACEACILLIN, REAGENT_COROPHIZINE, REAGENT_CRYOSLURRY)
	agent = "Living Plague"
	viable_mobtypes = list(/mob/living/carbon/human)
	cure_chance = 0
	desc = "Destroys the braincells, causing brain fever, brain necrosis and general intoxication."
	required_organs = list(/obj/item/organ/internal/brain)
	danger = DISEASE_HARMFUL
	discovery_threshold = 0

/datum/disease/infection_hivemind/stage_act()
	..()
	switch(stage)
		if(1)
			if(prob(1) && affected_mob.getBrainLoss() < 100)
				affected_mob.adjustBrainLoss(1)
			if(prob(10))
				to_chat(affected_mob, span_danger("You don't feel like yourself."))
		if(2)
			if(prob(1) && affected_mob.getBrainLoss() < 100)
				affected_mob.adjustBrainLoss(1)
			if(prob(10))
				to_chat(affected_mob, span_danger("You don't feel like yourself."))
			if(prob(10))
				step_rand(affected_mob)
			if(prob(10))
				new /mob/living/simple_mob/protoliveplague(affected_mob.loc)
		if(3)
			if(prob(1) && affected_mob.getBrainLoss() < 100)
				affected_mob.adjustBrainLoss(1)
			if(prob(10))
				to_chat(affected_mob, span_danger("You don't feel like yourself."))
			if(prob(20))
				step_rand(affected_mob)
			if(prob(20))
				new /mob/living/simple_mob/protoliveplague(affected_mob.loc)
		if(4)
			if(prob(1) && affected_mob.getBrainLoss() < 100)
				affected_mob.adjustBrainLoss(1)
			if(prob(10))
				to_chat(affected_mob, span_danger("You don't feel like yourself."))
			if(prob(30))
				step_rand(affected_mob)
			if(prob(40))
				new /mob/living/simple_mob/protoliveplague(affected_mob.loc)

/mob/living/simple_mob/protoliveplague
	name = "virus spore"
	desc = "A floating, fragile spore."

	icon = 'icons/mob/blob.dmi'
	pass_flags = PASSBLOB | PASSTABLE
	faction = FACTION_BLOB

	organ_names = /datum/decl/mob_organ_names/blob

	heat_damage_per_tick = 0
	cold_damage_per_tick = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	taser_kill = FALSE

	ai_holder_type = /datum/ai_holder/simple_mob/melee

	can_be_drop_prey = FALSE
	can_pain_emote = FALSE

	icon_state = "blobpod"
	icon_living = "blobpod"
	glow_range = 3
	glow_intensity = 5
	layer = ABOVE_MOB_LAYER // Over the blob.

	health = 30
	maxHealth = 30
	melee_damage_lower = 10
	melee_damage_upper = 10
	movement_cooldown = 0
	hovering = TRUE

	attacktext = list("slammed into")
	attack_sound = 'sound/effects/slime_squish.ogg'
	say_list_type = /datum/say_list/spore

	organ_names = /datum/decl/mob_organ_names/spore

/mob/living/simple_mob/protoliveplague/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/swarming)

/datum/reagent/event_agent
	name = REAGENT_EVENT_AGENT
	id = REAGENT_ID_EVENT_AGENT
	scannable = SCANNABLE_SECRETIVE
	description = "An abnormal substance."
	reagent_state = LIQUID
	color = "#ca1433"
	taste_mult = 0
	wiki_flag = WIKI_SPOILER
	supply_conversion_value = REFINERYEXPORT_VALUE_NO
	industrial_use = REFINERYEXPORT_REASON_BIOHAZARD

/datum/reagent/event_agent/on_mob_life(mob/living/carbon/M)
	M.ForceContractDisease(new /datum/disease/infection_hivemind(0))
	return ..()
