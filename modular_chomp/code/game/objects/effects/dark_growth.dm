/obj/effect/dark
	name = "dark thing"
	desc = "a strange darkness floods this space"
	icon = 'icons/turf/flooring/weird_vr.dmi'
	icon_state = "dark"

	var/health = 10
	var/obj/structure/prop/dark_node/linked_node = null

/obj/effect/dark/Initialize(mapload, check_glow)
	. = ..()
	if(check_glow && prob(5))
		add_glow()

/obj/effect/dark/proc/add_glow()
	var/flip = rand(1,2)
	var/choice
	var/choiceb
	if(flip == 1)
		choice = "overlay-[rand(1,6)]"
	if(flip == 2)
		choice = "overlay-[rand(7,12)]"
	var/image/i = image('icons/turf/flooring/weird_vr.dmi', choice)
	i.plane = PLANE_LIGHTING_ABOVE
	add_overlay(i)
	if(prob(10))
		if(flip == 1)
			choiceb = "overlay-[rand(7,12)]"
		if(flip == 2)
			choiceb = "overlay-[rand(1,6)]"
		var/image/ii = image('icons/turf/flooring/weird_vr.dmi', choiceb)
		add_overlay(ii)

/obj/effect/dark/Crossed(O)
	. = ..()
	if(!isliving(O))
		return
	cut_overlays()
	if(prob(5))
		add_glow()
	if(istype(O, /mob/living/carbon/human))
		var/mob/living/carbon/human/L = O
		if(istype(L.species, /datum/species/crew_shadekin))
			L.halloss += 5
			if(prob(50))
				to_chat(L, span_danger("The more you move through this darkness, the more you can feel a throbbing, shooting ache in your bones."))
			if(prob(5))
				L.visible_message("[L]'s body gives off a faint, sparking, haze...", "Your body gives off a faint, sparking, haze...", runemessage = "gives off a faint, sparking haze")
		else if(istype(L.species, /datum/species/shadekin))
			var/obj/item/organ/internal/brain/shadekin/B = L.internal_organs_by_name["brain"]
			B.dark_energy += 10
			if(prob(10))
				to_chat(L, span_notice("You can feel the energy flowing into you!"))
		else
			if(prob(0.25))
				to_chat(L, span_danger("The darkness seethes under your feet..."))
				L.hallucination += 50

/obj/effect/dark/proc/light_check()
	var/turf/T = get_turf(src)
	if(!istype(T))
		health = 0
	else
		var/health_change = (T.get_lumcount() * -10) + 5
		health = min(10, health + health_change)
	if(health <= 0)
		qdel(src)
		return


/obj/effect/dark/floor
	name = "dark"
	desc = "It's a strange, impenetrable darkness."
	icon_state = "dark"
	anchored = TRUE
	density = FALSE
	unacidable = TRUE
	plane = TURF_PLANE
	layer = ABOVE_TURF_LAYER

/obj/effect/dark/proc/unlinked()
	linked_node.children_effects -= src
	linked_node = null
	addtimer(CALLBACK(src, PROC_REF(perform_unlink), rand(20, 70), TIMER_DELETE_ME))

/obj/effect/dark/proc/perform_unlink()
	PRIVATE_PROC(TRUE)
	if(!linked_node)
		qdel(src)

/obj/effect/dark/floor/Initialize(mapload, check_glow, var/node)
	. = ..(mapload, !isspace(loc))

	if(isspace(loc))
		return INITIALIZE_HINT_QDEL

	linked_node = node

/obj/structure/prop/dark_node
	name = "crystal cluster"
	desc = "A large cluster of bluespace crystals, dark energy crackles within it."
	layer = ABOVE_TURF_LAYER+0.01
	icon = 'icons/obj/props/decor.dmi'
	icon_state = "bsc"

	var/list/children_effects = list()
	var/until_full_process = 0

	light_range = 3
	var/node_range = 9

/obj/structure/prop/dark_node/Initialize(mapload)
	. = ..()
	set_light(light_range, -20, "#FFFFFF")
	START_PROCESSING(SSobj, src)

/obj/structure/prop/dark_node/Destroy()
	STOP_PROCESSING(SSobj, src)
	for(var/obj/effect/dark/dark_tile in children_effects)
		dark_tile.unlinked()
	return ..()

/obj/effect/dark/Destroy()
	if(linked_node)
		linked_node.children_effects -= src
		linked_node = null
	. = ..()

/obj/effect/dark/proc/do_process()
	//set background = 1
	var/turf/U = get_turf(src)

	if(isspace(U))
		qdel(src)
		return

	if(!linked_node)
		return

	if(get_dist(linked_node, src) > linked_node.node_range)
		return

	var/turf/T1 = get_turf(src)
	if(T1.get_lumcount() < 0.4)
		for(var/dirn in GLOB.cardinal)
			var/turf/T2 = get_step(src, dirn)

			if(!istype(T2) || locate(/obj/effect/dark) in T2 || istype(T2.loc, /area/arrival) || isspace(T2) || istype(T2, /turf/simulated/open))
				continue

			if(T2.get_lumcount() >= 0.4)
				continue

			var/obj/effect/dark/floor/new_dark_tile = new /obj/effect/dark/floor(T2, null, linked_node)
			if(QDELETED(new_dark_tile))
				continue
			linked_node.children_effects += new_dark_tile

/obj/structure/prop/dark_node/process()
	//set background = 1

	if(!(locate(/obj/effect/dark) in get_turf(src)))
		var/obj/effect/dark/floor/new_dark_tile = new /obj/effect/dark/floor(get_turf(src), null, src)
		if(!QDELETED(new_dark_tile))
			children_effects += new_dark_tile

	if(until_full_process-- <= 0)
		for(var/obj/effect/dark/dark_tile in orange(node_range, src))
			if(QDELETED(dark_tile))
				continue
			if(dark_tile.linked_node)
				continue
			children_effects += dark_tile
			dark_tile.linked_node = src
		until_full_process = 4

	for(var/obj/effect/dark/dark_tile as anything in children_effects)
//		W.color = W.linked_node.set_color

		dark_tile.light_check()
		if(dark_tile.linked_node == src && prob(max(10, 60 - (children_effects.len))))
			dark_tile.do_process()

/obj/structure/prop/dark_node/dust
	name = "crystal dust"
	desc = "A small scattering of bluespace crystals, dark energy sparks and flickers between them."
	icon_state = "bsc_dust"
	light_range = 1
	node_range = 5

/obj/structure/prop/dark_node/statue
	name = "phoronic cascade"
	desc = "A huge structure made of pure phoron. Dark energy roils and bursts within it."
	icon = 'icons/obj/props/decor32x64.dmi'
	icon_state = "phoronic"
	light_range = 5
	node_range = 15
