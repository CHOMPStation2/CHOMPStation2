/obj/item/integrated_circuit/smart
	category_text = "Smart"

/obj/item/integrated_circuit/smart/basic_pathfinder
	name = "basic pathfinder"
	desc = "This complex circuit is able to determine what direction a given target is."
	extended_desc = "This circuit uses a miniturized, integrated camera to determine where the target is.  If the machine \
	cannot see the target, it will not be able to calculate the correct direction."
	icon_state = "numberpad"
	complexity = 25
	inputs = list("target" = IC_PINTYPE_REF)
	outputs = list("dir" = IC_PINTYPE_DIR)
	activators = list("calculate dir" = IC_PINTYPE_PULSE_IN, "on calculated" = IC_PINTYPE_PULSE_OUT)
	spawn_flags = IC_SPAWN_RESEARCH
	origin_tech = list(TECH_ENGINEERING = 4, TECH_DATA = 5)
	power_draw_per_use = 40

/obj/item/integrated_circuit/smart/basic_pathfinder/do_work()
	var/datum/integrated_io/I = inputs[1]
	set_pin_data(IC_OUTPUT, 1, null)

	if(!isweakref(I.data))
		return
	var/atom/A = I.data.resolve()
	if(!A)
		return
	if(!(A in view(get_turf(src))))
		push_data()
		return // Can't see the target.
	var/desired_dir = get_dir(get_turf(src), get_turf(A))

	set_pin_data(IC_OUTPUT, 1, desired_dir)
	push_data()
	activate_pin(2) //CHOMPEdit

//CHOMPEdit Begin
/obj/item/integrated_circuit/smart/advanced_pathfinder
	name = "advanced pathfinder"
	desc = "This circuit uses a complex processor for long-range pathfinding."
	extended_desc = "This circuit uses absolute coordinates to find its target.  A path will be generated to the target, taking obstacles into account, \
	and pathing around any instances of said input.  The passkey provided from a card reader is used to calculate a valid path through airlocks."
	icon_state = "numberpad"
	complexity = 40
	cooldown_per_use = 50
	inputs = list("X target" = IC_PINTYPE_NUMBER,"Y target" = IC_PINTYPE_NUMBER,"obstacle" = IC_PINTYPE_REF,"access" = IC_PINTYPE_STRING)
	outputs = list("X" = IC_PINTYPE_LIST,"Y" = IC_PINTYPE_LIST)
	activators = list("calculate path" = IC_PINTYPE_PULSE_IN, "on calculated" = IC_PINTYPE_PULSE_OUT,"not calculated" = IC_PINTYPE_PULSE_OUT)
	spawn_flags = IC_SPAWN_RESEARCH
	power_draw_per_use = 80
	var/obj/item/card/id/idc

/obj/item/integrated_circuit/smart/advanced_pathfinder/Initialize(mapload)
	.=..()
	idc = new(src)

/obj/item/integrated_circuit/smart/advanced_pathfinder/do_work()
	if(!assembly)
		activate_pin(3)
		return
	//idc.access = assembly.access_card.access
	var/turf/a_loc = get_turf(assembly)

	var/turf/target_turf = locate(get_pin_data(IC_INPUT, 1), get_pin_data(IC_INPUT, 2), a_loc.z)
	var/list/P = SSpathfinder.default_circuit_pathfinding(src, target_turf, 0, 200)

	if(!P)
		activate_pin(3)
		return
	else
		var/list/Xn =  new/list(P.len)
		var/list/Yn =  new/list(P.len)
		var/turf/T
		for(var/i =1 to P.len)
			T=P[i]
			Xn[i] = T.x
			Yn[i] = T.y
		set_pin_data(IC_OUTPUT, 1, Xn)
		set_pin_data(IC_OUTPUT, 2, Yn)
		push_data()
		activate_pin(2)
//CHOMPEdit End
