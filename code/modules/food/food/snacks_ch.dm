	//Imported food from old code
/obj/item/reagent_containers/food/snacks/sauerkraut
	name = "Sauerkraut"
	desc = "What happens when you mix salt and minced cabbage and forget it on a shelf."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "sauerkraut"
	trash = /obj/item/trash/snack_bowl
	nutriment_amt = 3
	nutriment_desc = list("sour cabbage" = 3)

/obj/item/reagent_containers/food/snacks/sauerkraut/Initialize(mapload)
	. = ..()
	bitesize = 3

/obj/item/reagent_containers/food/snacks/tamales
	name = "Tamales"
	desc = "Hot, steamy, moist meat bread wrapped in a corn leaf to retain moisture and flavor."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "tamales"
	trash = /obj/item/trash/plate
	nutriment_amt = 9
	nutriment_desc = list("doughy bread" = 5, "beefy" = 4, "tangy and savory vegetables" = 3)

/obj/item/reagent_containers/food/snacks/tamales/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 5)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/bigos
	name = "Bigos"
	desc = "What happens when you put minced sour cabbage and whats left in the fridge in a pot, start slowcooking it and then forget it for three hours."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "bigos"
	trash = /obj/item/trash/snack_bowl
	nutriment_amt = 6
	nutriment_desc = list("sour cabbage" = 4, "sausage" = 3, "mildly sweet vegetables" = 3)

/obj/item/reagent_containers/food/snacks/bigos/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 4)
	reagents.add_reagent(REAGENT_ID_WATER, 3)
	bitesize = 7

/obj/item/reagent_containers/food/snacks/concha
	name = "concha"
	desc = "A sweet bread roll baked with a strawberry topping thats crunchy and delicious, it kinda looks like a shell."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "concha"
	nutriment_amt = 5
	nutriment_desc = list("sweet bread" = 3, "strawberry" = 2)

/obj/item/reagent_containers/food/snacks/concha/Initialize(mapload)
	. = ..()
	bitesize = 3

/obj/item/reagent_containers/food/snacks/pandenata
	name = "Pan de nata"
	desc = "A large spongy and soft biscuits that taste creamy and sweet, a treat like this would be perfect on a lazy day."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "pandenata"
	trash = /obj/item/trash/plate
	nutriment_amt = 5
	nutriment_desc = list("creamy" = 3, "sweet bread" = 3)

/obj/item/reagent_containers/food/snacks/pandenata/Initialize(mapload)
	. = ..()
	bitesize = 3

/obj/item/reagent_containers/food/snacks/tocino
	name = "Tocino"
	desc = "A form of bacon made from cuts of pork that has cured in wine, sugar and salt, best served on a hot skillet so it remains hot and tasty til the last bite."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "tocino"
	trash = /obj/item/trash/plate
	nutriment_amt = 8
	nutriment_desc = list("crispy sweet meat" = 3, "savory sauce" = 2, "salty" = 2)

/obj/item/reagent_containers/food/snacks/tocino/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 5)
	bitesize = 5

/obj/item/reagent_containers/food/snacks/garlicbread
	name = "Garlic bread"
	desc = "Two slices of bread cooked with garlic, cheese and herbs on top to make a delicious sidedish."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "garlicbread"
	nutriment_amt = 5
	nutriment_desc = list("onions and melted cheese" = 2, "bread and seasonings" = 2)

/obj/item/reagent_containers/food/snacks/garlicbread/Initialize(mapload)
	. = ..()
	bitesize = 4

/obj/item/reagent_containers/food/snacks/plumpburger
	name = "Plump Burger"
	desc = "Did they switch a meat patty with a plump mushroom on this burger?, lets hope it's as tasty as a normal burger"
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "plumpburger"
	nutriment_amt = 5
	nutriment_desc = list("crispy sweet mushroom" = 3, "earthy" = 2, "salty" = 2)

/obj/item/reagent_containers/food/snacks/plumpburger/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 5)
	bitesize = 5



/obj/item/reagent_containers/food/snacks/slice/bigbeanburrito
	name = "Big Bean Burrito"
	desc = "The BBB. An engorged burrito filled to the brim of what makes Mexico. Beans, cheese and meat that ooze by how stuffed it is"
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "bigbeanburrito"
	nutriment_amt = 15
	nutriment_desc = list("tortilla" = 2, "meat" = 3, "bean" = 5, REAGENT_ID_CHEESE = 3, "Mexico" = 7)

