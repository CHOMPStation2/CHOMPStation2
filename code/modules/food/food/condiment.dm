
///////////////////////////////////////////////Condiments
//Notes by Darem: The condiments food-subtype is for stuff you don't actually eat but you use to modify existing food. They all
//	leave empty containers when used up and can be filled/re-filled with other items. Formatting for first section is identical
//	to mixed-drinks code. If you want an object that starts pre-loaded, you need to make it in addition to the other code.

//Food items that aren't eaten normally and leave an empty container behind.
/obj/item/reagent_containers/food/condiment // CHOMPEdit - Removal of obj/item/weapon
	name = "Condiment Container"
	desc = "Just your average condiment container."
	icon = 'icons/obj/food.dmi'
	icon_state = "emptycondiment"
	flags = OPENCONTAINER
	possible_transfer_amounts = list(1,5,10)
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 6 //CHOMPEdit
	volume = 50

/obj/item/reagent_containers/food/condiment/attackby(var/obj/item/W as obj, var/mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	return

/obj/item/reagent_containers/food/condiment/attack_self(var/mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	return

/obj/item/reagent_containers/food/condiment/attack(var/mob/M as mob, var/mob/user as mob, var/def_zone) // CHOMPEdit - Removal of obj/item/weapon
	if(standard_feed_mob(user, M))
		return

/obj/item/reagent_containers/food/condiment/afterattack(var/obj/target, var/mob/user, var/flag) // CHOMPEdit - Removal of obj/item/weapon
	if(!user.Adjacent(target))
		return
	if(standard_dispenser_refill(user, target))
		return
	if(standard_pour_into(user, target))
		return

	if(istype(target, /obj/item/reagent_containers/food/snacks)) // These are not opencontainers but we can transfer to them // CHOMPEdit - Removal of obj/item/weapon
		if(!reagents || !reagents.total_volume)
			to_chat(user, "<span class='notice'>There is no condiment left in \the [src].</span>")
			return

		if(!target.reagents.get_free_space())
			to_chat(user, "<span class='notice'>You can't add more condiment to \the [target].</span>")
			return

		var/trans = reagents.trans_to_obj(target, amount_per_transfer_from_this)
		to_chat(user, "<span class='notice'>You add [trans] units of the condiment to \the [target].</span>")
	else
		..()

/obj/item/reagent_containers/food/condiment/feed_sound(var/mob/user) // CHOMPEdit - Removal of obj/item/weapon
	playsound(src, 'sound/items/drink.ogg', rand(10, 50), 1)

/obj/item/reagent_containers/food/condiment/self_feed_message(var/mob/user) // CHOMPEdit - Removal of obj/item/weapon
	to_chat(user, "<span class='notice'>You swallow some of contents of \the [src].</span>")

/obj/item/reagent_containers/food/condiment/on_reagent_change() // CHOMPEdit - Removal of obj/item/weapon
	if(reagents.reagent_list.len > 0)
		switch(reagents.get_master_reagent_id())
			if("ketchup")
				name = "Ketchup"
				desc = "You feel more American already."
				icon_state = "ketchup"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("mustard")
				name = "Mustard"
				desc = "A somewhat bitter topping."
				icon_state = "mustard"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("capsaicin")
				name = "Hotsauce"
				desc = "You can almost TASTE the stomach ulcers now!"
				icon_state = "hotsauce"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("enzyme")
				name = "Universal Enzyme"
				desc = "Used in cooking various dishes."
				icon_state = "enzyme"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("soysauce")
				name = "Soy Sauce"
				desc = "A salty soy-based flavoring."
				icon_state = "soysauce"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("vinegar")
				name = "Vinegar"
				desc = "An acetic acid used in various dishes."
				icon_state = "vinegar"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("frostoil")
				name = "Coldsauce"
				desc = "Leaves the tongue numb in its passage."
				icon_state = "coldsauce"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("sodiumchloride")
				name = "Salt Shaker"
				desc = "Salt. From space oceans, presumably."
				icon_state = "saltshaker"
				center_of_mass_x = 17 //CHOMPEdit
				center_of_mass_y= 11 //CHOMPEdit
			if("blackpepper")
				name = "Pepper Mill"
				desc = "Often used to flavor food or make people sneeze."
				icon_state = "peppermillsmall"
				center_of_mass_x = 17 //CHOMPEdit
				center_of_mass_y= 11 //CHOMPEdit
			if("cookingoil")
				name = "Cooking Oil"
				desc = "A delicious oil used in cooking. General purpose."
				icon_state = "oliveoil"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("sugar")
				name = "Sugar"
				desc = "Tastey space sugar!"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("peanutbutter")
				name = "Peanut Butter"
				desc = "A jar of smooth peanut butter."
				icon_state = "peanutbutter"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("mayo")
				name = "Mayonnaise"
				desc = "A jar of mayonnaise!"
				icon_state = "mayo"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("yeast")
				name = "Yeast"
				desc = "This is what you use to make bread fluffy."
				icon_state = "yeast"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("spacespice")
				name = "bottle of space spice"
				desc = "An exotic blend of spices for cooking. Definitely not worms."
				icon_state = "spacespicebottle"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("barbecue")
				name = "barbecue sauce"
				desc = "Barbecue sauce, it's labeled 'sweet and spicy'."
				icon_state = "barbecue"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			if("sprinkles")
				name = "sprinkles"
				desc = "Bottle of sprinkles, colourful!"
				icon_state= "sprinkles"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
			else
				name = "Misc Condiment Bottle"
				if (reagents.reagent_list.len==1)
					desc = "Looks like it is [reagents.get_master_reagent_name()], but you are not sure."
				else
					desc = "A mixture of various condiments. [reagents.get_master_reagent_name()] is one of them."
				icon_state = "mixedcondiments"
				center_of_mass_x = 16 //CHOMPEdit
				center_of_mass_y= 6 //CHOMPEdit
	else
		icon_state = "emptycondiment"
		name = "Condiment Bottle"
		desc = "An empty condiment bottle."
		center_of_mass_x = 16 //CHOMPEdit
		center_of_mass_y= 6 //CHOMPEdit
		return

/obj/item/reagent_containers/food/condiment/enzyme // CHOMPEdit - Removal of obj/item/weapon
	name = "Universal Enzyme"
	desc = "Used in cooking various dishes."
	icon_state = "enzyme"

/obj/item/reagent_containers/food/condiment/enzyme/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("enzyme", 50)

/obj/item/reagent_containers/food/condiment/sugar/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("sugar", 50)

/obj/item/reagent_containers/food/condiment/ketchup/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("ketchup", 50)

/obj/item/reagent_containers/food/condiment/mustard/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("mustard", 50)

/obj/item/reagent_containers/food/condiment/hotsauce/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("capsaicin", 50)

/obj/item/reagent_containers/food/condiment/cookingoil // CHOMPEdit - Removal of obj/item/weapon
	name = "Cooking Oil"

/obj/item/reagent_containers/food/condiment/cookingoil/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("cookingoil", 50)

/obj/item/reagent_containers/food/condiment/cornoil // CHOMPEdit - Removal of obj/item/weapon
	name = "Corn Oil"

/obj/item/reagent_containers/food/condiment/cornoil/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("cornoil", 50)

/obj/item/reagent_containers/food/condiment/coldsauce/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("frostoil", 50)

/obj/item/reagent_containers/food/condiment/soysauce/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("soysauce", 50)

/obj/item/reagent_containers/food/condiment/vinegar/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("vinegar", 50)

/obj/item/reagent_containers/food/condiment/yeast // CHOMPEdit - Removal of obj/item/weapon
	name = "Yeast"

/obj/item/reagent_containers/food/condiment/yeast/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("yeast", 50)

/obj/item/reagent_containers/food/condiment/sprinkles // CHOMPEdit - Removal of obj/item/weapon
	name = "Sprinkles"

/obj/item/reagent_containers/food/condiment/sprinkles/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("sprinkles", 50)

/obj/item/reagent_containers/food/condiment/small // CHOMPEdit - Removal of obj/item/weapon
	possible_transfer_amounts = list(1,20)
	amount_per_transfer_from_this = 1
	volume = 20
	center_of_mass_x = 0 //CHOMPEdit
	center_of_mass_y = 0 //CHOMPEdit

/obj/item/reagent_containers/food/condiment/small/on_reagent_change() // CHOMPEdit - Removal of obj/item/weapon
	return

/obj/item/reagent_containers/food/condiment/small/saltshaker	//Seperate from above since it's a small shaker rather then // CHOMPEdit - Removal of obj/item/weapon
	name = "salt shaker"											//	a large one.
	desc = "Salt. From space oceans, presumably."
	icon_state = "saltshakersmall"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 11 //CHOMPEdit

/obj/item/reagent_containers/food/condiment/small/saltshaker/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("sodiumchloride", 20)

/obj/item/reagent_containers/food/condiment/small/peppermill //Keeping name here to save map based headaches // CHOMPEdit - Removal of obj/item/weapon
	name = "pepper shaker"
	desc = "Often used to flavor food or make people sneeze."
	icon_state = "peppershakersmall"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 11 //CHOMPEdit

/obj/item/reagent_containers/food/condiment/small/peppermill/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("blackpepper", 20)

/obj/item/reagent_containers/food/condiment/small/peppergrinder // CHOMPEdit - Removal of obj/item/weapon
	name = "pepper mill"
	desc = "Fancy way to season a dish or make people sneeze."
	icon_state = "peppermill"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 11 //CHOMPEdit

/obj/item/reagent_containers/food/condiment/small/peppermill/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("blackpepper", 30)

/obj/item/reagent_containers/food/condiment/small/sugar // CHOMPEdit - Removal of obj/item/weapon
	name = "sugar"
	desc = "Sweetness in a bottle"
	icon_state = "sugarsmall"

/obj/item/reagent_containers/food/condiment/small/sugar/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("sugar", 20)

//MRE condiments and drinks.

/obj/item/reagent_containers/food/condiment/small/packet // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "packet_small"
	w_class = ITEMSIZE_TINY
	possible_transfer_amounts = "1;5;10"
	amount_per_transfer_from_this = 1
	volume = 5

/obj/item/reagent_containers/food/condiment/small/packet/salt // CHOMPEdit - Removal of obj/item/weapon
	name = "salt packet"
	desc = "Contains 5u of table salt."
	icon_state = "packet_small_white"

/obj/item/reagent_containers/food/condiment/small/packet/salt/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("sodiumchloride", 5)

/obj/item/reagent_containers/food/condiment/small/packet/pepper // CHOMPEdit - Removal of obj/item/weapon
	name = "pepper packet"
	desc = "Contains 5u of black pepper."
	icon_state = "packet_small_black"

/obj/item/reagent_containers/food/condiment/small/packet/pepper/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("blackpepper", 5)

/obj/item/reagent_containers/food/condiment/small/packet/sugar // CHOMPEdit - Removal of obj/item/weapon
	name = "sugar packet"
	desc = "Contains 5u of refined sugar."
	icon_state = "packet_small_white"

/obj/item/reagent_containers/food/condiment/small/packet/sugar/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("sugar", 5)

/obj/item/reagent_containers/food/condiment/small/packet/jelly // CHOMPEdit - Removal of obj/item/weapon
	name = "jelly packet"
	desc = "Contains 10u of cherry jelly. Best used for spreading on crackers."
	icon_state = "packet_medium"
	volume = 10

/obj/item/reagent_containers/food/condiment/small/packet/jelly/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("cherryjelly", 10)

/obj/item/reagent_containers/food/condiment/small/packet/honey // CHOMPEdit - Removal of obj/item/weapon
	name = "honey packet"
	desc = "Contains 10u of honey."
	icon_state = "packet_medium"
	volume = 10

/obj/item/reagent_containers/food/condiment/small/packet/honey/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("honey", 10)

/obj/item/reagent_containers/food/condiment/small/packet/capsaicin // CHOMPEdit - Removal of obj/item/weapon
	name = "hot sauce packet"
	desc = "Contains 5u of hot sauce. Enjoy in moderation."
	icon_state = "packet_small_red"

/obj/item/reagent_containers/food/condiment/small/packet/capsaicin/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("capsaicin", 5)

/obj/item/reagent_containers/food/condiment/small/packet/ketchup // CHOMPEdit - Removal of obj/item/weapon
	name = "ketchup packet"
	desc = "Contains 5u of ketchup."
	icon_state = "packet_small_red"

/obj/item/reagent_containers/food/condiment/small/packet/ketchup/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("ketchup", 5)

/obj/item/reagent_containers/food/condiment/small/packet/mayo // CHOMPEdit - Removal of obj/item/weapon
	name = "mayonnaise packet"
	desc = "Contains 5u of mayonnaise."
	icon_state = "packet_small_white"

/obj/item/reagent_containers/food/condiment/small/packet/mayo/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("mayo", 5)

/obj/item/reagent_containers/food/condiment/small/packet/soy // CHOMPEdit - Removal of obj/item/weapon
	name = "soy sauce packet"
	desc = "Contains 5u of soy sauce."
	icon_state = "packet_small_black"

/obj/item/reagent_containers/food/condiment/small/packet/soy/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("soysauce", 5)

/obj/item/reagent_containers/food/condiment/small/packet/coffee // CHOMPEdit - Removal of obj/item/weapon
	name = "coffee powder packet"
	desc = "Contains 5u of coffee powder. Mix with 25u of water and heat."

/obj/item/reagent_containers/food/condiment/small/packet/coffee/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("coffeepowder", 5)

/obj/item/reagent_containers/food/condiment/small/packet/tea // CHOMPEdit - Removal of obj/item/weapon
	name = "tea powder packet"
	desc = "Contains 5u of black tea powder. Mix with 25u of water and heat."

/obj/item/reagent_containers/food/condiment/small/packet/tea/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("tea", 5)

/obj/item/reagent_containers/food/condiment/small/packet/cocoa // CHOMPEdit - Removal of obj/item/weapon
	name = "cocoa powder packet"
	desc = "Contains 5u of cocoa powder. Mix with 25u of water and heat."

/obj/item/reagent_containers/food/condiment/small/packet/cocoa/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("coco", 5)

/obj/item/reagent_containers/food/condiment/small/packet/grape // CHOMPEdit - Removal of obj/item/weapon
	name = "grape juice powder packet"
	desc = "Contains 5u of powdered grape juice. Mix with 15u of water."

/obj/item/reagent_containers/food/condiment/small/packet/grape/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("instantgrape", 5)

/obj/item/reagent_containers/food/condiment/small/packet/orange // CHOMPEdit - Removal of obj/item/weapon
	name = "orange juice powder packet"
	desc = "Contains 5u of powdered orange juice. Mix with 15u of water."

/obj/item/reagent_containers/food/condiment/small/packet/orange/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("instantorange", 5)

/obj/item/reagent_containers/food/condiment/small/packet/watermelon // CHOMPEdit - Removal of obj/item/weapon
	name = "watermelon juice powder packet"
	desc = "Contains 5u of powdered watermelon juice. Mix with 15u of water."

/obj/item/reagent_containers/food/condiment/small/packet/watermelon/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("instantwatermelon", 5)

/obj/item/reagent_containers/food/condiment/small/packet/apple // CHOMPEdit - Removal of obj/item/weapon
	name = "apple juice powder packet"
	desc = "Contains 5u of powdered apple juice. Mix with 15u of water."

/obj/item/reagent_containers/food/condiment/small/packet/apple/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("instantapple", 5)

/obj/item/reagent_containers/food/condiment/small/packet/protein // CHOMPEdit - Removal of obj/item/weapon
	name = "protein powder packet"
	desc = "Contains 10u of powdered protein. Mix with 20u of water."
	icon_state = "packet_medium"
	volume = 10

/obj/item/reagent_containers/food/condiment/small/packet/protein/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("protein", 10)

/obj/item/reagent_containers/food/condiment/small/packet/crayon // CHOMPEdit - Removal of obj/item/weapon
	name = "crayon powder packet"
	desc = "Contains 10u of powdered crayon. Mix with 30u of water."
	volume = 10
/obj/item/reagent_containers/food/condiment/small/packet/crayon/generic/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("crayon_dust", 10)
/obj/item/reagent_containers/food/condiment/small/packet/crayon/red/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("crayon_dust_red", 10)
/obj/item/reagent_containers/food/condiment/small/packet/crayon/orange/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("crayon_dust_orange", 10)
/obj/item/reagent_containers/food/condiment/small/packet/crayon/yellow/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("crayon_dust_yellow", 10)
/obj/item/reagent_containers/food/condiment/small/packet/crayon/green/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("crayon_dust_green", 10)
/obj/item/reagent_containers/food/condiment/small/packet/crayon/blue/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("crayon_dust_blue", 10)
/obj/item/reagent_containers/food/condiment/small/packet/crayon/purple/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("crayon_dust_purple", 10)
/obj/item/reagent_containers/food/condiment/small/packet/crayon/grey/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("crayon_dust_grey", 10)
/obj/item/reagent_containers/food/condiment/small/packet/crayon/brown/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("crayon_dust_brown", 10)

//End of MRE stuff.

/obj/item/reagent_containers/food/condiment/carton/flour // CHOMPEdit - Removal of obj/item/weapon
	name = "flour carton"
	desc = "A big carton of flour. Good for baking!"
	icon = 'icons/obj/food.dmi'
	icon_state = "flour"
	volume = 220
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 8 //CHOMPEdit

/obj/item/reagent_containers/food/condiment/carton/flour/on_reagent_change() // CHOMPEdit - Removal of obj/item/weapon
	update_icon()
	return

/obj/item/reagent_containers/food/condiment/carton/flour/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("flour", 200)
	randpixel_xy()

/obj/item/reagent_containers/food/condiment/carton/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	overlays.Cut()

	if(reagents.total_volume)
		var/image/filling = image('icons/obj/food.dmi', src, "[icon_state]10")

		filling.icon_state = "[icon_state]-[clamp(round(100 * reagents.total_volume / volume, 25), 0, 100)]"

		overlays += filling

/obj/item/reagent_containers/food/condiment/carton/flour/rustic // CHOMPEdit - Removal of obj/item/weapon
	name = "flour sack"
	desc = "An artisanal sack of flour. Classy!"
	icon_state = "flour_bag"

/obj/item/reagent_containers/food/condiment/carton/sugar // CHOMPEdit - Removal of obj/item/weapon
	name = "sugar carton"
	desc = "A big carton of sugar. Sweet!"
	icon_state = "sugar"
	volume = 120
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 8 //CHOMPEdit

/obj/item/reagent_containers/food/condiment/carton/sugar/on_reagent_change() // CHOMPEdit - Removal of obj/item/weapon
	update_icon()
	return

/obj/item/reagent_containers/food/condiment/carton/sugar/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("sugar", 100)

/obj/item/reagent_containers/food/condiment/carton/sugar/rustic // CHOMPEdit - Removal of obj/item/weapon
	name = "sugar sack"
	desc = "An artisanal sack of sugar. Classy!"
	icon_state = "sugar_bag"

/obj/item/reagent_containers/food/condiment/spacespice // CHOMPEdit - Removal of obj/item/weapon
	name = "space spices"
	desc = "An exotic blend of spices for cooking. Definitely not worms."
	icon_state = "spacespicebottle"
	possible_transfer_amounts = list(1,40) //for clown turning the lid off
	amount_per_transfer_from_this = 1
	volume = 40

/obj/item/reagent_containers/food/condiment/spacespice/on_reagent_change() // CHOMPEdit - Removal of obj/item/weapon
	return

/obj/item/reagent_containers/food/condiment/spacespice/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("spacespice", 40)

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder // CHOMPEdit - Removal of obj/item/weapon
	name = "protein powder packet"
	desc = "Contains 5u of regular protein powder. Mix with 25u of water and enjoy."
	icon_state = "protein_powder1"

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("protein_powder", 5)

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder/vanilla // CHOMPEdit - Removal of obj/item/weapon
	name = "vanilla protein powder packet"
	desc = "Contains 5u of vanilla flavored protein powder. Mix with 25u of water and enjoy."
	icon_state = "protein_powder2"

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder/vanilla/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("vanilla_protein_powder", 5)

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder/banana // CHOMPEdit - Removal of obj/item/weapon
	name = "banana protein powder packet"
	desc = "Contains 5u of banana flavored protein powder. Mix with 25u of water and enjoy."
	icon_state = "protein_powder3"

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder/banana/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("banana_protein_powder", 5)

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder/chocolate // CHOMPEdit - Removal of obj/item/weapon
	name = "chocolate protein powder packet"
	desc = "Contains 5u of chocolate flavored protein powder. Mix with 25u of water and enjoy."
	icon_state = "protein_powder4"

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder/chocolate/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("chocolate_protein_powder", 5)

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder/strawberry // CHOMPEdit - Removal of obj/item/weapon
	name = "strawberry protein powder packet"
	desc = "Contains 5u of strawberry flavored protein powder. Mix with 25u of water and enjoy."
	icon_state = "protein_powder5"

/obj/item/reagent_containers/food/condiment/small/packet/protein_powder/strawberry/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("strawberry_protein_powder", 5)
