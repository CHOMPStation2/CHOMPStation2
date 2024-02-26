/datum/gear/shoes/boots/winter/medical
	allowed_roles = list("Medical Doctor","Chief Medical Officer","Chemist","Paramedic","Geneticist", "Psychiatrist", "Field Medic") //CHOMP keep explo

/datum/gear/shoes/black/cuffs
	display_name = "legwraps, black"
	path = /obj/item/clothing/shoes/black/cuffs

/datum/gear/shoes/black/cuffs/blue
	display_name = "legwraps, blue"
	path = /obj/item/clothing/shoes/black/cuffs/blue

/datum/gear/shoes/black/cuffs/red
	display_name = "legwraps, red"
	path = /obj/item/clothing/shoes/black/cuffs/red

/datum/gear/shoes/siren
	display_name = "boots, Siren"
	path = /obj/item/clothing/shoes/boots/fluff/siren

/datum/gear/shoes/toeless
	display_name = "toe-less jackboots"
	path = /obj/item/clothing/shoes/boots/jackboots/toeless

/datum/gear/shoes/singer_blue
	display_name = "blue performer's boots"
	path = /obj/item/clothing/shoes/boots/singer

/datum/gear/shoes/singer_yellow
	display_name = "yellow performer's boots"
	path = /obj/item/clothing/shoes/boots/singer/yellow

/datum/gear/shoes/antediluvian
	display_name = "legwraps, antediluvian"
	path = /obj/item/clothing/shoes/antediluvian

/datum/gear/shoes/flats/alt
	display_name = "flats, alt"
	path = /obj/item/clothing/shoes/flats/white/color/alt

/datum/gear/shoes/sandals_elegant
	display_name = "sandals, elegant"
	path = /obj/item/clothing/shoes/sandals_elegant

/datum/gear/shoes/sandals_elegant/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

//CHOMP ADDITION, trying to make a no shoes shoe option
/datum/gear/shoes/none
	display_name = "Adjust - No Shoes"
	path = /obj/item/clothing/shoes/none
	cost = 0

/obj/item/clothing/shoes/none
	name = "No Shoes"
	desc = "shoeless?"
	icon_state = ""
	species_restricted = null

/obj/item/clothing/shoes/none/Initialize()
	..()
	if(istype(loc, /mob))
		var/mob/m = loc
		m.drop_from_inventory(src, get_turf(m))
		m.update_inv_shoes()
		moveToNullspace()
	return INITIALIZE_HINT_QDEL //Fuck them shoes
