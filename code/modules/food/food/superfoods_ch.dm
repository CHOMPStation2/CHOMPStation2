//The collection of everything 'cake' related
// adjust recipes, make ingredients mobs

/datum/recipe/thecake_firstlayer
	reagents = list(REAGENT_ID_FLOUR = 500,REAGENT_ID_MILK = 200, REAGENT_ID_SUGAR = 200, REAGENT_ID_EGG = 100)
	fruit = list(PLANT_ICECHILI = 30, PLANT_PLASTIC =  15)
	items = list(
			/obj/item/stack/material/silver,
			/obj/item/stack/material/silver,
			/obj/item/stack/material/silver,
			/obj/item/stack/material/silver,
			/obj/item/stack/material/silver,
			/obj/item/slime_extract/grey,
			/obj/item/slime_extract/grey,
			/obj/item/slime_extract/grey,
			/obj/item/slime_extract/grey,
			/obj/item/slime_extract/grey,
			/obj/item/reagent_containers/food/snacks/meat/grubmeat,
			/obj/item/reagent_containers/food/snacks/meat/grubmeat,
			/obj/item/reagent_containers/food/snacks/meat/grubmeat,
			/obj/item/reagent_containers/food/snacks/meat/grubmeat,
			/obj/item/reagent_containers/food/snacks/meat/grubmeat
		)
	result = /obj/structure/thecake

/datum/recipe/thecake_secondlayer
	reagents = list(REAGENT_ID_FLOUR = 400, REAGENT_ID_MILK = 200, REAGENT_ID_SUGAR = 100, REAGENT_ID_CRYOXADONE = 200, REAGENT_ID_FROSTOIL = 100)
	fruit = list(PLANT_VANILLA =  30, PLANT_SIFLETTUCE = 15)
	items = list(
			/obj/item/stack/material/glass/phoronglass,
			/obj/item/stack/material/glass/phoronglass,
			/obj/item/stack/material/glass/phoronglass,
			/obj/item/stack/material/glass/phoronglass,
			/obj/item/stack/material/glass/phoronglass,
			/obj/item/organ/internal/eyes,
			/obj/item/organ/internal/eyes,
			/obj/item/organ/internal/eyes,
			/obj/item/organ/internal/eyes,
			/obj/item/organ/internal/eyes,
			/obj/item/stack/material/diamond,
			/obj/item/stack/material/diamond,
			/obj/item/stack/material/diamond,
			/obj/item/stack/material/diamond,
			/obj/item/stack/material/diamond
		)
	result = /obj/item/thecake_layer

/datum/recipe/thecake_thirdlayer
	reagents = list(REAGENT_ID_FLOUR = 300, REAGENT_ID_SINGULO = 300, REAGENT_ID_ATOMICBOMB = 150, REAGENT_ID_THREEMILEISLAND = 150, REAGENT_ID_MANHATTANPROJ = 100)
	fruit = list(PLANT_GLOWBERRIES = 30, PLANT_GLOWSHROOM =  15)
	items = list(
			/obj/item/stack/material/uranium,
			/obj/item/stack/material/uranium,
			/obj/item/stack/material/uranium,
			/obj/item/stack/material/uranium,
			/obj/item/stack/material/uranium,
			/obj/item/slime_extract/green,
			/obj/item/slime_extract/green,
			/obj/item/slime_extract/green,
			/obj/item/slime_extract/green,
			/obj/item/slime_extract/green,
			/obj/item/reagent_containers/food/snacks/carpmeat,
			/obj/item/reagent_containers/food/snacks/carpmeat,
			/obj/item/reagent_containers/food/snacks/carpmeat,
			/obj/item/reagent_containers/food/snacks/carpmeat,
			/obj/item/reagent_containers/food/snacks/carpmeat
		)
	result = /obj/item/thecake_layer/three

/datum/recipe/thecake_fourthlayer
	reagents = list(REAGENT_ID_FLOUR = 400, REAGENT_ID_HOLYMARY = 100, REAGENT_ID_ANGELSKISS = 100, REAGENT_ID_GOLDSCHLAGER = 100, REAGENT_ID_GOLD = 300)
	fruit = list(PLANT_AMBROSIADEUS = 30, PLANT_GOLDAPPLE =  15)
	items = list(
			/obj/item/stack/material/gold,
			/obj/item/stack/material/gold,
			/obj/item/stack/material/gold,
			/obj/item/stack/material/gold,
			/obj/item/stack/material/gold,
			/obj/item/organ/internal/heart,
			/obj/item/organ/internal/heart,
			/obj/item/organ/internal/heart,
			/obj/item/organ/internal/heart,
			/obj/item/organ/internal/heart,
			/obj/item/reagent_containers/food/snacks/appletart,
			/obj/item/reagent_containers/food/snacks/appletart,
			/obj/item/reagent_containers/food/snacks/appletart,
			/obj/item/reagent_containers/food/snacks/appletart,
			/obj/item/reagent_containers/food/snacks/appletart
		)
	result = /obj/item/thecake_layer/four

