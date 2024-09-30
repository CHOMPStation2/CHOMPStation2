var/global/datum/phororeactions/phororeactions
var/global/list/discovered_phororeagents //list of all phororeagents discovered so far

/obj/machinery/computer/phoronics
	icon = 'icons/obj/computer3.dmi'
	icon_state = "frame-rnd"
	icon_keyboard = "kb9"
	icon_screen = "powerold"
	circuit = /obj/item/circuitboard/phoronics
//	var/turf/simulated/floor/phoronics/source
	var/turf/simulated/floor/source
	var/intensity = 1
	var/timeLeft = 0
	var/timeLeftMax = 0
	var/aborting = 0
	var/message = "" //57 character max message size, assuming all characters take same size, probably don't
	var/obj/machinery/telepad_phoronics/source_pad
	var/obj/machinery/telepad_phoronics/dest_pad
	var/turf/source_loc
	var/turf/dest_loc
	var/field

/obj/machinery/computer/phoronics/New()
	intensity = 1
	timeLeft = 0
	timeLeftMax = 0
	aborting = 0

	message = "Welcome to Phoronics"
	if(!phororeactions)
		phororeactions = new/datum/phororeactions
		phororeactions.set_up_reactions()

	if(!discovered_phororeagents)
		discovered_phororeagents = list("bicordrazine")

/obj/machinery/computer/phoronics/attack_hand(var/mob/user as mob)
	return src.ui_interact(user)


/obj/machinery/computer/phoronics/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)

	var/data[0]
	data["intensity"] =  intensity
	data["timeLeft"] = timeLeft
	data["timeLeftMax"] = timeLeftMax
	data["message"] = message
	if(source)
		var/datum/gas_mixture/enviro = source.return_air()
		if(enviro.gas["phoron"])
			data["phoron"] = round(enviro.gas["phoron"])
		else
			data["phoron"] = 0
	else
		data["phoron"] = 0

	ui = SSnanoui.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "phorochem.tmpl", "Phorochemputer", 480, 400)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)	// auto update every Master Controller tick


	return

/obj/machinery/computer/phoronics/Topic(href, href_list)
	if(href_list["beginTest"])
		if(timeLeft == 0)
			begin_test()

	if(href_list["abortTest"])
		if(timeLeft > 0)
			aborting = 1

	if(href_list["recalibrate"])
		if(timeLeft == 0)
			recalibrate()

	if(href_list["intensity"])
		intensity = min(max(text2num(href_list["intensity"]), 1), 5)

/obj/machinery/computer/phoronics/proc/recalibrate()
	if(timeLeft > 0)
		message = "ERROR: Cannot recalibrate while test is in progress"
	else
		source = null
		for(var/turf/simulated/floor/phoronics/tile in range(src, 7)) //check for turf before every tile for flooring first
			if(istype(tile.flooring, /decl/flooring/phoronics))
				if(!source)
					source = tile
				else
					var/distCur = sqrt(((source.x - src.x) ** 2) + ((source.y - src.y) ** 2))
					var/distNew = sqrt(((tile.x - src.x) ** 2) + ((tile.y - src.y) ** 2))
					if(distNew < distCur)
						source = tile

		//only gets here if they decide to move the phoronics tile location, or build their own phoronics for some reason
		if(!source)
			for(var/turf/simulated/floor/tile in range(src, 7))
				if(istype(tile.flooring, /decl/flooring/phoronics))
					if(!source)
						source = tile
					else
						var/distCur = sqrt(((source.x - src.x) ** 2) + ((source.y - src.y) ** 2))
						var/distNew = sqrt(((tile.x - src.x) ** 2) + ((tile.y - src.y) ** 2))
						if(distNew < distCur)
							source = tile
		if(source)
			message = "Electromagnetic tile located at: [source.x], [source.y]"
			SSnanoui.update_uis(src)
			source_pad = null
			dest_pad = null
			spawn(10)
				var/list/telepads = list()
				for(var/obj/machinery/telepad_phoronics/T in range(src, 7))
					telepads.Add(T)

				switch(telepads.len)
					if(0)
						message = "No telepads found"
						return
					if(1)
						message = "ERROR: Insufficient amount of telepads found, refusing link"
						return
					if(3 to INFINITY)
						message = "ERROR: Too many telepads found, refusing link"
						return

				var/obj/machinery/telepad_phoronics/temp_pad = telepads[1]
				var/turf/T = locate(temp_pad.x, temp_pad.y, temp_pad.z)
				if(istype(T, /turf/simulated/floor) && istype(T:flooring, /decl/flooring/phoronics))
					dest_pad = telepads[1]
					source_pad = telepads[2]

					if(!dest_pad.anchored || !source_pad.anchored)
						message = "ERROR: One or both telepads not anchored to ground"
						dest_pad = null
						source_pad = null
						return
				else
					temp_pad = telepads[2]
					T = locate(temp_pad.x, temp_pad.y, temp_pad.z)
					if(istype(T, /turf/simulated/floor) && istype(T:flooring, /decl/flooring/phoronics))
						dest_pad = telepads[2]
						source_pad = telepads[1]

						if(!dest_pad.anchored || !source_pad.anchored)
							message = "ERROR: One or both telepads not anchored to ground"
							dest_pad = null
							source_pad = null
							return
					else
						message = "ERROR: No telepad located on electromagnetic tile"
						return

					dest_pad.dest = source_pad
					source_pad.dest = dest_pad

				source_loc = source_pad.loc
				dest_loc = dest_pad.loc
				message = "Telepads successfully linked"
		else
			message = "ERROR: No electromagnetic tiles located"

