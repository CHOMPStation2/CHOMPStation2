/obj/machinery/computer/atmos_alert
	name = "atmospheric alert computer"
	desc = "Used to access the station's atmospheric sensors."
	circuit = /obj/item/circuitboard/atmos_alert
	icon_keyboard = "atmos_key"
	icon_screen = "alert:0"
	light_color = "#e6ffff"

/obj/machinery/computer/atmos_alert/Initialize(mapload)
	. = ..()
	atmosphere_alarm.register_alarm(src, /atom/proc/update_icon)

/obj/machinery/computer/atmos_alert/Destroy()
	atmosphere_alarm.unregister_alarm(src)
	. = ..()

/obj/machinery/computer/atmos_alert/attack_hand(mob/user)
	tgui_interact(user)

/obj/machinery/computer/atmos_alert/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AtmosAlertConsole", name)
		ui.open()

/obj/machinery/computer/atmos_alert/tgui_data(mob/user)
	var/list/data = list()
	var/list/major_alarms = list()
	var/list/minor_alarms = list()

	for(var/datum/alarm/alarm in atmosphere_alarm.major_alarms(get_z(src)))
		major_alarms[++major_alarms.len] = list("name" = sanitize(alarm.alarm_name()), "ref" = "\ref[alarm]")

	for(var/datum/alarm/alarm in atmosphere_alarm.minor_alarms(get_z(src)))
		minor_alarms[++minor_alarms.len] = list("name" = sanitize(alarm.alarm_name()), "ref" = "\ref[alarm]")

	data["priority_alarms"] = major_alarms
	data["minor_alarms"] = minor_alarms

	return data

/obj/machinery/computer/atmos_alert/update_icon()
	if(!(stat & (NOPOWER|BROKEN)))
		var/list/alarms = atmosphere_alarm.major_alarms()
		if(alarms.len)
			icon_screen = "alert:2"
			playsound(src, 'sound/effects/comp_alert_major.ogg', 70, 1) // CHOMPEdit: Alarm notifications
			spawn(100) // Wait 10 seconds, then play it again
				playsound(src, 'sound/effects/comp_alert_major.ogg', 70, 1) // CHOMPEdit: Alarm notifications
		else
			alarms = atmosphere_alarm.minor_alarms()
			if(alarms.len)
				icon_screen = "alert:1"
				playsound(src, 'sound/effects/comp_alert_minor.ogg', 50, 1) // CHOMPEdit: Alarm notifications
				spawn(100) // Wait 10 seconds, then play it again
					playsound(src, 'sound/effects/comp_alert_minor.ogg', 50, 1) // CHOMPEdit: Alarm notifications
			else
				icon_screen = initial(icon_screen)
				playsound(src, 'sound/effects/comp_alert_clear.ogg', 50, 1)  // CHOMPEdit: Alarm notifications
	..()

/obj/machinery/computer/atmos_alert/tgui_act(action, params)
	if(..())
		return TRUE

	switch(action)
		if("clear")
			var/datum/alarm/alarm = locate(params["ref"]) in atmosphere_alarm.alarms
			if(alarm)
				for(var/datum/alarm_source/alarm_source in alarm.sources)
					var/obj/machinery/alarm/air_alarm = alarm_source.source
					if(istype(air_alarm))
						// I have to leave a note here:
						// Once upon a time, this called air_alarm.Topic() with a custom topic state
						// in order to perform three lines of code. In other words, pure insanity.
						// Whyyyyyyyyyyyyyyyyyyyyyyy.
						air_alarm.atmos_reset()
			. = TRUE
	update_icon()
