////////////////////////////////////////////////
/////////DRINKS////////////////////////////////
//////////////////////////////////////////////

/datum/reagent/drink/tea/cherrytea
	name = REAGENT_CHERRYTEA
	id = REAGENT_ID_CHERRYTEA
	description = "A tasty mixture of cherries and tea. It's apparently good for you!"
	color = "#c15962"
	taste_description = "black tea with lots of cherries"

	glass_name = "cherry tea"
	glass_desc = "A tasty mixture of cherries and tea. It's apparently good for you!"

	cup_name = "cup of cherry tea"
	cup_desc = "A tasty mixture of cherries and tea. It's apparently good for you!"

/datum/reagent/drink/tea/watermelontea
	name = REAGENT_WATERMELONTEA
	id = REAGENT_ID_WATERMELONTEA
	description = "A tasty mixture of watermelon and tea. It's apparently good for you!"
	color = "#9f2c2c"
	taste_description = "black tea with sweet watermelon for flavouring"

	glass_name = "watermelon tea"
	glass_desc = "A tasty mixture of watermelon and tea. It's apparently good for you!"

	cup_name = "cup of watermelon tea"
	cup_desc = "A tasty mixture of watermelon and tea. It's apparently good for you!"

/datum/reagent/drink/tea/matcha_latte //Putting this as tea to inherit tea variables. Should not have the same toxloss as matcha so it can be placed in a dispenser without breaking balance.
	name = REAGENT_MATCHALATTE
	id = REAGENT_ID_MATCHALATTE
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
	name = REAGENT_DYLOTEANE
	id = REAGENT_ID_DYLOTEANE
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
	name = REAGENT_SLIMEDRINK
	id = REAGENT_ID_SLIMEDRINK
	description = "A gooey semi-liquid produced from your fellow slimey crew members."
	taste_description = "jiggly"
	taste_mult = 1.3
	reagent_state = LIQUID
	color = "#8bdce5"

	glass_name = REAGENT_SLIMEDRINK
	glass_desc = "Slime thats safe to drink (relatively)"

/datum/reagent/drink/soda
	ingest_met = REM * 5 //Makes it so soda metabolizes faster, since without this increase, the nutrients it currently gives does nothing. Also, metabolises faster then normal nutrients due to being soda.

/datum/reagent/ethanol/spiderdrink
	name = REAGENT_SPIDERDRINK
	id = REAGENT_ID_SPIDERDRINK
	description = "A fresh drink consisting of cloned spiderlings who are intoxicated by a healthy dose of absinthe."
	taste_description = "TOO MANY LEGS"
	color = "#526062" // rgb(82, 96, 98)
	strength = 15

	glass_name = REAGENT_SPIDERDRINK
	glass_desc = "A glass filled to the brim with tiny drunk spiderlings. Lets hope they dont escape."

/datum/reagent/ethanol/snaps
	name = REAGENT_SNAPS
	id = REAGENT_ID_SNAPS
	description = "Burns the nose and throat and soothes it with a herby aftertaste...Barely."
	taste_description = "strong spirit and a little dill"
	color = "e6d670" // rgb: 230, 214, 112
	strength = 15

	glass_name = "akvavit"
	glass_desc = "Burns the nose and throat, and soothes it with a herby aftertaste...Barely."

/datum/reagent/ethanol/bluetrain
	name = REAGENT_BLUETRAIN
	id = REAGENT_ID_BLUETRAIN
	description = "A drink only a fool or a very desperate creature would consume."
	taste_description = "someone who decided to pour ice cold motor oil down your throat and finish it off with a large shot of burning pure alcohol."
	color = "#c8a5dc"
	adj_temp = -10
	targ_temp = 220
	strength = 10

	glass_name = REAGENT_BLUETRAIN
	glass_desc = "A glass of what can only be described as the bastard child between coolant and alcohol made by a madman."

/datum/reagent/drink/lowpower
	name = REAGENT_LOWPOWER
	id = REAGENT_ID_LOWPOWER
	description = "Smells, and tastes like lemon.. with a hint of Ozone, for whatever reason. It glows softly."
	taste_description = "creamy lemonade, with some zest"
	color = "#5d8d39"

	glass_name = REAGENT_ID_LOWPOWER
	glass_desc = "Smells, and tastes like lemon.. with a hint of Ozone, for whatever reason. It glows softly."

/datum/reagent/drink/lowpower/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.adjustToxLoss(-0.5 * removed)

