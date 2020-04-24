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

///SAP REAGENTS////
//This is all a direct port from aeiou.

/datum/reagent/hannoa
	name = "Hannoa"
	id = "hannoa"
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
	name = "bullvalene"
	id = "bullvalene"
	description = "witty pending description. Converts brute and burn into toxin. Or at least is supposed to."
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
	name = "Serazine"
	id = "serazine"
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
	name = "Alizene"
	id = "alizene"
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

///GENDER CHANGE REAGENTS////

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

/datum/reagent/drink/tea/minttea
	name = "Mint Tea"
	id = "minttea"
	description = "A tasty mixture of mint and tea. It's apparently good for you!"
	color = "#A8442C"
	taste_description = "black tea with tones of mint"

	glass_name = "mint tea"
	glass_desc = "A tasty mixture of mint and tea. It's apparently good for you!"

	cup_name = "cup of mint tea"
	cup_desc = "A tasty mixture of mint and tea. It's apparently good for you!"

/datum/reagent/drink/tea/lemontea
	name = "Lemon Tea"
	id = "lemontea"
	description = "A tasty mixture of lemon and tea. It's apparently good for you!"
	color = "#FC6A00"
	taste_description = "black tea with tones of lemon"

	glass_name = "lemon tea"
	glass_desc = "A tasty mixture of lemon and tea. It's apparently good for you!"

	cup_name = "cup of lemon tea"
	cup_desc = "A tasty mixture of lemon and tea. It's apparently good for you!"

/datum/reagent/drink/tea/limetea
	name = "Lime Tea"
	id = "limetea"
	description = "A tasty mixture of lime and tea. It's apparently good for you!"
	color = "#DE4300"
	taste_description = "black tea with tones of lime"

	glass_name = "lime tea"
	glass_desc = "A tasty mixture of lime and tea. It's apparently good for you!"

	cup_name = "cup of berry tea"
	cup_desc = "A tasty mixture of lime and tea. It's apparently good for you!"

/datum/reagent/drink/tea/orangetea
	name = "Orange Tea"
	id = "orangetea"
	description = "A tasty mixture of orange and tea. It's apparently good for you!"
	color = "#FB4F06"
	taste_description = "black tea with tones of orange"

	glass_name = "orange tea"
	glass_desc = "A tasty mixture of orange and tea. It's apparently good for you!"

	cup_name = "cup of orange tea"
	cup_desc = "A tasty mixture of orange and tea. It's apparently good for you!"

/datum/reagent/drink/tea/berrytea
	name = "Berry Tea"
	id = "berrytea"
	description = "A tasty mixture of berries and tea. It's apparently good for you!"
	color = "#A60735"
	taste_description = "black tea with tones of berries"

	glass_name = "berry tea"
	glass_desc = "A tasty mixture of berries and tea. It's apparently good for you!"

	cup_name = "cup of berry tea"
	cup_desc = "A tasty mixture of berries and tea. It's apparently good for you!"

/datum/reagent/drink/tea/cherrytea
	name = "Cherry Tea"
	id = "cherrytea"
	description = "A tasty mixture of cherries and tea. It's apparently good for you!"
	color = "#c15962"
	taste_description = "black tea with lots of cherries"

	glass_name = "cherry tea"
	glass_desc = "A tasty mixture of cherries and tea. It's apparently good for you!"

	cup_name = "cup of cherry tea"
	cup_desc = "A tasty mixture of cherries and tea. It's apparently good for you!"

/datum/reagent/drink/tea/watermelontea
	name = "Watermelon Tea"
	id = "watermelontea"
	description = "A tasty mixture of watermelon and tea. It's apparently good for you!"
	color = "#9f2c2c"
	taste_description = "black tea with sweet watermelon for flavouring"

	glass_name = "watermelon tea"
	glass_desc = "A tasty mixture of watermelon and tea. It's apparently good for you!"

	cup_name = "cup of watermelon tea"
	cup_desc = "A tasty mixture of watermelon and tea. It's apparently good for you!"

