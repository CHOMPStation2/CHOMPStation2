/obj/item/toy/figure/bounty_hunter
	name = "Space bounty hunter action figure"
	desc = "A \"Space Life\" brand bounty hunter action figure."
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "hunter"
	toysay = "The last greytide is in captivity. The station is at peace."

/obj/item/toy/sif
	name = "Sif planet model"
	desc = "A \"Space Life\" brand planet model of Sif, it's oddly cold to the touch."
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "sif"

/obj/item/toy/figure/station
	name = "NLS Southern Cross action figure"
	desc = "A \"Space Life\" brand figure of the NLS Southern Cross, the station you work in."
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "station"
	toysay = "Attention! Alert level elevated to blue."

/obj/item/toy/plushie/green_fox
	name = "green fox plushie"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "greenfox"
	pokephrase = "Weh!"

/obj/item/toy/plushie/dragon
	name = "dragon plushie"
	desc = "A soft plushie in the shape of a dragon. How ferocious!"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "reddragon"
	var/cooldown = FALSE

/obj/item/toy/plushie/dragon/Initialize(mapload)
	. = ..()
	if (pokephrase != "Rawr~!")
		pokephrase = pick("ROAR!", "RAWR!", "GAWR!", "GRR!", "GROAR!", "GRAH!", "Weh!", "Merp!")

/obj/item/toy/plushie/dragon/attack_self(mob/user)
	if(!cooldown)
		switch(pokephrase)
			if("Weh!")
				playsound(user, 'sound/voice/weh.ogg', 20, 0)
			if("Merp!")
				playsound(user, 'sound/voice/merp.ogg', 20, 0)
			else
				playsound(user, 'sound/voice/roarbark.ogg', 20, 0)
		cooldown = TRUE
		addtimer(VARSET_CALLBACK(src, cooldown, FALSE), 5 SECONDS, TIMER_DELETE_ME)
	return ..()

/obj/item/toy/plushie/dragon/green
	name = "green dragon plushie"
	icon_state = "greendragon"

/obj/item/toy/plushie/dragon/purple
	name = "purple dragon plushie"
	icon_state = "purpledragon"

/obj/item/toy/plushie/dragon/white_east
	name = "white eastern dragon plushie"
	icon_state = "whiteeasterndragon"

/obj/item/toy/plushie/dragon/red_east
	name = "red eastern dragon plushie"
	icon_state = "redeasterndragon"

/obj/item/toy/plushie/dragon/green_east
	name = "green eastern dragon plushie"
	icon_state = "greeneasterndragon"

/obj/item/toy/plushie/dragon/gold_east
	name = "golden eastern dragon plushie"
	desc = "A soft plushie of a shiny golden dragon. Made of Real* gold!"
	icon_state = "goldeasterndragon"
	pokephrase = "Rawr~!"

/obj/item/toy/plushie/dragon/customizable
	name = "custom dragon plushie"
	icon_state = "blankdurg"

	var/base = "blankdurg"
	var/underbelly = "blankdurg2"
	var/wings = "classic_w"
	var/horns = "classic_h"
	var/extra = ""

	var/base_color = COLOR_WHITE
	var/underbelly_color = COLOR_WHITE
	var/wing_color = COLOR_WHITE
	var/wing_color_2 = COLOR_WHITE
	var/horn_color = COLOR_WHITE
	var/extra_color = COLOR_WHITE



/obj/item/toy/plushie/dragon/customizable/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/toy/plushie/dragon/customizable/update_icon()
	cut_overlays()
	..()

	var/list/overlays = list()
	var/image/base_image = image(icon_state = base)
	var/image/underbelly_image = image(icon_state = underbelly)

	base_image.color = base_color
	underbelly_image.color = underbelly_color

	overlays += base_image
	overlays += underbelly_image

	if(wings != "")
		var/image/wings_2 = image(icon_state = "[wings]_2")
		wings_2.color = wing_color
		overlays += wings_2
	if(horns != "")
		var/image/horns_2 = image(icon_state = "[horns]_2")
		horns_2.color = horn_color
		overlays += horns_2
	if(extra != "")
		var/image/extra_image = image(icon_state = extra)
		extra_image.color = extra_color
		overlays += extra_image
	if(wings != "")
		var/image/wings_1 = image(icon_state = "[wings]_1")
		var/image/wings_misc = image(icon_state = "[wings]_misc")
		wings_1.color = wing_color
		wings_misc.color = wing_color_2
		overlays += wings_1
		overlays += wings_misc
	if(horns != "")
		var/image/horns_1 = image(icon_state = "[horns]_1")
		horns_1.color = horn_color
		overlays += horns_1

	add_overlay(overlays)