/datum/reagent/drink/highpower
	name = REAGENT_HIGHPOWER
	id = REAGENT_ID_HIGHPOWER
	description = "A strange, softly crackling drink, smelling just like lightning's just struck, twice. It's rather difficult to make this without busting the lights."
	taste_description = "copper, ozone, and pain"
	color = "#a2f563"

	glass_name = REAGENT_ID_HIGHPOWER
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
	name = REAGENT_JACKBREW
	id = REAGENT_ID_JACKBREW
	description = "Irish coffee, and hyperzine. A common mix for panicked drinkers, EMTS, Paramedics, and CMOs alone on the job."
	taste_description = "wishing you could give up on the day"
	color = "#4C3100"
	strength = 15

	glass_name = REAGENT_JACKBREW
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
	name = REAGENT_BOOKWYRM
	id = REAGENT_ID_BOOKWYRM
	description = "You'd probably fancy a nice nap by the fireplace after drinking this."
	taste_description = "Mint, lime and a cold cozy nap"
	color = "#5678c3"
	strength = 20
	adj_temp = -10
	targ_temp = 273 //Dilluted cold front wont be the death of anyone who cant handle sipping liquid nitrogen.

	glass_name = REAGENT_BOOKWYRM
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
				M.deaf_loop.start() // CHOMPStation Add: Ear Ringing/Deafness
				M.Confuse(2)
			else
				M.Weaken(2)
		else
			M.sleeping = max(M.sleeping, 20)
		M.drowsyness = max(M.drowsyness, 60)

/datum/reagent/ethanol/flapper
	name = REAGENT_FLAPPER
	id = REAGENT_ID_FLAPPER
	description = "A common drink among blood-drinkers, and those who just wanna drink. Tinnibat be damned."
	taste_description = "a bloody good time"
	color = "#763424"
	strength = 15

	glass_name = REAGENT_ID_FLAPPER
	glass_desc = "A common drink among blood-drinkers, and those who just wanna drink. Tinnibat be damned."

/datum/reagent/toxin/oilslide
	name = REAGENT_OILSLIDE
	id = REAGENT_ID_OILSLIDE
	description = "Tasty, if you're a synth, not so much for organics."
	taste_description = "oil, slime, and fuel! Tastes also like synthetic backwash"
	color = "#331a1a"

	glass_name = REAGENT_ID_OILSLIDE
	glass_desc = "Tasty, if you're a synth, not so much for organics."

/datum/reagent/ethanol/sitonmyface
	name = REAGENT_SITONMYFACE
	id = REAGENT_ID_SITONMYFACE
	description = "A drink made of irish coffee and nuts, mostly known for its vulgar name. Makes for a great pickup line though!"
	taste_description = "creamy coffee and alcohol, and nuts"
	color = "#896750"
	strength = 15

	glass_name = REAGENT_SITONMYFACE
	glass_desc = "A drink made of irish coffee and nuts, mostly known for its vulgar name. Makes for a great pickup line though!"

/datum/reagent/ethanol/hachi
	name = REAGENT_HACHI
	id = REAGENT_ID_HACHI
	description = "An unusual fusion of bourbon and sake infused with lemon juice, and mushrooms. Sweet, savory, but mostly weird."
	taste_description = "sweet lemons, black pepper, and savory mushroom"
	color = "#DC971D"
	strength = 20

/datum/reagent/drink/freshtea
	name = REAGENT_FRESHTEA
	id = REAGENT_ID_FRESHTEA //Not meant to be obtainable, this is to define effects for teas made from grown teas.
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
	name = REAGENT_FRESHTEA
	id = REAGENT_ID_FRESHTEAGREEN
	description = "Floral green tea, it has antioxidants, it's good for you! Fresh means it's even healthier!"
	taste_description = "floral with vegetal notes and a slightly bitter aftertaste"
	color = "#cac162"

	glass_name = "green tea"
	glass_desc = "Floral green tea, it has antioxidants, it's fresh and good for you!"

	cup_icon_state = "cup_tea"
	cup_name = "cup of tea"
	cup_desc = "Floral green tea, it has antioxidants, it's fresh and good for you!"

/datum/reagent/drink/tealeavesgreen
	name = REAGENT_TEALEAVESGREEN
	id = REAGENT_ID_TEALEAVESGREEN
	description = "Prepared green tea, just waiting for hot water."
	taste_description = "overwhelmingly bitter with faint floral notes"
	color = "#56761d"

	glass_name = "tea leaves"
	glass_desc = "Dry tea leaves in a cup. Just add hot water!"

