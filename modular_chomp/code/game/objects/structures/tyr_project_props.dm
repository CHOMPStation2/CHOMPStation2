/obj/structure/prop/blackbox/tyr_precursor_a
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_a)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_a

/obj/structure/prop/blackbox/tyr_precursor_b
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_b)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_b

/obj/structure/prop/blackbox/tyr_precursor_c
	catalogue_data = list(/datum/category_item/catalogue/information/blackbox/tyr_precursor_c)

/datum/category_item/catalogue/information/blackbox/tyr_precursor_c

//oooh, shiny
/obj/structure/prop/tyr_elevator //This won't function for a while, if ever
	name = "odd elevator"
	desc = "A strange metal cylandir. Seems sealed shut."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "elevator"
	anchored = TRUE

/obj/machinery/door/blast/puzzle/tyrdoor
	name = "strange door"
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'

/obj/machinery/door/blast/puzzle/tyrdoor
	name = "strange door"
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state_open = "open_door"
	icon_state_closed = "star_door"
	icon_state = "star_door"

/obj/machinery/door/blast/puzzle/tyrdoor/finale
	name = "strange door"
	desc = "A strange door. With no way to open it, they will remain shut for quite some time.."
	icon_state_closed = "final_door"

//Okay, actual special puzzle doors for reals
/obj/machinery/door/blast/puzzle/tyrdoor/keypad
	icon_state_closed = "star_door"
	var/list/code = list()
	var/list/lastattempt = list()
	var/codelen = 6

/obj/machinery/door/blast/puzzle/tyrdoor/keypad/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/multitool))
		to_chat(user, span_notice("The door is locked."))
		var/input = tgui_input_text(usr, "Enter [codelen] digits. All digits must be unique.", "Deca-Code Lock", "")
		if(!Adjacent(user))
			return
		var/list/sanitised = list()
		var/sanitycheck = 1
		for(var/i=1,i<=length(input),i++) //put the guess into a list
			sanitised += text2num(copytext(input,i,i+1))
		for(var/i=1,i<=(length(input)-1),i++) //compare each digit in the guess to all those following it
			for(var/j=(i+1),j<=length(input),j++)
				if(sanitised[i] == sanitised[j])
					sanitycheck = null //if a digit is repeated, reject the input

		if(input == null || sanitycheck == null || length(input) != codelen)
			to_chat(user, span_notice("You leave the lock alone."))
		else if(check_input(input))
			to_chat(user, span_notice("The door unlocks and open!"))
			playsound(src, 'sound/machines/lockreset.ogg', 50, 1)
			open()
		else
			visible_message(span_warning("A red light on \the [src]'s control panel flashes briefly."))
	..()

/obj/machinery/door/blast/puzzle/tyrdoor/keypad/proc/check_input(var/input)
	if(length(input) != codelen)
		return 0

	. = 1
	lastattempt.Cut()
	for(var/i in 1 to codelen)
		var/guesschar = copytext(input, i, i+1)
		lastattempt += guesschar
		if(guesschar != code[i])
			. = 0

/obj/machinery/door/blast/puzzle/tyrdoor/firedoor
	icon_state_closed = "fog_door"
	var/heatcheck = 300

/obj/machinery/door/blast/puzzle/tyrdoor/firedoor/proc/ignite(exposed_temperature)
	if(exposed_temperature > heatcheck)
		open()

/*
/obj/machinery/door/blast/puzzle/tyrdoor/

/obj/machinery/door/blast/puzzle/tyrdoor/
*/

/obj/machinery/door/blast/tyremittercheck //Desire is for them to set up an emitter, and break the door that way.
	name = "strange door"
	desc = "A strange door, but seems weaker then others. May break under extreme firepower.."
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state_closed = "ultra_blast_door"
	health = 4500

