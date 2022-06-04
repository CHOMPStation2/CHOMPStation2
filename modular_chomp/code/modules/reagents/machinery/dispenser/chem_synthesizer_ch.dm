#define SYNTHESIZER_MAX_CARTRIDGES 40
#define SYNTHESIZER_MAX_RECIPES 20
#define SYNTHESIZER_MAX_QUEUE 40
#define RECIPE_MAX_STRING 160
#define RECIPE_MAX_STEPS 16

// Recipes are stored as a list which alternates between chemical id's and volumes to add.

// TODO:
// Design UI
// DONE TGUI procs
// DONE Create procs to take synthesis steps as an input and stores as a 1 click synthesis button. Needs name, expected output volume.
// DONE Create procs to actually perform the reagent transfer/etc. for a synthesis, reading the stored synthesis steps.
// DONE Implement a step-mode where the player manually clicks on each step and an expert mode where players input a comma-delineated list.
// DONE Add process() code which makes the machine actually work. Perhaps tie a boolean and single start proc into process().
// DONE Give the machine queue-behavior which allows players to queue up multiple recipes, even when the machine is busy. Reference protolathe code.
// DONE Give the machine a way to stop a synthesis and purge/bottle the reaction vessel.
// DONE Perhaps use recipes as a "ID" "num" "ID" "num" list to avoid using multiple lists.
// DONE Panel open button.
// DONE Code for power usage.
// Update_icon() overrides.
// Underlay code for the reaction vessel.
// DONE Add an eject catalyst bottle button.
// DONE Make sure recipes can only be removed when the machine is idle. Adding should be fine.
// May need yet another list which is just strings which match recipe ID's.
// For user recipes, make clicking on the recipe give a prompt with "add to queue," "export recipe," and "delete recipe."

/obj/machinery/chemical_synthesizer
	name = "chemical synthesizer"
	desc = "A programmable machine capable of automatically synthesizing medicine."
	icon = 'modular_chomp/icons/obj/chemical_ch.dmi'
	icon_state = "synth_idle_bottle"

	use_power = USE_POWER_IDLE
	power_channel = EQUIP
	idle_power_usage = 100
	active_power_usage = 150
	anchored = TRUE
	unacidable = TRUE
	panel_open = TRUE

	var/busy = FALSE
	var/production_mode = FALSE // Toggle between click-step input and comma-delineated text input for creating recipes.
	var/use_catalyst = TRUE // Determines whether or not the catalyst will be added to reagents while processing a recipe.
	var/delay_modifier = 3 // This is multiplied by the volume of a step to determine how long each step takes. Bigger volume = slower.
	var/obj/item/weapon/reagent_containers/glass/catalyst = null // This is where the user adds catalyst. Usually phoron.

	var/list/recipes = list(list()) // This holds chemical recipes up to a maximum determined by SYNTHESIZER_MAX_RECIPES. Two-dimensional.
	var/list/queue = list() // This holds the recipe id's for queued up recipes.
	var/list/catalyst_ids = list() // This keeps track of the chemicals in the catalyst to remove before bottling.
	var/list/cartridges = list() // Associative, label -> cartridge

	var/list/spawn_cartridges = list(
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/hydrogen,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lithium,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/carbon,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/nitrogen,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/oxygen,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/fluorine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sodium,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/aluminum,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/silicon,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/phosphorus,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sulfur,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/chlorine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/potassium,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/iron,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/copper,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/mercury,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/radium,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/water,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ethanol,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sugar,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sacid,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tungsten,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/calcium
		)

	var/_recharge_reagents = TRUE
	var/process_tick = 0
	var/list/dispense_reagents = list(
		"hydrogen", "lithium", "carbon", "nitrogen", "oxygen", "fluorine", "sodium",
		"aluminum", "silicon", "phosphorus", "sulfur", "chlorine", "potassium", "iron",
		"copper", "mercury", "radium", "water", "ethanol", "sugar", "sacid", "tungsten", "calcium"
		)

