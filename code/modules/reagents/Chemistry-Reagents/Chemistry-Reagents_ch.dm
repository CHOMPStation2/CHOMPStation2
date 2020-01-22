/// Recipes

/datum/chemical_reaction/aphrodisiac
	name = "Aphrodisiac"
	id = "aphrodisiac"
	result = "aphrodisiac"
	required_reagents = list("carbon" = 2, "hydrogen" = 2, "oxygen" = 2, "water" = 1)
	result_amount = 6

/datum/reagent/aphrodisiac
	name = "Aphrodisiac"
	id = "aphrodisiac"
	description = "You so horny."
	taste_description = "sweetness"
	reagent_state = LIQUID
	color = "#FF9999"
	scannable = 1

/datum/reagent/aphrodisiac/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(!M)	return

	if(prob(3))
		M.emote(pick("blush", "moan", "moan", "giggle"))

	// Unsure if we want to allow cumming. I'm gonna disable it for now.
/*
	if(prob(1))
		switch(M.gender)
			if(MALE)
				M.emote("mcum")
			if(FEMALE)
				M.emote("fcum")
			if(PLURAL)
				if(prob(50))
					M.emote("mcum")
				else
					M.emote("fcum")
*/
// Disabled cause I'm unsure if we want to do this or not.
/*
/mob/living/proc/cum()
	if(!check_has_mouth())
		return
	src.visible_message("<span class='warning'>[src] throws up!</span>","<span class='warning'>You throw up!</span>")

	var/turf/simulated/T = get_turf(src)	//TODO: Make add_blood_floor remove blood from human mobs
	if(istype(T))
		T.add_vomit_floor(src, 1)
*/

//////////////////////////////////////////////
////////////////C U B E S////////////////////
////////////////////////////////////////////
/datum/chemical_reaction/cube/sagaru
	name = "Saguwu"
	id = "cubedsagaru"
	result = null
	required_reagents = list("cheese" = 1, "blood" = 1, "clonexadone" = 10,)
	result_amount = 1

/datum/chemical_reaction/cube/sagaru/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/sarucube(location)
	return

//this kinda counts
//LIQUID EGG
/datum/reagent/liquidspideregg
	name = "spider eggs"
	id = "spideregg"
	description = "These are eggs, spiders crawl out of these.. probably not healthy inside of a person."
	taste_description = "SO MANY LEGS"
	reagent_state = LIQUID
	color = "#FFFFFF"
	overdose = REAGENTS_OVERDOSE * 100
	metabolism = REM * 0.1
	scannable = 1
	var/amount_grown = 0
	var/min_growth = 0
	var/max_growth = 2
	var/spiders_min = 6
	var/spiders_max = 24
	var/spider_type = /obj/effect/spider/spiderling

/datum/reagent/liquidspideregg/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(1))
		M.custom_pain("You can feel movement within your body!",45)
	amount_grown += rand(min_growth,max_growth)
	if(amount_grown >= 100)
		min_growth++
		max_growth++
		amount_grown = 0
		var/num = rand(spiders_min, spiders_max)
		var/obj/item/organ/external/O = null
		if(istype(M.loc, /obj/item/organ/external))
			O = M.loc

		for(var/i=0, i<num, i++)
			var/spiderling = new spider_type(M.loc, M)
			if(O)
				O.implants += spiderling

////////////////////////////////////
////////////   MEDICINE   /////////
//////////////////////////////////
/datum/reagent/claridyl
	name = "Claridyl Natural Remedy"
	id = "claridyl"
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
	name = "Bloodburn"
	id = "bloodburn"
	description = "A chemical used to soak up any reagents inside someones stomach, injection is not advised, if you need to ask why please seek a new job."
	taste_description = "liquid void"
	color = "#000000"
	metabolism = REM * 5

/datum/reagent/eden
	name = "Eden"
	id = "eden"
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
	name = "Tainted Eden"
	id = "eden_snake"
	metabolism = 0.1
	description = "It used to be an anti toxin until it was tainted."
	taste_description = "hellfire"
	color = "#FF0000"