/*
//Funky Buildings
/obj/machinery/restoration_cell
	name = "restoration cell"
	desc = "A precusor device that generators a healing fluid"
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state = "pod_preview"
	density = TRUE
	anchored = TRUE

	use_power = USE_POWER_IDLE
	idle_power_usage = 200
	active_power_usage = 7500
	buckle_lying = FALSE
	buckle_dir = SOUTH

	var/mob/living/carbon/occupant = null

/obj/machinery/restoration_cell/attackby(var/obj/item/G as obj, var/mob/user as mob)
	if(istype(G, /obj/item/grab))
		var/obj/item/grab/grab = G
		if(!ismob(grab.affecting))
			return
		if(occupant)
			to_chat(user,span_warning("\The [src] is already occupied by [occupant]."))
		if(grab.affecting.has_buckled_mobs())
			to_chat(user, span_warning("\The [grab.affecting] has other entities attached to it. Remove them first."))
			return
		var/mob/M = grab.affecting
		qdel(grab)
		put_mob(M)

	return

/obj/machinery/restoration_cell/proc/process_occupant()
	if(occupant)
		if(occupant.radiation || occupant.accumulated_rads)
			occupant.radiation -= 40
			occupant.accumulated_rads -= 40
		occupant.heal_organ_damage(8,8)

/obj/machinery/restoration_cell/proc/go_out()
	if(!(occupant))
		return
	//for(var/obj/O in src)
	//	O.loc = src.loc
	if(occupant.client)
		occupant.client.eye = occupant.client.mob
		occupant.client.perspective = MOB_PERSPECTIVE
	vis_contents -= occupant
	occupant.pixel_x = occupant.default_pixel_x
	occupant.pixel_y = occupant.default_pixel_y
	occupant.loc = get_step(src.loc, SOUTH)
	unbuckle_mob(occupant, force = TRUE)
	occupant = null
	update_use_power(USE_POWER_IDLE)
	return

/obj/machinery/restoration_cell/proc/put_mob(mob/living/carbon/M as mob)
	if(stat & (NOPOWER|BROKEN))
		to_chat(usr, span_warning("The cryo cell is not functioning."))
		return
	if(!istype(M))
		to_chat(usr, span_danger("The cryo cell cannot handle such a lifeform!"))
		return
	if(occupant)
		to_chat(usr, span_danger("The cryo cell is already occupied!"))
		return
	if(M.abiotic())
		to_chat(usr, span_warning("Subject may not have abiotic items on."))
		return
	if(M.client)
		M.client.perspective = EYE_PERSPECTIVE
		M.client.eye = src
	M.stop_pulling()
	M.loc = src
	M.ExtinguishMob()
	if(M.health > -100 && (M.health < 0 || M.sleeping))
		to_chat(M, span_notice("<b>You feel a warm liquid surround you.</b>"))
	occupant = M
	buckle_mob(occupant, forced = TRUE, check_loc = FALSE)
	vis_contents |= occupant
	occupant.pixel_y += 19
	update_use_power(USE_POWER_ACTIVE)
	add_fingerprint(usr)
	update_icon()
	return 1

/obj/machinery/restoration_cell/verb/move_eject()
	set name = "Eject occupant"
	set category = "Object"
	set src in oview(1)
	if(usr == occupant)//If the user is inside the tube...
		if(usr.stat == 2)//and he's not dead....
			return
		to_chat(usr, span_notice("Release sequence activated. This will take one minute."))
		sleep(600)
		if(!src || !usr || !occupant || (occupant != usr)) //Check if someone's released/replaced/bombed him already
			return
		go_out()//and release him from the eternal prison.
	else
		if(usr.stat != 0)
			return
		go_out()
	add_fingerprint(usr)
	return

/obj/machinery/restoration_cell/verb/move_inside()
	set name = "Move Inside"
	set category = "Object"
	set src in oview(1)
	if(isliving(usr))
		var/mob/living/L = usr
		if(L.has_buckled_mobs())
			to_chat(L, span_warning("You have other entities attached to yourself. Remove them first."))
			return
		if(L.stat != CONSCIOUS)
			return
		put_mob(L)

*/

//Rocc and stone


/obj/structure/outcrop/diamond/tyr
	mindrop = 4
	upperdrop = 8

/obj/structure/outcrop/phoron/tyr
	mindrop = 8
	upperdrop = 16

/obj/structure/outcrop/iron/tyr
	mindrop = 20
	upperdrop = 40

/obj/structure/outcrop/coal/tyr
	mindrop = 20
	upperdrop = 40

/obj/structure/outcrop/lead/tyr
	mindrop = 4
	upperdrop = 10

/obj/structure/outcrop/gold/tyr
	mindrop = 8
	upperdrop = 12

/obj/structure/outcrop/silver/tyr
	mindrop = 12
	upperdrop = 16

/obj/structure/outcrop/platinum/tyr
	mindrop = 4
	upperdrop = 10

/obj/structure/outcrop/uranium/tyr
	mindrop = 8
	upperdrop = 16

/obj/structure/outcrop/hydrogen
	name = "spiky outcrop"
	desc = "A spiky rocky outcrop."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "outcrop-hydrogen"
	mindrop = 4
	upperdrop = 8
	outcropdrop = /obj/item/ore/hydrogen

/obj/structure/outcrop/verdantium
	name = "spiky outcrop"
	desc = "A spiky rocky outcrop."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "outcrop-verdantium"
	mindrop = 4
	upperdrop = 8
	outcropdrop = /obj/item/ore/verdantium

/obj/random/tyroutcrop //In case you want an outcrop without pre-determining the type of ore.
	name = "random rock outcrop"
	desc = "This is a random rock outcrop."
	icon = 'icons/obj/outcrop.dmi'
	icon_state = "outcrop-random"


/obj/random/tyroutcrop/item_to_spawn()
	return pick(prob(3);/obj/structure/outcrop/verdantium,
				prob(1);/obj/structure/outcrop/iron/tyr,
				prob(1);/obj/structure/outcrop/coal/tyr,
				prob(1);/obj/structure/outcrop/silver/tyr,
				prob(1);/obj/structure/outcrop/gold/tyr,
				prob(1);/obj/structure/outcrop/uranium/tyr,
				prob(3);/obj/structure/outcrop/diamond/tyr,
				prob(1);/obj/structure/outcrop/platinum/tyr,
				prob(5);/obj/structure/outcrop/weathered_gate,
				prob(3);/obj/structure/outcrop/hydrogen,
				prob(1);/obj/structure/outcrop/lead/tyr)
