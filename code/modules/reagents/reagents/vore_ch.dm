//Vore/kink reagents go here.

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
