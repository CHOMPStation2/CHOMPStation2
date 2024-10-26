/obj/item/reagent_containers/food/snacks/deathclawmeat
	name = "Death claw Meat"
	desc = "A slice from a deathclaw"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("protein" = 6, "deathblood" = 6)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/deathclawmeat/Initialize()
	. = ..()
	reagents.add_reagent("protein", 6)
	reagents.add_reagent("deathblood", 6)

/obj/item/reagent_containers/food/snacks/dragonmeat
	name = "Dragon Meat"
	desc = "A slice from a mighty dragon"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("protein" = 6, "liquidfire" = 6)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/dragonmeat/Initialize()
	. = ..()
	reagents.add_reagent("protein", 6)
	reagents.add_reagent("liquidfire", 6)

/obj/item/reagent_containers/food/snacks/phorondragonmeat
	name = "Phoron Dragon Meat"
	desc = "A slice from a mighty dragon"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("protein" = 6, "neoliquidfire" = 6, "phoron" = 3)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/phorondragonmeat/Initialize()
	. = ..()
	reagents.add_reagent("protein", 6)
	reagents.add_reagent("neoliquidfire", 6)
	reagents.add_reagent("phoron", 3)

/obj/item/reagent_containers/food/snacks/metroidmeat
	name = "Metroid Slice"
	desc = "A slice from a metroid"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("protein" = 3, "liquidlife" = 3)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/metroidmeat/Initialize()
	. = ..()
	reagents.add_reagent("protein", 3)
	reagents.add_reagent("liquidlife", 3)

/obj/item/reagent_containers/food/snacks/meat/raymeat
	name = "Solar Ray Meat"
	desc = "You aren't sure how ediable this is"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("protein" = 3, "capsaicin" = 8, "condensedcapsaicin" = 8)


/obj/item/reagent_containers/food/snacks/meat/eelmeat
	name = "Eel Meat"
	desc = "A slice from an eel"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("protein" = 3, "shockchem" = 1)


/obj/item/reagent_containers/food/snacks/meat/gravityshell
	name = "Gravity Shell Meat"
	desc = "A slice from a gravity shell"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("protein" = 24)
