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
	nutriment_amt = 9
	nutriment_desc = list("moist bread" = 5, "beefy" = 4, "tangy and savory vegetables" = 3)

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
	desc = "Large spongy and soft biscuits that taste creamy and sweet, a treat like this would be perfect on a lazy day."
	icon = 'icons/obj/food_ch.dmi'
	icon_state = "pandenata"
	nutriment_amt = 5
	nutriment_desc = list("sweet creamy bread" = 3)

/obj/item/weapon/reagent_containers/food/snacks/pandenata/New()
	..()
	bitesize = 4

/obj/item/weapon/reagent_containers/food/snacks/tocino
	name = "Tocino"
	desc = "A form of bacon made from cuts of pork that has cured in wine, sugar and salt for a while, best served on a hot skillet so remains warm and tasty til the last bite."
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