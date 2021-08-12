////////////////////////////////////////////////
/////////DRINKS////////////////////////////////
//////////////////////////////////////////////

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

/datum/reagent/ethanol/coffee/jackbrew
	name = "Rush hour"
	id = "jackbrew"
	description = "Irish coffee, and hyperzine. A common mix for panicked drinkers, EMTS, Paramedics, and CMOs alone on the job."
	taste_description = "wishing you could give up on the day"
	color = "#4C3100"
	strength = 15

	glass_name = "Rush hour"
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
		M.emote(pick("twitch", "blink_r", "shiver", "weh", "weh", "weh")) // weh - Jack
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

/datum/reagent/ethanol/snaps
	name = "Akvavit"
	id = "snaps"
	description = "Burns the nose and throat and soothes it with a herby aftertaste...Barely."
	taste_description = "strong spirit and a little dill"
	color = "e6d670" // rgb: 230, 214, 112
	strength = 15

	glass_name = "akvavit"
	glass_desc = "Burns the nose and throat, and soothes it with a herby aftertaste...Barely."
  
////////////////////////////////////////////////
/////////FOODSTUFF/////////////////////////////
//////////////////////////////////////////////
  
/datum/reagent/cinnamonpowder
	name = "ground cinnamon"
	id = "cinnamonpowder"
	description = "Cinnamon, a spice made from tree bark, ground into a fine powder. Probably not a good idea to eat on its own!"
	taste_description= "sweet spice with a hint of wood"
	color = "#a96622"

	glass_name = "ground cinnamon"
	glass_desc = "A glass of ground cinnamon. Dare you take the challenge?"

//YW drinks
/datum/reagent/drink/lovepotion_yw
	name = "Strawberry Love Potion"
	id = "strawberrylovepotion"
	description = "Creamy strawberries and sugar, simple and sweet."
	taste_description = "strawberries and cream"
	color = "#fc8a8a" // rgb(252, 138, 138)

	glass_name = "Love Potion"
	glass_desc = "Love me tender, love me sweet."


/datum/reagent/ethanol/wormblood
	name = "Worm Blood"
	id = "wormblood"
	description = "Who had the grand idea to bottle THE BLOOD OF A WORM."
	taste_description = "Wriggly cave fungus"
	color = "#827A00"
	strength = 30
	druggy = 10

	glass_name = "Worm blood"
	glass_desc = "Who had the grand idea to bottle THE BLOOD OF A WORM."
	glass_icon_state = "wormblood"
	glass_center_of_mass = list("x"=16, "y"=8)
	glass_icon_file = 'icons/obj/drinks_yw.dmi'