/datum/reagent/drink/tea/matcha_latte //Putting this as tea to inherit tea variables. Should not have the same toxloss as matcha so it can be placed in a dispenser without breaking balance.
	name = "Matcha latte"
	id = "matcha_latte"
	description = "A nice and tasty beverage to enjoy while studying."
	taste_description = "creamy, vegetal sweetness"
	color = "#b1c48c"
	adj_temp = 5

	glass_name = "matcha latte"
	glass_desc = "A nice and refreshing beverage while you are studying."

	cup_icon_state = "cup_latte"
	cup_name = "cup of matcha latte"
	cup_desc = "A nice and refreshing beverage while you are studying."

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

/datum/reagent/ethanol/spiderdrink
	name = "Brimming glass of spiders"
	id = "spiderdrink"
	description = "A fresh drink consisting of cloned spiderlings who are intoxicated by a healthy dose of absinthe."
	taste_description = "TOO MANY LEGS"
	color = "#526062" // rgb(82, 96, 98)
	strength = 15

	glass_name = "Brimming glass of spiders"
	glass_desc = "A glass filled to the brim with tiny drunk spiderlings. Lets hope they dont escape."

/datum/reagent/ethanol/snaps
	name = "Akvavit"
	id = "snaps"
	description = "Burns the nose and throat and soothes it with a herby aftertaste...Barely."
	taste_description = "strong spirit and a little dill"
	color = "e6d670" // rgb: 230, 214, 112
	strength = 15

	glass_name = "akvavit"
	glass_desc = "Burns the nose and throat, and soothes it with a herby aftertaste...Barely."

/datum/reagent/ethanol/bluetrain
	name = "blue train"
	id = "bluetrain"
	description = "A drink only a fool or a very desperate creature would consume."
	taste_description = "someone who decided to pour ice cold motor oil down your throat and finish it off with a large shot of burning pure alcohol."
	color = "#c8a5dc"
	adj_temp = -10
	targ_temp = 220
	strength = 10

	glass_name = "blue train"
	glass_desc = "A glass of what can only be described as the bastard child between coolant and alcohol made by a madman."

/datum/reagent/drink/lowpower
	name = "The low power"
	id = "lowpower"
	description = "Smells, and tastes like lemon.. with a hint of Ozone, for whatever reason. It glows softly."
	taste_description = "creamy lemonade, with some zest"
	color = "#5d8d39"

	glass_name = "lowpower"
	glass_desc = "Smells, and tastes like lemon.. with a hint of Ozone, for whatever reason. It glows softly."

/datum/reagent/drink/lowpower/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.adjustToxLoss(-0.5 * removed)

/datum/reagent/ethanol/coffee/jackbrew
	name = "\improper Jack's brew"
	id = "jackbrew"
	description = "Irish coffee, and hyperzine. A common mix for panicked drinkers, EMTS, Paramedics, and CMOs alone on the job."
	taste_description = "wishing you could give up on the day"
	color = "#4C3100"
	strength = 15

	glass_name = "Jack's brew"
	glass_desc = "Irish coffee, and hyperzine. A common mix for panicked drinkers, EMTS, Paramedics, and CMOs alone on the job."

/datum/reagent/ethanol/coffee/jackbrew/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_TAJARA)
		removed *= 1.25
	if(alien == IS_SLIME)
		M.make_jittery(4) //Hyperactive fluid pumping results in unstable 'skeleton', resulting in vibration.
		if(dose >= 5)
			M.nutrition = (M.nutrition - (removed * 2)) //Sadly this movement starts burning food in higher doses.
	..()
	if(prob(5))
		M.emote(pick("twitch", "blink_r", "shiver", "weh"))
	M.add_chemical_effect(CE_SPEEDBOOST, 1)

