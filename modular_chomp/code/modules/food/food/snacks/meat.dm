/obj/item/reagent_containers/food/snacks/deathclawmeat
	name = "Death claw Meat"
	desc = "A slice from a deathclaw"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list(REAGENT_ID_PROTEIN = 6, REAGENT_ID_DEATHBLOOD = 6)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/deathclawmeat/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 6)
	reagents.add_reagent(REAGENT_ID_DEATHBLOOD, 6)

/obj/item/reagent_containers/food/snacks/dragonmeat
	name = "Dragon Meat"
	desc = "A slice from a mighty dragon"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list(REAGENT_ID_PROTEIN = 6, REAGENT_ID_LIQUIDFIRE = 6)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/dragonmeat/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 6)
	reagents.add_reagent(REAGENT_ID_LIQUIDFIRE, 6)

/obj/item/reagent_containers/food/snacks/phorondragonmeat
	name = "Phoron Dragon Meat"
	desc = "A slice from a mighty dragon"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list(REAGENT_ID_PROTEIN = 6, REAGENT_ID_NEOLIQUIDFIRE = 6, REAGENT_ID_PHORON = 3)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/phorondragonmeat/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 6)
	reagents.add_reagent(REAGENT_ID_NEOLIQUIDFIRE, 6)
	reagents.add_reagent(REAGENT_ID_PHORON, 3)

/obj/item/reagent_containers/food/snacks/metroidmeat
	name = "Metroid Slice"
	desc = "A slice from a metroid"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list(REAGENT_ID_PROTEIN = 3, REAGENT_ID_LIQUIDLIFE = 3)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/metroidmeat/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 3)
	reagents.add_reagent(REAGENT_ID_LIQUIDLIFE, 3)

/obj/item/reagent_containers/food/snacks/meat/raymeat
	name = "Solar Ray Meat"
	desc = "You aren't sure how ediable this is"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list(REAGENT_ID_PROTEIN = 3, REAGENT_ID_CAPSAICIN = 8, REAGENT_ID_CONDENSEDCAPSAICIN = 8)


/obj/item/reagent_containers/food/snacks/meat/eelmeat
	name = "Eel Meat"
	desc = "A slice from an eel"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list(REAGENT_ID_PROTEIN = 3, REAGENT_ID_SHOCKCHEM = 1)


/obj/item/reagent_containers/food/snacks/meat/gravityshell
	name = "Gravity Shell Meat"
	desc = "A slice from a gravity shell"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list(REAGENT_ID_PROTEIN = 24)
