////////////////////////////////////
////////////   MEDICINE   /////////
//////////////////////////////////
/datum/reagent/claridyl
	name = REAGENT_CLARIDYL
	id = REAGENT_ID_CLARIDYL
	description = "Claridyl is an advanced medicine that cures all of your problems. Notice: Clarydil does not claim to fix marriages, car loans, student debt or insomnia and may cause severe pain."
	taste_description = "sugar"
	reagent_state = LIQUID
	color = "#AAAAFF"
	overdose = REAGENTS_OVERDOSE * 100
	metabolism = REM * 0.1
	scannable = 1

/datum/reagent/claridyl/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.add_chemical_effect(CE_STABLE, 30)
		M.add_chemical_effect(CE_PAINKILLER, 40)
		if(M.getBruteLoss())
			M.adjustBruteLoss(-1)
			M.adjustHalLoss(1.5)
		if(prob(0.0001))
			M.adjustToxLoss(50)//instant crit for tesh

		if(prob(0.1))
			pick(M.custom_pain("You suddenly feel inexplicably angry!",30),
			M.custom_pain("You suddenly lose your train of thought!",30),
			M.custom_pain("Your mouth feels dry!",30),
			M.make_dizzy(2),
			M.AdjustWeakened(10),
			M.AdjustStunned(1),
			M.AdjustParalysis(0.1),
			M.hallucination = max(M.hallucination, 2),
			M.flash_eyes(),
			M.custom_pain("Your vision becomes blurred!",30),
			M.add_chemical_effect(CE_ALCOHOL, 5),)

/datum/reagent/claridyl/bloodburn/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.bloodstr)//No seriously dont inject this wtf is wrong with you.
		for(var/datum/reagent/R in M.bloodstr.reagent_list)
			if(istype(R, /datum/reagent/blood))
				R.remove_self(removed * 15)

/datum/reagent/claridyl/bloodburn/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.ingested)
		for(var/datum/reagent/R in M.ingested.reagent_list)
			if(istype(R, /datum/reagent/ethanol))
				R.remove_self(removed * 5)

/datum/reagent/claridyl/bloodburn
	name = REAGENT_BLOODBURN
	id = REAGENT_ID_BLOODBURN
	description = "A chemical used to soak up any reagents inside someones stomach, injection is not advised, if you need to ask why please seek a new job."
	taste_description = "liquid void"
	color = "#000000"
	metabolism = REM * 5

/datum/reagent/eden
	name = REAGENT_EDEN
	id = REAGENT_ID_EDEN
	description = "The ultimate anti toxin unrivaled, it corrects impurities within the body but punishes those who attain them with a burning sensation"
	taste_description = "peace"
	color = "#00FFBE"
	overdose = REAGENTS_OVERDOSE * 1
	metabolism = 0

/datum/reagent/eden/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_SLIME || alien == IS_DIONA)
		return
	if(M.getToxLoss())
		M.adjustFireLoss(1.2)
		M.adjustToxLoss(-1)

/datum/reagent/eden/snake
	name = REAGENT_EDENSNAKE
	id = REAGENT_ID_EDENSNAKE
	metabolism = 0.1
	description = "It used to be an anti toxin until it was tainted."
	taste_description = "hellfire"
	color = "#FF0000"

/datum/reagent/eden/snake/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustOxyLoss(1)
	M.adjustFireLoss(1)
	M.adjustBruteLoss(1)
	M.adjustToxLoss(1)

/datum/reagent/tercozolam
	name = REAGENT_TERCOZOLAM
	id = REAGENT_ID_TERCOZOLAM
	color = "#afeb17"
	metabolism = 0.05
	description = "A well respected drug used for treatment of schizophrenia in specific."
	overdose = REAGENTS_OVERDOSE * 2

///SAP REAGENTS////
//This is all a direct port from aeiou.