/datum/reagent/ethanol/bookwyrm
	name = "Bookwyrm's bite"
	id = "bookwyrm"
	description = "You'd probably fancy a nice nap by the fireplace after drinking this."
	taste_description = "Mint, lime and a cold cozy nap"
	color = "#5678c3"
	strength = 20
	adj_temp = -10
	targ_temp = 273 //Dilluted cold front wont be the death of anyone who cant handle sipping liquid nitrogen.

	glass_name = "Bookwyrm's bite"
	glass_desc = "A cold lime mint drink. Dont drink to much or you might fall asleep."

/datum/reagent/ethanol/bookwyrm/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return

	var/threshold = 1
	if(alien == IS_SKRELL)
		threshold = 1.2

	if(alien == IS_SLIME)
		threshold = 6	//Evens to 3 due to the fact they are considered 'small' for flaps.

	var/effective_dose = dose
	if(issmall(M))
		effective_dose *= 2

	if(effective_dose < 1 * threshold)
		if(effective_dose == metabolism * 2 || prob(5))
			M.emote("yawn")
	else if(effective_dose < 1.5 * threshold)
		M.eye_blurry = max(M.eye_blurry, 10)
	else if(effective_dose < 5 * threshold)
		if(prob(50))
			M.Weaken(2)
		M.drowsyness = max(M.drowsyness, 20)
	else
		if(alien == IS_SLIME) //They don't have eyes, and they don't really 'sleep'. Fumble their general senses.
			M.eye_blurry = max(M.eye_blurry, 30)
			if(prob(20))
				M.ear_deaf = max(M.ear_deaf, 4)
				M.Confuse(2)
			else
				M.Weaken(2)
		else
			M.sleeping = max(M.sleeping, 20)
		M.drowsyness = max(M.drowsyness, 60)

/datum/reagent/drink/highpower
	name = "The High power"
	id = "highpower"
	description = "A strange, softly crackling drink, smelling just like lightning's just struck, twice. It's rather difficult to make this without busting the lights."
	taste_description = "copper, ozone, and pain"
	color = "#a2f563"

	glass_name = "highpower"
	glass_desc = "A strange, softly crackling drink, smelling just like lightning's just struck, twice. It's rather difficult to make this without busting the lights."

/datum/reagent/drink/highpower/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(prob(5))
		M.say("!skin's crackles with energy and seems to be in pain.")
		M.custom_pain("You feel painful electricity running through your body, like adrenaline, and like your blood's boiling!",30)
		M.AdjustWeakened(3)		//Getting sapped makes the victim fall
		M.Stun(3)
	M.add_chemical_effect(CE_SPEEDBOOST, 1)

/datum/reagent/ethanol/flapper
	name = "Flapper"
	id = "flapper"
	description = "A common drink among blood-drinkers, and those who just wanna drink. Tinnibat be damned."
	taste_description = "a bloody good time"
	color = "#763424"
	strength = 15

	glass_name = "flapper"
	glass_desc = "A common drink among blood-drinkers, and those who just wanna drink. Tinnibat be damned."

/datum/reagent/toxin/oilslide
	name = "Oil slide"
	id = "oilslide"
	description = "Tasty, if you're a synth, not so much for organics."
	taste_description = "oil, slime, and fuel! Tastes also like synthetic backwash"
	color = "#331a1a"

	glass_name = "oilslide"
	glass_desc = "Tasty, if you're a synth, not so much for organics."

/datum/reagent/ethanol/sitonmyface
	name = "Sit on my face"
	id = "sitonmyface"
	description = "A drink made of irish coffee and nuts, mostly known for its vulgar name. Makes for a great pickup line though!"
	taste_description = "creamy coffee and alcohol, and nuts"
	color = "#896750"
	strength = 15

	glass_name = "Sit on my face"
	glass_desc = "A drink made of irish coffee and nuts, mostly known for its vulgar name. Makes for a great pickup line though!"

