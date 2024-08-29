#ifdef T_BOARD_MECHA
#error T_BOARD_MECHA already defined elsewhere, we can't use it.
#endif
#define T_BOARD_MECHA(name)	"exosuit module circuit board (" + (name) + ")"

/obj/item/circuitboard/mecha // CHOMPEdit - Removal of obj/item/weapon
	name = "exosuit circuit board"
	icon = 'icons/obj/module.dmi'
	icon_state = "std_mod"
	board_type = "other"

/obj/item/circuitboard/mecha/ripley // CHOMPEdit - Removal of obj/item/weapon
		origin_tech = list(TECH_DATA = 3)

/obj/item/circuitboard/mecha/ripley/peripherals // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Ripley peripherals control")
		icon_state = "mcontroller"

/obj/item/circuitboard/mecha/ripley/main // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Ripley central control")
		icon_state = "mainboard"

/obj/item/circuitboard/mecha/gygax // CHOMPEdit - Removal of obj/item/weapon
		origin_tech = list(TECH_DATA = 4)

/obj/item/circuitboard/mecha/gygax/peripherals // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Gygax peripherals control")
		icon_state = "mcontroller"

/obj/item/circuitboard/mecha/gygax/targeting // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Gygax weapon control and targeting")
		icon_state = "mcontroller"
		origin_tech = list(TECH_DATA = 4, TECH_COMBAT = 4)

/obj/item/circuitboard/mecha/gygax/medical // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Serenity medical control")
		icon_state = "mcontroller"
		origin_tech = list(TECH_DATA = 4, TECH_BIO = 4)

/obj/item/circuitboard/mecha/gygax/main // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Gygax central control")
		icon_state = "mainboard"

/obj/item/circuitboard/mecha/durand // CHOMPEdit - Removal of obj/item/weapon
		origin_tech = list(TECH_DATA = 4)

/obj/item/circuitboard/mecha/durand/peripherals // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Durand peripherals control")
		icon_state = "mcontroller"

/obj/item/circuitboard/mecha/durand/targeting // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Durand weapon control and targeting")
		icon_state = "mcontroller"
		origin_tech = list(TECH_DATA = 4, TECH_COMBAT = 4)

/obj/item/circuitboard/mecha/durand/main // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Durand central control")
		icon_state = "mainboard"

/obj/item/circuitboard/mecha/phazon // CHOMPEdit - Removal of obj/item/weapon

/obj/item/circuitboard/mecha/phazon/peripherals // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Phazon peripherals control")
		icon_state = "mcontroller"
		origin_tech = list(TECH_DATA = 6, TECH_ILLEGAL = 6)

/obj/item/circuitboard/mecha/phazon/targeting // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Phazon weapon control and targeting")
		icon_state = "mcontroller"
		origin_tech = list(TECH_DATA = 6, TECH_COMBAT = 7)

/obj/item/circuitboard/mecha/phazon/main // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Phazon central control")
		origin_tech = list(TECH_DATA = 6, TECH_BLUESPACE = 5)
		icon_state = "mainboard"

/obj/item/circuitboard/mecha/honker // CHOMPEdit - Removal of obj/item/weapon
		origin_tech = list(TECH_DATA = 4)

/obj/item/circuitboard/mecha/honker/peripherals // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("H.O.N.K peripherals control")
		icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/targeting // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("H.O.N.K weapon control and targeting")
		icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/main // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("H.O.N.K central control")
		icon_state = "mainboard"


/obj/item/circuitboard/mecha/odysseus // CHOMPEdit - Removal of obj/item/weapon
		origin_tech = list(TECH_DATA = 3)

/obj/item/circuitboard/mecha/odysseus/peripherals // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Odysseus peripherals control")
		icon_state = "mcontroller"

/obj/item/circuitboard/mecha/odysseus/main // CHOMPEdit - Removal of obj/item/weapon
		name = T_BOARD_MECHA("Odysseus central control")
		icon_state = "mainboard"

/obj/item/circuitboard/mecha/imperion // CHOMPEdit - Removal of obj/item/weapon
		name = "Alien Circuit"
		origin_tech = list(TECH_DATA = 5, TECH_BLUESPACE = 3, TECH_PRECURSOR = 1)
		icon = 'icons/obj/abductor.dmi'
		icon_state = "circuit"

/obj/item/circuitboard/mecha/imperion/main // CHOMPEdit - Removal of obj/item/weapon
		desc = "It is marked with a <span class='alien'>strange glyph</span>."

/obj/item/circuitboard/mecha/imperion/peripherals // CHOMPEdit - Removal of obj/item/weapon
		desc = "It is marked with a <span class='alien'>pulsing glyph</span>."

/obj/item/circuitboard/mecha/imperion/targeting // CHOMPEdit - Removal of obj/item/weapon
		desc = "It is marked with an <span class='alien'>ominous glyph</span>."

/obj/item/circuitboard/mecha/imperion/phasing // CHOMPEdit - Removal of obj/item/weapon
		desc = "It is marked with a <span class='alien'>disturbing glyph</span>."

/obj/item/circuitboard/mecha/imperion/damaged // CHOMPEdit - Removal of obj/item/weapon
		name = "Damaged Alien Circuit"
		desc = "It is marked with a <span class='alien'>constantly shifting glyph</span>."
		origin_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 1, TECH_PRECURSOR = 2)

//Undef the macro, shouldn't be needed anywhere else
#undef T_BOARD_MECHA
