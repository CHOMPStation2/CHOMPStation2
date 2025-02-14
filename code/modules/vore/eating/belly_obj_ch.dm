//CHOMP vore additions.

/obj/belly
	//CHOMP - liquid bellies
	var/reagentbellymode = FALSE			// Belly has abilities to make liquids from digested/absorbed/drained prey and/or nutrition
	var/reagent_mode_flags = 0

	var/tmp/static/list/reagent_mode_flag_list= list(
		"Produce Liquids" = DM_FLAG_REAGENTSNUTRI,
		"Digestion Liquids" = DM_FLAG_REAGENTSDIGEST,
		"Absorption Liquids" = DM_FLAG_REAGENTSABSORB,
		"Draining Liquids" = DM_FLAG_REAGENTSDRAIN
		)

	var/show_liquids = FALSE //Moved from vorepanel_ch to be a belly var
	var/show_fullness_messages = FALSE //Moved from vorepanel_ch to be a belly var
	var/liquid_overlay = TRUE						//Belly-specific liquid overlay toggle
	var/max_liquid_level = 100						//Custom max level for liquid overlay
	var/mush_overlay = FALSE						//Toggle for nutrition mush overlay
	var/reagent_touches = TRUE						//If reagents touch and interact with things in belly
	var/mush_color = "#664330"						//Nutrition mush overlay color
	var/mush_alpha = 255							//Mush overlay transparency.
	var/max_mush = 500								//How much nutrition for full mush overlay
	var/min_mush = 0								//Manual setting for lowest mush level
	var/item_mush_val = 0							//How much solid belly contents raise mush level per item
	var/metabolism_overlay = FALSE					//Extra mush layer for ingested reagents currently in metabolism.
	var/metabolism_mush_ratio = 15					//Metabolism reagent volume per unit compared to nutrition units.
	var/max_ingested = 500							//How much metabolism content for full overlay.
	var/ingested_color = "#664330"					//Normal color holder for ingested layer. Blended from existing reagent colors.
	var/custom_ingested_color = null				//Custom color for ingested reagent layer.
	var/custom_ingested_alpha = 255					//Custom alpha for ingested reagent layer if not using normal mush layer.

	var/nutri_reagent_gen = FALSE					//if belly produces reagent over time using nutrition, needs to be optimized to use subsystem - Jack
	var/is_beneficial = FALSE							//Sets a reagent as a beneficial one / healing reagents
	var/list/generated_reagents = list(REAGENT_ID_WATER = 1) //Any number of reagents, the associated value is how many units are generated per process()
	var/reagent_name = REAGENT_ID_WATER 						//What is shown when reagents are removed, doesn't need to be an actual reagent
	var/reagentid = REAGENT_ID_WATER							//Selected reagent's id, for use in puddle system currently
	var/reagentcolor = "#0064C877"					//Selected reagent's color, for use in puddle system currently
	var/custom_reagentcolor							//Custom reagent color. Blank for normal reagent color
	var/custom_reagentalpha							//Custom reagent alpha. Blank for capacity based alpha
	var/gen_cost = 1 								//amount of nutrient taken from the host everytime nutrition is used to make reagents
	var/gen_amount = 1							//Does not actually influence amount produced, but is used as a way to tell the system how much total reagent it has to take into account when filling a belly

	var/gen_interval = 0							//Interval in seconds for generating fluids, once it reaches the value of gen_time one cycle of reagents generation will occur
	var/gen_time = 5								//Time it takes in seconds to produce one cycle of reagents, technically add 1 second to it for the tick where the fluid is produced
	var/gen_time_display = "1 hour"					//The displayed time it takes from a belly to go from 0 to 100
	var/custom_max_volume = 100						//Variable for people to limit amount of liquid they can receive/produce in a belly
	var/digest_nutri_gain = 0						//variable to store temporary nutrition gain from digestion and allow a seperate proc to ease up on the wall of code
	var/reagent_transfer_verb = "injects"			//verb for transfer of reagent from a vore belly

	var/vorefootsteps_sounds = FALSE				//If this belly can make sounds when someone walks around
	var/liquid_fullness1_messages = FALSE
	var/liquid_fullness2_messages = FALSE
	var/liquid_fullness3_messages = FALSE
	var/liquid_fullness4_messages = FALSE
	var/liquid_fullness5_messages = FALSE
	var/vorespawn_blacklist = FALSE
	var/vorespawn_whitelist = list()
	var/vorespawn_absorbed = 0

	var/list/fullness1_messages = list(
		"%pred's %belly looks empty"
		)
	var/list/fullness2_messages = list(
		"%pred's %belly looks filled"
		)
	var/list/fullness3_messages = list(
		"%pred's %belly looks like it's full of liquid"
		)
	var/list/fullness4_messages = list(
		"%pred's %belly is quite full!"
		)
	var/list/fullness5_messages = list(
		"%pred's %belly is completely filled to it's limit!"
		)

	// Stuff to add in future!
	/*
	var/list/empty_message = list("You feel as though your internal reagent implant is almost empty.")
	var/list/full_message = "You feel as though your internal reagent implant is full."

	var/list/emote_descriptor = list("tranfers something") //In format of [x] [emote_descriptor] into [container]
	var/list/self_emote_descriptor = list("transfer") //In format of You [self_emote_descriptor] some [generated_reagent] into [container]
	*/

	var/tmp/reagent_chosen = REAGENT_WATER				// variable for switch to figure out what to set variables when a certain reagent is selected
	var/tmp/static/list/reagent_choices = list(		// List of reagents people can chose, maybe one day expand so it covers criterias like dogborgs who can make meds, booze, etc - Jack
	REAGENT_WATER,
	REAGENT_MILK,
	REAGENT_CREAM,
	REAGENT_HONEY,
	REAGENT_CHERRYJELLY,
	REAGENT_STOMACID,
	REAGENT_DIETSTOMACID,
	REAGENT_CLEANER,
	REAGENT_LUBE,
	REAGENT_BIOMASS,
	REAGENT_CONCENTRATEDRADIUM,
	REAGENT_TRICORDRAZINE
	)

	var/tail_colouration = FALSE
	//var/marking_to_add = NULL
	//var/marking_color = NULL
	var/special_entrance_sound				// Mob specific custom entry sound set by mob's init_vore when applicable
	var/slow_digestion = FALSE				// Gradual corpse digestion
	var/slow_brutal = FALSE					// Gradual corpse digestion: Stumpy's Special
	var/sound_volume = 100					// Volume knob.
	var/speedy_mob_processing = FALSE		// Independent belly processing to utilize SSobj instead of SSbellies 3x speed.
	var/cycle_sloshed = FALSE				// Has vorgan entrance made a wet slosh this cycle? Soundspam prevention for multiple items entered.
	var/egg_cycles = 0						// Process egg mode after 10 cycles.
	var/recycling = FALSE					// Recycling mode.
	var/entrance_logs = TRUE				// Belly-specific entry message toggle.
	var/noise_freq = 42500					// Tasty sound prefs.
	var/item_digest_logs = FALSE			// Chat messages for digested items.
	var/storing_nutrition = FALSE			// Storing gained nutrition as paste instead of absorbing it.
	var/belchchance = 0						// % Chance of pred belching on prey struggle

	var/list/belly_surrounding = list()		// A list of living mobs surrounded by this belly, including inside containers, food, on mobs, etc. Exclusing inside other bellies.



