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

/obj/item/toy/plushie/red_dragon
	name = "red dragon plushie"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "reddragon"
	pokephrase = "RAWR!"

/obj/item/toy/plushie/green_dragon
	name = "green dragon plushie"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "greendragon"
	pokephrase = "GRR!"

/obj/item/toy/plushie/purple_dragon
	name = "purple dragon plushie"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "purpledragon"
	pokephrase = "GRAH!"

/obj/item/toy/plushie/white_eastdragon
	name = "white eastern dragon plushie"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "whiteeasterndragon"
	pokephrase = "Rooar!"

/obj/item/toy/plushie/red_eastdragon
	name = "red eastern dragon plushie"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "redeasterndragon"
	pokephrase = "Whoosh!"

/obj/item/toy/plushie/green_eastdragon
	name = "green eastern dragon plushie"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "greeneasterndragon"
	pokephrase = "Fwoomp!"

/obj/item/toy/plushie/gold_eastdragon
	name = "golden eastern dragon plushie"
	desc = "A soft plushie of a shiny golden dragon. Made of Real* gold!"
	icon = 'icons/obj/toy_ch.dmi'
	icon_state = "goldeasterndragon"
	pokephrase = "Shine!"

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
