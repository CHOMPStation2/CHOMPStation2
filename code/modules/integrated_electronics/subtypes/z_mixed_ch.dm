//set_pin_data()
//This sets Data of a pin, You can use IC_INPUT to target the input side, second argument to select which input, thied Argument is the data to push
//get_pin_data()
//Same as above but fetches data instead, This literally does all the work for you.
//do:work()
//This happens when the wire is pulsed.
//pins start at 1 not 0, lists always start at 1 in this.

/obj/item/integrated_circuit/logic/conditional
	name = "conditional gate"
	desc = "This gate checks a boolean and based on its state either outputs the first or second inputs value, this is also know as the ?: operator."
	icon_state = "equal"
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH
	inputs = list("Condition"= IC_PINTYPE_BOOLEAN,"True","False")
	outputs = list("Result" = IC_PINTYPE_ANY)

/obj/item/integrated_circuit/logic/conditional/do_work()
	if(get_pin_data(IC_INPUT, 1))
		return set_pin_data(IC_OUTPUT, 1,get_pin_data(IC_INPUT, 2))
	else
		return set_pin_data(IC_OUTPUT, 1,get_pin_data(IC_INPUT, 3))

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