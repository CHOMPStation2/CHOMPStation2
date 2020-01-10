//The collection of everything 'cake' related
// adjust recipes, make ingredients mobs

/datum/recipe/thecake_firstlayer
	reagents = list("flour" = 500,"milk" = 200, "sugar" = 200, "egg" = 100)
	fruit = list("icechili" = 30, "plastellium" =  15)
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

		/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat,
		/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat,
		/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat,
		/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat,
		/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat
		)
	result = /obj/structure/thecake

/datum/recipe/thecake_secondlayer
	reagents = list("flour" = 400, "milk" = 200, "sugar" = 100, "cryoxadone" = 200, "frostoil" = 100)
	fruit = list("vanilla" =  30, "icelettuce" = 15)
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
	result = /obj/item/weapon/thecake_layertwo

/datum/recipe/thecake_thirdlayer
	reagents = list("flour" = 300, "singulo" = 300, "atomicbomb" = 150, "threemileisland" = 150, "manhattan_proj" = 100)
	fruit = list("glowberries" = 30, "glowshrooms" =  15)
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

		/obj/item/weapon/reagent_containers/food/snacks/carpmeat,
		/obj/item/weapon/reagent_containers/food/snacks/carpmeat,
		/obj/item/weapon/reagent_containers/food/snacks/carpmeat,
		/obj/item/weapon/reagent_containers/food/snacks/carpmeat,
		/obj/item/weapon/reagent_containers/food/snacks/carpmeat
		)
	result = /obj/item/weapon/thecake_layerthree

/datum/recipe/thecake_fourthlayer
	reagents = list("flour" = 400, "holymary" = 100, "angelskiss" = 100, "goldschlager" = 100, "gold" = 300)
	fruit = list("ambrosiadeus" = 30, "goldapple" =  15)
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

		/obj/item/weapon/reagent_containers/food/snacks/appletart,
		/obj/item/weapon/reagent_containers/food/snacks/appletart,
		/obj/item/weapon/reagent_containers/food/snacks/appletart,
		/obj/item/weapon/reagent_containers/food/snacks/appletart,
		/obj/item/weapon/reagent_containers/food/snacks/appletart
		)
	result = /obj/item/weapon/thecake_layerfour

/datum/recipe/thecake_fifthlayer
	reagents = list("deathbell" = 1000)
	fruit = list("libertycap" = 10, "deathnettle" =  10, "destroyingangel" = 10)
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

		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat
		)
	result = /obj/item/weapon/thecake_layerfive

/obj/structure/thecake
	name = "An unfinished cake"
	desc = "A single layer of tasty delicious cake goodness, but it feels very incomplete..."

	icon = 'icons/obj/64x64.dmi'
	icon_state = "thecake_onelayer"
	pixel_x = -16

	var/edible = 0
	var/stage = 1
	var/slices = 5
	var/maxslices = 5

	var/regentime = 2000
	var/interval = 0

/obj/structure/thecake/proc/HasSliceMissing()
	..()
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

/obj/item/weapon/thecake_layertwo
	name = "A layer of cake"
	desc = "a layer of cake, you can see your own reflection in it."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "thecake_layertwo"

/obj/item/weapon/thecake_layerthree
	desc = "a layer of cake, it bathes you in a soft green glowth and warmth."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "thecake_layerthree"

/obj/item/weapon/thecake_layerfour
	name = "A layer of cake"
	desc = "a layer of cake, its of so high karat that even the lightest touch leaves a dent in it."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "thecake_layerfour"

/obj/item/weapon/thecake_layerfive
	name = "A layer of cake"
	desc = "a layer of cake, whatever this strange metal thats used in it is, it seems to drawn in light and reflect it back in a different shade."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "thecake_layerfive"

/obj/item/weapon/thecake_singulocherry
	name = "A stable singularity cherry"
	desc = "It's a tiny singularity, but it doesnt draw in everything around it, touching it feels strange, like your touching nothingness...That feels at the same time like touching a cherry."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "singulocherry"

/obj/item/weapon/reagent_containers/food/snacks/thecakeslice
	name = "The Infinity Cake Slice"
	desc = "A slice from The Infinity Cake, sadly the slice itself isnt infinite..."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "thecakeslice"

	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "singularity?" = 1)
	nutriment_amt = 5
	//Add some randomized effect possibly, to make the slices special - Jack


