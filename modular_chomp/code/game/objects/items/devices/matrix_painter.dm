//Shamelessly duplicated code from colormate.dm

/obj/item/device/matrix_painter
	name = "Handheld painting device"
	desc = "A handheld version of the colormate that can repaint anything."
	icon = 'icons/obj/tools_vr.dmi'
	icon_state = "debug_rcd"
	var/obj/machinery/gear_painter/always_on/painter
	var/allow_mobs

/obj/item/paint_card
	name = "SMPTE color card"
	desc = "Something to reference for color correction"
	icon = 'modular_chomp/icons/system/paint_card32x32.dmi'

/obj/item/device/matrix_painter/badmin
	name = "Enhanced painting device"
	desc = "This one works on mobs too."
	allow_mobs = 1

/obj/item/device/matrix_painter/Initialize()
	.=..()
	painter = new(src)

/obj/item/device/matrix_painter/attack_self(var/mob/user)
	painter.tgui_interact(user)

/obj/item/device/matrix_painter/pre_attack(var/atom/A, var/mob/user, proximity, params)
	if((!proximity || !painter || (istype(A, /mob))) && !allow_mobs)
		return
	painter.do_paint(user, A)