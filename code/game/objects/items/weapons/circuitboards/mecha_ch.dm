#ifdef T_BOARD_CHMecha
#error T_BOARD_CHMECHA already defined elsewhere, we can't use it.
#endif
#define T_BOARD_CHMECHA(name)	"exosuit module circuit board (" + (name) + ")"
//renaming CHmecha for Chomp mecha to allow for more to be made if needed.

/obj/item/circuitboard/mecha/scarab
		origin_tech = list(TECH_DATA = 4)

/obj/item/circuitboard/mecha/scarab/peripherals
		name = T_BOARD_CHMECHA("Scarab peripherals control")
		icon_state = "mcontroller"

/obj/item/circuitboard/mecha/scarab/targeting
		name = T_BOARD_CHMECHA("Scarab weapon control and targeting")
		icon_state = "mcontroller"
		origin_tech = list(TECH_DATA = 4, TECH_COMBAT = 4)

/obj/item/circuitboard/mecha/scarab/main
		name = T_BOARD_CHMECHA("Scarab central control")
		icon_state = "mainboard"