/datum/reagent/drink/teamush
	name = REAGENT_TEAMUSH
	id = REAGENT_ID_TEAMUSH
	description = "Mashed tea leaves, a bit like grass clippings. You can't make proper tea out of this now."
	taste_description = "overwhelmingly bitter plant"
	color = "#7db72d"

	glass_name = "blended plant"
	glass_desc = "Chunky, mashed up plant of some sort. Looks kinda gross."

/datum/reagent/drink/instantteapowdergreen
	name = REAGENT_INSTANTTEAPOWDERGREEN
	id = REAGENT_ID_INSTANTTEAPOWDERGREEN
	description = "Green tea powder missing all the goodness of green tea." //Heathen.
	taste_description = "strong bitterness with a subtle chemical aftertaste"
	color = "#56761d"

	glass_name = "tea powder"
	glass_desc = "Instant green tea powder. Just add water for imitation green tea!"

/datum/reagent/drink/instantteagreen
	name = REAGENT_INSTANTTEAGREEN
	id = REAGENT_ID_INSTANTTEAGREEN
	description = "Convenient green tea missing all the goodness of actual green tea." //It's not even hot.
	taste_description = "bitterness with a subtle chemical aftertaste"
	color = "#cac162"

	glass_name = "green tea"
	glass_desc = "Green tea. It smells a bit off."

	cup_icon_state = "cup_tea"
	cup_name = "cup of tea"
	cup_desc = "Green tea. It smells a bit off."

/datum/reagent/drink/matchapowder
	name = REAGENT_MATCHAPOWDER
	id = REAGENT_ID_MATCHAPOWDER
	description = "Finely ground green tea. This is about the highest quality matcha you can prepare without traditional methods."
	taste_description = "heavy bitterness"
	color = "#86a443"

	glass_name = "matcha powder"
	glass_desc = "Matcha powder, waiting for brewing."

/datum/reagent/drink/matcha
	name = REAGENT_MATCHA
	id = REAGENT_ID_MATCHA
	description = "A form of green tea where the leaf is ground and suspended in water rather than steeped. This is considered cooking grade."
	taste_description = "floral, full-bodied bitterness with a subtle, earthy sweetness"
	color = "#9bc265"
	adj_dizzy = -4
	adj_drowsy = -1
	adj_sleepy = -3
	adj_temp = 20

	glass_name = REAGENT_ID_MATCHA
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
	name = REAGENT_ID_GELATIN
	id = REAGENT_GELATIN
	description = "It doesnt taste like anything."
	taste_description = REAGENT_ID_NOTHING
	nutrition = 0
	color = "#aaabcf"

	glass_name = REAGENT_ID_GELATIN
	glass_desc = "It's like flavourless slime."

/datum/reagent/drink/bubbleteawatermelon
	name = REAGENT_BUBBLETEAWATERMELON
	id = REAGENT_BUBBLETEAWATERMELON
	description = "A tea with milk and watermelon in it and gelatin balls as well."
	taste_description = "creamy tea and watermelon"
	color = "#b83333"

	glass_name = "watermelon bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with watermelon."

/datum/reagent/drink/bubbleteastrawberry
	name = REAGENT_BUBBLETEASTRAWBERRY
	id = REAGENT_ID_BUBBLETEASTRAWBERRY
	description = "A tea with milk and strawberry in it and gelatin balls as well."
	taste_description = "creamy tea and strawberry"
	color = "#eb6c77"

	glass_name = "strawberry bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with strawberry."

/datum/reagent/drink/bubbleteacherry
	name = REAGENT_BUBBLETEACHERRY
	id = REAGENT_ID_BUBBLETEACHERRY
	description = "A tea with milk and cherry in it and gelatin balls as well."
	taste_description = "creamy tea and cherry"
	color = "#801e28"

	glass_name = "cherry bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with cherry."

/datum/reagent/drink/bubbleteacoffee
	name = REAGENT_BUBBLETEACOFFEE
	id = REAGENT_ID_BUBBLETEACOFFEE
	description = "A tea with milk and coffee in it and gelatin balls as well."
	taste_description = "creamy tea and coffee"
	color = "#482910"

	glass_name = "coffee bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with coffee."

