/obj/item/storage/bag/plasticbag/halloween
	name = "halloween bag"
	icon = 'modular_chomp/icons/obj/halloween/trash.dmi'
	icon_state = "halloween_bag"
	can_hold = list(
		/obj/item/reagent_containers/food/snacks/candy,
		/obj/item/reagent_containers/food/snacks/candy_corn,
		/obj/item/reagent_containers/food/snacks/chocolatebar,
		/obj/item/reagent_containers/food/snacks/chocolatepiece,
		/obj/item/reagent_containers/food/snacks/chocolatepiece/white,
		/obj/item/reagent_containers/food/snacks/chocolatepiece/truffle,
		/obj/item/reagent_containers/food/snacks/chocolateegg,
		/obj/item/reagent_containers/food/snacks/no_raisin,
		/obj/item/reagent_containers/food/snacks/butterscotch,
		/obj/item/reagent_containers/food/snacks/spicy_boys,
		/obj/item/reagent_containers/food/snacks/welders_original,
		/obj/item/reagent_containers/food/snacks/organ,
		/obj/item/reagent_containers/food/snacks/mint,
		/obj/item/storage/box/admints,
		/obj/item/reagent_containers/food/snacks/cookiesnack,
		/obj/item/reagent_containers/food/snacks/cb01,
		/obj/item/reagent_containers/food/snacks/cb02,
		/obj/item/reagent_containers/food/snacks/cb03,
		/obj/item/reagent_containers/food/snacks/cb04,
		/obj/item/reagent_containers/food/snacks/cb05,
		/obj/item/reagent_containers/food/snacks/cb06,
		/obj/item/reagent_containers/food/snacks/cb07,
		/obj/item/reagent_containers/food/snacks/cb08,
		/obj/item/reagent_containers/food/snacks/cb09,
		/obj/item/reagent_containers/food/snacks/cb10,
		/obj/item/reagent_containers/food/snacks/reishicup,
		/obj/item/reagent_containers/food/snacks/antball,
		/obj/item/reagent_containers/food/snacks/honey_candy,
		/obj/item/storage/box/winegum,
		/obj/item/storage/box/shrimpsandbananas,
		/obj/item/clothing/mask/chewable/candy/lolli
	)

/obj/structure/candybowl
	name = "candy bowl"
	desc = "It's a bowl, with candy! Take only one, please."
	anchored = FALSE
	density = FALSE
	icon = 'modular_chomp/icons/obj/halloween/bowls.dmi'
	icon_state = "fullcandy"

	var/searching = FALSE
	var/has_candy = TRUE

	var/list/candy = list(
		/obj/item/reagent_containers/food/snacks/chocolatebar,
		/obj/item/reagent_containers/food/snacks/cb01,
		/obj/item/reagent_containers/food/snacks/cb02,
		/obj/item/reagent_containers/food/snacks/cb03,
		/obj/item/reagent_containers/food/snacks/cb04,
		/obj/item/reagent_containers/food/snacks/cb05,
		/obj/item/reagent_containers/food/snacks/cb06,
		/obj/item/reagent_containers/food/snacks/cb07,
		/obj/item/reagent_containers/food/snacks/cb08,
		/obj/item/reagent_containers/food/snacks/cb09,
		/obj/item/reagent_containers/food/snacks/cb10,
	)

	var/list/badcandy = list(
		/obj/item/reagent_containers/food/snacks/no_raisin,
		/obj/item/reagent_containers/food/snacks/egg/rotten,
		/obj/item/reagent_containers/food/snacks/candy_corn
	)

	var/list/treated = list()

/obj/structure/candybowl/attack_hand(mob/user)

	var/thegoods

	if(!has_candy)
		to_chat(user, span_warning("There is no candy! Someone took too many..."))
		return

	if(searching)
		to_chat(user, span_warning("Someone is already looking through \the [src]!"))
		return

	searching = TRUE

	if(!do_after(user, 5 SECONDS))
		searching = FALSE
		return

	searching = FALSE

	if(treated[user.ckey])
		var/choice = tgui_alert(user, "You already took one! Take more?", "Take another...", list("Reach in...", "Leave it!"))
		if(!choice)
			return
		if(choice == "Reach in...")
			if(prob(35))
				thegoods = pick(badcandy)
				to_chat(user, span_danger("That's one too many! The bowl is empty now..."))
				empty()
			else
				thegoods = pick(candy)
	else
		thegoods = pick(candy)
		treated[user.ckey] = TRUE

	var/goodie = new thegoods(src)
	user.put_in_hands(goodie)

