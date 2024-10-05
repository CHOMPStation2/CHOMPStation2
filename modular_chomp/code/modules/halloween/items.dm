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

	if(searching)
		to_chat(user, SPAN_WARNING("Someone is already looking through \the [src]!"))
		return

	searching = TRUE

	do_after(user, 5 SECONDS)

	if(user.ckey in treated)
		var/choice = tgui_alert(user, "You already took one! Take more?", "Take another...", list("Reach in...", "Leave it!"))
		if(choice == "Reach in...")
			if(prob(35))
				thegoods = pick(badcandy)
			else
				thegoods = pick(candy)
	else
		thegoods = pick(candy)
		treated += user.ckey

	searching = FALSE

	var/goodie = new thegoods(src)
	user.put_in_hands(goodie)

/obj/structure/candybowl/medical
	name = "medical candy bowl"

/obj/structure/candybowl/medical/Initialize()
	. = ..()
	candy += list(
		/obj/item/clothing/mask/chewable/candy/lolli,
		/obj/item/reagent_containers/food/snacks/organ,
		/obj/item/storage/box/shrimpsandbananas
	)

/obj/structure/candybowl/engineering
	name = "engineering candy bowl"

/obj/structure/candybowl/engineering/Initialize()
	. = ..()
	candy += list(
		/obj/item/reagent_containers/food/snacks/welders_original,
		/obj/item/reagent_containers/food/snacks/butterscotch,
		/obj/item/reagent_containers/food/snacks/chocolatepiece
	)

/obj/structure/candybowl/cargo
	name = "cargo candy bowl"

/obj/structure/candybowl/cargo/Initialize()
	. = ..()
	candy += list(
		/obj/item/reagent_containers/food/snacks/butterscotch,
		/obj/item/reagent_containers/food/snacks/honey_candy,
		/obj/item/storage/box/winegum,
	)

/obj/structure/candybowl/science
	name = "science candy bowl"

/obj/structure/candybowl/science/Initialize()
	. = ..()
	candy += list(
		/obj/item/reagent_containers/food/snacks/reishicup,
		/obj/item/reagent_containers/food/snacks/antball,
		/obj/item/storage/box/winegum,
		/obj/item/reagent_containers/food/snacks/chocolatepiece/truffle
	)

/obj/structure/candybowl/security
	name = "security candy bowl"

/obj/structure/candybowl/security/Initialize()
	. = ..()
	candy += list(
		/obj/item/reagent_containers/food/snacks/spicy_boys,
		/obj/item/reagent_containers/food/snacks/chocolatepiece/white,
		/obj/item/reagent_containers/food/snacks/candy_corn
	)
