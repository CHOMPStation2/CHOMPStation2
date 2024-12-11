#define PLANT_AMBROSIA "ambrosia"
#define PLANT_APPLE "apple"
#define PLANT_BANANA "banana"
#define PLANT_BERRIES "berries"
#define PLANT_CABBAGE "cabbage"
#define PLANT_CARROT "carrot"
#define PLANT_CELERY "celery"
#define PLANT_CHERRY "cherry"
#define PLANT_CHILI "chili"
#define PLANT_COCOA "cocoa"
#define PLANT_CORN "corn"
#define PLANT_DURIAN "durian"
#define PLANT_EGGPLANT "eggplant"
#define PLANT_GRAPES "grapes"
#define PLANT_GREENGRAPES "greengrapes"
#define PLANT_HAREBELLS "harebells"
#define PLANT_LAVENDER "lavender"
#define PLANT_LEMON "lemon"
#define PLANT_LETTUCE "lettuce"
#define PLANT_LIME "lime"
#define PLANT_ONION "onion"
#define PLANT_ORANGE "orange"
#define PLANT_PEANUT "peanut"
#define PLANT_POPPIES "poppies"
#define PLANT_POTATO "potato"
#define PLANT_PUMPKIN "pumpkin"
#define PLANT_RICE "rice"
#define PLANT_ROSE "rose"
#define PLANT_RHUBARB "rhubarb"
#define PLANT_SOYBEAN "soybean"
#define PLANT_SPINEAPPLE "spineapple"
#define PLANT_SUGARCANE "sugarcane"
#define PLANT_SUNFLOWERS "sunflowers"
#define PLANT_TOMATO "tomato"
#define PLANT_VANILLA "vanilla"
#define PLANT_WATERMELON "watermelon"
#define PLANT_WHEAT "wheat"
#define PLANT_WHITEBEET "whitebeet"
#define PLANT_DIONA "diona"
#define PLANT_GHOSTCHILI "ghostchili"
#define PLANT_PLASTIC "plastic"
#define PLANT_SHAND "shand"
#define PLANT_MTEAR "mtear"
#define PLANT_GLOWBERRIES "glowberries"
#define PLANT_PEPPERCORNS "peppercorns"
#define PLANT_BLOODTOMATO "bloodtomato"
#define PLANT_KILLERTOMATO "killertomato"
#define PLANT_BLUETOMATO "bluetomato"
#define PLANT_BLUESPACETOMATO "bluespacetomato"
#define PLANT_ICECHILI "icechili"
#define PLANT_REISHI "reishi"
#define PLANT_AMANITA "amanita"
#define PLANT_DESTROYINGANGEL "destroyingangel"
#define PLANT_LIBERTYCAP "libertycap"
#define PLANT_MUSHROOMS "mushrooms"
#define PLANT_TOWERCAP "towercap"
#define PLANT_REDCAP "redcap"
#define PLANT_GLOWSHROOM "glowshroom"
#define PLANT_PLUMPHELMET "plumphelmet"
#define PLANT_SPORESHROOM "sporeshroom"
#define PLANT_NETTLE "nettle"
#define PLANT_DEATHNETTLE "deathnettle"
#define PLANT_WEEDS "weeds"
#define PLANT_MOLD "mold"
#define PLANT_POISONAPPLE "poisonapple"
#define PLANT_GOLDAPPLE "goldapple"
#define PLANT_AMBROSIADEUS "ambrosiadeus"
#define PLANT_AMBROSIAGAIA "ambrosiagaia"
#define PLANT_AMBROSIAINFERNUS "ambrosiainfernus"
#define PLANT_POISONBERRIES "poisonberries"
#define PLANT_DEATHBERRIES "deathberries"
#define PLANT_GRASS "grass"
#define PLANT_CARPET "carpet"
#define PLANT_TOBACCO "tobacco"
#define PLANT_KUDZU "kudzu"
#define PLANT_JURLMAH "jurlmah"
#define PLANT_AMAURI "amauri"
#define PLANT_GELTHI "gelthi"
#define PLANT_VALE "vale"
#define PLANT_SURIK "surik"
#define PLANT_TELRIIS "telriis"
#define PLANT_THAADRA "thaadra"
#define PLANT_WHITEWABBACK "whitewabback"
#define PLANT_BLACKWABBACK "blackwabback"
#define PLANT_WILDWABBACK "wildwabback"
#define PLANT_SIFLETTUCE "siflettuce"
#define PLANT_EGG_PLANT "egg-plant"
#define PLANT_PINEAPPLE "pineapple"
#define PLANT_BLOODROSE "bloodrose"
#define PLANT_GNOMES "gnomes"
#define PLANT_SIFBULB "sifbulb"
#define PLANT_WURMWOAD "wurmwoad"
#define PLANT_MICROM "microm"
#define PLANT_MEGAM "megam"

