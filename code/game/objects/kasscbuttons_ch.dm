/obj/kbutton
	name = "button"
	icon = 'icons/obj/objects.dmi'
	icon_state = "launcherbtt"
	desc = "A remote control switch for something."
	anchored = 1.0
	var/nothing_sound_file 								//Sound to play when button fails to be pressed
	var/nothing_sound_volume 							//Volume of sound when button fails to be pressed
	var/pressed_sound_file = 'sound/machines/button.ogg'//Sound to play when button is successfully pressed
	var/pressed_sound_volume = 100						//Volume of sound when button is successfully pressed
	var/list/trig_target_paths = list()					//What are the paths of whatever we want to call our proc on?
	var/trig_target_trigger_uid							//What is the trigger_uid of whatever we want to call our proc on?
	var/trig_proc										//What proc do we want to call?
	var/list/trig_args = list()							//What are the arguments for said proc?
	var/trig_message = "You press the button"			//Should we send a message to the person who pressed the button?
	var/trig_message_span_class = "notice"				//Span class used for pressed message, normal ones include notice, warning, and danger.
	var/nothing_message = "Nothing happens."			//Should we send a message if nothing happens when the button is pressed?
	var/nothing_message_span_class = "warning"			//Span class used for nothing message, normal ones include notice, warning, and danger.
	var/list/trig_targets = list()
	var/trig_target_is_trigerrer = FALSE				//Should we use the button presser as the target?

/obj/kbutton/attackby(obj/item/W, mob/user as mob)
	return attack_hand(user)

/obj/kbutton/attack_hand(mob/user as mob)
	. = ..()
	if(can_press(user))
		if(trig_target_is_trigerrer)
			trig_targets = list(user)
		button_trigger()
		if(pressed_sound_file)
			playsound(src, pressed_sound_file, pressed_sound_volume, 1)
		if(trig_message)
			to_chat(user,"<span class='[trig_message_span_class]'>"+trig_message+"</span>")
	else
		if(nothing_sound_file)
			playsound(src, nothing_sound_file, nothing_sound_volume, 1)
		if(nothing_message)
			to_chat(user,"<span class='[nothing_message_span_class]'>"+nothing_message+"</span>")
	return

/obj/kbutton/proc/button_trigger()
	if(trig_proc)
		if(trig_targets.len)
			var/testname = trig_proc
			//Find one of the 3 possible ways they could have written /proc/PROCNAME
			if(findtext(trig_proc, "/proc/"))
				testname = replacetext(trig_proc, "/proc/", "")
			else if(findtext(trig_proc, "/proc"))
				testname = replacetext(trig_proc, "/proc", "")
			else if(findtext(trig_proc, "proc/"))
				testname = replacetext(trig_proc, "proc/", "")
			//Clear out any parenthesis if they're a dummy
			testname = replacetext(testname, "()", "")
			for(var/trig_target in trig_targets)
				if(trig_target && !hascall(trig_target,testname))
					message_admins("TRIGGER ERROR: ONE OR MORE TRIGGER TARGETS LACKS THE MENTIONED PROC")
					return
			for(var/trig_target in trig_targets)
				call(trig_target,testname)(arglist(trig_args))
		else
			var/procpath = text2path(trig_proc)
			if(!procpath)
				message_admins("TRIGGER ERROR: INVALID PROC")
				return
			call(procpath)(arglist(trig_args))

/obj/kbutton/proc/can_press(mob/user)
	return TRUE

/obj/kbutton/proc/update_trig_targets()
	trig_targets = list()
	for(var/path in trig_target_paths)
		var/trig_target_path = text2path(path)
		if(trig_target_path && trig_target_trigger_uid)
			var/list/candidates = get_all_of_type(trig_target_path)
			for(var/candidate in candidates)
				var/datum/cand_datum = candidate
				if(istype(cand_datum))
					if(cand_datum.trigger_uid == trig_target_trigger_uid)
						trig_targets += candidate
						continue
				continue
	if(!trig_targets.len)
		message_admins("TRIGGER ERROR: trig_targets STILL EMPTY AFTER CALLED update_trig_targets()")

/obj/kbutton/Initialize(mapload)
	. = ..()
	update_trig_targets()
	return

/obj/kbutton/single_use
	name = "single use button"
	var/has_been_pressed = FALSE

/obj/kbutton/single_use/button_trigger()
	has_been_pressed = TRUE
	..()

/obj/kbutton/single_use/can_press(mob/user)
	return !has_been_pressed

/obj/kbutton/single_use_per_mob
	name = "button"
	var/list/been_triggered_by = list()

/obj/kbutton/single_use_per_mob/can_press(mob/user)
	if(user in been_triggered_by)
		return FALSE
	else
		been_triggered_by |= user
		return TRUE

