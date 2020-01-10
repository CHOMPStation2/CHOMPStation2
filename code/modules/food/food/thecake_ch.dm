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