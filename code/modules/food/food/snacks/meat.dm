/obj/item/reagent_containers/food/snacks/meat // CHOMPEdit - Removal of obj/item/weapon
	name = "meat"
	desc = "A slab of meat."
	icon_state = "meat"
	health = 180
	filling_color = "#FF1C1C"
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 14 //CHOMPEdit

/obj/item/reagent_containers/food/snacks/meat/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("protein", 6)
	reagents.add_reagent("triglyceride", 2)
	src.bitesize = 1.5

/obj/item/reagent_containers/food/snacks/meat/cook() // CHOMPEdit - Removal of obj/item/weapon

	if (!isnull(cooked_icon))
		icon_state = cooked_icon
		flat_icon = null //Force regenating the flat icon for coatings, since we've changed the icon of the thing being coated
	..()

	if (name == initial(name))
		name = "cooked [name]"

/obj/item/reagent_containers/food/snacks/meat/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(W,/obj/item/material/knife)) // CHOMPEdit - Removal of obj/item/weapon
		new /obj/item/reagent_containers/food/snacks/rawcutlet(src) // CHOMPEdit - Removal of obj/item/weapon
		new /obj/item/reagent_containers/food/snacks/rawcutlet(src) // CHOMPEdit - Removal of obj/item/weapon
		new /obj/item/reagent_containers/food/snacks/rawcutlet(src) // CHOMPEdit - Removal of obj/item/weapon
		to_chat(user, "You cut the meat into thin strips.")
		qdel(src)
	else
		..()

/obj/item/reagent_containers/food/snacks/meat/syntiflesh // CHOMPEdit - Removal of obj/item/weapon
	name = "synthetic meat"
	desc = "A synthetic slab of flesh."

// Seperate definitions because some food likes to know if it's human.
// TODO: rewrite kitchen code to check a var on the meat item so we can remove
// all these sybtypes.
/obj/item/reagent_containers/food/snacks/meat/human // CHOMPEdit - Removal of obj/item/weapon
/obj/item/reagent_containers/food/snacks/meat/monkey // CHOMPEdit - Removal of obj/item/weapon
	//same as plain meat

/obj/item/reagent_containers/food/snacks/meat/corgi // CHOMPEdit - Removal of obj/item/weapon
	name = "dogmeat"
	desc = "Tastes like... well, you know."

/obj/item/reagent_containers/food/snacks/meat/chicken // CHOMPEdit - Removal of obj/item/weapon
	name = "poultry"
	icon_state = "chickenbreast"
	cooked_icon = "chickensteak"
	filling_color = "#BBBBAA"

/obj/item/reagent_containers/food/snacks/meat/chicken/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.remove_reagent("triglyceride", INFINITY)
	//Chicken is low fat. Less total calories than other meats

/obj/item/reagent_containers/food/snacks/crabmeat // CHOMPEdit - Removal of obj/item/weapon
	name = "crustacean legs"
	desc = "... Coffee? Is that you?"
	icon_state = "crabmeat"
	bitesize = 1

/obj/item/reagent_containers/food/snacks/crabmeat/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("seafood", 2)

/obj/item/reagent_containers/food/snacks/hugemushroomslice // CHOMPEdit - Removal of obj/item/weapon
	name = "fungus slice"
	desc = "A slice from a huge mushroom."
	icon_state = "hugemushroomslice"
	filling_color = "#E0D7C5"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("raw" = 2, "mushroom" = 2)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/hugemushroomslice/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("psilocybin", 3)

/obj/item/reagent_containers/food/snacks/tomatomeat // CHOMPEdit - Removal of obj/item/weapon
	name = "tomato slice"
	desc = "A slice from a huge tomato"
	icon_state = "tomatomeat"
	filling_color = "#DB0000"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("raw" = 2, "tomato" = 3)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/bearmeat // CHOMPEdit - Removal of obj/item/weapon
	name = "bearmeat"
	desc = "A very manly slab of meat."
	icon_state = "bearmeat"
	filling_color = "#DB0000"
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 10 //CHOMPEdit
	bitesize = 3

/obj/item/reagent_containers/food/snacks/bearmeat/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("protein", 12)
	reagents.add_reagent("hyperzine", 5)

/obj/item/reagent_containers/food/snacks/xenomeat // CHOMPEdit - Removal of obj/item/weapon
	name = "xenomeat"
	desc = "A slab of green meat. Smells like acid."
	icon_state = "xenomeat"
	filling_color = "#43DE18"
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 10 //CHOMPEdit
	bitesize = 6

/obj/item/reagent_containers/food/snacks/xenomeat/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("protein", 6)
	reagents.add_reagent("pacid",6)

/obj/item/reagent_containers/food/snacks/xenomeat/spidermeat // Substitute for recipes requiring xeno meat. // CHOMPEdit - Removal of obj/item/weapon
	name = "insect meat"
	desc = "A slab of green meat."
	icon_state = "xenomeat"
	filling_color = "#43DE18"
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 10 //CHOMPEdit
	bitesize = 6

/obj/item/reagent_containers/food/snacks/xenomeat/spidermeat/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("spidertoxin",6)
	reagents.remove_reagent("pacid",6)

/obj/item/reagent_containers/food/snacks/meat/fox // CHOMPEdit - Removal of obj/item/weapon
	name = "foxmeat"
	desc = "The fox doesn't say a goddamn thing, now."

/obj/item/reagent_containers/food/snacks/meat/grubmeat // CHOMPEdit - Removal of obj/item/weapon
	name = "grubmeat"
	desc = "A slab of grub meat, it gives a gentle shock if you touch it"
	icon = 'icons/obj/food.dmi'
	icon_state = "grubmeat"
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 10 //CHOMPEdit

/obj/item/reagent_containers/food/snacks/meat/grubmeat/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("protein", 1)
	reagents.add_reagent("shockchem", 6)
	bitesize = 6

/obj/item/reagent_containers/food/snacks/meat/worm // CHOMPEdit - Removal of obj/item/weapon
	name = "weird meat"
	desc = "A chunk of pulsating meat."
	icon_state = "wormmeat"
	health = 180
	filling_color = "#551A8B"
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 14 //CHOMPEdit

/obj/item/reagent_containers/food/snacks/meat/worm/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("protein", 6)
	reagents.add_reagent("phoron", 3)
	reagents.add_reagent("myelamine", 3)
	src.bitesize = 3

/obj/item/reagent_containers/food/snacks/meat/worm/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(W,/obj/item/material/knife)) // CHOMPEdit - Removal of obj/item/weapon
		var/to_spawn = pickweight(/obj/random/junk = 30,
		/obj/random/trash = 30,
		/obj/random/maintenance/clean = 15,
		/obj/random/tool = 15,
		/obj/random/medical = 3,
		/obj/random/bomb_supply = 7,
		/obj/random/contraband = 3,
		/obj/random/unidentified_medicine/old_medicine = 7,
		/obj/item/strangerock = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/ore/phoron = 7, // CHOMPEdit - Removal of obj/item/weapon
		/obj/random/handgun = 1,
		/obj/random/toolbox = 4,
		/obj/random/drinkbottle = 5
		)

		new to_spawn(get_turf(src))

		if(prob(20))
			user.visible_message("<span class='alien'>Something oozes out of \the [src] as it is cut.</span>")

		to_chat(user, "<span class='alien'>You cut the tissue holding the chunks together.</span>")

	..()