/datum/recipe/thecake_fifthlayer
	reagents = list(REAGENT_ID_DEATHBELL = 1000)
	fruit = list(PLANT_LIBERTYCAP = 10, PLANT_DEATHNETTLE =  10, PLANT_DESTROYINGANGEL = 10)
	items = list(
			/obj/item/stack/material/platinum,
			/obj/item/stack/material/platinum,
			/obj/item/stack/material/platinum,
			/obj/item/stack/material/platinum,
			/obj/item/stack/material/platinum,
			/obj/item/slime_extract/emerald,
			/obj/item/slime_extract/emerald,
			/obj/item/slime_extract/emerald,
			/obj/item/slime_extract/emerald,
			/obj/item/slime_extract/emerald,
			/obj/item/reagent_containers/food/snacks/xenomeat,
			/obj/item/reagent_containers/food/snacks/xenomeat,
			/obj/item/reagent_containers/food/snacks/xenomeat,
			/obj/item/reagent_containers/food/snacks/xenomeat,
			/obj/item/reagent_containers/food/snacks/xenomeat
		)
	result = /obj/item/thecake_layer/five

/obj/structure/thecake/proc/HasSliceMissing()
	if(slices < maxslices)
		if(interval >= regentime)
			interval = 0
			slices++
			HasSliceMissing()
		else
			interval++
			HasSliceMissing()
	else
		return

/obj/item/thecake_layer
	name = "A layer of cake"
	desc = "a layer of cake, you can see your own reflection in it."
	icon = 'icons/obj/food_ch.dmi'
	var/layer_stage = 1
	icon_state = "thecake_layer-1"

/obj/item/thecake_layer/three
	desc = "a layer of cake, it bathes you in a soft green glowth and warmth."
	layer_stage = 2
	icon_state = "thecake_layer-2"

/obj/item/thecake_layer/four
	desc = "a layer of cake, its of so high karat that even the lightest touch leaves a dent in it."
	layer_stage = 3
	icon_state = "thecake_layer-3"

/obj/item/thecake_layer/five
	desc = "a layer of cake, whatever this strange metal thats used in it is, it seems to drawn in light and reflect it back in a different shade."
	layer_stage = 4
	icon_state = "thecake_layer-4"

/obj/item/thecake_layer/six
	name = "A stable singularity cherry"
	desc = "It's a tiny singularity, but it doesnt draw in everything around it, touching it feels strange, like your touching nothingness...That feels at the same time like touching a cherry."
	layer_stage = 5
	icon_state = "thecake_layer-5"

/obj/item/reagent_containers/food/snacks/thecakeslice
	name = "The Infinity Cake Slice"
	desc = "A slice from The Infinity Cake, sadly the slice itself isnt infinite..."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "thecakeslice"

	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 10 //CHOMPEdit
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "singularity?" = 1)
	nutriment_amt = 5
	//Add some randomized effect possibly, to make the slices special - Jack

/obj/structure/thecake
	name = "An unfinished cake"
	desc = "A single layer of tasty delicious cake goodness, but it feels very incomplete..."

	icon = 'icons/obj/food64x64_ch.dmi'
	icon_state = "thecake_onelayer"
	pixel_x = -16

	var/edible = 0
	var/stage = 1
	var/maxstages = 6
	var/slices = 5
	var/maxslices = 5

	var/regentime = 250 // considering the effort it takes to make this thing, 2000 meant it regenerated painfully slow.
	var/interval = 0
	var/static/list/desclist = list(
			"The lonely first layer of a magnificent cake. It looks tasty, just like momma used to bake.",
			"The second layer of the cake is added, the reflection makes it strange to look at.",
			"The third layer of cake sits in place now, it looks like it might kill you but it appears the second layer is an excellent radiation absorbant.",
			"The fourth layer of cake rests, so heavy the other layers starts to connect seamlessly as the dough warps.",
			"With the fifth layer messing with the light, the cake almost looks complete. It's just missing a centerpiece on top.",
			"its The Infinity Cake! This huge imposing cake made by immense efforts and resources stands tall in you, radiating a menacing aura of frosty goodness and diabetes for those not wary of it's infinite might!"
		)

