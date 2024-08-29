/datum/recipe/humanburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/human, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/human/burger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/plainburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat //do not place this recipe before /datum/recipe/humanburger // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/monkeyburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/syntiburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/monkeyburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/brainburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/organ/internal/brain
	)
	result = /obj/item/reagent_containers/food/snacks/brainburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/roburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/robot_parts/head
	)
	result = /obj/item/reagent_containers/food/snacks/roburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/xenoburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/xenomeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/xenoburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/fishburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/fishburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/tofuburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/tofuburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/ghostburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ectoplasm //where do you even find this stuff // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/ghostburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/clownburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas/clown_hat
	)
	result = /obj/item/reagent_containers/food/snacks/clownburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/mimeburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/beret
	)
	result = /obj/item/reagent_containers/food/snacks/mimeburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/mouseburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/holder/mouse // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/mouseburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bunbun
	appliance = GRILL
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bunbun // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/hotdog
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/sausage // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/hotdog // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/humankabob
	appliance = GRILL
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/human, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/human, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/human/kabob // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/kabob	//Do not put before humankabob
	appliance = GRILL
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/monkeykabob // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/monkeykabob
	appliance = GRILL
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/monkey, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/monkey // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/monkeykabob // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/syntikabob
	appliance = GRILL
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/monkeykabob // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/tofukabob
	appliance = GRILL
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/tofu, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/tofukabob // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/fakespellburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/monkeyburger, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/wizard/fake,
	)
	result = /obj/item/reagent_containers/food/snacks/spellburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/spellburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/monkeyburger, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/wizard,
	)
	result = /obj/item/reagent_containers/food/snacks/spellburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bigbiteburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/monkeyburger, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("egg" = 3)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/bigbiteburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/superbiteburger
	appliance = GRILL
	fruit = list("tomato" = 1)
	reagents = list("sodiumchloride" = 5, "blackpepper" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bigbiteburger, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/dough, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/boiledegg, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/superbiteburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/slimeburger
	appliance = GRILL
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/jellyburger/slime // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/jellyburger
	appliance = GRILL
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/jellyburger/cherry // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/bearburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bearmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bearburger // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/baconburger
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/bun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bacon // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/burger/bacon // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/omelette
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("egg" = 6)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/omelette // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/omurice
	appliance = GRILL
	reagents = list("rice" = 5, "ketchup" = 5, "egg" = 3)
	result = /obj/item/reagent_containers/food/snacks/omurice // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/omurice/heart
	appliance = GRILL
	reagents = list("rice" = 5, "ketchup" = 5, "sugar" = 5, "egg" = 3)
	result = /obj/item/reagent_containers/food/snacks/omurice/heart // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/omurice/face
	appliance = GRILL
	reagents = list("rice" = 5, "ketchup" = 5, "sodiumchloride" = 1, "egg" = 3)
	result = /obj/item/reagent_containers/food/snacks/omurice/face // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/meatsteak
	appliance = GRILL
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat) // CHOMPEdit - Removal of obj/item/weapon
	result = /obj/item/reagent_containers/food/snacks/meatsteak // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/honeytoast
	appliance = GRILL
	reagents = list("honey" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread // CHOMPEdit - Removal of obj/item/weapon
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/honeytoast // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/grilled_carp
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/carpmeat // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("spacespice" = 1)
	fruit = list("lettuce" = 1, "lime" = 1)
	result = /obj/item/reagent_containers/food/snacks/sliceable/grilled_carp // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/grilledcheese
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge, // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/grilledcheese // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/toastedsandwich
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/sandwich // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/toastedsandwich // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/cheese_cracker
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/spreads/butter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/slice/bread, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/cheesewedge // CHOMPEdit - Removal of obj/item/weapon
	)
	reagents = list("spacespice" = 1)
	result = /obj/item/reagent_containers/food/snacks/cheesetoast // CHOMPEdit - Removal of obj/item/weapon
	result_quantity = 4

/datum/recipe/bacongrill
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/spreads, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/rawbacon // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/bacon // CHOMPEdit - Removal of obj/item/weapon

/datum/recipe/chickenfillet //Also just combinable, like burgers and hot dogs.
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/chickenkatsu, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/food/snacks/bun // CHOMPEdit - Removal of obj/item/weapon
	)
	result = /obj/item/reagent_containers/food/snacks/chickenfillet // CHOMPEdit - Removal of obj/item/weapon
