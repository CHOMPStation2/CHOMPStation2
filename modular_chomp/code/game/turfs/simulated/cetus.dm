/turf/simulated/floor/water
	var/watercolor = null

/turf/simulated/floor/water/digestive_enzymes
	watercolor = "green"

/turf/simulated/floor/water/digestive_enzymes/nanites //i just wanted to map, why has it come to making such terrible crimes against humanity
	name = "nanite-infested tiles."
	desc = "This section of reinforced plating appears to host a colony of nanites between the tiles"
	icon = 'modular_chomp/icons/turf/nanitegoo.dmi'
	icon_state = "composite"
	water_icon = 'modular_chomp/icons/turf/nanitegoo.dmi'
	water_state = "goo_inactive"
	under_state = "reinforced"
	depth = 0
	movement_cost = 1
	mobstuff = FALSE
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	watercolor = "black"
	reagent_type = REAGENT_ID_LIQUIDPROTEAN
	var/digesting = FALSE
	var/active = FALSE
	var/usesmes = TRUE
	var/obj/machinery/power/smes/smes //when the nanites digest something, it becomes power in an SMES
	var/area/area

/turf/simulated/floor/water/digestive_enzymes/nanites/Initialize(mapload)
	. = ..()
	if(usesmes)
		for(var/obj/machinery/power/smes/M in GLOB.smeses)
			if(!M)
				continue
			if(!M.loc)
				continue
			if(!M.loc.loc)
				continue
			if(istype(M.loc.loc, /area/ai))
				smes = M //sets the SMES in the AI chamber to recieve power when something is digested

/turf/simulated/floor/water/digestive_enzymes/nanites/can_digest(atom/movable/AM) //copypasting the entire proc because we use an SMES instead of a linked mob
	. = FALSE
	if(!digesting)
		return FALSE
	if(AM.loc != src)
		return FALSE
	if(isitem(AM))
		var/obj/item/I = AM
		if(I.unacidable || I.throwing || I.is_incorporeal())
			return FALSE
		var/food = FALSE
		if(istype(I,/obj/item/reagent_containers/food))
			food = TRUE
		if(prob(95))	//Give people a chance to pick them up
			return TRUE
		I.visible_message(span_warning("\The [I] sizzles..."))
		var/yum = I.digest_act()	//Glorp
		if(istype(I , /obj/item/card))
			yum = 0		//No, IDs do not have infinite nutrition, thank you
		if(istype(I, /obj/item/cell))
			var/obj/item/cell/C = I
			yum = C.charge
		if(usesmes && linked_mob && yum)
			if(food)
				yum += 50
			smes.charge += yum
		return TRUE
	if(isliving(AM))
		var/mob/living/L = AM
		if(L.unacidable || !L.digestable || L.buckled || L.hovering || L.throwing || L.is_incorporeal())
			return FALSE
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(!H.pl_suit_protected())
				return TRUE
			if(H.resting && !H.pl_head_protected())
				return TRUE
		else return TRUE

