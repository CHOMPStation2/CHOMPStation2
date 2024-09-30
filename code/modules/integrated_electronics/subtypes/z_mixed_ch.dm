//set_pin_data()
//This sets Data of a pin, You can use IC_INPUT to target the input side, second argument to select which input, thied Argument is the data to push
//get_pin_data()
//Same as above but fetches data instead, This literally does all the work for you.
//do:work()
//This happens when the wire is pulsed.
//pins start at 1 not 0, lists always start at 1 in this.

//Activators (pulsing stuff) seems to work similiarly im gonna add some conditional pulsing to mine as an example
//All of the behaviour of these procs is defined in core/helpers.dm

//push_data() makes sure any connections actually update

/obj/item/integrated_circuit/logic/conditional
	name = "conditional operator"
	desc = "This operator checks a boolean and based on its state either outputs the first or second inputs value, this is also known as the ?: operator."
	icon_state = "equal"
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH
	inputs = list("Condition"= IC_PINTYPE_BOOLEAN,"True","False")
	outputs = list("Result" = IC_PINTYPE_ANY)
	activators = list("compare" = IC_PINTYPE_PULSE_IN, "on true" = IC_PINTYPE_PULSE_OUT, "on false" = IC_PINTYPE_PULSE_OUT)

/obj/item/integrated_circuit/logic/conditional/do_work()
	pull_data()
	if(get_pin_data(IC_INPUT, 1))
		set_pin_data(IC_OUTPUT, 1,get_pin_data(IC_INPUT, 2))
		activate_pin(2)
	else
		set_pin_data(IC_OUTPUT, 1,get_pin_data(IC_INPUT, 3))
		activate_pin(3)
	return push_data()

/obj/item/integrated_circuit/logic/boollatch
	name = "boolean latch"
	desc = "A boolean latch is essentially a toggle swapping between true and false on being pulsed."
	icon_state = "equal"
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH
	inputs = list()
	outputs = list("State" = IC_PINTYPE_BOOLEAN)
	activators = list("Toggle" = IC_PINTYPE_PULSE_IN, "on true" = IC_PINTYPE_PULSE_OUT, "on false" = IC_PINTYPE_PULSE_OUT)

/obj/item/integrated_circuit/logic/boollatch/do_work()
	if(get_pin_data(IC_OUTPUT, 1))
		set_pin_data(IC_OUTPUT, 1,FALSE)
		activate_pin(3)
	else
		set_pin_data(IC_OUTPUT, 1,TRUE)
		activate_pin(2)
	return push_data()

//FIXES fr pads below because i dont want to edit the actual files, YES this removes checks for if user is close to the machine,, no they werent working anyway.
/obj/item/integrated_circuit/input/textpad/ask_for_input(mob/user)
	var/new_input = input(user, "Enter some words, please.","Number pad", get_pin_data(IC_OUTPUT, 1)) as null|text
	if(istext(new_input))
		set_pin_data(IC_OUTPUT, 1, new_input)
		push_data()
		activate_pin(1)

/obj/item/integrated_circuit/input/numberpad/ask_for_input(mob/user)
	var/new_input = input(user, "Enter a number, please.","Number pad", get_pin_data(IC_OUTPUT, 1)) as null|num
	if(isnum(new_input))
		set_pin_data(IC_OUTPUT, 1, new_input)
		push_data()
		activate_pin(1)

/obj/item/integrated_circuit/input/colorpad/ask_for_input(mob/user)
	var/new_color = input(user, "Enter a color, please.", "Color pad", get_pin_data(IC_OUTPUT, 1)) as color|null
	if(new_color)
		set_pin_data(IC_OUTPUT, 1, new_color)
		push_data()
		activate_pin(1)

//Racial addition for medscanner circuitry.
//Because if we die from water, probably shouldn't feed em protein shakes yknow or if you are an antag this can be useful info too

/obj/item/integrated_circuit/input/adv_med_scanner

	name = "integrated advanced medical analyzer"
	desc = "A very small version of the medibot's medical analyzer.  This allows the machine to know how healthy someone is.  \

	This type is much more precise, allowing the machine to know much more about the target than a normal analyzer."
	icon_state = "medscan_adv"
	complexity = 12
	inputs = list("target" = IC_PINTYPE_REF)
	outputs = list(
		"total health %"		= IC_PINTYPE_NUMBER,
		"total missing health"	= IC_PINTYPE_NUMBER,
		"brute damage"			= IC_PINTYPE_NUMBER,
		"burn damage"			= IC_PINTYPE_NUMBER,
		"tox damage"			= IC_PINTYPE_NUMBER,
		"oxy damage"			= IC_PINTYPE_NUMBER,
		"clone damage"			= IC_PINTYPE_NUMBER,
		"species"				= IC_PINTYPE_STRING,
		"size %"				= IC_PINTYPE_NUMBER
	)
	activators = list("scan" = IC_PINTYPE_PULSE_IN, "on scanned" = IC_PINTYPE_PULSE_OUT)
	spawn_flags = IC_SPAWN_RESEARCH
	origin_tech = list(TECH_ENGINEERING = 3, TECH_DATA = 3, TECH_BIO = 4)
	power_draw_per_use = 80

/obj/item/integrated_circuit/input/adv_med_scanner/do_work()
	var/mob/living/carbon/human/H = get_pin_data_as_type(IC_INPUT, 1, /mob/living/carbon/human)
	if(!istype(H)) //Invalid input
		return

	if(H in view(get_turf(H))) // Like medbot's analyzer it can be used in range..

		var/total_health = round(H.health/H.getMaxHealth(), 0.01)*100
		var/missing_health = H.getMaxHealth() - H.health

		set_pin_data(IC_OUTPUT, 1, total_health)
		set_pin_data(IC_OUTPUT, 2, missing_health)
		set_pin_data(IC_OUTPUT, 3, H.getBruteLoss())
		set_pin_data(IC_OUTPUT, 4, H.getFireLoss())
		set_pin_data(IC_OUTPUT, 5, H.getToxLoss())
		set_pin_data(IC_OUTPUT, 6, H.getOxyLoss())
		set_pin_data(IC_OUTPUT, 7, H.getCloneLoss())
		set_pin_data(IC_OUTPUT, 8, H.species.name)
		set_pin_data(IC_OUTPUT, 9, H.size_multiplier *100)

	push_data()
	activate_pin(2)

/obj/item/electronic_assembly/drone
	w_class = ITEMSIZE_NORMAL
	max_components = IC_COMPONENTS_BASE * 6
	max_complexity = IC_COMPLEXITY_BASE * 6