/obj/structure/thecake/attackby(var/obj/item/weapon/W, var/mob/living/user)
	if(istype(W,/obj/item/weapon/material/knife))
		if(edible == 1)
			HasSliceMissing()
			if(slices <= 0)
				user << "The cake hums away quietly as the singulo powered goodness slowly recovers the large amount of lost mass, best to give it a moment before cutting another slice."
				return
			else
				user << "You cut a slice of the cake. The slice looks like the cake was just baked, and you can see before your eyes as the spot where you cut the slice slowly regenerates!"
				slices = slices - 1
				new /obj/item/weapon/reagent_containers/food/snacks/thecakeslice(src.loc)

		else
			to_chat(user, "<span class='notice'>It looks so good... But it feels so wrong to eat it before it's finished...</span>")
			return
	if(istype(W,/obj/item/weapon/thecake_layertwo))
		if(stage == 1)
			user << "You add a second layer to the cake, nice."
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "thecake_twolayers"
			stage = 2
		else if(stage == 6)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/thecake_layerthree))
		if(stage == 2)
			user << "You add a third layer to the cake, sweet~"
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "thecake_threelayers"
			stage = 3
		else if(stage == 6)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/thecake_layerfour))
		if(stage == 3)
			user << "You add a fourth layer to the cake, it's almost done!"
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "thecake_fourlayers"
			stage = 4
		else if(stage == 6)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/thecake_layerfive))
		if(stage == 4)
			user << "You add a fifth layer to the cake, it's finished!"
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "thecake_fivelayers"
			stage = 5
			spawn(5 SECONDS)
				user << "...But it feels like...It's missing something?"
		else if(stage == 6)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/thecake_singulocherry))
		if(stage == 5)
			user << "Finally! The cherry on the top, the almighty infinity cake is complete!"
			qdel(W)
			name = "The Infinity Cake!"
			desc = "its The Infinity Cake! This huge imposing cake made by immense efforts and resources stands tall in you, radiating a menacing aura of frosty goodness and diabetes for those not wary of it's infinite might!"
			icon_state = "thecake_finished"
			stage = 6
			edible = 1
			//Maybe fireworks going off? Confetti spawn? - Jack
		else if(stage == 6)
			user << "The cake is already done!"
		else
			user << "I don't think this goes on the cake...At least not yet?"

// Chaos cake

/datum/recipe/chaoscake_layerone
	reagents = list("flour" = 500,"milk" = 200, "sugar" = 200, "egg" = 100)
	fruit = list("icechili" = 30, "plastellium" =  15)
	items = list(
		/obj/item/stack/material/silver,
		/obj/item/stack/material/silver,
		/obj/item/stack/material/silver,
		/obj/item/stack/material/silver,

		/obj/item/slime_extract/grey,
		/obj/item/slime_extract/grey,
		/obj/item/slime_extract/grey,
		/obj/item/slime_extract/grey,

		/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat,
		/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat,
		/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat,
		/obj/item/weapon/reagent_containers/food/snacks/meat/grubmeat
		)
	result = /obj/structure/chaoscake

/datum/recipe/chaoscake_layertwo
	reagents = list("flour" = 400, "milk" = 200, "sugar" = 100, "cryoxadone" = 200, "frostoil" = 100)
	fruit = list("vanilla" =  30, "icelettuce" = 15)
	items = list(
		/obj/item/stack/material/glass/phoronglass,
		/obj/item/stack/material/glass/phoronglass,
		/obj/item/stack/material/glass/phoronglass,
		/obj/item/stack/material/glass/phoronglass,

		/obj/item/organ/internal/eyes,
		/obj/item/organ/internal/eyes,
		/obj/item/organ/internal/eyes,
		/obj/item/organ/internal/eyes,

		/obj/item/stack/material/diamond,
		/obj/item/stack/material/diamond,
		/obj/item/stack/material/diamond,
		/obj/item/stack/material/diamond
		)
	result = /obj/item/weapon/chaoscake_layertwo