/turf/simulated/floor/water/digestive_enzymes/nanites/digest_stuff(atom/movable/AM)	//copypasting the entire proc because we use an SMES instead of a linked mob
	. = FALSE

	var/damage = 1
	var/list/stuff = list()
	for(var/thing in src)
		if(can_digest(thing))
			stuff |= thing
	if(!stuff.len)
		return FALSE
	var/thing = pick(stuff)	//We only think about one thing at a time, otherwise things get wacky
	. = TRUE
	if(ishuman(thing))
		var/mob/living/carbon/human/H = thing
		if(!H)
			return
		visible_message(runemessage = "blub...")
		if(H.stat == DEAD)
			H.unacidable = TRUE	//Don't touch this one again, we're gonna delete it in a second
			H.release_vore_contents()
			for(var/obj/item/W in H)
				if(istype(W, /obj/item/organ/internal/mmi_holder/posibrain))
					var/obj/item/organ/internal/mmi_holder/MMI = W
					MMI.removed()
				if(istype(W, /obj/item/implant/backup) || istype(W, /obj/item/nif) || istype(W, /obj/item/organ))
					continue
				H.drop_from_inventory(W)
			if(linked_mob)
				var/how_much = H.mob_size + H.nutrition
				if(!H.ckey)
					how_much = how_much / 10	//Braindead mobs are worth less
				smes.charge += how_much
				H.mind?.vore_death = TRUE
				GLOB.prey_digested_roundstat++
			spawn(0)
			qdel(H)	//glorp
			return
		if(linked_mob)
			H.burn_skin(damage)
			if(linked_mob)
				var/how_much = (damage * H.size_multiplier) * H.get_digestion_nutrition_modifier() * linked_mob.get_digestion_efficiency_modifier()
				if(!H.ckey)
					how_much = how_much / 10	//Braindead mobs are worth less
				smes.charge += how_much
	else if (isliving(thing))
		var/mob/living/L = thing
		if(!L)
			return
		visible_message(runemessage = "blub...")
		if(L.stat == DEAD)
			L.unacidable = TRUE	//Don't touch this one again, we're gonna delete it in a second
			L.release_vore_contents()
			if(linked_mob)
				var/how_much = L.mob_size + L.nutrition
				if(!L.ckey)
					how_much = how_much / 10	//Braindead mobs are worth less
				smes.charge += how_much
			qdel(L) //gloop
			return
		L.adjustFireLoss(damage)
		if(linked_mob)
			var/how_much = (damage * L.size_multiplier) * L.get_digestion_nutrition_modifier() * linked_mob.get_digestion_efficiency_modifier()
			if(!L.ckey)
				how_much = how_much / 10	//Braindead mobs are worth less
			smes.charge += how_much

/turf/simulated/floor/water/digestive_enzymes/nanites/return_air_for_internal_lifeform(var/mob/living/L)
	if(!can_digest(L))
		return return_air() //Nanites should always be nonlethal until the AI turns on digestion
	..()

/turf/simulated/floor/water/digestive_enzymes/nanites/proc/select_state()
	if(active)
		name = "nanite-infested tiles."
		desc = "This section of reinforced plating appears to host a colony of nanites between the tiles"
		depth = 0
		movement_cost = 1
		footstep = FOOTSTEP_PLATING
		barefootstep = FOOTSTEP_HARD_BAREFOOT
		clawfootstep = FOOTSTEP_HARD_CLAW
		water_state = "goo_inactive"
		for(var/obj/structure/railing/overhang/hazard/nanite/R in src)
			R.icon_modifier = "inactive_"
			R.icon_state = "inactive_railing0"
		for(var/obj/structure/railing/overhang/hazard/nanite/R in range(src, 1))
			R.update_icon()
		for(var/obj/structure/dummystairs/hazardledge/stairs in src)
			stairs.icon_state = "stair_hazard"
			stairs.update_icon()
	else
		name = "nanite goop."
		desc = "A deep pool of pulsating, possibly deadly nanite goop."
		depth = 2
		movement_cost = 4
		footstep = FOOTSTEP_WATER
		barefootstep = FOOTSTEP_WATER
		clawfootstep = FOOTSTEP_WATER
		water_state = "goo_active"
		for(var/obj/structure/railing/overhang/hazard/nanite/R in src)
			R.icon_modifier = "active_"
			R.icon_state = "active_railing0"
		for(var/obj/structure/railing/overhang/hazard/nanite/R in range(src, 1))
			R.update_icon()
		for(var/obj/structure/dummystairs/hazardledge/stairs in src)
			depth = 1
			movement_cost = 3
			stairs.icon_state = "stair_hazard_nanite"
			stairs.update_icon()
	for(var/atom/AM in src)
		Entered(AM, src)
	update_icon()

/obj/structure/railing/overhang/hazard
	name = "hazardous ledge"
	desc = "An overhang made of a steel. It's painted with vibrant hazard markings."
	icon = 'modular_chomp/icons/obj/nanite_overhang.dmi'
	icon_modifier = "hazard_"
	icon_state = "hazard_railing0"

/obj/structure/railing/overhang/hazard/nanite
	icon_modifier = "inactive_"
	icon_state = "inactive_railing0"

/obj/structure/dummystairs
	name = "stairs"
	desc = "A short set of stairs"
	icon = 'modular_chomp/icons/obj/nanite_overhang.dmi'
	icon_state = "stair"
	anchored = TRUE
	density = FALSE
	layer = 2.5