/obj/structure/thecake/attackby(var/obj/item/W, var/mob/living/user)
	if(istype(W,/obj/item/material/knife))
		if(edible == 1)
			HasSliceMissing()
			if(slices <= 0)
				to_chat(usr, span_warning("The cake hums away quietly as the singulo powered goodness slowly recovers the large amount of lost mass, best to give it a moment before cutting another slice."))
				return
			else
				to_chat(user, span_notice("You cut a slice of the cake. The slice looks like the cake was just baked, and you can see before your eyes as the spot where you cut the slice slowly regenerates!"))
				slices = slices - 1
				new /obj/item/reagent_containers/food/snacks/thecakeslice(src.loc)

		else
			to_chat(user, span_notice("It looks so good... But it feels so wrong to eat it before it's finished..."))
			return
	if(istype(W,/obj/item/thecake_layer))
		var/obj/item/thecake_layer/C = W
		if(C.layer_stage == 5)
			for(var/mob/O in view(src, null))
				O.show_message(span_warning("It has been done! The Infinity Cake has been assembled!"),1)
			qdel(W)
			stage++
			desc = desclist[stage]
			icon_state = "thecake_finished"
			edible = 1
			name = "The Infinity Cake!"
		else if(stage == maxstages)
			to_chat(usr, span_warning("The cake is already done!"))
		else if(stage == C.layer_stage)
			to_chat(usr, span_warning("You add another layer to the cake, nice."))
			qdel(W)
			stage++
			desc = desclist[stage]
			icon_state = "thecake_stage-[stage]"
		else
			to_chat(usr, span_warning("Hmm, doesnt seem like this layer is supposed to be added there?"))

// Chaos cake

/datum/recipe/chaoscake_layerone
	reagents = list(REAGENT_ID_FLOUR = 300,REAGENT_ID_MILK = 200, REAGENT_ID_SUGAR = 100, REAGENT_ID_EGG = 30)
	fruit = list(PLANT_POISONBERRIES = 15, PLANT_CHERRY =  15)
	items = list(
			/obj/item/reagent_containers/food/snacks/meat/,
			/obj/item/reagent_containers/food/snacks/meat/,
			/obj/item/reagent_containers/food/snacks/meat/,
			/obj/item/reagent_containers/food/snacks/meat/
		)
	result = /obj/structure/chaoscake

/datum/recipe/chaoscake_layertwo
	reagents = list(REAGENT_ID_FLOUR = 300, REAGENT_ID_MILK = 200, REAGENT_ID_SUGAR = 100, REAGENT_ID_EGG = 30, )
	fruit = list(PLANT_VANILLA =  15, PLANT_BANANA = 15)
	items = list(
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough
		)
	result = /obj/item/chaoscake_layer

/datum/recipe/chaoscake_layerthree
	reagents = list(REAGENT_ID_FLOUR = 240, REAGENT_ID_MILK = 150, REAGENT_ID_SUGAR = 80, REAGENT_ID_EGG = 24, REAGENT_ID_DEATHBELL = 100)
	fruit = list(PLANT_GRAPES = 30)
	items = list(
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough
		)
	result = /obj/item/chaoscake_layer/three

/datum/recipe/chaoscake_layerfour
	reagents = list(REAGENT_ID_FLOUR = 240, REAGENT_ID_MILK = 150, REAGENT_ID_SUGAR = 80, REAGENT_ID_EGG = 24, REAGENT_ID_MILKSHAKE = 300)
	fruit = list(PLANT_RICE = 30)
	items = list(
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough
		)
	result = /obj/item/chaoscake_layer/four

/datum/recipe/chaoscake_layerfive
	reagents = list(REAGENT_ID_FLOUR = 180, REAGENT_ID_MILK = 100, REAGENT_ID_SUGAR = 60, REAGENT_ID_EGG = 18, REAGENT_ID_BLOOD = 300)
	fruit = list(PLANT_TOMATO = 20)
	items = list(
		/obj/item/reagent_containers/food/snacks/lobster,
		/obj/item/reagent_containers/food/snacks/lobster,
		/obj/item/reagent_containers/food/snacks/lobster,
		/obj/item/reagent_containers/food/snacks/lobster
		)
	result = /obj/item/chaoscake_layer/five

