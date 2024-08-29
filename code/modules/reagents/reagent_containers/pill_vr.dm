/obj/item/reagent_containers/pill/nutriment // CHOMPEdit - Removal of obj/item/weapon
	name = "Nutriment (30u)"
	desc = "Used to feed people on the field. Contains 30 units of Nutriment."
	icon_state = "pill10"

/obj/item/reagent_containers/pill/nutriment/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("nutriment", 30)

/obj/item/reagent_containers/pill/protein // CHOMPEdit - Removal of obj/item/weapon
	name = "Protein (30u)"
	desc = "Used to feed carnivores on the field. Contains 30 units of Protein."
	icon_state = "pill24"

/obj/item/reagent_containers/pill/protein/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("protein", 30)

/obj/item/reagent_containers/pill/rezadone // CHOMPEdit - Removal of obj/item/weapon
	name = "Rezadone (5u)"
	desc = "A powder with almost magical properties, this substance can effectively treat genetic damage in humanoids, though excessive consumption has side effects."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/rezadone/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("rezadone", 5)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/peridaxon // CHOMPEdit - Removal of obj/item/weapon
	name = "Peridaxon (10u)"
	desc = "Used to encourage recovery of internal organs and nervous systems. Medicate cautiously."
	icon_state = "pill10"

/obj/item/reagent_containers/pill/peridaxon/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("peridaxon", 10)

/obj/item/reagent_containers/pill/carthatoline // CHOMPEdit - Removal of obj/item/weapon
	name = "Carthatoline (15u)"
	desc = "Carthatoline is strong evacuant used to treat severe poisoning."
	icon_state = "pill4"

/obj/item/reagent_containers/pill/carthatoline/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("carthatoline", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/alkysine // CHOMPEdit - Removal of obj/item/weapon
	name = "Alkysine (10u)"
	desc = "Alkysine is a drug used to lessen the damage to neurological tissue after a catastrophic injury. Can heal brain tissue."
	icon_state = "pill3"

/obj/item/reagent_containers/pill/alkysine/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("alkysine", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/imidazoline // CHOMPEdit - Removal of obj/item/weapon
	name = "Imidazoline (15u)"
	desc = "Heals eye damage."
	icon_state = "pill3"

/obj/item/reagent_containers/pill/imidazoline/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("imidazoline", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/osteodaxon // CHOMPEdit - Removal of obj/item/weapon
	name = "Osteodaxon (25u)"
	desc = "An experimental drug used to heal bone fractures."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/osteodaxon/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("osteodaxon", 15)
	reagents.add_reagent("inaprovaline", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/myelamine // CHOMPEdit - Removal of obj/item/weapon
	name = "Myelamine (25u)"
	desc = "Used to rapidly clot internal hemorrhages by increasing the effectiveness of platelets."
	icon_state = "pill1"

/obj/item/reagent_containers/pill/myelamine/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("myelamine", 15)
	reagents.add_reagent("inaprovaline", 10)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/hyronalin // CHOMPEdit - Removal of obj/item/weapon
	name = "Hyronalin (15u)"
	desc = "Hyronalin is a medicinal drug used to counter the effect of radiation poisoning."
	icon_state = "pill4"

/obj/item/reagent_containers/pill/hyronalin/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("hyronalin", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/arithrazine // CHOMPEdit - Removal of obj/item/weapon
	name = "Arithrazine (5u)"
	desc = "Arithrazine is an unstable medication used for the most extreme cases of radiation poisoning."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/arithrazine/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("arithrazine", 5)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/corophizine // CHOMPEdit - Removal of obj/item/weapon
	name = "Corophizine (5u)"
	desc = "A wide-spectrum antibiotic drug. Powerful and uncomfortable in equal doses."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/corophizine/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("corophizine", 5)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/vermicetol // CHOMPEdit - Removal of obj/item/weapon
	name = "Vermicetol (15u)"
	desc = "An extremely potent drug to treat physical injuries."
	icon_state = "pill1"

/obj/item/reagent_containers/pill/vermicetol/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("vermicetol", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/healing_nanites // CHOMPEdit - Removal of obj/item/weapon
	name = "Healing nanites (30u)"
	desc = "Miniature medical robots that swiftly restore bodily damage."
	icon_state = "pill1"

/obj/item/reagent_containers/pill/healing_nanites/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("healing_nanites", 30)
	color = reagents.get_color()

/*CHOMPStation removal begin
/obj/item/reagent_containers/pill/sleevingcure // CHOMPEdit - Removal of obj/item/weapon
	name = "Vey-Med Resleeving Booster pill" //YW Edit
	desc = "A rare medication provided by Vey-Med that helps counteract negative side effects of using resleeving machinery. Numb tongue before swallowing." //YW Edit
	icon_state = "pill3"

/obj/item/reagent_containers/pill/sleevingcure/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("sleevingcure", 1)
	color = reagents.get_color()
*/ //CHOMPStation removal end

/obj/item/reagent_containers/pill/airlock // CHOMPEdit - Removal of obj/item/weapon
	name = "\'Airlock\' Pill"
	desc = "Neutralizes toxins and provides a mild analgesic effect."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/airlock/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	reagents.add_reagent("anti_toxin", 15)
	reagents.add_reagent("paracetamol", 5)