///////////////////// NUTRITION REAGENT PRODUCTION /////////////////

/obj/belly/proc/HandleBellyReagents()
	if(show_liquids && reagentbellymode && reagent_mode_flags & DM_FLAG_REAGENTSNUTRI && reagents.total_volume < custom_max_volume && !isnewplayer(owner)) //Removed if(reagentbellymode == TRUE) since that's less optimized
		if(isrobot(owner))
			var/mob/living/silicon/robot/R = owner
			if(R.cell && R.cell.charge >= gen_cost*10 && gen_interval >= gen_time)
				GenerateBellyReagents()
				gen_interval = 0
			else
				gen_interval++
		else
			if(owner.nutrition >= gen_cost && gen_interval >= gen_time)
				GenerateBellyReagents()
				gen_interval = 0
			else
				gen_interval++

/obj/belly/proc/HandleBellyReagentEffects(var/list/touchable_atoms)
	if(LAZYLEN(contents))
		if(show_liquids && reagent_touches && reagents.total_volume >= 5)
			var/affecting_amt = reagents.total_volume / max(LAZYLEN(touchable_atoms), 1)
			if(affecting_amt > 5)
				affecting_amt = 5
			if(affecting_amt >= 1)
				for(var/mob/living/L in touchable_atoms)
					if(!L.apply_reagents)
						continue
					if((L.digestable && digest_mode == DM_DIGEST))
						if(!L.permit_healbelly && is_beneficial) // Healing reagents turned off in preferences!
							continue
						if(reagents.total_volume)
							reagents.trans_to(L, affecting_amt, 1, FALSE)
					if(L.permit_healbelly && digest_mode == DM_HEAL)
						if(is_beneficial && reagents.total_volume)
							reagents.trans_to(L, affecting_amt, 1, FALSE)
				for(var/obj/item/I in touchable_atoms)
					if(is_type_in_list(I, item_digestion_blacklist))
						continue
					if(reagents.total_volume)
						reagents.trans_to(I, affecting_amt, 1, FALSE)
		SEND_SIGNAL(src, COMSIG_BELLY_UPDATE_VORE_FX, FALSE, reagents.total_volume) // Signals vore_fx() reagents updates.
		for(var/mob/living/L in contents)
			vore_fx(L, FALSE, reagents.total_volume)
	if(owner.previewing_belly == src)
		vore_fx(owner, FALSE, reagents.total_volume)

