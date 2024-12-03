/datum/event/vent_clog
	announceWhen = 0
	startWhen = 5
	var/interval = 2
	var/list/vents = list()
	activeFor = 0

/datum/event/vent_clog/announce()
	command_announcement.Announce("The scrubbers network is experiencing a backpressure surge. Some ejection of contents may occur.", "Atmospherics alert")

/datum/event/vent_clog/setup()
	endWHen = rand(25, 100)
	for(var/obj/machinery/atmospherics/unary/vent_scrubber/temp_vent in global.machines)
		if(istype(temp_vent.z, /area/crew_quarters))
			continue
		if(temp_vent.network && (temp_vent.z in using_map.station_levels))
			if(temp_vent.network.normal_members.len > 10)
				var/area/A = get_area(temp_vent)
				if(!(A.forbid_events))
					vents += temp_vent

/datum/event/vent_clog/tick()
	if(activeFor % interval == 0)
		var/obj/machinery/atmospherics/unary/vent_scrubber/vent = pick_n_take(vents)

		if(!vent || vent.welded)
			endWHen++
			return

		var/list/gunk = list(
			"water", "carbon", "flour", "radium", "toxin", "spacecleaner", "nutriment", "condensedcapsaicin", "psilocybin", "lube", "plantbgone", "banana",
			"bliss", "holywater", "ethanol", "hot_coco", "blood", "mutagen", "frostoil", "inaprovaline", "beepskysmash", "synaptizine", "bicaridine",
			"hyperzine", "cryoxadone", "hyronalin", "paracetamol", "virusfood", "dexalin", "anti_toxin"
		)

		var/datum/effect/effect/system/smoke_spread/chem/smoke_system = new()
		smoke_system.set_up(pick(gunk), 50, 0, vent)
		smoke_system.start()
		playsound(vent.loc, 'sound/effects/smoke.ogg', 50, TRUE, -3)
