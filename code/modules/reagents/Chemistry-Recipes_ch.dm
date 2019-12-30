/datum/chemical_reaction/claridyl
	name = "claridyl"
	id = "claridyl"
	result = "claridyl"
	required_reagents = list("lithium" = 1, "radium" = 1, "sugar" = 1)
	result_amount = 1

/datum/chemical_reaction/dyloteane
	name = "dyloteane"
	id = "dyloteane"
	result = "dyloteane"
	required_reagents = list("anti_toxin" = 1, "tea" = 1)
	result_amount = 1

/datum/chemical_reaction/dyloteane/super
	name = "dyloteanesuper"
	id = "dyloteanesuper"
	result = "dyloteane"
	required_reagents = list("anti_toxin" = 1, "tea" = 1,"sugar" = 1)
	result_amount = 10 //by the powers of england for sugaring your tea you gain *10 result

/datum/chemical_reaction/eden
	name = "eden"
	id = "eden"
	result = "eden"
	required_reagents = list("anti_toxin" = 60, "phoron" = 60)
	result_amount = 1

/datum/chemical_reaction/eden/snake
	id = "eden_snake"
	result = "eden_snake"
	required_reagents = list("eden" = 1, "ethanol" = 1)

/datum/chemical_reaction/freshtea/green
	id = "freshteagreen"
	result = "freshteagreen"
	required_reagents = list ("tealeavesgreen" = 1, "hotwater" = 9)
	result_amount = 10

/datum/chemical_reaction/instantteapowder/green
	id = "instantteapowdergreen"
	result = "instantteapowdergreen"
	required_reagents = list ("teamush" = 10, "frostoil" = 1)
	result_amount = 10

/datum/chemical_reaction/instanttea/green
	id = "instantteagreen"
	result = "instantteagreen"
	required_reagents = list ("instantteapowdergreen" = 1, "water" = 9)
	result_amount = 10

/datum/chemical_reaction/matcha
	id = "matcha"
	result = "matcha"
	required_reagents = list ("matchapowder" = 1, "hotwater" = 2)
	result_amount = 2

/datum/chemical_reaction/tea/matcha_latte
	id = "matcha_latte"
	result = "matcha_latte"
	required_reagents = list ("matchapowder" = 1, "milk" = 5)
	result_amount = 5

/datum/chemical_reaction/change_drug/male
	name = "Elixer of Change"
	id = "change_drug_male"
	result = "change_drug_male"
	required_reagents = list("blood" = 1, "mutagen" = 1, "iron" = 1)
	result_amount = 1

/datum/chemical_reaction/change_drug/female
	name = "Elixer of Change"
	id = "change_drug_female"
	result = "change_drug_female"
	required_reagents = list("blood" = 1, "mutagen" = 1, "sugar" = 1)
	result_amount = 1

/datum/chemical_reaction/change_drug/intersex
	name = "Elixer of Change"
	id = "change_drug_intersex"
	result = "change_drug_intersex"
	required_reagents = list("change_drug_male" = 1, "change_drug_female" = 1)
	result_amount = 1