/obj/machinery/chemical_synthesizer/Initialize()
	. = ..()
	// Create the reagents datum which will act as the machine's reaction vessel.
	create_reagents(600)
	catalyst = new /obj/item/weapon/reagent_containers/glass/beaker(src)

	if(spawn_cartridges)
		for(var/type in spawn_cartridges)
			add_cartridge(new type(src))
		panel_open = FALSE

/obj/machinery/chemical_synthesizer/examine(mob/user)
	. = ..()
	if(panel_open)
		. += "It has [cartridges.len] cartridges installed, and has space for [SYNTHESIZER_MAX_CARTRIDGES - cartridges.len] more."

/obj/machinery/chemical_synthesizer/proc/add_cartridge(obj/item/weapon/reagent_containers/chem_disp_cartridge/C, mob/user)
	if(!panel_open)
		if(user)
			to_chat(user, "<span class='warning'>\The panel is locked!</span>")
		return

	if(!istype(C))
		if(user)
			to_chat(user, "<span class='warning'>\The [C] will not fit in \the [src]!</span>")
		return

	if(cartridges.len >= SYNTHESIZER_MAX_CARTRIDGES)
		if(user)
			to_chat(user, "<span class='warning'>\The [src] does not have any slots open for \the [C] to fit into!</span>")
		return

	if(!C.label)
		if(user)
			to_chat(user, "<span class='warning'>\The [C] does not have a label!</span>")
		return

	if(cartridges[C.label])
		if(user)
			to_chat(user, "<span class='warning'>\The [src] already contains a cartridge with that label!</span>")
		return

	if(user)
		user.drop_from_inventory(C)
		to_chat(user, "<span class='notice'>You add \the [C] to \the [src].</span>")

	C.loc = src
	cartridges[C.label] = C
	cartridges = sortAssoc(cartridges)
	SStgui.update_uis(src)

/obj/machinery/chemical_synthesizer/proc/remove_cartridge(label)
	. = cartridges[label]
	cartridges -= label
	SStgui.update_uis(src)

/obj/machinery/chemical_synthesizer/attackby(obj/item/weapon/W, mob/user)
	// Why do so many people code in wrenching when there's already a proc for it?
	if(!busy && default_unfasten_wrench(user, W, 40))
		return

	if(istype(W, /obj/item/weapon/reagent_containers/chem_disp_cartridge))
		add_cartridge(W, user)
		return

	// But we won't use the screwdriver proc because chem dispenser behavior.
	if(panel_open && W.is_screwdriver())
		var/label = tgui_input_list(user, "Which cartridge would you like to remove?", "Chemical Synthesizer", cartridges)
		if(!label)
			return
		var/obj/item/weapon/reagent_containers/chem_disp_cartridge/C = remove_cartridge(label)
		if(C)
			to_chat(user, "<span class='notice'>You remove \the [C] from \the [src].</span>")
			C.loc = loc
			playsound(src, W.usesound, 50, 1)
			return

	// We don't need a busy check here as the catalyst slot must be occupied for the machine to function.
	if(istype(W, /obj/item/weapon/reagent_containers/glass))
		if(catalyst)
			to_chat(user, "<span class='warning'>There is already \a [catalyst] in \the [src] catalyst slot!</span>")
			return

		var/obj/item/weapon/reagent_containers/RC = W

		if(!RC.is_open_container())
			to_chat(user, "<span class='warning'>You don't see how \the [src] could extract reagents from \the [RC].</span>")
			return

		catalyst =  RC
		user.drop_from_inventory(RC)
		RC.loc = src
		to_chat(user, "<span class='notice'>You set \the [RC] on \the [src].</span>")
		update_icon()
		return

	return ..()