/datum/reagent/ethanol/hachi
	name = "Hachi"
	id = "hachi"
	description = "An unusual fusion of bourbon and sake infused with lemon juice, and mushrooms. Sweet, savory, but mostly weird."
	taste_description = "sweet lemons, black pepper, and savory mushroom"
	color = "#DC971D"
	strength = 20

/datum/reagent/drink/freshtea
	name = "Green tea"
	id = "freshtea" //Not meant to be obtainable, this is to define effects for teas made from grown teas.
	description = "Tasty green tea, it has antioxidants, it's good for you! Fresh means it's even healthier!"
	taste_description = "green tea"
	color = "#cac162"
	adj_dizzy = -4
	adj_drowsy = -1
	adj_sleepy = -3
	adj_temp = 20

	glass_name = "green tea"
	glass_desc = "Tasty green tea, it has antioxidants, it's good for you!"

	cup_icon_state = "cup_tea"
	cup_name = "cup of tea"
	cup_desc = "Tasty green tea, it has antioxidants, it's good for you!"

/datum/reagent/drink/freshtea/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.adjustToxLoss(-2 * removed) //Higher toxin removal than other tea to reflect difficulty in preparing, still worse than dylovene.

/datum/reagent/drink/freshtea/green
	name = "Green tea"
	id = "freshteagreen"
	description = "Floral green tea, it has antioxidants, it's good for you! Fresh means it's even healthier!"
	taste_description = "floral with vegetal notes and a slightly bitter aftertaste"
	color = "#cac162"

	glass_name = "green tea"
	glass_desc = "Floral green tea, it has antioxidants, it's fresh and good for you!"

	cup_icon_state = "cup_tea"
	cup_name = "cup of tea"
	cup_desc = "Floral green tea, it has antioxidants, it's fresh and good for you!"

/datum/reagent/drink/tealeavesgreen
	name = "Green tea leaves"
	id = "tealeavesgreen"
	description = "Prepared green tea, just waiting for hot water."
	taste_description = "overwhelmingly bitter with faint floral notes"
	color = "#56761d"

	glass_name = "tea leaves"
	glass_desc = "Dry tea leaves in a cup. Just add hot water!"

/datum/reagent/drink/teamush
	name = "Tea mush"
	id = "teamush"
	description = "Mashed tea leaves, a bit like grass clippings. You can't make proper tea out of this now."
	taste_description = "overwhelmingly bitter plant"
	color = "#7db72d"

	glass_name = "blended plant"
	glass_desc = "Chunky, mashed up plant of some sort. Looks kinda gross."

/datum/reagent/drink/instantteapowdergreen
	name = "Instant green tea powder"
	id = "instantteapowdergreen"
	description = "Green tea powder missing all the goodness of green tea." //Heathen.
	taste_description = "strong bitterness with a subtle chemical aftertaste"
	color = "#56761d"

	glass_name = "tea powder"
	glass_desc = "Instant green tea powder. Just add water for imitation green tea!"

/datum/reagent/drink/instantteagreen
	name = "Instant green tea"
	id = "instantteagreen"
	description = "Convenient green tea missing all the goodness of actual green tea." //It's not even hot.
	taste_description = "bitterness with a subtle chemical aftertaste"
	color = "#cac162"

	glass_name = "green tea"
	glass_desc = "Green tea. It smells a bit off."

	cup_icon_state = "cup_tea"
	cup_name = "cup of tea"
	cup_desc = "Green tea. It smells a bit off."

/datum/reagent/drink/matchapowder
	name = "Matcha powder"
	id = "matchapowder"
	description = "Finely ground green tea. This is about the highest quality matcha you can prepare without traditional methods."
	taste_description = "heavy bitterness"
	color = "#86a443"

	glass_name = "matcha powder"
	glass_desc = "Matcha powder, waiting for brewing."