/datum/recipe/chaoscake_layerthree
	reagents = list("flour" = 300, "singulo" = 300, "atomicbomb" = 150, "threemileisland" = 150, "manhattan_proj" = 100)
	fruit = list("glowberries" = 30, "glowshrooms" =  15)
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

		/obj/item/weapon/reagent_containers/food/snacks/carpmeat,
		/obj/item/weapon/reagent_containers/food/snacks/carpmeat,
		/obj/item/weapon/reagent_containers/food/snacks/carpmeat,
		/obj/item/weapon/reagent_containers/food/snacks/carpmeat
		)
	result = /obj/item/weapon/chaoscake_layerthree

/datum/recipe/chaoscake_layerfour
	reagents = list("flour" = 400, "holymary" = 100, "angelskiss" = 100, "goldschlager" = 100, "gold" = 300)
	fruit = list("ambrosiadeus" = 30, "goldapple" =  15)
	items = list(
		/obj/item/stack/material/gold,
		/obj/item/stack/material/gold,
		/obj/item/stack/material/gold,
		/obj/item/stack/material/gold,

		/obj/item/organ/internal/heart,
		/obj/item/organ/internal/heart,
		/obj/item/organ/internal/heart,
		/obj/item/organ/internal/heart,

		/obj/item/weapon/reagent_containers/food/snacks/appletart,
		/obj/item/weapon/reagent_containers/food/snacks/appletart,
		/obj/item/weapon/reagent_containers/food/snacks/appletart,
		/obj/item/weapon/reagent_containers/food/snacks/appletart
		)
	result = /obj/item/weapon/chaoscake_layerfour

/datum/recipe/chaoscake_layerfive
	reagents = list("deathbell" = 1000)
	fruit = list("libertycap" = 10, "deathnettle" =  10, "destroyingangel" = 10)
	items = list(
		/obj/item/stack/material/platinum,
		/obj/item/stack/material/platinum,
		/obj/item/stack/material/platinum,
		/obj/item/stack/material/platinum,

		/obj/item/slime_extract/emerald,
		/obj/item/slime_extract/emerald,
		/obj/item/slime_extract/emerald,
		/obj/item/slime_extract/emerald,

		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat
		)
	result = /obj/item/weapon/chaoscake_layerfive

/datum/recipe/chaoscake_layersix
	reagents = list()
	fruit = list("potato" = 5)
	items = list()
	result = /obj/item/weapon/chaoscake_layersix

/datum/recipe/chaoscake_layerseven
	reagents = list()
	fruit = list("tomato" = 5)
	items = list()
	result = /obj/item/weapon/chaoscake_layerseven

/datum/recipe/chaoscake_layereight
	reagents = list()
	fruit = list("cabbage" = 5)
	items = list()
	result = /obj/item/weapon/chaoscake_layereight

/datum/recipe/chaoscake_layernine
	reagents = list()
	fruit = list("mushroom" = 5)
	items = list()
	result = /obj/item/weapon/chaoscake_layernine

/obj/structure/chaoscake
	name = "An unfinished cake"
	desc = "A single layer of tasty delicious cake goodness, but it feels very incomplete..."

	icon = 'icons/obj/64x64.dmi'
	icon_state = "chaoscake_unfinished-1"
	pixel_x = -16

	var/edible = 0
	var/stage = 1
	var/slices = 6
	var/maxslices = 6

	var/regentime = 2000
	var/interval = 0

/obj/structure/chaoscake/proc/HasSliceMissing()
	..()
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

/*
/obj/item/weapon/chaoscake_layerone
	name = "A layer of cake"
	desc = "a layer of cake, you can see the cherry paste ooze."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_layer-1"
*/

/obj/item/weapon/chaoscake_layertwo
	desc = "a layer of cake, it is made out of colourful cream."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_layer-2"

/obj/item/weapon/chaoscake_layerthree
	name = "A layer of cake"
	desc = "a layer of cake, glazed in purple."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_layer-3"

/obj/item/weapon/chaoscake_layerfour
	name = "A layer of cake"
	desc = "a layer of cake, reminding you of a colouring book."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_layer-4"

/obj/item/weapon/chaoscake_layerfive
	name = "A layer of cake"
	desc = "A layer of cake, smells like blood."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_layer-5"

/obj/item/weapon/chaoscake_layersix
	name = "A layer of cake"
	desc = "A layer of cake, featuring colourful sprinkles."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_layer-6"

/obj/item/weapon/chaoscake_layerseven
	name = "A layer of cake"
	desc = "A triplet of evil cake parts."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_layer-7"