// More stolen chemical_dispenser code.
/obj/machinery/chemical_synthesizer/process()
	if(!_recharge_reagents)
		return
	if(stat & (BROKEN|NOPOWER))
		return
	if(--process_tick <= 0)
		process_tick = 15
		. = 0
		for(var/id in dispense_reagents)
			var/datum/reagent/R = SSchemistry.chemical_reagents[id]
			if(!R)
				stack_trace("[src] at [x],[y],[z] failed to find reagent '[id]'!")
				dispense_reagents -= id
				continue
			var/obj/item/weapon/reagent_containers/chem_disp_cartridge/C = cartridges[R.name]
			if(C && C.reagents.total_volume < C.reagents.maximum_volume)
				var/to_restore = min(C.reagents.maximum_volume - C.reagents.total_volume, 5)
				use_power(to_restore * 500)
				C.reagents.add_reagent(id, to_restore)
				. = 1
		if(.)
			SStgui.update_uis(src)

/obj/machinery/chemical_synthesizer/tgui_interact(mob/user, datum/tgui/ui = null)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ChemSynthesizer", name)
		ui.open()

/obj/machinery/chemical_synthesizer/tgui_data(mob/user)
	var/list/data = list()

	data["busy"] = busy
	data["production_mode"] = production_mode
	data["panel_open"] = panel_open
	data["use_catalyst"] = use_catalyst

	// Queue and recipe lists might not be formatted correctly here. Delete this once you've confirmed.
	data["queue"] = queue
	data["recipes"] = recipes



	// Read data from the reaction vessel.
	var/list/vessel_reagents_list = list()
	data["rxn_vessel"] = vessel_reagents_list
	for(var/datum/reagent/R in src.reagents.reagent_list)
		vessel_reagents_list[++vessel_reagents_list.len] = list("name" = R.name, "volume" = R.volume, "description" = R.description, "id" = R.id)

	// Read data from the catalyst, if present.
	data["catalyst"] = catalyst ? 1 : 0
	if(catalyst)
		var/list/catalyst_reagents_list = list()
		data["catalyst_reagents"] = catalyst_reagents_list
		for(var/datum/reagent/R in catalyst.reagents.reagent_list)
			catalyst_reagents_list[++catalyst_reagents_list.len] = list("name" = R.name, "volume" = R.volume, "description" = R.description, "id" = R.id)

	var/chemicals[0]
	for(var/label in cartridges)
		var/obj/item/weapon/reagent_containers/chem_disp_cartridge/C = cartridges[label]
		chemicals.Add(list(list("title" = label, "id" = label, "amount" = C.reagents.total_volume))) // list in a list because Byond merges the first list
	data["chemicals"] = chemicals

	return data

/obj/machinery/chemical_synthesizer/tgui_act(action, params)
	if(..())
		return TRUE

	. = TRUE
	switch(action)
		if("start_queue")
			// Start up the queue.
			if(!busy)
				start_queue()
		if("rem_queue")
			// Remove a single entry from the queue.
			var/index = text2num(params["q_index"])
			if(!isnum(index) || !ISINTEGER(index) || !istype(queue) || (index<1 || index>length(queue)))
				return
			queue -= queue[index]
		if("clear_queue")
			// Remove all entries from the queue except the currently processing recipe.
			var/confirm = alert(usr, "Are you sure you want to clear the running queue?", "Confirm", "No", "Yes")
			if(confirm == "Yes")
				queue = list()
		if("eject_catalyst")
			// Removes the catalyst bottle from the machine.
			if(!busy && catalyst)
				catalyst.forceMove(get_turf(src))
				catalyst = null
		if("toggle_catalyst")
			// Decides if the machine uses the catalyst.
			if(!busy)
				use_catalyst = !use_catalyst
		if("emergency_stop")
			// Stops everything if that's desirable for some reason.
			if(busy)
				stall()
		if("bottle_product")
			// Bottles the reaction mixture if stalled.
			if(!busy)
				bottle_product()
		if("panel_toggle")
			// Opens/closes the panel.
			if(!busy)
				panel_open = !panel_open
		if("add_recipe")
			// Allows the user to add a recipe. Kinda vital for this machine to do anything useful.
			if(recipes.len >= SYNTHESIZER_MAX_RECIPES)
				to_chat(usr, "<span class='warning'>Maximum recipes exceeded!</span>")
				return
			if(!production_mode)
				babystep_recipe(usr)
			else
				import_recipe(usr)
		if("rem_recipe")
			// Allows the user to remove recipes while the machine is idle.
			if(!busy)
				var/confirm = alert(usr, "Are you sure you want to remove this recipe?", "Confirm", "No", "Yes")
				if(confirm == "Yes")
					var/index = params["rm_index"]
					if(index in recipes)
						recipes -= recipes[index]
		if("exp_recipe")
			// Allows the user to export recipes to chat formatted for easy importing. 
			var/index = params["exp_index"]
			export_recipe(usr, index)
		if("add_queue")
			// Adds recipes to the queue.
			if(queue.len >= SYNTHESIZER_MAX_QUEUE)
				to_chat(usr, "<span class='warning'>Synthesizer queue full!</span>")
				return
			var/index = params["qa_index"]
			// If you forgot, this is a string returned by the user pressing the "add to queue" button on a recipe.
			if(index in recipes)
				queue[queue.len + 1] = index

	add_fingerprint(usr)