/obj/item/toy/plushie/dragon/customizable/verb/Customize()
	set category = "Object"
	set src in usr

	var/list/wings_choice = list("None" = "", "Classic" = "classic_w", "Fairy" = "fairy_w", "Angular" = "angular_w")
	var/list/horns_choice = list("None" = "", "Classic" = "classic_h", "Double" = "double_h", "Thick" = "thick_h")
	var/list/extra_choice = list("None" = "", "Fur" = "durg_fur", "Spines" = "durg_spines")

	var/new_base_color = tgui_color_picker(usr, "Please select base color", "Base Color", base_color)
	var/new_underbelly_color = tgui_color_picker(usr, "Please select secondary color", "Secondary Color", underbelly_color)

	if(new_base_color)
		base_color = new_base_color
	if(new_underbelly_color)
		underbelly_color = new_underbelly_color

	var/new_wings = tgui_input_list(usr, "Please select wings", "Wings", wings_choice, wings)
	if(new_wings)
		wings = wings_choice[new_wings]
		if(wings != "")
			var/new_wing_color = tgui_color_picker(usr, "Please select wing color", "Wing Color", wing_color)
			var/new_wing_color_2 = tgui_color_picker(usr, "Please select secondary wing color", "Secondary Wing Color", wing_color_2)
			if(new_wing_color)
				wing_color = new_wing_color
			if(new_wing_color_2)
				wing_color_2 = new_wing_color_2

	var/new_horns = tgui_input_list(usr, "Please select horns", "Horns", horns_choice, horns)
	if(new_horns)
		horns = horns_choice[new_horns]
		if(horns != "")
			var/new_horn_color = tgui_color_picker(usr, "Please select horn color", "Horn Color", horn_color)
			if(new_horn_color)
				horn_color = new_horn_color

	var/new_extra = tgui_input_list(usr, "Please select extra", "Extra", extra_choice, extra)
	if(new_extra)
		extra = extra_choice[new_extra]
		if(extra != "")
			var/new_extra_color = tgui_color_picker(usr, "Please select extra color", "Extra Color", extra_color)
			if(new_extra_color)
				extra_color = new_extra_color

	update_icon()

/obj/item/toy/plushie/teppi
	name = "teppi plushie"
	desc = "A soft, fluffy plushie made out of real teppi fur!"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "teppi"
	pokephrase = "Gyooooooooh!"

/obj/item/toy/plushie/teppi/alt
	name = "teppi plush"
	desc = "No teppi were harmed in the creation of this plushie."
	icon_state = "teppialt"

/obj/item/toy/plushie/teppi/attack_self(mob/user as mob)
	if(user.a_intent == I_HURT || user.a_intent == I_GRAB)
		playsound(user, 'sound/voice/teppi/roar.ogg', 10, 0)
	else
		var/teppi_noise = pick(
			'sound/voice/teppi/whine1.ogg',
			'sound/voice/teppi/whine2.ogg')
		playsound(user, teppi_noise, 10, 0)
		src.visible_message(span_notice("Gyooooooooh!"))
	return ..()

/*
 * Hand buzzer
 */
/obj/item/clothing/gloves/ring/buzzer/toy
	name = "steel ring"
	desc = "Torus shaped finger decoration. It has a small piece of metal on the palm-side."
	icon_state = "seal-signet"
	drop_sound = 'sound/items/drop/ring.ogg'

/obj/item/clothing/gloves/ring/buzzer/toy/Touch(var/atom/A, var/proximity)
	if(proximity && istype(usr, /mob/living/carbon/human))

		return zap(usr, A, proximity)
	return 0

/obj/item/clothing/gloves/ring/buzzer/toy/zap(var/mob/living/carbon/human/user, var/atom/movable/target, var/proximity)
	. = FALSE
	if(user.a_intent == I_HELP && battery.percent() >= 50)
		if(isliving(target))
			var/mob/living/L = target

			to_chat(L, span_warning("You feel a powerful shock!"))
			if(!.)
				playsound(L, 'sound/effects/sparks7.ogg', 40, 1)
				L.electrocute_act(battery.percent() * 0, src)
			return .

	return 0