/datum/recipe/chaoscake_layersix
	reagents = list(REAGENT_ID_FLOUR = 180, REAGENT_ID_MILK = 100, REAGENT_ID_SUGAR = 60, REAGENT_ID_EGG = 18, REAGENT_ID_SPRINKLES = 10)
	fruit = list(PLANT_APPLE = 30)
	items = list(
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/chocolatebar,
			/obj/item/reagent_containers/food/snacks/chocolatebar,
			/obj/item/reagent_containers/food/snacks/chocolatebar
		)
	result = /obj/item/chaoscake_layer/six

/datum/recipe/chaoscake_layerseven
	reagents = list(REAGENT_ID_FLOUR = 120, REAGENT_ID_MILK = 50, REAGENT_ID_SUGAR = 40, REAGENT_ID_EGG = 12, REAGENT_ID_DEVILSKISS = 200)
	fruit = list(PLANT_POTATO = 10)
	items = list(
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough
		)
	result = /obj/item/chaoscake_layer/seven

/datum/recipe/chaoscake_layereight
	reagents = list(REAGENT_ID_FLOUR = 120, REAGENT_ID_MILK = 50, REAGENT_ID_SUGAR = 40, REAGENT_ID_EGG = 12, REAGENT_ID_CREAM = 200)
	fruit = list(PLANT_LEMON = 10)
	items = list(
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough,
			/obj/item/reagent_containers/food/snacks/dough
		)
	result = /obj/item/chaoscake_layer/eight

/datum/recipe/chaoscake_layernine
	reagents = list(REAGENT_ID_WATER = 100, REAGENT_ID_BLOOD = 100)
	fruit = list(PLANT_GOLDAPPLE = 50)
	items = list()
	result = /obj/item/chaoscake_layer/nine

/obj/structure/chaoscake
	name = "An unfinished cake"
	desc = "A single layer of a strange cake, you can see the cherry paste ooze, but it feels very incomplete..."

	icon = 'icons/obj/food64x64.dmi'
	icon_state = "chaoscake_unfinished-1"
	pixel_x = -16

	var/slices = 6
	var/maxslices = 6
	var/stage = 1
	var/maxstages = 9
	var/edible = 0

	var/regentime = 1000
	var/interval = 0

	var/static/list/desclist2 = list(
			"The first layer of a strange cake, you can see the cherry paste ooze.",
			"The second layer of the cake sits in place now, smelling of pear with delicious colourful cream.",
			"The third layer of cake adds a strange purple layer, glazed over with frosting. It smells of grapes, but with a hint of something foul underneath.",
			"With the fourth layer added the cake looks happier again. Reeking of vanilla, it brings up memories of childhood joy.",
			"The fifth layer is extremely disturbing on that cake. Smelling of pure copper, it seems that bright blood clots are forming on top.",
			"The cake is getting closer with the sixth layer added, the pink hue smelling of chocolate, with colourful sprinkles on top.",
			"The first pair of triplets rest on the cake, despite being mostly similar to the first three, an evil aura becomes noticable.",
			"The second pair of triplets rest on the cake, if you stand on the bright side, you can feel a good aura lifting your mood.",
			"A chaos cake. Both a creation of dark and light, the two cakes are kept in a careful balance by that mystical coin in the middle. It's said its effects would dissipate if the balance is ever tipped in favour of one side too much, so both sides much be cut equally."
		)

/*
/obj/item/chaoscake_layerone
	name = "A layer of cake"
	desc = "a layer of cake, you can see the cherry paste ooze."
	icon = 'icons/obj/food.dmi'
	icon_state = "chaoscake_layer-1"
*/

/obj/item/chaoscake_layer
	name = "A layer of cake"
	desc = "a layer of cake, it is made out of colourful cream."
	icon = 'icons/obj/food.dmi'
	icon_state = "chaoscake_layer-2"
	var/layer_stage = 1

/obj/item/chaoscake_layer/three
	desc = "a layer of cake, glazed in purple."
	icon_state = "chaoscake_layer-3"
	layer_stage = 2

/obj/item/chaoscake_layer/four
	desc = "a layer of cake, reminding you of a colouring book."
	icon_state = "chaoscake_layer-4"
	layer_stage = 3

/obj/item/chaoscake_layer/five
	desc = "A layer of cake, smells like copper."
	icon_state = "chaoscake_layer-5"
	layer_stage = 4

/obj/item/chaoscake_layer/six
	desc = "A layer of cake, featuring colourful sprinkles."
	icon_state = "chaoscake_layer-6"
	layer_stage = 5