/datum/reagent/drink/matcha
	name = "Matcha"
	id = "matcha"
	description = "A form of green tea where the leaf is ground and suspended in water rather than steeped. This is considered cooking grade."
	taste_description = "floral, full-bodied bitterness with a subtle, earthy sweetness"
	color = "#9bc265"
	adj_dizzy = -4
	adj_drowsy = -1
	adj_sleepy = -3
	adj_temp = 20

	glass_name = "matcha"
	glass_desc = "Heavenly matcha. Good for body and spirit."

	cup_icon_state = "cup_tea"
	cup_name = "cup of matcha"
	cup_desc = "Heavenly matcha. Good for body and spirit."

/datum/reagent/drink/matcha/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.adjustToxLoss(-3 * removed) //Almost on par with dylovene despite being harder to obtain in bulk. Nerf if this causes problems.

/datum/reagent/drink/juice/gelatin
	name = "Gelatin"
	id = "gelatin"
	description = "It doesnt taste like anything."
	taste_description = "nothing"
	nutrition = 0
	color = "#aaabcf"

	glass_name = "Gelatin"
	glass_desc = "It's like flavourless slime."

/datum/reagent/drink/bubbleteawatermelon
	name = "Watermelon bubble tea"
	id = "bubbleteawatermelon"
	description = "A tea with milk and watermelon in it and gelatin balls as well."
	taste_description = "creamy tea and watermelon"
	color = "#b83333"

	glass_name = "watermelon bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with watermelon."

/datum/reagent/drink/bubbleteastrawberry
	name = "Strawberry bubble tea"
	id = "bubbleteastrawberry"
	description = "A tea with milk and strawberry in it and gelatin balls as well."
	taste_description = "creamy tea and strawberry"
	color = "#eb6c77"

	glass_name = "strawberry bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with strawberry."

/datum/reagent/drink/bubbleteacherry
	name = "Cherry bubble tea"
	id = "bubbleteacherry"
	description = "A tea with milk and cherry in it and gelatin balls as well."
	taste_description = "creamy tea and cherry"
	color = "#801e28"

	glass_name = "cherry bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with cherry."

/datum/reagent/drink/bubbleteacoffee
	name = "Coffee bubble tea"
	id = "bubbleteacoffee"
	description = "A tea with milk and coffee in it and gelatin balls as well."
	taste_description = "creamy tea and coffee"
	color = "#482910"

	glass_name = "coffee bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with coffee."

/datum/reagent/drink/bubbleteabanana
	name = "Banana bubble tea"
	id = "bubbleteabanana"
	description = "A tea with milk and banana in it and gelatin balls as well."
	taste_description = "creamy tea and banana"
	color = "#c3af00"

	glass_name = "banana bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with banana."

/datum/reagent/drink/horchata
	name = "Horchata"
	id = "horchata"
	description = "A sweet and cold rice milk beverage."
	taste_description = "sweet rice milk and cinnamon"
	color = "#ebcdc1"
	adj_temp = -5

	glass_name = "horchata"
	glass_desc = "A sweet and cold rice milk beverage."

//////SAP IN UNREFINED FORM////

/datum/reagent/toxin/bluesap //This is the first sap. Blue one.
	name = "Blue Sap"
	id = "bluesap"
	description = "Glowing blue liquid."
	reagent_state = LIQUID
	color = "#91f9ff" // rgb(145, 249, 255)
	metabolism = 0.01
	strength = 10//Don't drink it
	mrate_static = TRUE

/datum/reagent/purplesap
	name = "Purple sap"
	id = "purplesap"
	description = "Purple liquid. It is very sticky and smells of ammonia."
	color = "#7a48a0"
	taste_description = "Ammonia"

/datum/reagent/orangesap
	name = "Orange sap"
	id = "orangesap"
	description = "Orange liquid. It wobbles around a bit like jelly."
	color = "#e0962f"
	taste_description = "Ammonia"