/obj/belly/proc/GenerateBellyReagents()
	if(isrobot(owner))
		var/mob/living/silicon/robot/R = owner
		if(!R.use_direct_power(gen_cost*10, 200))
			return
	else
		owner.nutrition -= gen_cost
	for(var/reagent in generated_reagents)
		reagents.add_reagent(reagent, generated_reagents[reagent])
	if(count_liquid_for_sprite)
		owner.handle_belly_update() //This is run whenever a belly's contents are changed.
	if(LAZYLEN(belly_surrounding))
		SEND_SIGNAL(src, COMSIG_BELLY_UPDATE_VORE_FX, FALSE, reagents.total_volume) // Signals vore_fx() reagents updates.

//////////////////////////// REAGENT_DIGEST ////////////////////////

/obj/belly/proc/GenerateBellyReagents_digesting()	//The rate isnt based on selected reagent, due to the fact that the price of the reagent is already paid by nutrient not gained.
	if(reagents.total_volume + (digest_nutri_gain * gen_amount) <= custom_max_volume) //By default a reagent with an amount of 1 should result in pred getting 100 units from a full health prey
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] * digest_nutri_gain / gen_cost)
	else
		owner_adjust_nutrition(digest_nutri_gain * owner.get_digestion_efficiency_modifier())
	digest_nutri_gain = 0

/obj/belly/proc/GenerateBellyReagents_digested()
	if(reagents.total_volume <= custom_max_volume - 25 * gen_amount)
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] * 25)
	else
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] / gen_amount * (custom_max_volume - reagents.total_volume))
	digest_nutri_gain = 0

//////////////////////////// REAGENT_ABSORB ////////////////////////

/obj/belly/proc/GenerateBellyReagents_absorbing()
	if(reagents.total_volume <= custom_max_volume - 1.5 * gen_amount) //Going for 1.5 amount of reagent per cycle, can be adjusted in future if need adjustments
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] * 1.5)
	else
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] / gen_amount * (custom_max_volume - reagents.total_volume))

