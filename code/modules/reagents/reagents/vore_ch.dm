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

/datum/reagent/sorbitol
	name = "Sorbitol"
	id = "sorbitol"
	description = "A frothy green liquid, for causing cellular-level hetrogenous structure merging."
	reagent_state = LIQUID
	color = "#10881A"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/sorbitol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.make_dizzy(1)

	for(var/obj/belly/B as anything in M.vore_organs)

		if(B.digest_mode == DM_UNABSORB) //Don't affect bellies set to unabsorb
			continue

		for(var/mob/living/P in B)
			if(P.absorbed || !P.absorbable)
				continue

			else if(prob(10))
				B.absorb_living(P)
				//absorption reagent production
				if(B.reagent_mode_flags & DM_FLAG_REAGENTSABSORB && B.reagents.total_volume < B.reagents.maximum_volume)
					B.GenerateBellyReagents_absorbed()


///GENDER CHANGE REAGENTS////

/datum/reagent/change_drug //base chemical
	name = "Amorphorovir" //always the same name
	id = "change_drug"
	metabolism = 100 //set high enough that it does not process multiple times(delay implemented below)
	description = "the bloods DNA in this seems aggressive"
	taste_description = "this shouldn't be here" //unobtainable ingame
	color = "#7F0000"
	var/gender_change = null //set the gender variable here so we can set it to others in varients

/datum/reagent/change_drug/male //inherits base chemical properties listed above
	name = "Androrovir"
	id = "change_drug_male" //unique ID for each varient
	taste_description = "old spice odor blocker and body wash"
	reagent_state = LIQUID
	description = \
		"A medical concoction, capable of rapidly altering genetic and physical structure of the body. This one seems\
		to realign the target's gender to be male."
	color = "#428AFF"
	gender_change = "male"
	scannable = 1

/datum/reagent/change_drug/female
	name = "Gynorovir"
	id = "change_drug_female"
	description = \
		"A medical concoction, capable of rapidly altering genetic and physical structure of the body. This one seems\
		to realign the target's gender to be female."
	taste_description = "spiced honey"
	reagent_state = LIQUID
	color = "#FFA0FA"
	gender_change = "female"
	scannable = 1

/datum/reagent/change_drug/intersex
	name = "Androgynorovir"
	id = "change_drug_intersex"
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
			"<span class='notice'>[M] suddenly twitches as some of their features seem to contort and reshape.</span>",
			"<span class='notice'>You lose focus as warmth spreads throughout your chest and abdomen.</span>"
		)
		//wait 30 seconds, growth takes time yo
		spawn(300)
			//allow it to bug them again now that we've waited
			M.gender_change_cooldown = 0
			//check if they want this to happen for pref sake
			if (alert(M,"This chemical will change your gender, proceed?", "Warning", "Yes", "No") == "Yes")
				M.change_gender_identity(gender_change)
				M.change_gender(gender_change)
				M << "<span class='warning'>You feel like a new person.</span>" //success