/obj/item/chaoscake_layer/seven
	desc = "A triplet of evil cake parts."
	icon_state = "chaoscake_layer-7"
	layer_stage = 6

/obj/item/chaoscake_layer/eight
	desc = "A triplet of good cake parts."
	icon_state = "chaoscake_layer-8"
	layer_stage = 7

/obj/item/chaoscake_layer/nine
	name = "A coin of balance"
	desc = "A very peculiar coin, it seems to stabilise the air around it."
	icon_state = "chaoscake_layer-9"
	layer_stage = 8

/obj/structure/chaoscake/proc/HasSliceMissing()
	if(slices < maxslices)
		if(interval >= regentime)
			interval = 0
			slices++
			HasSliceMissing()
		else
			interval++
			HasSliceMissing()
	else
		return

/obj/item/reagent_containers/food/snacks/chaoscakeslice
	name = "The Chaos Cake Slice"
	desc = "A slice from The Chaos Cake, it pulses weirdly, as if angry to be seperated from the whole"
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_slice-1"

	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 10 //CHOMPEdit
	nutriment_desc = list()
	nutriment_amt = 4
	volume = 80

/obj/item/reagent_containers/food/snacks/chaoscakeslice/Initialize(mapload)
	. = ..()
	var/i = rand(1,6)
	icon_state = "chaoscake_slice-[i]"
	switch(i)
		if(1)
			name = "Slice Of Evil" //Pretty damn poisonous, takes a lot of work to make safe for consumption, useful for medical.
			desc = "An odd slice, despite the grease and cherries oozing off the top, it smells delicious."
			nutriment_desc = list("The desire to consume" = 10) // You won't even taste the poison.
			reagents.add_reagent(REAGENT_ID_NEUROTOXIC_PROTEIN, 2)
			reagents.add_reagent(REAGENT_ID_SHOCKCHEM, 2)
			reagents.add_reagent(REAGENT_ID_AMATOXIN, 2)
			reagents.add_reagent(REAGENT_ID_CARPOTOXIN, 2)
			reagents.add_reagent(REAGENT_ID_SPIDERTOXIN, 2)
			bitesize = 7
		if(2)
			name = "Slice Of Evil" //A bad trip
			desc = "A mysterious slice, coated in purple frosting that smells like grapes."
			nutriment_desc = list("The desire to show off an party" = 10)
			reagents.add_reagent(REAGENT_ID_STOXIN, 2)
			reagents.add_reagent(REAGENT_ID_BLISS, 10)
			reagents.add_reagent(REAGENT_ID_SEROTROTIUM, 4)
			reagents.add_reagent(REAGENT_ID_CRYPTOBIOLIN, 8)
			reagents.add_reagent(REAGENT_ID_MINDBREAKER, 10)
			reagents.add_reagent(REAGENT_ID_PSILOCYBIN, 10)
			bitesize = 30 //even a single bite won't make you escape fate.
		if(3)
			name = "Slice Of Evil" //acidic
			desc = "A menacing slice, smelling clearly of copper, blood clots float on top."
			nutriment_desc = list("Infernal Rage" = 10)
			reagents.add_reagent(REAGENT_ID_BLOOD, 20)
			reagents.add_reagent(REAGENT_ID_STOMACID, 10)
			reagents.add_reagent(REAGENT_ID_MUTAGEN, 4)
			reagents.add_reagent(REAGENT_ID_THIRTEENLOKO, 20)
			reagents.add_reagent(REAGENT_ID_HYPERZINE, 10)
			bitesize = 30
		if(4)
			name = "Slice Of Good" //anti-tox
			desc = "A colourful slice, smelling of pear and coated in delicious cream."
			nutriment_desc = list("Hapiness" = 10)
			reagents.add_reagent(REAGENT_ID_ANTITOXIN, 2)
			reagents.add_reagent(REAGENT_ID_TRICORDRAZINE, 2)
			bitesize = 3
		if(5)
			name = "Slice Of Good" //anti-oxy
			desc = "A light slice, it's pretty to look at and smells of vanilla."
			nutriment_desc = list("Freedom" = 10)
			reagents.add_reagent(REAGENT_ID_DEXALINP, 2)
			reagents.add_reagent(REAGENT_ID_TRICORDRAZINE, 2)
			bitesize = 3
		if(6)
			name = "Slice Of Good" //anti-burn/brute
			desc = "A hearty slice, it smells of chocolate and strawberries."
			nutriment_desc = list("Love" = 10)
			reagents.add_reagent(REAGENT_ID_BICARIDINE, 2)
			reagents.add_reagent(REAGENT_ID_TRICORDRAZINE, 2)
			reagents.add_reagent(REAGENT_ID_KELOTANE, 2)
			bitesize = 4

