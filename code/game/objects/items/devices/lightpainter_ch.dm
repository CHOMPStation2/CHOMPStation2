// Light Painter.


/obj/item/lightpainter
	name = "light painter"
	desc = "A device to configure the emission color of lighting fixtures. Use this device in-hand to set/reset the color. Use the device on a light fixture to assign the color."
	icon = 'icons/obj/janitor.dmi'
	icon_state = "lightreplacer0"
	color = "#bbbbff"
	slot_flags = SLOT_BELT

	matter = list(MAT_STEEL = 5000,MAT_GLASS = 1500)

	var/static/dcolor = "#e0eff0"
	var/static/dnightcolor = "#efcc86"
	//set color values.
	var/setcolor = "#e0eff0"
	var/setnightcolor = "#efcc86"
	var/resetmode = 1

	var/dimming = 0.7 // multiply value to dim lights from setcolor to nightcolor


/obj/item/lightpainter/New()
	. = ..()

/obj/item/lightpainter/examine(mob/user)
	. = ..()
	if(get_dist(user, src) <= 2)
		if(resetmode)
			. += "It is currently resetting light colors."
		else
			. += "It is currently coloring lights."

/obj/item/lightpainter/attack_self(mob/user)

	if(!resetmode)
		resetmode = 1
		to_chat(usr, "Painter reset.")
	else
		var/color_input = input(usr,"","Choose Light Color",setcolor) as color|null
		if(color_input)
			setcolor = sanitize_hexcolor(color_input)
			var/list/setcolorRGB = hex2rgb(setcolor)
			var/setcolorR = num2hex(setcolorRGB[1] * dimming, 2)
			var/setcolorG = num2hex(setcolorRGB[2] * dimming, 2)
			var/setcolorB = num2hex(setcolorRGB[3] * dimming, 2)
			setnightcolor = addtext("#", setcolorR, setcolorG, setcolorB)
			resetmode = 0
			to_chat(usr, "Painter color set.")


/obj/item/lightpainter/proc/ColorLight(var/obj/machinery/light/target, var/mob/living/U)

	src.add_fingerprint(U)

	if(resetmode)
		to_chat(U, "<span class='notice'>You reset the color of the [target.get_fitting_name()].</span>")
		target.brightness_color = dcolor
		target.brightness_color_ns = dnightcolor
	else
		to_chat(U, "<span class='notice'>You set the color of the [target.get_fitting_name()].</span>")

		target.brightness_color = setcolor
		target.brightness_color_ns = setnightcolor

	if(target.nightshift_enabled)
		target.light_color = target.brightness_color_ns
	else
		target.light_color = target.brightness_color

	target.set_light(0)
	target.update()