/datum/reagent/drink/bubbleteabanana
	name = REAGENT_BUBBLETEABANANA
	id = REAGENT_ID_BUBBLETEABANANA
	description = "A tea with milk and banana in it and gelatin balls as well."
	taste_description = "creamy tea and banana"
	color = "#c3af00"

	glass_name = "banana bubble tea"
	glass_desc = "A sweet tea with tasty little flavoured gelatin balls in it, this one is with banana."

/datum/reagent/drink/horchata
	name = REAGENT_HORCHATA
	id = REAGENT_ID_HORCHATA
	description = "A sweet and cold rice milk beverage."
	taste_description = "sweet rice milk and cinnamon"
	color = "#ebcdc1"
	adj_temp = -5

	glass_name = REAGENT_ID_HORCHATA
	glass_desc = "A sweet and cold rice milk beverage."

/datum/reagent/ethanol/narsour
	name = REAGENT_NARSOUR
	id = REAGENT_ID_NARSOUR
	description = "Side effects include self-mutilation and hoarding plasteel."
	taste_description = "blood and runes"
	color = "#7D1717"
	strength = 10

	glass_icon_state = REAGENT_ID_NARSOUR
	glass_name = REAGENT_NARSOUR
	glass_desc = "A new hit cocktail inspired by THE ARM Breweries will have you shouting Fuu ma'jin in no time!"

/datum/reagent/ethanol/cogchamp
	name = REAGENT_COGCHAMP
	id = REAGENT_ID_COGCHAMP
	description = "Now you can fill yourself with the power of Ratvar!"
	taste_description = "brass taste with a hint of oil"
	color = rgb(255, 201, 49)
	strength = 10

	glass_icon_state = "cogchamp"
	glass_name = REAGENT_COGCHAMP
	glass_desc = "Not even Ratvar's Four Generals could withstand this!  Qevax Jryy!"

//Arachnid slammer states - Jack

/datum/reagent/ethanol/arachnidslammer
	name = REAGENT_ARACHNIDSLAMMER
	id = REAGENT_ID_ARACHNIDSLAMMER
	description = "An adventurous mix of a cheap, powerful ale with an equally cheap, powerful energy drink and combat drugs. The result should have been undrikable, and yet it sure does put a spring in your step."
	taste_description = "hearty barley ale, almost illegal energy drink, combat stimulants, and the urge to go mine and wrestle a spider"
	color = "#594219"
	strength = 30
	nutriment_factor = 1

	glass_name = "arachnid slammer"
	glass_desc = "A freezing pint of delicious Araching Slammer, it foams constantly with the air crisp around it."
	allergen_type = ALLERGEN_GRAINS //Barley is grain

/datum/reagent/ethanol/arachnidslammer/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	.=..()
	M.reagents.add_reagent(REAGENT_ID_INFUSEDARACHNIDSLAMMER, removed * 5)
/datum/reagent/ethanol/arachnidslammer/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	.=..()
	M.reagents.add_reagent(REAGENT_ID_INFUSEDARACHNIDSLAMMER, removed * 5)

/datum/reagent/infusedarachnidslammer
	name = REAGENT_INFUSEDARACHNIDSLAMMER
	id = REAGENT_ID_INFUSEDARACHNIDSLAMMER
	description = "When Arachnid Slammer is metabolized you get a concortion of chemicals that breaks down slower. While the alcohol is burned off, the new compounds seems dormant, like they're waiting for some malicious toxin.."
	taste_description = "flat watered down Arachnid Slammer and a brewing tempest"
	reagent_state = LIQUID
	color = "#8040FF"
	scannable = 1
	metabolism = REM
	ingest_met = REM

	glass_name = "infused arachnid slammer"
	glass_desc = "A pint of metabolized Arachnid Slammer. Even if its flat it still somehow foams and sparkles as well as bubbles more actively when spiders are nearby."

/datum/reagent/infusedarachnidslammer/enragedarachnidslammer
	name = REAGENT_ENRAGEDARACHNIDSLAMMER
	id = REAGENT_ID_ENRAGEDARACHNIDSLAMMER
	description = "The best term to scientifically describe this concortion is that the compounds of the Arachnid Slammer are going into a raging frenzy from spider toxin. Its now functioning like a form of potent chemical-based white blood cells that aims to break down harmful compounds and repair the body."
	taste_description = "cold burning liquid rage and the urge to destroy any spider you see"

	glass_name = "enraged arachnid slammer"
	glass_desc = "A pint of Enraged Arachnid Slammer. It bubbles and sparkles fiercly as if it was in a berserking state!"