/obj/structure/dummystairs/bronzeledge
	icon_state = "stair_bronze"

/obj/structure/dummystairs/greyledge
	icon_state = "stair_grey"

/obj/structure/dummystairs/hazardledge
	icon_state = "stair_hazard"

/turf/simulated/floor/carpet/graycarpet
	name = "gray carpet"
	desc = "A dusty, gray carpeted floor."
	icon = 'modular_chomp/icons/turf/flooring/carpet.dmi'
	icon_state = "gcarpet"
	initial_flooring = /decl/flooring/carpet/gray

/decl/flooring/carpet/gray
	name = "gray carpet"
	desc = "A dusty, gray carpeted floor."
	icon = 'modular_chomp/icons/turf/flooring/carpet.dmi'
	icon_base = "gcarpet"
	build_type = /obj/item/stack/tile/carpet/gray
	flags = TURF_REMOVE_CROWBAR | TURF_CAN_BURN

/obj/item/stack/tile/carpet/gray
	name = "gray carpet"
	icon_state = "tile"
	desc = "A piece dusty, gray carpet. It is the same size as a normal floor tile!"

/obj/machinery/light/fluorescent
	name = "fluorescent light fixture"
	nightshift_allowed = FALSE
	overlay_color = LIGHT_COLOR_FLUORESCENT_TUBE
	light_type = /obj/item/light/tube/fluorescent

/obj/machinery/light/small/fluorescent
	name = "fluorescent light fixture"
	nightshift_allowed = FALSE
	overlay_color = LIGHT_COLOR_FLUORESCENT_TUBE
	light_type = /obj/item/light/bulb/fluorescent

/obj/item/light/tube/fluorescent
	desc = "A harsh, bright fluorescent light tube"
	brightness_color = LIGHT_COLOR_FLUORESCENT_TUBE

/obj/item/light/bulb/fluorescent
	desc = "A harsh, bright fluorescent light tube"
	brightness_color = LIGHT_COLOR_FLUORESCENT_TUBE

/obj/machinery/light/yellowed
	desc = "This light fixture displays a sickly yellow hue"
	overlay_color = LIGHT_COLOR_YELLOW
	nightshift_allowed = FALSE
	light_type = /obj/item/light/tube/yellowed

/obj/machinery/light/small/yellowed
	desc = "This light fixture displays a sickly yellow hue"
	overlay_color = LIGHT_COLOR_YELLOW
	nightshift_allowed = FALSE
	light_type = /obj/item/light/bulb/yellowed
	brightness_power = 0.5

/obj/item/light/tube/yellowed
	desc = "An old, yellowed light tube."
	color = COLOR_YELLOW
	brightness_color = LIGHT_COLOR_YELLOW
	brightness_power = 0.45
	init_brightness_power = 0.45

/obj/item/light/bulb/yellowed
	desc = "An old, yellowed light bulb."
	color = COLOR_YELLOW
	brightness_color = LIGHT_COLOR_YELLOW
	brightness_power = 0.5
	init_brightness_power = 0.5

/turf/simulated/mineral/cetus
	desc = "Solid rock"
	floor_name = "rocks"
	outdoors = FALSE
	ignore_cavegen = TRUE
	ignore_mapgen = TRUE
	sand_icon_path = 'icons/turf/outdoors.dmi'
	sand_icon_state = "rock_brown"
	oxygen		= MOLES_O2STANDARD
	nitrogen	= MOLES_N2STANDARD
	temperature = T20C

/turf/simulated/floor/outdoors/rocks/cetus
	name = "rocks"
	outdoors = FALSE
	icon_state = "rock_brown"
	oxygen		= MOLES_O2STANDARD
	nitrogen	= MOLES_N2STANDARD
	temperature = T20C

/turf/simulated/mineral/cetus/edge
	name = "cold rock"
	desc = "Solid rock. It's cool to the touch. Digging through this will probably expose the area to hard vacuum!"
	outdoors = TRUE
	sand_icon_path = 'icons/turf/outdoors.dmi'
	sand_icon_state = "rock_brown"
	icon_state = "rock-dark"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/outdoors/rocks/cetus/edge
	outdoors = TRUE
	icon_state = "rock_brown"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB
