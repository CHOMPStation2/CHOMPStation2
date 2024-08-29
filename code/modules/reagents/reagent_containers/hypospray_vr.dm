/obj/item/reagent_containers/hypospray/autoinjector/burn // CHOMPEdit - Removal of obj/item/weapon
	name = "autoinjector (burn)"
	icon_state = "purple"
	filled_reagents = list("dermaline" = 3.5, "leporazine" = 1.5)

/obj/item/reagent_containers/hypospray/autoinjector/trauma // CHOMPEdit - Removal of obj/item/weapon
	name = "autoinjector (trauma)"
	icon_state = "black"
	filled_reagents = list("bicaridine" = 4, "tramadol" = 1)

/obj/item/reagent_containers/hypospray/autoinjector/oxy // CHOMPEdit - Removal of obj/item/weapon
	name = "autoinjector (oxy)"
	icon_state = "blue"
	filled_reagents = list("dexalinp" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/rad // CHOMPEdit - Removal of obj/item/weapon
	name = "autoinjector (rad)"
	icon_state = "black"
	filled_reagents = list("hyronalin" = 5)

/obj/item/storage/box/traumainjectors // CHOMPEdit - Removal of obj/item/weapon
	name = "box of emergency injectors"
	desc = "Contains emergency autoinjectors."
	icon_state = "syringe"
	max_storage_space = ITEMSIZE_COST_SMALL * 7 // 14
	starts_with = list(
		/obj/item/reagent_containers/hypospray/autoinjector/trauma = 4, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/hypospray/autoinjector/detox = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/hypospray/autoinjector/burn = 1 // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/reagent_containers/hypospray // CHOMPEdit - Removal of obj/item/weapon
	var/prototype = 0

/obj/item/reagent_containers/hypospray/science // CHOMPEdit - Removal of obj/item/weapon
	name = "prototype hypospray"
	desc = "This reproduction hypospray is nearly a perfect replica of the early model DeForest hyposprays, sharing many of the same features. However, there are additional safety measures installed to prevent unwanted injections."
	prototype = 1
