/obj/machinery/v_garbosystem
	icon = 'modular_chomp/icons/obj/machines/other.dmi'
	icon_state = "cronchy_off"
	name = "garbage grinder"
	desc = "Mind your fingers. Filter access hatch can be opened with crowbar to release trapped contents within."
	plane = TURF_PLANE
	layer = ABOVE_TURF_LAYER
	anchored = TRUE
	idle_power_usage = 5
	active_power_usage = 100
	var/operating = FALSE
	var/obj/machinery/recycling/crusher/crusher //Connects to regular crusher
	var/obj/machinery/button/garbosystem/button
	var/list/affecting
	var/voracity = 5 //How much stuff is swallowed at once.

/obj/machinery/v_garbosystem/Initialize(mapload)
	. = ..()
	for(var/dir in cardinal)
		src.crusher = locate(/obj/machinery/recycling/crusher, get_step(src, dir))
		if(src.crusher)
			crusher.hand_fed = FALSE
			break
	for(var/dir in cardinal)
		src.button = locate(/obj/machinery/button/garbosystem, get_step(src, dir))
		if(src.button)
			button.grinder = src
			break
	return

/obj/machinery/v_garbosystem/attack_hand(mob/living/user as mob)
	operating = !operating
	update()

/obj/machinery/v_garbosystem/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/v_garbosystem/power_change()
	if((. = ..()))
		update()

/obj/machinery/v_garbosystem/proc/update()
	if(stat & (BROKEN | NOPOWER))
		operating = FALSE
		update_use_power(USE_POWER_OFF)
		return
	if(!operating)
		update_use_power(USE_POWER_OFF)
		return
	icon_state = "cronchy_active"
	START_MACHINE_PROCESSING(src)
	update_use_power(USE_POWER_ACTIVE)

/obj/machinery/v_garbosystem/process()
	if(!operating || !crusher || crusher.stat & (NOPOWER|BROKEN))
		icon_state = "cronchy_off"
		return PROCESS_KILL
	if(stat & (BROKEN | NOPOWER))
		icon_state = "cronchy_off"
		return PROCESS_KILL
	icon_state = "cronchy_active"

	affecting = loc.contents - src
	spawn(1)
		var/items_taken = 0
		for(var/atom/movable/A in affecting)
			if(!isobj(A) && !isliving(A))
				continue
			if(istype(A, /obj/effect/decal/cleanable) || istype(A, /mob/living/voice))
				qdel(A)
			if(!A.anchored)
				if(A.loc == src.loc)
					if(isliving(A))
						var/mob/living/L = A
						if(!emagged && ishuman(L) && L.mind)
							playsound(src, 'sound/machines/warning-buzzer.ogg', 50, 0, 0)
							visible_message(span_warning("POSSIBLE CREW MEMBER DETECTED! EMERGENCY STOP ENGAGED!"))
							global_announcer.autosay("Possible crew member detected in grinder feed. Emergency Stop Protocols engaged!", "Recycling Grinder Alert", "Supply")
							operating = FALSE
							update()
							break
						if(L.stat == DEAD)
							playsound(src, 'sound/effects/splat.ogg', 50, 1)
							L.gib()
							items_taken++
						else
							L.adjustBruteLoss(25)
							items_taken++
							break
					for(var/atom/movable/C in A.contents)
						if(C.anchored)
							C.anchored = FALSE
						C.forceMove(loc)
					if(isitem(A))
						A.SpinAnimation(5,3)
						spawn(15)
							if(A.loc == loc)
								A.forceMove(src)
								if(!is_type_in_list(A,item_digestion_blacklist))
									crusher.take_item(A) //Force feed the poor bastard.
						items_taken++
					else
						A.SpinAnimation(5,3)
						spawn(15)
							if(A)
								A.forceMove(src)
								if(istype(A, /obj/structure/closet))
									new /obj/item/stack/material/steel(loc, 2)
								qdel(A)
						items_taken++
			if(items_taken >= voracity)
				break
		if(items_taken) //Lazy coder sound design moment.
			GLOB.Recycled_Items = GLOB.Recycled_Items + items_taken
			playsound(src, 'sound/items/poster_being_created.ogg', 50, 1)
			playsound(src, 'sound/items/electronic_assembly_emptying.ogg', 50, 1)
			playsound(src, 'sound/effects/metalscrape2.ogg', 50, 1)

/obj/machinery/v_garbosystem/emag_act(var/remaining_charges, var/mob/user, var/emag_source)
	emagged = !emagged
	update()

/obj/machinery/v_garbosystem/attackby(obj/item/W as obj, mob/user as mob)
	if(W.is_crowbar())
		if(!operating)
			to_chat(user, "You crowbar the filter hatch open, releasing the items trapped within.")
			for(var/atom/movable/A in contents)
				A.forceMove(loc)
			return
		else
			to_chat(user, "Unable to empty filter while the machine is running.")
	return ..()

/obj/machinery/button/garbosystem
	name = "garbage grinder switch"
	desc = "A power button for the big grinder."
	icon = 'icons/obj/machines/doorbell_vr.dmi'
	icon_state = "doorbell-standby"
	var/obj/machinery/v_garbosystem/grinder

/obj/machinery/button/garbosystem/attack_hand(mob/living/user as mob)
	if(grinder)
		return grinder.attack_hand(user)

GLOBAL_VAR_INIT(Recycled_Items, 0)