/obj/machinery/computer/phoronics/proc/begin_test()
	if(source && istype(source.flooring, /decl/flooring/phoronics)) //make sure turf is still phoronics tile
		message = "Test in progress"
	else
		return abort("ERROR: Recalibrate to locate electromagnetic tile and or telepads")

	var/datum/reagent/reactant
	var/obj/item/reagent_containers/container

	//check for beaker, and that beaker contains only one reagent
	var/num_containers = 0
	if(source_pad)
		if(source_pad.loc != source_loc)
			return abort("ERROR: Input telepad not where expected, please recalibrate")
		if(!source_pad.anchored)
			return abort("ERROR: Input telepad not anchored")
		for(var/obj/item/reagent_containers/R in source_pad.loc.contents)
			num_containers++
			container = R

	if(container)
		if(!container.is_open_container()) //container not open, insult user
			var/insult = pick("idiot", "failure", "waste of space", "high school dropout", "chucklefuck", \
								"asshat", "dumbass", "fucklechuck", "scrub", "moron", "typical NT worker")
			return abort("ERROR: Open reagent container, you [insult]")

		if(istype(container, /obj/item/reagent_containers/glass/beaker/noreact)) //container doesn't react, insult user
			var/insult = pick("idiot", "failure", "ass", "scrub", "chucklefuck", \
								"asshat", "dumbass", "fucklechuck", "scrub", "moron")
			return abort("ERROR: Reactions don't happen in a cryostasis beaker, you [insult]")

		if(container.reagents.reagent_list.len > 1)
			return abort("ERROR: Too many reagents detected, aborting test")

		if(container.reagents.reagent_list.len == 0)
			return abort("ERROR: No reagents detected, aborting test")

		var/datum/gas_mixture/enviro = source.return_air()
		if(!enviro.gas["phoron"] || enviro.gas["phoron"] < 40)
			return abort("ERROR: Not enough phoron to initiate reaction")

		reactant = container.reagents.reagent_list[1]

	if(source_pad && dest_pad)
		if(dest_pad.loc != dest_loc)
			return abort("ERROR: Output telepad not where expected, please recalibrate")

		if(num_containers > 1)
			return abort("ERROR: Too many containers detected on telepads")
		else
			sleep(10)
			source_pad.teleport()
			sleep(10) //give some time to see result of teleport
	else
		message = "WARNING: Telepads not detected. Beginning electrical field"

	switch(intensity) //time left in seconds
		if(1)
			timeLeft = 1
		if(2)
			timeLeft = 3
		if(3)
			timeLeft = 6
		if(4)
			timeLeft = 10
		if(5)
			timeLeft = 15

	timeLeft *= 2 //half seconds to make escape impossible from electrical fields
	timeLeftMax = timeLeft

	SSnanoui.update_uis(src) //update progress bar with new timeLeftMax

	var/obj/effect/electrical_field/small/field
	var/obj/effect/electrical_field/big/field2

	var/intensity2 = intensity //to ensure no shenanigans with changing intensities mid test
	if(!aborting)
		if(intensity != 4)
			field = new/obj/effect/electrical_field/small(source)

		if(intensity > 3)
			field2 = new/obj/effect/electrical_field/big(source)

	while(timeLeft > 0)
		if(aborting)
			aborting = 0
			timeLeft = 0
			if(stat & NOPOWER)
				message = "ERROR: Test aborted due to power loss"
			else
				message = "Test aborted"
			qdel(field)
			qdel(field2)
			if(dest_pad)
				sleep(10)
				dest_pad.anchored = 1
				dest_pad.teleport()
			return
		if(field)
			field.process_field()
		if(field2)
			field2.process_field()
		timeLeft--
		sleep(5)

	if(field2) //add a little extra damage to ensure eventual death on intensity 5 electrical field center
		field2.process_field()

	qdel(field)
	qdel(field2)

	//reaction time!
	var/reaction_happened = 0
	var/datum/reagent/phororeagent/phororeagent = null
	var/vol = 0
	if(reactant)
		vol = reactant.volume //must store because it gets cleared
		var/datum/phororeaction/process = phororeactions.reactions[reactant.id]
		if(process)
			var/result = process.get_result(intensity2)
			if(result == "Reaction successful")
				container.reagents.clear_reagents()
				container.reagents.add_reagent(process.result_id, min(vol * process.conversion_rate, container.volume))
				reaction_happened = 1
				phororeagent = container.reagents.reagent_list[1]

				var/datum/gas_mixture/enviro = source.return_air()
				enviro.adjust_gas("phoron", -0.15 * vol) //must fix to use proportion of moles with gas laws

			message = result
		else
			message = "No significant reaction detected"

	if(dest_pad)
		sleep(10)
		dest_pad.teleport()
		if(reaction_happened && phororeagent) //phororeagent probably unnecessary check
			spawn(rand(25, 50))
				message = phororeagent.initial_reaction(container, container.loc, vol, message)

/obj/machinery/computer/phoronics/proc/abort(var/text)
	message = text
	aborting = 0
	timeLeft = 0
	return

/obj/machinery/computer/phoronics/power_change()
	..()
	if(timeLeft > 0 && (stat & NOPOWER))
		aborting = 1

//Buildable computers stuff
/obj/item/circuitboard/phoronics
	name = T_BOARD("phorochemputer")
	build_path = /obj/machinery/computer/phoronics
	origin_tech = "programming=2;bluespace=2"
/*
/datum/design/circuit/phoronics
	name = "phorochemputer"
	id = "phorochemputer"
	req_tech = list("programming" = 3, "bluespace" = 2)
	build_path = /obj/item/circuitboard/phoronics
*/