/obj/item/reagent_containers/food/snacks/slice/bigbeanburrito/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 12)
	reagents.add_reagent(REAGENT_ID_NUTRIMENT, 15)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/sliceable/supremoburrito
	name = "Supremo burrito"
	desc = "The one and only burrito that can rule them all. This monster of a burrito is large enough to hide someone inside, unless it already has someone inside."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "supremoburrito"
	slice_path = /obj/item/reagent_containers/food/snacks/slice/bigbeanburrito/filled
	slices_num = 5
	nutriment_desc = list("tortilla" = 2, "meat" = 4, "bean" = 7, REAGENT_ID_CHEESE = 4, PLANT_CHILI = 1, "Mexico" = 7)
	nutriment_amt = 50


/obj/item/reagent_containers/food/snacks/sliceable/supremoburrito/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 50)
	reagents.add_reagent(REAGENT_ID_NUTRIMENT, 55)
	reagents.add_reagent(REAGENT_ID_CAPSAICIN, 3)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/slice/bigbeanburrito
	name = "Big Bean Burrito"
	desc = "The BBB. An engorged burrito filled to the brim of what makes Mexico. Beans, cheese and meat that ooze by how stuffed it is"
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "bigbeanburrito"
	bitesize = 3
	whole_path = /obj/item/reagent_containers/food/snacks/slice/bigbeanburrito

/obj/item/reagent_containers/food/snacks/slice/bigbeanburrito/filled
	filled = TRUE

/obj/item/reagent_containers/food/snacks/steamtealeaf
	name = "Steamed tea leaf"
	desc = "A freshly picked tea leaf steamed to inhibit oxidation. Needs rolling."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "tealeafsteam"
	nutriment_amt = 0
	nutriment_desc = list(REAGENT_ID_NOTHING = 1)

/obj/item/reagent_containers/food/snacks/steamtealeaf/Initialize(mapload)
	. = ..()
	bitesize = 1

/obj/item/reagent_containers/food/snacks/steamtealeaf/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/material/kitchen/rollingpin))
		new /obj/item/reagent_containers/food/snacks/steamrolltealeaf(src)
		user << "You roll the steamed tea leaf."
		qdel(src)

/obj/item/reagent_containers/food/snacks/steamrolltealeaf
	name = "Rolled steamed tea leaf"
	desc = "A steamed tea leaf ready for drying."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "tealeafsteamroll"
	nutriment_amt = 0
	nutriment_desc = list(REAGENT_ID_NOTHING = 1)

/obj/item/reagent_containers/food/snacks/steamrolltealeaf/Initialize(mapload)
	. = ..()
	bitesize = 1

/obj/item/reagent_containers/food/snacks/greentealeaf
	name = "Green tea leaf"
	desc = "Green tea! Just grind and mix with hot water."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "greentealeaf"
	nutriment_amt = 0
	nutriment_desc = list(REAGENT_ID_NOTHING = 1)

/obj/item/reagent_containers/food/snacks/greentealeaf/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_TEALEAVESGREEN, 6)
	bitesize = 1

/obj/item/reagent_containers/food/snacks/butterscotch
	name = "Butterscotch"
	desc = "A sweet, golden-brown liquid, usually used as part of confectionary. Just a spoonful wouldn't hurt, right?"
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "butterscotch" //Sprite by Dinnel
	trash = /obj/item/trash/snack_bowl
	nutriment_amt = 1
	nutriment_desc = list("sickly sweet deliciousness" = 1)

/obj/item/reagent_containers/food/snacks/butterscotch/Initialize(mapload)
	. = ..()
	bitesize = 1

/obj/item/reagent_containers/food/snacks/slicable/buttspie
	name = "Butterscotch-Cinnamon Pie"
	desc = "A delightfully caramel-coloured filling in a crispy pie base."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "butts_pie" //Sprite by Dinnel
	slice_path = /obj/item/reagent_containers/food/snacks/slice/buttspie
	slices_num = 6
	nutriment_amt = 12
	nutriment_desc = list("a warm, buttery sweetness that reminds you of home" = 5)
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 9 //CHOMPEdit

/obj/item/reagent_containers/food/snacks/slicable/buttspie/Initialize(mapload)
	. = ..()
	bitesize = 2

