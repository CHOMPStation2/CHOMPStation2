/decl/chemical_reaction/instant/aphrodisiac
	name = "Aphrodisiac"
	id = "aphrodisiac"
	result = "aphrodisiac"
	required_reagents = list("carbon" = 2, "hydrogen" = 2, "oxygen" = 2, "water" = 1)
	result_amount = 6
  
/decl/chemical_reaction/instant/claridyl
	name = "claridyl"
	id = "claridyl"
	result = "claridyl"
	required_reagents = list("lithium" = 1, "radium" = 1, "sugar" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/dyloteane
	name = "dyloteane"
	id = "dyloteane"
	result = "dyloteane"
	required_reagents = list("anti_toxin" = 1, "tea" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/dyloteane/super
	name = "dyloteanesuper"
	id = "dyloteanesuper"
	result = "dyloteane"
	required_reagents = list("anti_toxin" = 1, "tea" = 1,"sugar" = 1)
	result_amount = 10 //by the powers of england for sugaring your tea you gain *10 result

/decl/chemical_reaction/instant/eden
	name = "eden"
	id = "eden"
	result = "eden"
	required_reagents = list("anti_toxin" = 60, "phoron" = 60)
	result_amount = 1

/decl/chemical_reaction/instant/eden/snake
	id = "eden_snake"
	result = "eden_snake"
	required_reagents = list("eden" = 1, "ethanol" = 1)
	
/decl/chemical_reaction/instant/tercozolam
	id = "tercozolam"
	result = "tercozolam"
	required_reagents = list("anti_toxin" = 1, "ethanol" = 1, "lithium" = 1)
	result_amount = 3

/decl/chemical_reaction/instant/peridaxon_ch
	name = "Peridaxon"
	id = "peridaxon_ch"
	result = "peridaxon"
	required_reagents = list("cordradaxon" = 1, "gastirodaxon" = 1, "hepanephrodaxon" = 1, "respirodaxon" = 1)	
	result_amount = 12 //More phoron-efficient alternative recipe. 

///SAP RECIPES//////

/decl/chemical_reaction/instant/myelamine_sap //This is the clotting agent used by clotting packs.
	name = "Myelamine"
	id = "myelamine"
	result = "myelamine"
	required_reagents = list("bicaridine" = 1, "iron" = 2, "kelotane" = 1, "bluesap" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/hannoa
	name = "Hannoa"
	id = "hannoa"
	result = "hannoa"
	required_reagents = list("purplesap" = 1, "iron" = 2, "kelotane" = 1, "carbon" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/bullvalene
	name = "Bullvalene"
	id = "bullvalene"
	result = "bullvalene"
	required_reagents = list("dermaline" = 1, "orangesap" = 1, "Copper" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/nutrient
	name = "Nutriment"
	id = "nutriment"
	result = "nutriment"
	required_reagents = list("purplesap" = 1, "orangesap" = 1, "bluesap" = 1)
	result_amount = 3
	
/////SERAZINE RECIPES//////

/decl/chemical_reaction/instant/alizine
	name = "Alizine"
	id = "alizine"
	result = "alizine"
	required_reagents = list("bicaridine" = 1, "serazine" = 1, "tungsten" = 1)
	result_amount = 3
	
/////GENDER CHANGE RECIPES/////

/decl/chemical_reaction/instant/change_drug/male
	name = "Elixer of Change"
	id = "change_drug_male"
	result = "change_drug_male"
	required_reagents = list("blood" = 1, "mutagen" = 1, "iron" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/change_drug/female
	name = "Elixer of Change"
	id = "change_drug_female"
	result = "change_drug_female"
	required_reagents = list("blood" = 1, "mutagen" = 1, "sugar" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/change_drug/intersex
	name = "Elixer of Change"
	id = "change_drug_intersex"
	result = "change_drug_intersex"
	required_reagents = list("change_drug_male" = 1, "change_drug_female" = 1)
	result_amount = 1
  
// Frost oil reactions for material sheets
/decl/chemical_reaction/instant/solidification/aluminium
	name = "Solid Aluminium"
	id = "solidaluminium"
	required_reagents = list("frostoil" = 5, "aluminum" = REAGENTS_PER_SHEET)
	sheet_to_give = /obj/item/stack/material/aluminium

/decl/chemical_reaction/instant/solidification/copper
	name = "Solid Copper"
	id = "solidcopper"
	required_reagents = list("frostoil" = 5, "copper" = REAGENTS_PER_SHEET)
	sheet_to_give = /obj/item/stack/material/copper
  
//YW stuff
/decl/chemical_reaction/instant/benzilate
	name = "Benzilate"
	id = "benzilate"
	result = "benzilate"
	required_reagents = list("paracetamol" = 1, "mindbreaker" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/phenethylamine
	name = "Phenethylamine"
	id = "phenethylamine"
	result = "phenethylamine"
	required_reagents = list("paroxetine" = 1, "benzilate" = 1)
	result_amount = 2