/obj/machinery/chemical_synthesizer/attack_ghost(mob/user)
	if(stat & (BROKEN|NOPOWER))
		return
	tgui_interact(user)

/obj/machinery/chemical_synthesizer/attack_ai(mob/user)
	attack_hand(user)

/obj/machinery/chemical_synthesizer/attack_hand(mob/user)
	if(stat & (BROKEN|NOPOWER))
		return
	tgui_interact(user)

// This proc is lets users create recipes step-by-step and exports a comma delineated list to chat. It's intended to teach how to use the machine.
/obj/machinery/chemical_synthesizer/proc/babystep_recipe(mob/user)
	var/rec_name = sanitizeSafe(input(user, "Name your recipe. Consider including the output volume.", "Recipe naming", null) as text, MAX_NAME_LEN)
	if(!rec_name || (rec_name in recipes)) // Code requires each recipe to have a unique name.
		to_chat(user, "Please provide a unique recipe name!")
		return

	var/steps = 2 * CLAMP(round(input(user, "How many steps does your recipe contain (16 max)?", "Steps", null)), 0, RECIPE_MAX_STEPS) // Round to get a whole integer, clamp to ensure proper range.
	var/new_rec = list() // This holds the actual recipe.
	for(var/i = 1, i < steps, i += 2) // For the user, 1 step is both text and volume. For list arithmetic, that's 2 steps.
		var/label = tgui_input_list(user, "Which chemical would you like to use?", "Chemical Synthesizer", cartridges)
		if(!label)
			to_chat(user, "Please select a chemical!")
			return
		new_rec[i] = label // Add the reagent ID.
		var/amount = CLAMP(round(input(user, "How much of the chemical would you like to add?", "Volume", null)), 0, src.reagents.maximum_volume)
		if(!amount)
			to_chat(user, "Please select a volume!")
			return
		new_rec[i+1] = amount // Add the amount of reagent.

	recipes[rec_name] = new_rec
	SStgui.update_uis(src)
	export_recipe(user, rec_name) // Now export the recipe to the user's chatbox formatted for import_recipe().
	return