/obj/item/reagent_containers/food/snacks/slice/buttspie
	name = "Slice of Butterscotch-Cinnamon Pie"
	desc = "A slice of pie, filled with delightfully caramel-coloured filling."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "butts_pie_slice" //Sprite by Dinnel
	trash = /obj/item/trash/plate
	whole_path = /obj/item/reagent_containers/food/snacks/slicable/buttspie

/obj/item/reagent_containers/food/snacks/slice/buttspie/Initialize(mapload)
	. = ..()
	bitesize = 2

/obj/item/reagent_containers/food/snacks/spicy_boys //These are off-brand red hots/atomic fireballs
	name = "Spicy Boys"
	desc = "Spicy little candy rounds for very naughty individuals."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "spicy_boys" //Sprite by Dinnel
	nutriment_amt = 2
	nutriment_desc = list("sweet cinnamon candy" = 2)

/obj/item/reagent_containers/food/snacks/cinnamonroll
	name = "cinnamon roll"
	desc = "A precious little cinnamon roll, just begging to be eaten."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "cinnamon_roll" //Sprite by Dinnel
	nutriment_amt = 2
	nutriment_desc = list("a sweetness worth protecting" = 2)

/obj/item/reagent_containers/food/snacks/welders_original
	name = "Welder's Original"
	desc = "A golden, oblong sweet commonly eaten by both engineers and the elderly."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "welders_original" //Sprite by Dinnel
	nutriment_amt = 2
	nutriment_desc = list("smooth, creamy butterscotch and caramel" = 2)

//GRANNY CREAM'S HOT BUTTER ICE CREAM
/obj/item/reagent_containers/food/snacks/hotbuttericecream
	name = "Hot Butter Ice Cream"
	desc = "A bowl of ice cream and hot butter mixed together into an ominous, frothy concoction."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "hotbuttericecream" //Sprite by Dinnel
	trash = /obj/item/trash/snack_bowl
	nutriment_amt = 4
	nutriment_desc = list ("hot butter" = 2, "ice cream" = 2)

//So what if like yknow, you buy a bread tube and wow you actually get to test the new and improved producct.
/obj/item/reagent_containers/food/snacks/tastybread/sequel
	name = "bread tube 2"
	desc = "Bread in a tube. Chewy...and surprisingly tasty. Now with twice the bread to tube!"
	filling_color = "#75491c"
	nutriment_amt = 12
	nutriment_desc = list("bread" = 4, "sweetness" = 6)

/obj/item/reagent_containers/food/snacks/tastybread/Initialize(mapload)
	. = ..()
	if(prob(1))
		new /obj/item/reagent_containers/food/snacks/tastybread/sequel(src)
		return INITIALIZE_HINT_QDEL

/obj/item/reagent_containers/food/snacks/tastybread/sequel/Initialize(mapload)
	. = ..()
	bitesize = 4

/obj/item/reagent_containers/food/snacks/sliceable/blondies
	name = "blondies"
	gender = PLURAL
	desc = "Like a brownie, but instead of chocolate it's vanilla. Dogs love it!"
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "blondies"
	slice_path = /obj/item/reagent_containers/food/snacks/blondiesslice
	slices_num = 4
	trash = /obj/item/trash/brownies
	filling_color = "#E39C29"
	nutriment_amt = 8
	nutriment_desc = list(REAGENT_ID_VANILLA = 8)
	center_of_mass_x = 15 //CHOMPEdit
	center_of_mass_y= 9 //CHOMPEdit
	bitesize = 2

/obj/item/reagent_containers/food/snacks/sliceable/blondies/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 2)

/obj/item/reagent_containers/food/snacks/blondiesslice
	name = "blondie"
	desc = "a dense, decadent vanilla blondie."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "blondiesslice"
	trash = /obj/item/trash/plate
	filling_color = "#F5B951"
	bitesize = 2
	nutriment_desc = list(REAGENT_ID_VANILLA = 1)
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 12 //CHOMPEdit

/obj/item/reagent_containers/food/snacks/blondiesslice/filled
	nutriment_amt = 1

/obj/item/reagent_containers/food/snacks/blondiesslice/filled/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 1)

/obj/item/reagent_containers/food/snacks/churro
	name = "churro"
	desc = "Dough, deep fried in olive oil. No toppings on it!"
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "churro"
	trash = /obj/item/paper/crumpled
	filling_color = "#F5B951"
	bitesize = 2
	nutriment_desc = list("deep fried dough" = 2)
	nutriment_amt = 2

/obj/item/reagent_containers/food/snacks/churro/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_COOKINGOIL, 1)