/obj/kbutton/toggle
	name = "toggle button"
	var/toggled = FALSE
	//For each of the following, each of the following variables will be used when switching to that state,
	//and if it's set to null, it will use def(short for default)
	var/trig_message_types = list(\
	"def" = "You toggle the button.", \
	"on" = null, \
	"off" = null)
	var/nothing_message_types = list(\
	"def" = "Nothing happens.", \
	"on" = null, \
	"off" = null)
	var/pressed_sound_file_types = list(\
	"def" = 'sound/machines/button.ogg', \
	"on" = null, \
	"off" = null)
	var/pressed_sound_volume_types = list(\
	"def" = 100, \
	"on" = null, \
	"off" = null)
	var/nothing_sound_file_types = list(\
	"def" = null, \
	"on" = null, \
	"off" = null)
	var/nothing_sound_volume_types = list(\
	"def" = null, \
	"on" = null, \
	"off" = null)
	var/icon_types = list(\
	"def" = 'icons/obj/objects.dmi', \
	"on" = null, \
	"off" = null)
	var/icon_state_types = list(\
	"def" = "launcherbtt", \
	"on" = null, \
	"off" = null)
	var/trig_proc_types = list(\
	"def" = null, \
	"on" = null, \
	"off" = null)
	var/trig_args_types = list(\
	"def" = list(), \
	"on" = list(), \
	"off" = list())

/obj/kbutton/toggle/Initialize(mapload)
	. = ..()
	update_variables()

/obj/kbutton/toggle/proc/update_variables()
	var/index = toggled ? "on" : "off"
	trig_message = trig_message_types[index] ? trig_message_types[index] : trig_message_types["def"]
	nothing_message = nothing_message_types[index] ? nothing_message_types[index] : nothing_message_types["def"]
	pressed_sound_file = pressed_sound_file_types[index] ? pressed_sound_file_types[index] : pressed_sound_file_types["def"]
	pressed_sound_volume = pressed_sound_volume_types[index] ? pressed_sound_volume_types[index] : pressed_sound_volume_types["def"]
	nothing_sound_file = nothing_sound_file_types[index] ? nothing_sound_file_types[index] : nothing_sound_file_types["def"]
	nothing_sound_volume = nothing_sound_volume_types[index] ? nothing_sound_volume_types[index] : nothing_sound_volume_types["def"]
	icon = icon_types[index] ? icon_types[index] : icon_types["def"]
	icon_state = icon_state_types[index] ? icon_state_types[index] : icon_state_types["def"]
	trig_proc = trig_proc_types[index] ? trig_proc_types[index] : trig_proc_types["def"]
	var/list/trig_arg_type = trig_args_types[index]
	trig_args = (istype(trig_arg_type) && trig_arg_type.len) ? trig_args_types[index] : trig_args_types["def"]

/obj/kbutton/toggle/button_trigger()
	toggled = !toggled
	update_variables()
	..()
//An example button which opens and closes a closet.
/obj/kbutton/toggle/example
	var/press_wait_time = 25
	var/last_pressed = 0

	trig_target_paths = list("/obj/structure/closet")
	trig_target_trigger_uid = 97482

	trig_message_types = list(\
	"def" = "You toggle the button.", \
	"on" = "You switch the button on.", \
	"off" = "You switch the button off.")
	nothing_message_types = list(\
	"def" = "Nothing happens.", \
	"on" = "You fail to switch the button off.", \
	"off" = "You fail to switch the button on.")
	pressed_sound_file_types = list(\
	"def" = 'sound/machines/button.ogg', \
	"on" = 'sound/machines/chime.ogg', \
	"off" = 'sound/machines/buttonbeep.ogg')
	pressed_sound_volume_types = list(\
	"def" = 80, \
	"on" = 80, \
	"off" = 80)
	nothing_sound_file_types = list(\
	"def" = 'sound/machines/buzz-sigh.ogg', \
	"on" = 'sound/machines/buzz-sigh.ogg', \
	"off" = 'sound/machines/buzz-two.ogg')
	nothing_sound_volume_types = list(\
	"def" = 100, \
	"on" = 100, \
	"off" = 100)
	icon_state_types = list(\
	"def" = "launcherbtt", \
	"on" = "launcheract", \
	"off" = "launcherbtt")
	trig_proc_types = list(\
	"def" = "close", \
	"on" = "open", \
	"off" = "close")

/obj/kbutton/toggle/example/can_press(mob/user)
	if(world.time > last_pressed + press_wait_time)
		last_pressed = world.time
		return TRUE
	else
		return FALSE
//Corresponding closet for example button
/obj/structure/closet/button_example
	trigger_uid = 97482