// This proc allows users to copy-paste a comma delineated list to create a recipe. The recipe will cause a stall() if formatted incorrectly.
/obj/machinery/chemical_synthesizer/proc/import_recipe(mob/user)
	var/rec_name = sanitizeSafe(input(user, "Name your recipe. Consider including the output volume.", "Recipe naming", null) as text, MAX_NAME_LEN)
	if(!rec_name || (rec_name in recipes)) // Code requires each recipe to have a unique name.
		to_chat(user, "Please provide a unique recipe name!")
		return

	var/rec_input = input(user, "Input your recipe as 'Chem1,Vol1,Chem2,Vol2,...'", "Import recipe", null)
	if(!rec_input || (length(rec_input) > RECIPE_MAX_STRING) || !findtext(rec_input, ",")) // The smallest possible recipe will contain 1 comma.
		to_chat(user, "Invalid input or recipe max length exceeded!")
		return

	rec_input = trim(rec_input) // Sanitize.
	var/new_rec = list() // This holds the actual recipe.
	var/vol = FALSE // This tracks if the next step is a chemical name or a volume.
	var/index = findtext(rec_input, ",") // This tracks the delineation index in the user-provided string. Should never be null at this point.
	var/i = 1 // This tracks the index for new_rec, the actual list which gets added to recipes[rec_name].
	while(index) // Alternates between text strings and numbers. When false, the rest of rec_input is the final step.
		new_rec[i] = copytext(rec_input, 1, index)
		if(vol)
			new_rec[i] = text2num(new_rec[i]) // If it's a volume step, convert to a number.
			vol = FALSE
		else
			vol = TRUE
		i++
		rec_input = copytext(rec_input, index + 1) // Trim previous substrings from rec_input.
		index = findtext(rec_input, ",")

	if(rec_input) // The remainder of rec_input should be the final volume step of the recipe. The if() is a sanity check.
		new_rec[i] = text2num(rec_input)

	recipes[rec_name] = new_rec // Finally, add the recipe to the recipes list.
	SStgui.update_uis(src)
	return

// This proc exports stored recipes to the user's chatbox formatted as a comma delineated list for use with import_recpe()
/obj/machinery/chemical_synthesizer/proc/export_recipe(mob/user, rec_name)
	var/list/export = recipes[rec_name]
	if(!export)
		return
	var/display_txt = export.Join(",") // This converts the entire list into a CSV string.
	to_chat(user, "[display_txt]")

// This proc handles adding the catalyst starting the synthesizer's queue.
/obj/machinery/chemical_synthesizer/proc/start_queue(mob/user)
	if(stat & (BROKEN|NOPOWER))
		return

	if(!queue)
		to_chat(user, "You can't start an empty queue!")
		return

	if(!catalyst)
		to_chat(user, "Place a bottle in the catalyst slot before starting the queue!")
		return

	if(panel_open)
		to_chat(user, "Close the panel before starting the queue!")
		return

	if(reagents.total_volume)
		to_chat(user, "Empty the reaction vessel before starting the queue!")
		return

	busy = TRUE
	use_power = USE_POWER_ACTIVE
	if(use_catalyst)
		// Populate the list of catalyst chems. This is important when it's time to bottle_product().
		for(var/datum/reagent/chem in catalyst.reagents.reagent_list)
			catalyst_ids += chem.id

		// Transfer the catalyst to the synthesizer's reagent holder.
		catalyst.reagents.trans_to_holder(src.reagents, catalyst.reagents.total_volume)

	// Start the first recipe in the queue, starting with step 1.
	follow_recipe(queue[1], 1)


// This proc controls the timing for each step in a reaction. Step is the index for the current chem of our recipe, step + 1 is the volume of said chem.
/obj/machinery/chemical_synthesizer/proc/follow_recipe(var/r_id, var/step as num)
	if(stat & (BROKEN|NOPOWER))
		stall()
		return

	icon_state = "synth_working"
	if(!step)
		step = 1

	// The time between each step is the volume required by a step multiplied by the delay_modifier (in ticks/deciseconds).
	addtimer(CALLBACK(src, .proc/perform_reaction, r_id, step), recipes[r_id][step + 1] * delay_modifier)

