/datum/gear/plushieteshcolor
	display_name = "plushie, lifelike teshari, colorable"
	path = /obj/item/toy/plushie/teshari/w_yw

/datum/gear/plushieteshcolor/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/medication
	display_name = "medication selection"
	description = "Varying medications that might've been prescribed, gotten illicitly, or otherwise acquired."
	cost = 2
	path = /obj/item/storage/pill_bottle/citalopram

/datum/gear/medication/New()
	..()
	var/list/medications = list(
	"Pill Bottle (Citalopram)" = /obj/item/storage/pill_bottle/citalopram,
	"Pill Bottle (Methylphenidate)" = /obj/item/storage/pill_bottle/methylphenidate,
	"Pill Bottle (Paroxetine)" = /obj/item/storage/pill_bottle/paroxetine,
	"Pill Bottle (Paracetamol)" = /obj/item/storage/pill_bottle/paracetamol,
	"Pill Bottle (Adranol)" = /obj/item/storage/pill_bottle/adranol,
	"Pill Bottle (Bliss)" = /obj/item/storage/pill_bottle/happy,
	"Pill Bottle (Aphrodisiac)" = /obj/item/storage/pill_bottle/aphrodisiac
	)
	gear_tweaks += new/datum/gear_tweak/path(medications)