/datum/reagent/infusedarachnidslammer/enragedarachnidslammer/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	var/chem_effective = 1 * M.species.chem_strength_heal

	M.adjustOxyLoss(-1.5 * removed * chem_effective)
	M.adjustToxLoss(-1.5 * removed * chem_effective)
	M.heal_organ_damage(1.5 * removed, 1.5 * removed * chem_effective)
	M.add_chemical_effect(CE_PAINKILLER, 80 * chem_effective)
	M.add_chemical_effect(CE_SPEEDBOOST, 0)

/datum/reagent/drink/pilk
	name = REAGENT_PILK
	id = REAGENT_ID_PILK
	description = "A forbidden mixture that dates back to the early days of space civilization, its creation is known to have caused at least one or two massacres."
	taste_description = "heresy"
	color = "#4C3100"

	glass_name = REAGENT_PILK
	glass_desc = "Why would you do this to yourself?"

	cup_name = "glass of Pilk"
	cup_desc = "A glass of regret."

//Ported Drinks
/datum/reagent/ethanol/alliescocktail
	name = REAGENT_ALLIESCOCKTAIL
	id = REAGENT_ID_ALLIESCOCKTAIL
	description = "A drink made from your allies. Not as sweet as those made from your enemies."
	taste_description = "bitter yet free"
	color = "#60f8f8" // rgb(96, 248, 248)
	strength = 45

	glass_name = "Allies cocktail"
	glass_desc = "A drink made from your allies."

/datum/reagent/ethanol/fetching_fizz
	name = REAGENT_FETCHINGFIZZ
	id = REAGENT_ID_FETCHINGFIZZ
	description = "Cola/iron/uranium mixture resulting in a highly magnetic slurry. Mild alcohol content."
	taste_description = "charged metal"
	color = "#FF5B0F" // rgb(255, 91, 15)
	strength = 90

	glass_name = REAGENT_FETCHINGFIZZ
	glass_desc = "Induces magnetism in the imbiber. Started as a barroom prank but evolved to become popular with miners and scrappers. Metallic aftertaste."

/datum/reagent/ethanol/fetching_fizz/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	for(var/obj/item/ore/O in orange(3, M))
		step_towards(O, get_turf(M))

/datum/reagent/ethanol/hearty_punch
	name = REAGENT_HEARTYPUNCH
	id = REAGENT_ID_HEARTYPUNCH
	description = "Brave bull/syndicate bomb/absinthe mixture resulting in an energizing beverage. Mild alcohol content."
	taste_description = "bravado in the face of disaster"
	color = "#8C0000" // rgb(140, 0, 0)
	strength = 90
	glass_name = REAGENT_HEARTYPUNCH
	glass_desc = "Aromatic beverage served piping hot. According to folk tales it can almost wake the dead."

/datum/reagent/ethanol/hearty_punch/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.health<=0)
		M.adjustBruteLoss(-3 * removed)
		M.adjustFireLoss(-3 * removed)
		M.adjustCloneLoss(-5 * removed)
		M.adjustOxyLoss(-4 * removed)
		M.adjustToxLoss(-3 * removed)

/datum/reagent/ethanol/squirt_cider
	name = REAGENT_SQUIRTCIDER
	id = REAGENT_ID_SQUIRTCIDER
	description = "Fermented squirt extract with a nose of stale bread and ocean water. Whatever a squirt is."
	taste_description = "stale bread with a staler aftertaste"
	color = "#FF0000" // rgb(255, 0, 0)
	strength = 40
	glass_name = REAGENT_SQUIRTCIDER
	glass_desc = "Squirt cider will toughen you right up. Too bad about the musty aftertaste."
	nutriment_factor = 2

/datum/reagent/ethanol/fringe_weaver
	name = REAGENT_FRINGEWEAVER
	id = REAGENT_ID_FRINGEWEAVER
	description = "Bubbly, classy, and undoubtedly strong - a Glitch City classic."
	taste_description = "ethylic alcohol with a hint of sugar"
	color = "#FFEAC4" // rgb(255, 234, 197)
	strength = 10
	glass_name = REAGENT_FRINGEWEAVER
	glass_desc = "It's a wonder it doesn't spill out of the glass."