// CHompAdd Start
#define PLANT_VOLTATO "voltato"
// CHOMPAdd End

GLOBAL_LIST_INIT(acceptable_fruit_types, list(
											PLANT_AMBROSIA,
											PLANT_APPLE,
											PLANT_BANANA,
											PLANT_BERRIES,
											PLANT_CABBAGE,
											PLANT_CARROT,
											PLANT_CELERY,
											PLANT_CHERRY,
											PLANT_CHILI,
											PLANT_COCOA,
											PLANT_CORN,
											PLANT_DURIAN,
											PLANT_EGGPLANT,
											PLANT_GRAPES,
											PLANT_GRASS, // CHOMPAdd
											PLANT_GREENGRAPES,
											PLANT_HAREBELLS,
											PLANT_LAVENDER,
											PLANT_LEMON,
											PLANT_LETTUCE,
											PLANT_LIME,
											PLANT_ONION,
											PLANT_ORANGE,
											PLANT_PEANUT,
											PLANT_POPPIES,
											PLANT_POTATO,
											PLANT_PUMPKIN,
											PLANT_REISHI, // CHOMPAdd
											PLANT_RICE,
											PLANT_ROSE,
											PLANT_RHUBARB,
											PLAND_SHAND, // CHOMPAdd
											PLANT_SOYBEAN,
											PLANT_SPINEAPPLE,
											PLANT_SUGARCANE,
											PLANT_SUNFLOWERS,
											PLANT_TOMATO,
											PLANT_TOWERCAP, // CHOMPAdd
											PLANT_VANILLA,
											PLANT_WATERMELON,
											PLANT_WHEAT,
											PLANT_WHITEBEET))






("orangesapbean","bluesapbean","purplesapbean")
	mutants = list("meatwheat") //CHOMPEdit - Adding mutation strain for meatwheat.
	mutants = list("solarflower") //CHOMPEdit - Adding mutation strain for solarflowers.
	mutants = list("milkdew") //CHOMPEdit - Adding mutation strain for milkdew
	mutants = list("siflettuce") // ChompEDIT - Makes the glacial lettuce obtainable
get_reagent_amount("

	src.trait_injection_reagents += "microcillin"			// get small
	src.trait_injection_reagents += "macrocillin"			// get BIG
	src.trait_injection_reagents += "normalcillin"			// normal
	src.trait_injection_reagents += "numbenzyme"			// no feelings
	src.trait_injection_reagents += "change_drug_male"		// -> MALE
	src.trait_injection_reagents += "change_drug_female"	// -> FEMALE
	src.trait_injection_reagents += "change_drug_intersex"	// -> PLURAL
	src.trait_injection_reagents += "stoxin"				// night night chem
	src.trait_injection_reagents += "rainbowtoxin" 			// Funny flashing lights.
	src.trait_injection_reagents += "paralysistoxin" 		// Paralysis!
	src.trait_injection_reagents += "painenzyme"			// Pain INCREASER
		ORE_SAND = 0,
		"hematite" = 0,
		"carbon" = 0,
		"raw copper" = 0,
		"raw tin" = 0,
		"void opal" = 0,
		"painite" = 0,
		"quartz" = 0,
		"raw bauxite" = 0,
		"phoron" = 0,
		"silver" = 0,
		"gold" = 0,
		"marble" = 0,
		"uranium" = 0,
		"diamond" = 0,
		"platinum" = 0,
		"lead" = 0,
		"mhydrogen" = 0,
		"verdantium" = 0,
		"rutile" = 0)

			Prey.touching.del_reagent("stomacid") //Don't need this stuff in our bloodstream.
			Prey.touching.del_reagent("diet_stomacid") //Don't need this stuff in our bloodstream.
			Prey.touching.del_reagent("pacid") //Don't need this stuff in our bloodstream.
			Prey.touching.del_reagent("sacid") //Don't need this stuff in our bloodstream.
			Prey.touching.del_reagent("cleaner") //Don't need this stuff in our bloodstream.
			Prey.touching.trans_to_holder(Pred.ingested, Prey.touching.total_volume, 0.5, TRUE) // On updating the prey's reagents
		else if(M.reagents)
			M.reagents.del_reagent("stomacid") //Don't need this stuff in our bloodstream.
			M.reagents.del_reagent("diet_stomacid") //Don't need this stuff in our bloodstream.
			M.reagents.del_reagent("cleaner") //Don't need this stuff in our bloodstream.

	prefill = list("change_drug_male" = 1) // CHOMPEdit