/obj/belly/proc/GenerateBellyReagents_absorbed()
	if(reagents.total_volume <= custom_max_volume - 25 * gen_amount) //Going for 25 amount of reagent for absorbing the prey, can be adjusted in future if need adjustments
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] * 10)
	else
		for(var/reagent in generated_reagents)
			reagents.add_reagent(reagent, generated_reagents[reagent] / gen_amount * (custom_max_volume - reagents.total_volume))

//////////////////////////// REAGENT_DRAIN ///////////////////////// //Currently not needed, maybe later a specific proc for drain needs to be made - Jack



//////////////////////////// REAGENT SELECTION /////////////////////

//This is gonna end up a long proc, but its gonna have to make do for now

/obj/belly/proc/ReagentSwitch()
	switch(reagent_chosen)
		if(REAGENT_WATER)
			generated_reagents = list(REAGENT_ID_WATER = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = REAGENT_ID_WATER
			gen_amount = 1
			gen_cost = 1
			reagentid = REAGENT_ID_WATER
			reagentcolor = "#0064C877"
		if(REAGENT_MILK)
			generated_reagents = list(REAGENT_ID_MILK = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = REAGENT_ID_MILK
			gen_amount = 1
			gen_cost = 5
			reagentid = REAGENT_ID_MILK
			reagentcolor = "#DFDFDF"
		if(REAGENT_CREAM)
			generated_reagents = list(REAGENT_ID_CREAM = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = REAGENT_ID_CREAM
			gen_amount = 1
			gen_cost = 5
			reagentid = REAGENT_ID_CREAM
			reagentcolor = "#DFD7AF"
		if(REAGENT_HONEY)
			generated_reagents = list(REAGENT_ID_HONEY = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = REAGENT_ID_HONEY
			gen_amount = 1
			gen_cost = 10
			reagentid = REAGENT_ID_HONEY
			reagentcolor = "#FFFF00"
		if(REAGENT_CHERRYJELLY)	//Kinda WIP, allows slime like folks something to stuff others with, should make a generic jelly in future
			generated_reagents = list(REAGENT_ID_CHERRYJELLY = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = "cherry jelly"
			gen_amount = 1
			gen_cost = 10
			reagentid = REAGENT_ID_CHERRYJELLY
			reagentcolor = "#801E28"
		if(REAGENT_STOMACID)
			generated_reagents = list(REAGENT_ID_STOMACID = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = "digestive acid"
			gen_amount = 1
			gen_cost = 1
			reagentid = REAGENT_ID_STOMACID
			reagentcolor = "#664330"
		if(REAGENT_DIETSTOMACID)
			generated_reagents = list(REAGENT_ID_DIETSTOMACID = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = "diluted digestive acid"
			gen_amount = 1
			gen_cost = 1
			reagentid = REAGENT_ID_DIETSTOMACID
			reagentcolor = "#664330"
		if(REAGENT_CLEANER)
			generated_reagents = list(REAGENT_ID_CLEANER = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = REAGENT_CLEANER
			gen_amount = 1
			gen_cost = 10
			reagentid = REAGENT_ID_CLEANER
			reagentcolor = "#A5F0EE"
		if(REAGENT_LUBE)
			generated_reagents = list(REAGENT_ID_LUBE = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = REAGENT_ID_LUBE
			gen_amount = 1
			gen_cost = 10
			reagentid = REAGENT_ID_LUBE
			reagentcolor = "#009CA8"
		if(REAGENT_BIOMASS)
			generated_reagents = list(REAGENT_ID_BIOMASS = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = REAGENT_ID_BIOMASS
			gen_amount = 1
			gen_cost = 10
			reagentid = REAGENT_ID_BIOMASS
			reagentcolor = "#DF9FBF"
		if(REAGENT_CONCENTRATEDRADIUM)
			generated_reagents = list(REAGENT_ID_CONCENTRATEDRADIUM = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = "concentrated radium"
			gen_amount = 1
			gen_cost = 1
			reagentid = REAGENT_ID_CONCENTRATEDRADIUM
			reagentcolor = "#C7C7C7"
		if(REAGENT_TRICORDRAZINE)
			generated_reagents = list(REAGENT_ID_TRICORDRAZINE = 1)
			if(capitalize(reagent_name) in reagent_choices)
				reagent_name = REAGENT_ID_TRICORDRAZINE
			gen_amount = 1
			gen_cost = 10
			reagentid = REAGENT_ID_TRICORDRAZINE
			reagentcolor = "#8040FF"
			is_beneficial = TRUE


/////////////////////// FULLNESS MESSAGES //////////////////////

// Get the line that should show up in Examine message if the owner of this belly is examined.
// Returns a string which shoul be appended to the Examine output.
// Yes I know it doesnt look great with 5 almost identical procs in a row, I didnt have a better idea at the time - Jack
/obj/belly/proc/get_reagent_examine_msg1()
	if(fullness1_messages.len)
		var/formatted_message
		var/raw_message = pick(fullness1_messages)

		formatted_message = replacetext(raw_message,"%belly",lowertext(name))
		formatted_message = replacetext(formatted_message,"%pred",owner)

		return(span_red("[formatted_message]<BR>"))

/obj/belly/proc/get_reagent_examine_msg2()
	if(fullness1_messages.len)
		var/formatted_message
		var/raw_message = pick(fullness2_messages)

		formatted_message = replacetext(raw_message,"%belly",lowertext(name))
		formatted_message = replacetext(formatted_message,"%pred",owner)

		return(span_red("[formatted_message]<BR>"))

/obj/belly/proc/get_reagent_examine_msg3()
	if(fullness1_messages.len)
		var/formatted_message
		var/raw_message = pick(fullness3_messages)

		formatted_message = replacetext(raw_message,"%belly",lowertext(name))
		formatted_message = replacetext(formatted_message,"%pred",owner)

		return(span_red("[formatted_message]<BR>"))

/obj/belly/proc/get_reagent_examine_msg4()
	if(fullness1_messages.len)
		var/formatted_message
		var/raw_message = pick(fullness4_messages)

		formatted_message = replacetext(raw_message,"%belly",lowertext(name))
		formatted_message = replacetext(formatted_message,"%pred",owner)

		return(span_red("[formatted_message]<BR>"))

/obj/belly/proc/get_reagent_examine_msg5()
	if(fullness1_messages.len)
		var/formatted_message
		var/raw_message = pick(fullness5_messages)

		formatted_message = replacetext(raw_message,"%belly",lowertext(name))
		formatted_message = replacetext(formatted_message,"%pred",owner)

		return(span_red("[formatted_message]<BR>"))


// The next function gets the messages set on the belly, in human-readable format.
// This is useful in customization boxes and such. The delimiter right now is \n\n so
// in message boxes, this looks nice and is easily delimited.
/obj/belly/proc/get_reagent_messages(var/type, var/delim = "\n\n")
	ASSERT(type == "full1" || type == "full2" || type == "full3" || type == "full4" || type == "full5")
	var/list/raw_messages

	switch(type)
		if("full1")
			raw_messages = fullness1_messages
		if("full2")
			raw_messages = fullness2_messages
		if("full3")
			raw_messages = fullness3_messages
		if("full4")
			raw_messages = fullness4_messages
		if("full5")
			raw_messages = fullness5_messages

	var/messages = raw_messages.Join(delim)
	return messages

// The next function sets the messages on the belly, from human-readable var
// replacement strings and linebreaks as delimiters (two \n\n by default).
// They also sanitize the messages.
/obj/belly/proc/set_reagent_messages(var/raw_text, var/type, var/delim = "\n\n")
	ASSERT(type == "full1" || type == "full2" || type == "full3" || type == "full4" || type == "full5")

	var/list/raw_list = splittext(html_encode(raw_text),delim)
	if(raw_list.len > 10)
		raw_list.Cut(11)
		log_debug("[owner] tried to set [lowertext(name)] with 11+ messages")

	for(var/i = 1, i <= raw_list.len, i++)
		if(length(raw_list[i]) > 160 || length(raw_list[i]) < 10) //160 is fudged value due to htmlencoding increasing the size
			raw_list.Cut(i,i)
			log_debug("[owner] tried to set [lowertext(name)] with >121 or <10 char message")
		else
			raw_list[i] = readd_quotes(raw_list[i])
			//Also fix % sign for var replacement
			raw_list[i] = replacetext(raw_list[i],"&#37;","%")

	ASSERT(raw_list.len <= 10) //Sanity

	switch(type)
		if("full1")
			fullness1_messages = raw_list
		if("full2")
			fullness2_messages = raw_list
		if("full3")
			fullness3_messages = raw_list
		if("full4")
			fullness4_messages = raw_list
		if("full5")
			fullness5_messages = raw_list

	return

/////////////////////////// Process Cycle Lite /////////////////////////// CHOMP PCL
/obj/belly/proc/quick_cycle() //For manual belly cycling without straining the bellies subsystem.
	HandleBellyReagents()	//CHOMP reagent belly stuff.
	// VERY early exit
	if(!contents.len)
		return

	var/to_update = FALSE //Did anything update worthy happen?

/////////////////////////// Exit Early //////////////////////////// CHOMP PCL
	var/list/touchable_atoms = contents - items_preserved
	if(!length(touchable_atoms))
		return

	var/datum/digest_mode/DM = GLOB.digest_modes["[digest_mode]"]
	if(!DM)
		log_debug("Digest mode [digest_mode] didn't exist in the digest_modes list!!")
		return FALSE
	if(DM.handle_atoms(src, touchable_atoms))
		updateVRPanels()
		return

	var/list/touchable_mobs = null

	var/list/hta_returns = handle_touchable_atoms(touchable_atoms)
	if(islist(hta_returns))
		if(hta_returns["touchable_mobs"])
			touchable_mobs = hta_returns["touchable_mobs"]
		if(hta_returns["to_update"])
			to_update = hta_returns["to_update"]

	if(!LAZYLEN(touchable_mobs))
		return

///////////////////// Time to actually process mobs ///////////////////// CHOMP PCL
	for(var/target in touchable_mobs)
		var/mob/living/L = target
		if(!istype(L))
			continue
		var/list/returns = DM.process_mob(src, target)
		if(istype(returns) && returns["to_update"])
			to_update = TRUE

	if(to_update)
		updateVRPanels()
/////////////////////////// CHOMP PCL END ///////////////////////////

/obj/belly/proc/update_internal_overlay()
	if(LAZYLEN(belly_surrounding))
		SEND_SIGNAL(src, COMSIG_BELLY_UPDATE_VORE_FX, TRUE) // Signals vore_fx() to listening atoms. Atoms must handle appropriate isliving() checks.
	for(var/A in belly_surrounding)
		if(isliving(A))
			vore_fx(A,1)
	if(owner.previewing_belly == src)
		if(isbelly(owner.loc))
			owner.previewing_belly = null
			return
		vore_fx(owner,1)

/obj/belly/deserialize(var/list/data)
	..()
	STOP_PROCESSING(SSbellies, src)
	STOP_PROCESSING(SSobj, src)
	if(speedy_mob_processing)
		START_PROCESSING(SSobj, src)
	else
		START_PROCESSING(SSbellies, src)

/obj/item/debris_pack/digested
	name = "digested material"
	desc = "Some thoroughly digested mass of ... something. Might be useful for recycling."
	icon = 'icons/obj/recycling.dmi'
	icon_state = "matdust"
	color = "#664330"
	w_class = ITEMSIZE_SMALL

/obj/belly/proc/recycle(var/obj/item/O)
	if(!recycling || (!LAZYLEN(O.matter) && !istype(O, /obj/item/ore)))
		return FALSE
	if(istype(O, /obj/item/ore))
		var/obj/item/ore/ore = O
		for(var/obj/item/ore_chunk/C in contents)
			if(istype(C))
				C.stored_ore[ore.material]++
				return TRUE
		var/obj/item/ore_chunk/newchunk = new /obj/item/ore_chunk(src)
		newchunk.stored_ore[ore.material]++
		return TRUE
	else
		var/list/modified_mats = list()
		var/trash = 1
		if(istype(O,/obj/item/trash))
			trash = 5
		if(istype(O,/obj/item/stack))
			var/obj/item/stack/S = O
			trash = S.amount
		for(var/mat in O.matter)
			modified_mats[mat] = O.matter[mat] * trash
		for(var/obj/item/debris_pack/digested/D in contents)
			if(istype(D))
				for(var/mat in modified_mats)
					D.matter[mat] += modified_mats[mat]
				if(O.w_class > D.w_class)
					D.w_class = O.w_class
				//CHOMPAdd Start
				if(O.possessed_voice && O.possessed_voice.len)
					for(var/mob/living/voice/V in O.possessed_voice)
						D.inhabit_item(V, null, V.tf_mob_holder)
						qdel(V)
					O.possessed_voice = list()
				//CHOMPAdd End
				return TRUE
		var/obj/item/debris_pack/digested/D = new /obj/item/debris_pack/digested(src, modified_mats) //CHOMPEdit
		//CHOMPAdd Start
		if(O.possessed_voice && O.possessed_voice.len)
			for(var/mob/living/voice/V in O.possessed_voice)
				D.inhabit_item(V, null, V.tf_mob_holder)
				qdel(V)
			O.possessed_voice = list()
		//CHOMPAdd End
	return TRUE

/obj/belly/proc/owner_adjust_nutrition(var/amount = 0)
	if(storing_nutrition && amount > 0)
		for(var/obj/item/reagent_containers/food/rawnutrition/R in contents)
			if(istype(R))
				R.stored_nutrition += amount
				return
		var/obj/item/reagent_containers/food/rawnutrition/NR = new /obj/item/reagent_containers/food/rawnutrition(src)
		NR.stored_nutrition += amount
		return
	else
		owner.adjust_nutrition(amount)

/obj/item/reagent_containers/food/rawnutrition
	name = "raw nutrition"
	desc = "A nutritious pile of converted mass ready for consumption."
	icon = 'icons/obj/recycling.dmi'
	icon_state = "matdust"
	color = "#664330"
	w_class = ITEMSIZE_SMALL
	var/stored_nutrition = 0

/obj/item/reagent_containers/food/rawnutrition/standard_feed_mob(var/mob/user, var/mob/target)
	if(isliving(target))
		var/mob/living/L = target
		L.nutrition += stored_nutrition
		stored_nutrition = 0
		qdel(src)
		return
	.=..()

// Updates the belly_surrounding list variable. Called in bellymodes_vr.dm
/obj/belly/proc/update_belly_surrounding()
	if(!contents.len && !LAZYLEN(owner.soulgem?.brainmobs))
		belly_surrounding = list()
		return
	belly_surrounding = get_belly_surrounding(contents)
	if(owner.soulgem?.linked_belly == src)
		belly_surrounding += owner.soulgem.brainmobs

// Recursive proc that returns all living mobs directly and indirectly inside a belly
// This can also be called more generically to get all living mobs not in bellies within any contents list
/obj/belly/proc/get_belly_surrounding(var/list/C)
	var/list/surrounding = list()
	for(var/thing in C)
		if(istype(thing,/mob/living))
			var/mob/living/L = thing
			surrounding.Add(L)
			surrounding.Add(get_belly_surrounding(L.contents))
		if(istype(thing,/obj/item))
			var/obj/item/I = thing
			surrounding.Add(get_belly_surrounding(I.contents))
	return surrounding

/obj/belly/proc/effective_emote_hearers()
	. = list(loc)
	for(var/atom/movable/AM as anything in contents)
		//if(AM.atom_flags & ATOM_HEAR)
		. += AM
