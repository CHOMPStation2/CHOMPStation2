/obj/item/assembly // CHOMPEdit - Removal of obj/item/device
	name = "assembly"
	desc = "A small electronic device that should never exist."
	icon = 'icons/obj/assemblies/new_assemblies.dmi'
	icon_state = ""
	w_class = ITEMSIZE_SMALL
	matter = list(MAT_STEEL = 100)
	throwforce = 2
	throw_speed = 3
	throw_range = 10
	drop_sound = 'sound/items/drop/component.ogg'
	pickup_sound =  'sound/items/pickup/component.ogg'
	origin_tech = list(TECH_MAGNET = 1)

	var/secured = 1
	var/list/attached_overlays = null
	var/obj/item/assembly_holder/holder = null // CHOMPEdit - Removal of obj/item/device
	var/cooldown = FALSE //To prevent spam
	var/wires = WIRE_RECEIVE | WIRE_PULSE

	var/const/WIRE_RECEIVE = 1			//Allows Pulsed(0) to call Activate()
	var/const/WIRE_PULSE = 2				//Allows Pulse(0) to act on the holder
	var/const/WIRE_PULSE_SPECIAL = 4		//Allows Pulse(0) to act on the holders special assembly
	var/const/WIRE_RADIO_RECEIVE = 8		//Allows Pulsed(1) to call Activate()
	var/const/WIRE_RADIO_PULSE = 16		//Allows Pulse(1) to send a radio message

/obj/item/assembly/proc/holder_movement() // CHOMPEdit - Removal of obj/item/device
	return

/obj/item/assembly/proc/process_cooldown() // CHOMPEdit - Removal of obj/item/device
	if(cooldown)
		return FALSE
	cooldown = TRUE
	VARSET_IN(src, cooldown, FALSE, 2 SECONDS)
	return TRUE

/obj/item/assembly/proc/pulsed(var/radio = 0) // CHOMPEdit - Removal of obj/item/device
	if(holder && (wires & WIRE_RECEIVE))
		activate()
	if(radio && (wires & WIRE_RADIO_RECEIVE))
		activate()
	return 1

/obj/item/assembly/proc/pulse(var/radio = 0) // CHOMPEdit - Removal of obj/item/device
	if(holder && (wires & WIRE_PULSE))
		holder.process_activation(src, 1, 0)
	if(holder && (wires & WIRE_PULSE_SPECIAL))
		holder.process_activation(src, 0, 1)
	return 1

/obj/item/assembly/proc/activate() // CHOMPEdit - Removal of obj/item/device
	if(!secured || !process_cooldown())
		return FALSE
	return TRUE

/obj/item/assembly/proc/toggle_secure() // CHOMPEdit - Removal of obj/item/device
	secured = !secured
	update_icon()
	return secured

/obj/item/assembly/proc/attach_assembly(var/obj/item/assembly/A, var/mob/user) // CHOMPEdit - Removal of obj/item/device
	holder = new/obj/item/assembly_holder(get_turf(src)) // CHOMPEdit - Removal of obj/item/device
	if(holder.attach(A,src,user))
		to_chat(user, "<span class='notice'>You attach \the [A] to \the [src]!</span>")
		return TRUE

/obj/item/assembly/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon // CHOMPEdit - Removal of obj/item/device
	if(isassembly(W))
		var/obj/item/assembly/A = W // CHOMPEdit - Removal of obj/item/device
		if((!A.secured) && (!secured))
			attach_assembly(A,user)
			return
	if(W.has_tool_quality(TOOL_SCREWDRIVER))
		if(toggle_secure())
			to_chat(user, "<span class='notice'>\The [src] is ready!</span>")
		else
			to_chat(user, "<span class='notice'>\The [src] can now be attached!</span>")
		return
	return ..()

/obj/item/assembly/process() // CHOMPEdit - Removal of obj/item/device
	return PROCESS_KILL

/obj/item/assembly/examine(mob/user) // CHOMPEdit - Removal of obj/item/device
	. = ..()
	if((in_range(src, user) || loc == user))
		if(secured)
			. += "\The [src] is ready!"
		else
			. += "\The [src] can be attached!"

/obj/item/assembly/attack_self(mob/user as mob) // CHOMPEdit - Removal of obj/item/device
	if(!user)
		return 0
	user.set_machine(src)
	tgui_interact(user)
	return 1

/obj/item/assembly/tgui_state(mob/user) // CHOMPEdit - Removal of obj/item/device
	return GLOB.tgui_deep_inventory_state

/obj/item/assembly/tgui_interact(mob/user, datum/tgui/ui) // CHOMPEdit - Removal of obj/item/device
	return // tgui goes here

/obj/item/assembly/tgui_host() // CHOMPEdit - Removal of obj/item/device
	if(istype(loc, /obj/item/assembly_holder)) // CHOMPEdit - Removal of obj/item/device
		return loc.tgui_host()
	return ..()
