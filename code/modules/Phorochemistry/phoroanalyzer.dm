/obj/machinery/phoroanalyzer
	name = "Chemical Analyzer"
	density = 1
	anchored = 1
	icon = 'icons/obj/chemical.dmi'
	icon_state = "mixer0b"
	use_power = 1
	idle_power_usage = 20
	var/obj/item/reagent_containers/stored = null

/obj/machinery/phoroanalyzer/attackby(var/obj/item/B as obj, var/mob/user as mob)
	if(istype(B, /obj/item/reagent_containers))
		stored = B
		if(stored.reagents.reagent_list.len > 1)
			state("Error: Multiple reagents detected")
			return

		if(stored.reagents.reagent_list.len == 0)
			state("Error: No reagents detected")
			return

		var/datum/reagent/R = stored.reagents.reagent_list[1]
		user.drop_item()
		B.loc = src
		icon_state = "mixer1b"
		//say analyze stuff
		spawn(0)
			analyze(R)
			B.loc = src.loc
			icon_state = "mixer0b"
	else
		return

/obj/machinery/phoroanalyzer/proc/analyze(var/datum/reagent/R)
	if(istype(R, /datum/reagent/phororeagent))
		var/datum/reagent/phororeagent/P = R
		var/description = "Analysis complete - [P.name]: [P.description]"
		var/id = P.id
		sleep(20)
		discovered_phororeagents.Add(id)
		state(description)
	else
		var/description = "Analysis complete - [R.name]: [R.description]"
		sleep(20)
		state(description)