/datum/reagent/eden/snake/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustOxyLoss(1)
	M.adjustFireLoss(1)
	M.adjustBruteLoss(1)
	M.adjustToxLoss(1)

/datum/reagent/change_drug //base chemical
	name = "Elixer of Change" //always the same name
	id = "change_drug"
	metabolism = 100 //set high enough that it does not process multiple times(delay implemented below)
	description = "the bloods DNA in this seems aggressive"
	taste_description = "this shouldn't be here" //unobtainable ingame
	color = "#7F0000"
	var/gender_change = null //set the gender variable here so we can set it to others in varients

/datum/reagent/change_drug/male //inherits base chemical properties listed above
	id = "change_drug_male" //unique ID for each varient
	taste_description = "old spice odor blocker body wash"
	reagent_state = LIQUID
	color = "#428AFF"
	gender_change = "male"
	scannable = 1

/datum/reagent/change_drug/female
	id = "change_drug_female"
	taste_description = "spiced honey"
	reagent_state = LIQUID
	color = "#FFA0FA"
	gender_change = "female"
	scannable = 1

/datum/reagent/change_drug/intersex
	id = "change_drug_intersex"
	taste_description = "something salty and sweet"
	reagent_state = LIQUID
	color = "#CB9EFF"
	gender_change = "herm"
	scannable = 1

/datum/reagent/change_drug/affect_blood(var/mob/living/carbon/human/M, var/alien, var/removed) //we need to process the change
	if(alien == IS_DIONA) //doesn't work on multiple creature hiveminds
		return
	if(M.identifying_gender == gender_change) //don't bug them if they're already the same gender
		return
	if(M.gender_change_cooldown == 1) //if already done, don't bug them
		return
	else
		M.gender_change_cooldown = 1 //set not to bug them because the chem is activating
		M << "<span class='notice'>You lose focus as warmth spreads throughout your chest and abdomen.</span>"
		spawn(300) //wait 30 seconds, growth takes time yo
			M.gender_change_cooldown = 0 //allow it to bug them again now that we've waited
			if (alert(M,"This chemical will change your gender, proceed?", "Warning", "Yes", "No") == "Yes") //check if they want this to happen for pref sake
				M.change_gender_identity(gender_change)
				M << "<span class='warning'>You feel like a new person</span>" //success
////////////////////////////////////////////////
/////////DRINKS////////////////////////////////
//////////////////////////////////////////////

/datum/reagent/drink/tea/dyloteane
	name = "The Anti-Irish"
	id = "dyloteane"
	glass_name = "Medicinal tea cup"
	glass_desc = "Goes perfectly with alcohol poisoning!"
	taste_description = "The sweet taste of multidepartment cooperation!"
	cup_desc = "Goes perfectly with alcohol poisoning!"
	cup_name = "Medicinal tea cup"
	color = "#00FF00"


/datum/reagent/drink/tea/dyloteane/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(M.ingested)
		for(var/datum/reagent/R in M.ingested.reagent_list)
			if(istype(R, /datum/reagent/ethanol))
				R.remove_self(removed * 3)
	if(M.bloodstr)
		for(var/datum/reagent/R in M.bloodstr.reagent_list)
			if(istype(R, /datum/reagent/ethanol))
				R.remove_self(removed * 10)

/datum/reagent/drink/tea/dyloteane/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1
	if(alien != IS_DIONA)
		M.drowsyness = max(0, M.drowsyness - 6 * removed * chem_effective)
		M.hallucination = max(0, M.hallucination - 9 * removed * chem_effective)
		M.adjustToxLoss(-1 * removed * chem_effective)

/datum/reagent/slimedrink
	name = "Slime"
	id = "slimedrink"
	description = "A gooey semi-liquid produced from your fellow slimey crew members."
	taste_description = "jiggly"
	taste_mult = 1.3
	reagent_state = LIQUID
	color = "#8bdce5"

	glass_name = "Slime"
	glass_desc = "Slime thats safe to drink (relatively)"

/datum/reagent/drink/soda
	ingest_met = REM * 5 //Makes it so soda metabolizes faster, since without this increase, the nutrients it currently gives does nothing. Also, metabolises faster then normal nutrients due to being soda.