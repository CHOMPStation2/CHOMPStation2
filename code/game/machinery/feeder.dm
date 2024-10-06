/obj/machinery/feeder
	name = "\improper Feeder"
	icon = 'icons/obj/feeder.dmi'
	desc = "This is a feeder. Put in a reagent container, then click and drag the feeder to someone!"
	anchored = FALSE
	density = FALSE
	var/mob/living/carbon/human/attached = null
	var/obj/item/reagent_containers/beaker = null

/obj/machinery/feeder/update_icon()
	if(attached)
		icon_state = "feeding"
	else
		icon_state = ""

	overlays.Cut()

	if(beaker)
		var/datum/reagents/reagents = beaker.reagents
		if(reagents.total_volume)
			var/image/filling = image('icons/obj/feeder.dmi', src, "reagent")

			var/percent = round((reagents.total_volume / beaker.volume) * 100)
			switch(percent)
				if(0 to 9)		filling.icon_state = "reagent0"
				if(10 to 19) 	filling.icon_state = "reagent10"
				if(20 to 44)	filling.icon_state = "reagent20"
				if(45 to 59)	filling.icon_state = "reagent45"
				if(60 to 74)	filling.icon_state = "reagent60"
				if(75 to 89)	filling.icon_state = "reagent75"
				if(90 to 94)	filling.icon_state = "reagent90"
				if(95 to INFINITY)	filling.icon_state = "reagent100"

			filling.icon += reagents.get_color()
			overlays += filling

/obj/machinery/feeder/MouseDrop(over_object, src_location, over_location)
	..()
	if(!isliving(usr))
		return

	if(attached)
		visible_message("The feeding tube is pulled out of [attached].")
		attached = null
		update_icon()
		return

	if(in_range(src, usr) && ishuman(over_object) && get_dist(over_object, src) <= 1)
		visible_message("[usr] inserts the feeding tube into \the [over_object].")
		attached = over_object
		update_icon()


/obj/machinery/feeder/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/reagent_containers))
		if(!isnull(beaker))
			. += "There is already a reagent container inserted!"
			return

		user.drop_item()
		W.loc = src
		beaker = W
		. += "You insert \the [W] into \the [src]."
		update_icon()
		return

	if(default_deconstruction_screwdriver(user, W))
		if(do_after(user, 15))
			to_chat(user, "You deconstruct the feeder.")
			new /obj/item/stack/material/plastic(src.loc, 4)
			if(beaker)
				beaker.loc = get_turf(src)
				beaker = null
			qdel(src)
		return


/obj/machinery/feeder/process()
	set background = 1

	if(attached)

		if(!(get_dist(src, attached) <= 1 && isturf(attached.loc)))
			visible_message("The tube is pulled out of [attached].")
			attached = null
			update_icon()
			return

	if(attached && beaker)
		// Give food
		if(beaker.volume > 0)
			var/transfer_amount = 2
			beaker.reagents.trans_to_mob(attached, transfer_amount, CHEM_INGEST)
			update_icon()

/obj/machinery/feeder/attack_hand(mob/user as mob)
	if(beaker)
		beaker.loc = get_turf(src)
		beaker = null
		update_icon()
	else
		return ..()

/obj/machinery/feeder/examine(mob/user)
	.=..()
	if(!(user in view(2)) && user != src.loc) return

	if(beaker)
		if(beaker.reagents && beaker.reagents.reagent_list.len)
			. += "<span class='notice'>Inserted is \a [beaker] with [beaker.reagents.total_volume] units of liquid.</span>"
		else
			. += "<span class='notice'>Inserted is an empty [beaker].</span>"
	else
		. += "<span class='notice'>No container is inserted.</span>"

	. += "<span class='notice'>[attached ? attached : "No one"] is being fed by it.</span>"

/obj/machinery/feeder/CanPass(atom/movable/mover, turf/target, height = 0, air_group = 0)
	if(height && istype(mover) && mover.checkpass(PASSTABLE)) //allow bullets, beams, thrown objects, mice, drones, and the like through.
		return 1
	return ..()