/obj/structure/chaoscake/attackby(var/obj/item/W, var/mob/living/user)
	if(istype(W,/obj/item/material/knife))
		if(edible == 1)
			HasSliceMissing()
			if(slices <= 0)
				user << "The cake hums away quietly as the chaos powered goodness slowly recovers the large amount of lost mass, best to give it a moment before cutting another slice."
				return
			else
				user << "You cut a slice of the cake. The slice looks like the cake was just baked, and you can see before your eyes as the spot where you cut the slice slowly regenerates!"
				slices = slices - 1
				icon_state = "chaoscake-[slices]"
				new /obj/item/reagent_containers/food/snacks/chaoscakeslice(src.loc)

		else
			to_chat(user, span_notice("It looks so good... But it feels so wrong to eat it before it's finished..."))
			return
	if(istype(W,/obj/item/chaoscake_layer))
		var/obj/item/chaoscake_layer/C = W
		if(C.layer_stage == 8)
			user << "Finally! The coin on the top, the almighty chaos cake is complete!"
			qdel(W)
			stage++
			desc = desclist2[stage]
			icon_state = "chaoscake-6"
			edible = 1
			name = "The Chaos Cake!"
		else if(stage == maxstages)
			user << "The cake is already done!"
		else if(stage == C.layer_stage)
			user << "You add another layer to the cake, nice."
			qdel(W)
			stage++
			desc = desclist2[stage]
			icon_state = "chaoscake_stage-[stage]"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"



// The One Pizza

/obj/structure/theonepizza
	name = "The One Pizza"
	desc = "...it's real."

	icon = 'icons/obj/food64x64.dmi'
	icon_state = "theonepizza"
	pixel_x = -16
	pixel_y = -16

	var/slicetime = 15 SECONDS

	var/slicelist = list(/obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita/bigslice,
							/obj/item/reagent_containers/food/snacks/sliceable/pizza/pineapple/bigslice,
							/obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza/bigslice,
							/obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza/bigslice,
							/obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza/bigslice)

/obj/structure/theonepizza/attackby(var/obj/item/W, var/mob/living/user)
	if(istype(W,/obj/item/material/knife))
		user.visible_message(span_bold("\The [user]") + " starts to slowly cut through The One Pizza.", span_notice("You start to slowly cut through The One Pizza."))
		if(do_after(user, slicetime, exclusive = TASK_USER_EXCLUSIVE))
			if(!src)
				return		// We got disappeared already
			user.visible_message(span_infoplain(span_bold("\The [user]") + " successfully cuts The One Pizza."), span_notice("You successfully cut The One Pizza."))
			for(var/slicetype in slicelist)
				new slicetype(src.loc)
			qdel(src)

/obj/item/reagent_containers/food/snacks/sliceable/pizza/margherita/bigslice
	name = "Giant Margherita slice"
	desc = "Big enough to be a sign at a pizzeria."
	icon_state = "big_cheese_slice"

/obj/item/reagent_containers/food/snacks/sliceable/pizza/pineapple/bigslice
	name = "Giant ham & pineapple pizza slice"
	desc = "This thing probably constitutes an italian warcrime."
	icon_state = "big_pineapple_slice"

/obj/item/reagent_containers/food/snacks/sliceable/pizza/meatpizza/bigslice
	name = "Giant meatpizza slice"
	desc = "A Meat Feast fit for a king."
	icon_state = "big_meat_slice"

/obj/item/reagent_containers/food/snacks/sliceable/pizza/mushroompizza/bigslice
	name = "Giant mushroompizza slice"
	desc = "Practically a honey mushroom at this scale."
	icon_state = "big_mushroom_slice"

/obj/item/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza/bigslice
	name = "Giant vegetable pizza slice"
	desc = "So healthy it'll give you a heart attack."
	icon_state = "big_veggie_slice"

/datum/recipe/theonepizza
	fruit = list(PLANT_TOMATO = 5, PLANT_MUSHROOMS = 5, PLANT_EGGPLANT = 1, PLANT_CARROT = 1, PLANT_CORN = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/pineapple_ring,
		/obj/item/reagent_containers/food/snacks/pineapple_ring
	)
	result = /obj/structure/theonepizza