/obj/structure/candybowl/attackby(obj/item/O, mob/user)
	. = ..()
	if(istype(O, /obj/item/reagent_containers/food/snacks) && !has_candy)
		to_chat(user, span_notice("You add \the [O] to the bowl."))
		if(prob(20))
			fill()
		qdel(O)

/obj/structure/candybowl/proc/empty()
	var/newname = "empty " + initial(name)
	name = newname
	desc = "An empty bowl! Someone took too many candies..."
	icon_state = "nocandy"
	has_candy = FALSE
	searching = FALSE

	update_icon()

/obj/structure/candybowl/proc/fill()
	name = initial(name)
	desc = initial(desc)
	icon_state = "fullcandy"
	has_candy = TRUE

	update_icon()

/obj/structure/candybowl/medical
	name = "medical candy bowl"

/obj/structure/candybowl/medical/Initialize(mapload)
	. = ..()
	candy += list(
		/obj/item/clothing/mask/chewable/candy/lolli,
		/obj/item/reagent_containers/food/snacks/organ,
		/obj/item/storage/box/shrimpsandbananas
	)

/obj/structure/candybowl/engineering
	name = "engineering candy bowl"

/obj/structure/candybowl/engineering/Initialize(mapload)
	. = ..()
	candy += list(
		/obj/item/reagent_containers/food/snacks/welders_original,
		/obj/item/reagent_containers/food/snacks/butterscotch,
		/obj/item/reagent_containers/food/snacks/chocolatepiece
	)

/obj/structure/candybowl/cargo
	name = "cargo candy bowl"

/obj/structure/candybowl/cargo/Initialize(mapload)
	. = ..()
	candy += list(
		/obj/item/reagent_containers/food/snacks/butterscotch,
		/obj/item/reagent_containers/food/snacks/honey_candy,
		/obj/item/storage/box/winegum,
	)

/obj/structure/candybowl/science
	name = "science candy bowl"

/obj/structure/candybowl/science/Initialize(mapload)
	. = ..()
	candy += list(
		/obj/item/reagent_containers/food/snacks/reishicup,
		/obj/item/reagent_containers/food/snacks/antball,
		/obj/item/storage/box/winegum,
		/obj/item/reagent_containers/food/snacks/chocolatepiece/truffle
	)

/obj/structure/candybowl/security
	name = "security candy bowl"

/obj/structure/candybowl/security/Initialize(mapload)
	. = ..()
	candy += list(
		/obj/item/reagent_containers/food/snacks/spicy_boys,
		/obj/item/reagent_containers/food/snacks/chocolatepiece/white,
		/obj/item/reagent_containers/food/snacks/candy_corn
	)

/obj/structure/boxpile
	name = "box pile"
	desc = "It's a bunch of costume boxes! Maybe one could fit you..."
	icon = 'modular_chomp/icons/obj/halloween/trash64x64.dmi'
	icon_state = "bigboxes"

	anchored = TRUE

	var/list/ckeys_that_took = list()
	var/list/costumes

/obj/structure/boxpile/Initialize(mapload)
	. = ..()

	costumes = typesof(/obj/item/storage/box/halloween/)

/obj/structure/boxpile/attack_hand(mob/living/user)
	if(!do_after(user, 5 SECONDS, exclusive = TASK_USER_EXCLUSIVE))
		return
	if(!user.ckey)
		return
	if(ckeys_that_took[user.ckey])
		to_chat(user, span_notice("Nothing else fits you here!"))
		return
	to_chat(user, span_notice("After looking around, you found a costume that fits you!"))
	ckeys_that_took[user.ckey] = TRUE
	var/obj/item/box = pick(costumes)
	new box(loc)
