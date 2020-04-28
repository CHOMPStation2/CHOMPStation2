	//Imported food from old code
/obj/item/weapon/reagent_containers/food/snacks/sauerkraut
	name = "Sauerkraut"
	desc = "What happens when you mix salt and minced cabbage and forget it on a shelf."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "sauerkraut"
	trash = /obj/item/trash/snack_bowl
	nutriment_amt = 3
	nutriment_desc = list("sour cabbage" = 3)

/obj/item/weapon/reagent_containers/food/snacks/sauerkraut/New()
	..()
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tamales
	name = "Tamales"
	desc = "Hot, steamy, moist meat bread wrapped in a corn leaf to retain moisture and flavor."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "tamales"
	trash = /obj/item/trash/plate
	nutriment_amt = 9
	nutriment_desc = list("doughy bread" = 5, "beefy" = 4, "tangy and savory vegetables" = 3)

/obj/item/weapon/reagent_containers/food/snacks/tamales/New()
	..()
	reagents.add_reagent("protein", 5)
	bitesize = 6

/obj/item/weapon/reagent_containers/food/snacks/bigos
	name = "Bigos"
	desc = "What happens when you put minced sour cabbage and whats left in the fridge in a pot, start slowcooking it and then forget it for three hours."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "bigos"
	trash = /obj/item/trash/snack_bowl
	nutriment_amt = 6
	nutriment_desc = list("sour cabbage" = 4, "sausage" = 3, "mildly sweet vegetables" = 3)

/obj/item/weapon/reagent_containers/food/snacks/bigos/New()
	..()
	reagents.add_reagent("protein", 4)
	reagents.add_reagent("water", 3)
	bitesize = 7

/obj/item/weapon/reagent_containers/food/snacks/concha
	name = "concha"
	desc = "A sweet bread roll baked with a strawberry topping thats crunchy and delicious, it kinda looks like a shell."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "concha"
	nutriment_amt = 5
	nutriment_desc = list("sweet bread" = 3, "strawberry" = 2)

/obj/item/weapon/reagent_containers/food/snacks/concha/New()
	..()
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/pandenata
	name = "Pan de nata"
	desc = "A large spongy and soft biscuits that taste creamy and sweet, a treat like this would be perfect on a lazy day."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "pandenata"
	trash = /obj/item/trash/plate
	nutriment_amt = 5
	nutriment_desc = list("creamy" = 3, "sweet bread" = 3)

/obj/item/weapon/reagent_containers/food/snacks/pandenata/New()
	..()
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tocino
	name = "Tocino"
	desc = "A form of bacon made from cuts of pork that has cured in wine, sugar and salt, best served on a hot skillet so it remains hot and tasty til the last bite."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "tocino"
	trash = /obj/item/trash/plate
	nutriment_amt = 8
	nutriment_desc = list("crispy sweet meat" = 3, "savory sauce" = 2, "salty" = 2)

/obj/item/weapon/reagent_containers/food/snacks/tocino/New()
	..()
	reagents.add_reagent("protein", 5)
	bitesize = 5

/obj/item/weapon/reagent_containers/food/snacks/garlicbread
	name = "Garlic bread"
	desc = "Two slices of bread cooked with garlic, cheese and herbs on top to make a delicious sidedish."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "garlicbread"
	nutriment_amt = 5
	nutriment_desc = list("onions and melted cheese" = 2, "bread and seasonings" = 2)

/obj/item/weapon/reagent_containers/food/snacks/garlicbread/New()
	..()
	bitesize = 4

<<<<<<< Updated upstream
/obj/item/weapon/reagent_containers/food/snacks/steamtealeaf
	name = "Steamed tea leaf"
	desc = "A freshly picked tea leaf steamed to inhibit oxidation. Needs rolling."
	icon = 'icons/obj/food.dmi'
	icon_state = "tealeafsteam"
	nutriment_amt = 0
	nutriment_desc = list("nothing" = 1)

/obj/item/weapon/reagent_containers/food/snacks/steamtealeaf/New()
	..()
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/steamtealeaf/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/material/kitchen/rollingpin))
		new /obj/item/weapon/reagent_containers/food/snacks/steamrolltealeaf(src)
		user << "You roll the steamed tea leaf."
		qdel(src)

/obj/item/weapon/reagent_containers/food/snacks/steamrolltealeaf
	name = "Rolled steamed tea leaf"
	desc = "A steamed tea leaf ready for drying."
	icon = 'icons/obj/food.dmi'
	icon_state = "tealeafsteamroll"
	nutriment_amt = 0
	nutriment_desc = list("nothing" = 1)

/obj/item/weapon/reagent_containers/food/snacks/steamrolltealeaf/New()
	..()
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/greentealeaf
	name = "Green tea leaf"
	desc = "Green tea! Just grind and mix with hot water."
	icon = 'icons/obj/food.dmi'
	icon_state = "greentealeaf"
	nutriment_amt = 0
	nutriment_desc = list("nothing" = 1)

/obj/item/weapon/reagent_containers/food/snacks/greentealeaf/New()
	..()
	reagents.add_reagent("tealeavesgreen", 6)
	bitesize = 1
=======
/obj/item/weapon/reagent_containers/food/snacks/sliceable/bigbeanburrito
	name = "Big Bean Burrito"
	desc = "The BBB. An engorged burrito filled to the brim of what makes Mexico. Beans, cheese and meat that ooze by how stuffed it is"
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "bigbeanburrito"
	nutriment_amt = 15
	nutriment_desc = list("tortilla" = 2, "meat" = 3, "bean" = 5, "cheese" = 3, "Mexico" = 7)

/obj/item/weapon/reagent_containers/food/snacks/bigbeanburrito/Initialize()
	. = ..()
	reagents.add_reagent("protein", 12)
	reagents.add_reagent("nutriment", 15)
	bitesize = 6

/obj/item/weapon/reagent_containers/food/snacks/sliceable/supremoburrito
	name = "Supremo burrito"
	desc = "The one and only burrito that can rule them all. This monster of a burrito is large enough to hide someone inside, unless it already has someone inside."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "supremoburrito"
	nutriment_amt = 75
	nutriment_desc = list("tortilla" = 2, "meat" = 4, "bean" = 7, "cheese" = 4, "chili" = 1, "Mexico" = 7)

/obj/item/weapon/reagent_containers/food/snacks/sliceable/supremoburrito/Initialize()
	. = ..()
	reagents.add_reagent("protein", 50)
	reagents.add_reagent("nutriment", 55)
	reagents.add_reagent("capsaicin", 3)
	bitesize = 15

/obj/item/weapon/reagent_containers/food/snacks/sliceable/meatbread/Initialize()
	. = ..()
	reagents.add_reagent("protein", 20)
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/slice/meatbread
	name = "meatbread slice"
	desc = "A slice of delicious meatbread."
	icon_state = "meatbreadslice"
	trash = /obj/item/trash/plate
	filling_color = "#FF7575"
	bitesize = 2
	center_of_mass = list("x"=16, "y"=16)
	whole_path = /obj/item/weapon/reagent_containers/food/snacks/sliceable/meatbread

/obj/item/weapon/reagent_containers/food/snacks/slice/meatbread/filled
	filled = TRUE
>>>>>>> Stashed changes
