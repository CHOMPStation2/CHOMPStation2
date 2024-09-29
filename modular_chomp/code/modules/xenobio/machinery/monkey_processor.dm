//To help streamline virology work. Would be broken if put in Xenobio so maybe perhaps don't do that.
//Or do. I'm just a dev, not your boss.

/obj/machinery/processor/monkey
	name = "monkey processor"
	desc = "An industrial grinder used to automate the process of monkey recycling."
	description_info = "Clickdrag dead monkeys to it to insert them. It will make a new monkey cube for every monkey it processes."

/obj/item/circuitboard/processor/monkey
	name = T_BOARD("monkey processor")
	build_path = /obj/machinery/processor/monkey
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 2)

/obj/machinery/processor/monkey/begin_processing()
	if(processing)
		return // Already doing it.
	processing = TRUE
	playsound(src, 'sound/machines/juicer.ogg', 50, 1)
	for(var/atom/movable/AM in to_be_processed)
		extract(AM)
		sleep(1 SECONDS)

	while(monkeys_recycled >= 1)
		new /obj/item/reagent_containers/food/snacks/monkeycube(get_turf(src))
		playsound(src, 'sound/effects/splat.ogg', 50, 1)
		monkeys_recycled -= 1
		sleep(1 SECOND)

	processing = FALSE
	playsound(src, 'sound/machines/ding.ogg', 50, 1)

/obj/machinery/processor/monkey/extract(var/atom/movable/AM)
	if(istype(AM, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = AM
		playsound(src, 'sound/effects/splat.ogg', 50, 1)
		to_be_processed.Remove(M)
		qdel(M)
		monkeys_recycled++
		sleep(1 SECOND)

/obj/machinery/processor/monkey/can_insert(var/atom/movable/AM)
	if(istype(AM, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = AM
		if(!istype(H.species, /datum/species/monkey))
			return FALSE
		if(H.stat != DEAD)
			return FALSE
		return TRUE
	return FALSE