/obj/item/weapon/chaoscake_layereight
	name = "A layer of cake"
	desc = "A triplet of good cake parts."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_layer-8"

/obj/item/weapon/chaoscake_layernine
	name = "A coin of balance"
	desc = "A very peculiar coin, it seems to stabilise the air around it."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_layer-9"

/obj/item/weapon/reagent_containers/food/snacks/chaoscakeslice
	name = "The Chaos Cake Slice"
	desc = "A slice from The Chaos Cake, it pulses weirdly, as if angry to be seperated from the whole"
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "chaoscake_slice-1"

	center_of_mass = list("x"=16, "y"=10)
	nutriment_desc = list("cake" = 10, "sweetness" = 10, "order and entrophy?" = 1)
	nutriment_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/chaoscakeslice/Initialize()
	var/i = rand(1,6)
	icon_state = "chaoscake_slice-[i]"

/obj/structure/chaoscake/attackby(var/obj/item/weapon/W, var/mob/living/user)
	if(istype(W,/obj/item/weapon/material/knife))
		if(edible == 1)
			HasSliceMissing()
			if(slices <= 0)
				user << "The cake hums away quietly as the chaos powered goodness slowly recovers the large amount of lost mass, best to give it a moment before cutting another slice."
				return
			else
				user << "You cut a slice of the cake. The slice looks like the cake was just baked, and you can see before your eyes as the spot where you cut the slice slowly regenerates!"
				slices = slices - 1
				icon_state = "chaoscake-[slices]"
				new /obj/item/weapon/reagent_containers/food/snacks/chaoscakeslice(src.loc)

		else
			to_chat(user, "<span class='notice'>It looks so good... But it feels so wrong to eat it before it's finished...</span>")
			return
	if(istype(W,/obj/item/weapon/chaoscake_layertwo))
		if(stage == 1)
			user << "You add a second layer to the cake, nice."
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "chaoscake_unfinished-2"
			stage = 2
		else if(stage == 9)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/chaoscake_layerthree))
		if(stage == 2)
			user << "You add a third layer to the cake, sweet~"
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "chaoscake_unfinished-3"
			stage = 3
		else if(stage == 9)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/chaoscake_layerfour))
		if(stage == 3)
			user << "You add a fourth layer to the cake, it's almost done!"
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "chaoscake_unfinished-4"
			stage = 4
		else if(stage == 9)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/chaoscake_layerfive))
		if(stage == 4)
			user << "You add a fifth layer to the cake, it's finished!"
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "chaoscake_unfinished-5"
			stage = 5
			spawn(5 SECONDS)
				user << "...But it feels like...It's missing something?"
		else if(stage == 9)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/chaoscake_layersix))
		if(stage == 5)
			user << "You add a fifth layer to the cake, it's finished!"
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "chaoscake_unfinished-6"
			stage = 6
			spawn(5 SECONDS)
				user << "...But it feels like...It's missing something?"
		else if(stage == 9)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/chaoscake_layerseven))
		if(stage == 6)
			user << "You add a fifth layer to the cake, it's finished!"
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "chaoscake_unfinished-7"
			stage = 7
			spawn(5 SECONDS)
				user << "...But it feels like...It's missing something?"
		else if(stage == 9)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/chaoscake_layereight))
		if(stage == 7)
			user << "You add a fifth layer to the cake, it's finished!"
			qdel(W)
			desc = "Two layer of tasty delicious cake goodness, but it feels pretty incomplete..."
			icon_state = "chaoscake_unfinished-8"
			stage = 8
			spawn(5 SECONDS)
				user << "...But it feels like...It's missing something?"
		else if(stage == 9)
			user << "The cake is already done!"
		else
			user << "Hmm, doesnt seem like this layer is supposed to be added there?"
	if(istype(W,/obj/item/weapon/chaoscake_layernine))
		if(stage == 8)
			user << "Finally! The coin on the top, the almighty chaos cake is complete!"
			qdel(W)
			name = "The Chaos Cake!"
			desc = "its The Chaos Cake! This odd cake seems to be a careful balance between good and evil, order and entrophy. Take care not to destroy the equilibrium!"
			icon_state = "chaoscake-1"
			stage = 9
			edible = 1
		else if(stage == 9)
			user << "The cake is already done!"
		else
			user << "I don't think this goes on the cake...At least not yet?"