/datum/reagent/hannoa
	name = REAGENT_HANNOA
	id = REAGENT_ID_HANNOA
	description = "A powerful clotting agent that treats brute damage very quickly but takes a long time to be metabolised. Overdoses easily, reacts badly with other chemicals."
	taste_description = "paint"
	reagent_state = LIQUID
	color = "#163851"
	overdose = 8
	scannable = 1
	metabolism = 0.03

/datum/reagent/hannoa/overdose(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(ishuman(M))
		var/wound_heal = 1.5 * removed
		var/mob/living/carbon/human/H = M
		for(var/obj/item/organ/external/O in H.bad_external_organs)
			for(var/datum/wound/W in O.wounds)
				if(W.bleeding())
					W.damage = max(W.damage - wound_heal, 0)
					if(W.damage <= 0)
						O.wounds -= W
		M.take_organ_damage(3 * removed, 0)
		if(M.losebreath < 15)
			M.AdjustLosebreath(1)
		H.custom_pain("It feels as if your veins are fusing shut!",60)

/datum/reagent/hannoa/affect_blood(var/mob/living/carbon/M, var/alien, var/removed) //Sleepy if not overdosing.
	..()
	var/effective_dose = dose
	if(effective_dose < 2)
		if(effective_dose == metabolism * 2 || prob(5))
			M.emote("yawn")
		else if(effective_dose < 5)
			M.eye_blurry = max(M.eye_blurry, 10)
		else if(effective_dose < 20)
			if(prob(50))
				M.Weaken(2)
			M.drowsyness = max(M.drowsyness, 20)
	else
		M.sleeping = max(M.sleeping, 20)


/datum/reagent/bullvalene //This is for the third sap. It converts Brute Oxy and burn into slightly less toxins.
	name = REAGENT_BULLVALENE
	id = REAGENT_ID_BULLVALENE
	description = "A catalytic chemical that can treat a wide variety of ailments at the cost of toxifying the host's body."
	taste_description = "sulfur"
	reagent_state = LIQUID
	color = "#163851"
	overdose = 8 //This many units starts killing you.
	scannable = 1 // Mechs can scan this ye
	metabolism = 0.03 //Slow metabolism. This value was plucked out of nowhere. Can be changed.

/datum/reagent/bullvalene/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_SLIME || alien == IS_DIONA)
		return
	if(M.getBruteLoss() || M.getFireLoss() || M.getOxyLoss())
		M.adjustOxyLoss(-1)
		M.adjustFireLoss(-1)
		M.adjustBruteLoss(-1)
		M.adjustToxLoss(0.8)

/////SERAZINE REAGENTS///////

/datum/reagent/serazine
	name = REAGENT_SERAZINE
	id = REAGENT_ID_SERAZINE
	description = "A sweet tasting flower extract, it has very mild anti toxic properties, help with hallucinations and drowsyness, and can be used to make potent drugs."
	taste_description = "sweet nectar"
	reagent_state = LIQUID
	color = "#df9898"
	scannable = 1

/datum/reagent/serazine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1
	if(alien != IS_DIONA)
		M.drowsyness = max(0, M.drowsyness - 3 * removed * chem_effective)
		M.hallucination = max(0, M.hallucination - 6 * removed * chem_effective)
		M.adjustToxLoss(-2 * removed * chem_effective)

/datum/reagent/alizene
	name = REAGENT_ALIZENE
	id = REAGENT_ID_ALIZENE
	description = "A derivative from bicaridine enhanced by serazine to more effectively mend flesh, but is ineffective against internal hemorrhage."
	taste_description = "bittersweet"
	taste_mult = 3
	reagent_state = LIQUID
	color = "#b37979"
	overdose = REAGENTS_OVERDOSE
	scannable = 1

/datum/reagent/alizene/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1
	if(alien == IS_SLIME)
		chem_effective = 0.75
	if(alien != IS_DIONA)
		M.heal_organ_damage(12 * removed * chem_effective, 0)