// This proc carries out the actual steps in each reaction.
/obj/machinery/chemical_synthesizer/proc/perform_reaction(var/r_id, var/step as num)
	if(stat & (BROKEN|NOPOWER))
		stall()
		return

	//Let's store these as temporary variables to make the code more readable.
	var/label = recipes[r_id][step]
	var/quantity = recipes[r_id][step+1]

	// If we're missing a cartridge somehow or lack space for the next step, stall. It's now up to the chemist to fix this.
	if(!cartridges[label])
		visible_message("<span class='warning'>The [src] beeps loudly, flashing a 'cartridge missing' error!</span>", "You hear loud beeping!")
		playsound(src, 'sound/weapons/smg_empty_alarm.ogg', 40)
		stall()
		return

	if(quantity > reagents.get_free_space())
		visible_message("<span class='warning'>The [src] beeps loudly, flashing a 'maximum volume exceeded' error!</span>", "You hear loud beeping!")
		playsound(src, 'sound/weapons/smg_empty_alarm.ogg', 40)
		stall()
		return

	// If there isn't enough reagent left for this step, try again in a minute.
	var/obj/item/weapon/reagent_containers/chem_disp_cartridge/C = cartridges[label]
	if(quantity > C.reagents.total_volume)
		visible_message("<span class='notice'>The [src] flashes an 'insufficient reagents' warning.</span>")
		addtimer(CALLBACK(src, .proc/perform_reaction, r_id, step), 1 MINUTE)
		return

	// After all this mess of code, we reach the line where the magic happens.
	C.reagents.trans_to_holder(src.reagents, quantity)
	// playsound(src, 'sound/machinery/HPLC_binary_pump.ogg', 25, 1)

	// Advance to the next step in the recipe. If this is outside of the recipe's index, we're finished. Otherwise, proceed to next step.
	step += 2
	var/list/tmp = recipes[r_id]
	if(step > tmp.len)
		icon_state = "synth_finished"

		// First extract the catalyst(s), if any remain.
		if(use_catalyst)
			for(var/chem in catalyst_ids)
				var/amount = reagents.get_reagent_amount(chem)
				reagents.trans_id_to(catalyst, chem, amount)

		// Add a delay of 1 tick per unit of reagent. Clear the catalyst_ids.
		catalyst_ids = list()
		var/delay = reagents.total_volume
		addtimer(CALLBACK(src, .proc/bottle_product, r_id), delay)

	else
		follow_recipe(r_id, step)

// Now that we're done, bottle up the product.
/obj/machinery/chemical_synthesizer/proc/bottle_product(var/r_id)
	if(stat & (BROKEN|NOPOWER))
		stall()
		return

	if(!r_id)
		r_id = "[reagents.get_master_reagent_name()]"

	while(reagents.total_volume)
		var/obj/item/weapon/reagent_containers/glass/bottle/B = new(src.loc)
		B.name = "[r_id] bottle"
		B.pixel_x = rand(-7, 7) // random position
		B.pixel_y = rand(-7, 7)
		B.icon_state = "bottle-4"
		reagents.trans_to_obj(B, min(reagents.total_volume, MAX_UNITS_PER_BOTTLE))
		B.update_icon()

	// Sanity check when manual bottling is triggered.
	if(queue)
		queue -= queue[1]

	// If the queue is now empty, we're done. Otherwise, re-add catalyst and proceed to the next recipe.
	if(queue)
		if(use_catalyst)
			for(var/datum/reagent/chem in catalyst.reagents.reagent_list)
				catalyst_ids += chem.id
			catalyst.reagents.trans_to_holder(src.reagents, catalyst.reagents.total_volume)
		follow_recipe(queue[1], 1)

	else
		busy = FALSE
		use_power = USE_POWER_IDLE
		queue = list()
		update_icon()


// What happens to the synthesizer if it breaks or loses power in the middle of running. Chemists must fix things manually.
/obj/machinery/chemical_synthesizer/proc/stall()
	busy = FALSE
	use_power = USE_POWER_IDLE
	queue = list()
	catalyst_ids = list()
	update_icon()

#undef SYNTHESIZER_MAX_CARTRIDGES
#undef SYNTHESIZER_MAX_RECIPES
#undef SYNTHESIZER_MAX_QUEUE
#undef RECIPE_MAX_STRING
#undef RECIPE_MAX_STEPS