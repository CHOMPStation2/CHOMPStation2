/datum/reagent/modapplying/energybooster
	name = REAGENT_ENERGYBOOSTER
	id = REAGENT_ID_ENERGYBOOSTER
	description = "A strange formula that improves evasion and attack speed, but  makes one more conductive."
	taste_description = "high voltage"
	color = "#FFFF66"

	modifier_to_add = /datum/modifier/eletricalsurge
	modifier_duration = 3 SECONDS

/datum/reagent/modapplying/oceaniccure
	name = REAGENT_OCEANICCURE
	id = REAGENT_ID_OCEANICCURE
	description = "A strange formula that slows the body's rate of metabolism considerably, and improves the healing one's body receives"
	taste_description = "sea breeze"
	color = "#C8A5DC"

	modifier_to_add = /datum/modifier/healingtide
	modifier_duration = 3 SECONDS

/datum/reagent/modapplying/deathclawmutagen
	name = REAGENT_DEATHCLAWMUTAGEN
	id = REAGENT_ID_DEATHCLAWMUTAGEN
	description = "A strange formula known to increase the size of a person, increase their health, and reduce the damage they receive, at the cost of reduced healing."
	taste_description = "buzzing radiation"
	color = "#00A000"

	modifier_to_add = /datum/modifier/radiationhide
	modifier_duration = 3 SECONDS

/datum/reagent/modapplying/senseenhancer
	name = REAGENT_SENSEENHANCER
	id = REAGENT_ID_SENSEENHANCER
	description = "A strange formula known to massively increase muscle performance, making one move faster, attack faster, and recover from stuns much more quickly. However, due to increased heart rate, bleeding is significantly worse, metabolism is accelerated three-fold, and death hovers not far behind. Caution advised."
	taste_description = "blood"
	color = "#808080"

	modifier_to_add = /datum/modifier/nervoushigh
	modifier_duration = 3 SECONDS

/datum/reagent/modapplying/heatnullifer
	name = REAGENT_HEATNULLIFER
	id = REAGENT_ID_HEATNULLIFER
	description = "An experimental drug that let's consumer's body ignore the effects of tempature, but slows down limb movements."
	taste_description = "nothing"
	color = "#561EC3"

	modifier_to_add = /datum/modifier/protectivenumbing
	modifier_duration = 3 SECONDS


/datum/reagent/modapplying/juggernog
	name = REAGENT_JUGGERNOG
	id = REAGENT_ID_JUGGERNOG
	description = "An experimental drug designed to increase the general amount of damage a person can take before reaching their limit. It also makes it easier to resist effects that disable the user."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#660066"

	modifier_to_add = /datum/modifier/juggernog
	modifier_duration = 3 SECONDS
