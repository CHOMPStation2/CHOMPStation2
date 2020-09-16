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
	
///SAP RECIPES//////

/datum/chemical_reaction/myelamine_sap //This is the clotting agent used by clotting packs.
	name = "Myelamine"
	id = "myelamine"
	result = "myelamine"
	required_reagents = list("bicaridine" = 1, "iron" = 2, "kelotane" = 1, "bluesap" = 1)
	result_amount = 1

/datum/chemical_reaction/hannoa
	name = "Hannoa"
	id = "hannoa"
	result = "hannoa"
	required_reagents = list("purplesap" = 1, "iron" = 2, "kelotane" = 1, "carbon" = 1)
	result_amount = 1

/datum/chemical_reaction/bullvalene
	name = "Bullvalene"
	id = "bullvalene"
	result = "bullvalene"
	required_reagents = list("dermaline" = 1, "orangesap" = 1, "Copper" = 1)
	result_amount = 1

/datum/chemical_reaction/nutrient
	name = "Nutriment"
	id = "nutriment"
	result = "nutriment"
	required_reagents = list("purplesap" = 1, "orangesap" = 1, "bluesap" = 1)
	result_amount = 3
	
/////SERAZINE RECIPES//////

/datum/chemical_reaction/alizine
	name = "Alizine"
	id = "alizine"
	result = "alizine"
	required_reagents = list("bicaridine" = 1, "serazine" = 1, "tungsten" = 1)
	result_amount = 3
	
/////GENDER CHANGE RECIPES/////

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

////////////////////////////////////////////////
/////////DRINKS////////////////////////////////
//////////////////////////////////////////////

/datum/chemical_reaction/drinks/minttea
	name = "Mint Tea"
	id = "minttea"
	result = "minttea"
	required_reagents = list("tea" = 5, "mint" = 1)
	result_amount = 6

/datum/chemical_reaction/drinks/lemontea
	name = "Lemon Tea"
	id = "lemontea"
	result = "lemontea"
	required_reagents = list("tea" = 5, "lemonjuice" = 1)
	result_amount = 6

/datum/chemical_reaction/drinks/limetea
	name = "Lime Tea"
	id = "limetea"
	result = "limetea"
	required_reagents = list("tea" = 5, "limejuice" = 1)
	result_amount = 6

/datum/chemical_reaction/drinks/orangetea
	name = "Orange Tea"
	id = "orangetea"
	result = "orangetea"
	required_reagents = list("tea" = 5, "orangejuice" = 1)
	result_amount = 6

/datum/chemical_reaction/drinks/berrytea
	name = "Berry Tea"
	id = "berrytea"
	result = "berrytea"
	required_reagents = list("tea" = 5, "berryjuice" = 1)
	result_amount = 6

/datum/chemical_reaction/drinks/cherrytea
	name = "Cherry Tea"
	id = "cherrytea"
	result = "cherrytea"
	required_reagents = list("tea" = 5, "cherryjelly" = 1)
	result_amount = 6

/datum/chemical_reaction/drinks/watermelontea
	name = "Watermelon Tea"
	id = "watermelontea"
	result = "watermelontea"
	required_reagents = list("tea" = 5, "watermelonjuice" = 1)
	result_amount = 6

/datum/chemical_reaction/tea/matcha_latte
	id = "matcha_latte"
	result = "matcha_latte"
	required_reagents = list ("matchapowder" = 1, "milk" = 5)
	result_amount = 5

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

/datum/chemical_reaction/drinks/spiderdrink
	name = "Brimming glass of spiders"
	id = "spiderdrink"
	result = "spiderdrink"
	required_reagents = list("spidertoxin" = 1, "clonexadone" = 5, "absinthe" = 4)
	result_amount = 10

/datum/chemical_reaction/drinks/bubbleteawatermelon
	name = "Watermelon bubble tea"
	id = "bubbleteawatermelon"
	result = "bubbleteawatermelon"
	required_reagents = list("gelatin" = 2, "watermelontea" = 6, "milk" = 2)
	result_amount = 10

/datum/chemical_reaction/drinks/bubbleteastrawberry
	name = "Strawberry bubble tea"
	id = "bubbleteastrawberry"
	result = "bubbleteastrawberry"
	required_reagents = list("gelatin" = 2, "berrytea" = 6, "milk" = 2)
	result_amount = 10

/datum/chemical_reaction/drinks/bubbleteacherry
	name = "Cherry bubble tea"
	id = "bubbleteacherry"
	result = "bubbleteacherry"
	required_reagents = list("gelatin" = 2, "cherrytea" = 6, "milk" = 2)
	result_amount = 10

/datum/chemical_reaction/drinks/bubbleteacoffee
	name = "Coffee bubble tea"
	id = "bubbleteacoffee"
	result = "bubbleteacoffee"
	required_reagents = list("gelatin" = 2, "tea" = 5, "cafe_latte" = 3)
	result_amount = 10

/datum/chemical_reaction/drinks/bubbleteabanana
	name = "Banana bubble tea"
	id = "bubbleteabanana"
	result = "bubbleteabanana"
	required_reagents = list("gelatin" = 2, "tea" = 5, "banana" = 1, "milk" = 2)
	result_amount = 10

/datum/chemical_reaction/drinks/horchata
	name = "Horchata"
	id = "horchata"
	result = "horchata"
	required_reagents = list("milk" = 1, "sugar" = 2, "rice" = 2)
	result_amount = 5

/datum/chemical_reaction/drinks/bluetrain
	name = "Blue train"
	id = "bluetrain"
	result = "bluetrain"
	required_reagents = list("coolant" = 2, "ethanol" = 2, "nutriment" = 1)
	result_amount = 5

/datum/chemical_reaction/drinks/lowpower
	name = "The low power"
	id = "lowpower"
	result = "lowpower"
	required_reagents = list("lemonade" = 1, "cream" = 1, "limejuice" = 1)
	result_amount = 3

/datum/chemical_reaction/drinks/jackbrew
	name = "Jack's brew"
	id = "jackbrew"
	result = "jackbrew"
	required_reagents = list("irishcoffee" = 1, "hyperzine" = 1)
	result_amount = 2

/datum/chemical_reaction/drinks/bookwyrm
	name = "Bookwyrm's bite"
	id = "bookwyrm"
	result = "bookwyrm"
	required_reagents = list("coldfront" = 1, "limejuice" = 1, "stoxin" = 1)
	result_amount = 3

/datum/chemical_reaction/drinks/highpower
	name = "The high power"
	id = "highpower"
	result = "highpower"
	required_reagents = list("lowpower" = 1, "iron" = 1, "uranium" = 1)
	result_amount = 3

/datum/chemical_reaction/drinks/flapper
	name = "Flapper"
	id = "flapper"
	result = "flapper"
	required_reagents = list("whiskey" = 1, "blood" = 1, "ice" = 1)
	result_amount = 3

/datum/chemical_reaction/toxin/oilslide
	name = "Oil slide"
	id = "oilslide"
	result = "oilslide"
	required_reagents = list("moonshine" = 1, "lube" = 1, "fuel" = 1)
	result_amount = 3

/datum/chemical_reaction/drinks/sitonmyface
	name = "Sit on my face"
	id = "sitonmyface"
	result = "sitonmyface"
	required_reagents = list("kahlua" = 1, "irishcream" = 1, "peanutbutter" = 1)
	result_amount = 3

/datum/chemical_reaction/drinks/hachi
	name = "Hachi"
	id = "hachi"
	result = "hachi"
	required_reagents = list("burbon" = 2, "sake" = 1, "lemonjuice" = 1, "mushroom" = 1)
	result_amount = 5