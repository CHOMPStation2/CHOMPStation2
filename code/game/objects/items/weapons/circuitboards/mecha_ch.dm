#ifdef T_BOARD_CHMecha
#error T_BOARD_CHMECHA already defined elsewhere, we can't use it.
#endif
#define T_BOARD_CHMECHA(name)	"exosuit module circuit board (" + (name) + ")"
#ifdef T_BOARD_FIGHTER
#error T_BOARD_FIGHTER already defined elsewhere, we can't use it.
#endif
#define T_BOARD_FIGHTER(name)	"fightercraft circuit board (" + (name) + ")"

//renaming CHmecha for Chomp mecha to allow for more to be made if needed.

/obj/item/weapon/circuitboard/mecha/scarab
		origin_tech = list(TECH_DATA = 4)

/obj/item/weapon/circuitboard/mecha/scarab/peripherals
		name = T_BOARD_CHMECHA("Scarab peripherals control")
		icon_state = "mcontroller"

/obj/item/weapon/circuitboard/mecha/scarab/targeting
		name = T_BOARD_CHMECHA("Scarab weapon control and targeting")
		icon_state = "mcontroller"
		origin_tech = list(TECH_DATA = 4, TECH_COMBAT = 4)

/obj/item/weapon/circuitboard/mecha/scarab/main
		name = T_BOARD_CHMECHA("Scarab central control")
		icon_state = "mainboard"


///Fighters///

//Pinnace//

/obj/item/circuitboard/mecha/fighter/pinnace

/obj/item/circuitboard/mecha/fighter/pinnace/main
	name = T_BOARD_FIGHTER("Pinnace central control")
	origin_tech = list(TECH_DATA = 4, TECH_BIO = 2, TECH_BLUESPACE = 2)
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/fighter/pinnace/flight
	name = T_BOARD_FIGHTER("Pinnace flight control")
	icon_state = "mcontroller"
	origin_tech = list(TECH_DATA = 4, TECH_BLUESPACE = 2)

/obj/item/circuitboard/mecha/fighter/pinnace/targeting
	name = T_BOARD_FIGHTER("Pinnace weapon control and targeting")
	icon_state = "mcontroller"
	origin_tech = list(TECH_DATA = 4, TECH_COMBAT = 1)

/obj/item/circuitboard/mecha/fighter/pinnace/cockpitboard
	name = T_BOARD_FIGHTER("Pinnace manual flight control instruments")
	origin_tech = list(TECH_DATA = 4, TECH_BLUESPACE = 2)
	icon_state = "card_mod"

//Baron//

/obj/item/circuitboard/mecha/fighter/baron

/obj/item/circuitboard/mecha/fighter/baron/main
	name = T_BOARD_FIGHTER("Baron central control")
	icon_state = "mainboard"
	origin_tech = list(TECH_DATA = 6, TECH_BIO = 4, TECH_BLUESPACE = 5)

/obj/item/circuitboard/mecha/fighter/baron/flight
	name = T_BOARD_FIGHTER("Baron flight control")
	icon_state = "mcontroller"
	origin_tech = list(TECH_DATA = 6, TECH_BLUESPACE = 5)

/obj/item/circuitboard/mecha/fighter/baron/targeting
	name = T_BOARD_FIGHTER("Baron weapon control and targeting")
	icon_state = "mcontroller"
	origin_tech = list(TECH_DATA = 6, TECH_BIO = 4, TECH_COMBAT = 5)

/obj/item/circuitboard/mecha/fighter/baron/cockpitboard
	name = T_BOARD_FIGHTER("Baron manual flight control instruments")
	icon_state = "card_mod"
	origin_tech = list(TECH_DATA = 6, TECH_BLUESPACE = 5)

//Undef the macro, shouldn't be needed outside of fighter construction
#undef T_BOARD_FIGHTER