/datum/reagent/ethanol/crevice_spike
	name = REAGENT_CREVICESPIKE
	id = REAGENT_ID_CREVICESPIKE
	description = "Sour, bitter, and smashingly sobering."
	taste_description = "a bitter SPIKE with a sour aftertaste"
	color = "#5BD231" // rgb(91, 210, 49)
	strength = 200
	glass_name = REAGENT_CREVICESPIKE
	glass_desc = "It'll either knock the drunkenness out of you or knock you out cold. Both, probably."

/datum/reagent/ethanol/crevice_spike/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustBruteLoss(50 * removed)
	for(var/datum/reagent/R in M.ingested.reagent_list)
		if(istype(R, /datum/reagent/ethanol))
			R.remove_self(50 * removed)

/datum/reagent/ethanol/duplex
	name = REAGENT_DUPLEX
	id = REAGENT_ID_DUPLEX
	description = "An inseparable combination of two fruity drinks."
	taste_description = "green apples and blue raspberries"
	color = "#50e5cf" // rgb(80, 229, 207)
	strength = 50
	glass_name = REAGENT_DUPLEX
	glass_desc = "To imbibe one component separately from the other is consider a great faux pas."

/datum/reagent/ethanol/mauna_loa
	name = REAGENT_MAUNALOA
	id = REAGENT_ID_MAUNALOA
	description = "Extremely hot; not for the faint of heart!"
	taste_description = "fiery, with an aftertaste of burnt flesh"
	color = "#fe8308" // rgb(254, 131, 8)
	strength = 50
	glass_name = REAGENT_MAUNALOA
	glass_desc = "Lava in a drink... mug... volcano... thing."

/datum/reagent/ethanol/mauna_loa/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(10))
		M.adjust_fire_stacks(5*removed)
		M.IgniteMob()

/datum/reagent/ethanol/hiveminderaser
	name = REAGENT_HIVEMINDERASER
	id = REAGENT_ID_HIVEMINDERASER
	description = "A vessel of pure flavor."
	taste_description = "psychic links"
	color = "#FF80FC" // rgb(255, 128, 252)
	strength = 50
	glass_name = REAGENT_HIVEMINDERASER
	glass_desc = "For when even mindshields can't save you."

/datum/reagent/ethanol/erikasurprise
	name = REAGENT_ERIKASURPRISE
	id = REAGENT_ID_ERIKASURPRISE
	description = "The surprise is, it's green!"
	taste_description = "tartness and bananas"
	color = "#2E6671" // rgb(46, 102, 113)
	strength = 75
	glass_name = REAGENT_ERIKASURPRISE
	glass_desc = "The surprise is, it's green!"

////////////////////////////////////////////////
/////////FOODSTUFF/////////////////////////////
//////////////////////////////////////////////

/datum/reagent/cinnamonpowder
	name = REAGENT_CINNAMONPOWDER
	id = REAGENT_ID_CINNAMONPOWDER
	description = "Cinnamon, a spice made from tree bark, ground into a fine powder. Probably not a good idea to eat on its own!"
	taste_description= "sweet spice with a hint of wood"
	color = "#a96622"

	glass_name = REAGENT_CINNAMONPOWDER
	glass_desc = "A glass of ground cinnamon. Dare you take the challenge?"

//YW drinks
/datum/reagent/drink/lovepotion_yw
	name = REAGENT_STRAWBERRYLOVEPOTION
	id = REAGENT_ID_STRAWBERRYLOVEPOTION
	description = "Creamy strawberries and sugar, simple and sweet."
	taste_description = "strawberries and cream"
	color = "#fc8a8a" // rgb(252, 138, 138)

	glass_name = "Love Potion"
	glass_desc = "Love me tender, love me sweet."

/datum/reagent/ethanol/wormblood
	name = REAGENT_WORMBLOOD
	id = REAGENT_ID_WORMBLOOD
	description = "Who had the grand idea to bottle THE BLOOD OF A WORM."
	taste_description = "Wriggly cave fungus"
	color = "#827A00"
	strength = 30
	druggy = 10

	glass_name = "Worm blood"
	glass_desc = "Who had the grand idea to bottle THE BLOOD OF A WORM."
	glass_icon_state = "wormblood"
	glass_center_of_mass_x = 16
	glass_center_of_mass_y = 8
	glass_icon_file = 'icons/obj/drinks_yw.dmi'

/datum/reagent/blondiemix
	name = REAGENT_BLONDIEMIX
	id = REAGENT_ID_BLONDIEMIX
	description = "A dry mix for making delicious blondies."
	reagent_state = SOLID
	color = "#f3b44e"
