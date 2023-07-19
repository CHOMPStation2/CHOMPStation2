/obj/item/weapon/reagent_containers/food/snacks/deathclawmeat
	name = "Death claw Meat"
	desc = "A slice from a deathclaw"
	icon_state = "meat"
	center_of_mass = list("x"=17, "y"=16)
	nutriment_amt = 3
	nutriment_desc = list("protein" = 6, "deathblood" = 6)
	bitesize = 6

/obj/item/weapon/reagent_containers/food/snacks/deathclawmeat/Initialize()
	. = ..()
	reagents.add_reagent("protein", 6)
	reagents.add_reagent("deathblood", 6)

/obj/item/weapon/reagent_containers/food/snacks/dragonmeat
	name = "Dragon Meat"
	desc = "A slice from a mighty dragon"
	icon_state = "meat"
	center_of_mass = list("x"=17, "y"=16)
	nutriment_amt = 3
	nutriment_desc = list("protein" = 6, "liquidfire" = 6)
	bitesize = 6

/obj/item/weapon/reagent_containers/food/snacks/deathclawmeat/Initialize()
	. = ..()
	reagents.add_reagent("protein", 6)
	reagents.add_reagent("liquidfire", 6)

/obj/item/weapon/reagent_containers/food/snacks/phorondragonmeat
	name = "Phoron Dragon Meat"
	desc = "A slice from a mighty dragon"
	icon_state = "meat"
	center_of_mass = list("x"=17, "y"=16)
	nutriment_amt = 3
	nutriment_desc = list("protein" = 6, "neoliquidfire" = 6, "phoron" = 3)
	bitesize = 6

/obj/item/weapon/reagent_containers/food/snacks/deathclawmeat/Initialize()
	. = ..()
	reagents.add_reagent("protein", 6)
	reagents.add_reagent("neoliquidfire", 6)
	reagents.add_reagent("phoron", 3)

/obj/item/weapon/reagent_containers/food/snacks/metroidmeat
	name = "Metroid Slice"
	desc = "A slice from a metroid"
	icon_state = "meat"
	center_of_mass = list("x"=17, "y"=16)
	nutriment_amt = 3
	nutriment_desc = list("protein" = 3, "liquidlife" = 3)
	bitesize = 6

/obj/item/weapon/reagent_containers/food/snacks/deathclawmeat/Initialize()
	. = ..()
	reagents.add_reagent("protein", 3)
	reagents.add_reagent("liquidlife", 3)