#define SYNTHESIZER_MAX_CARTRIDGES 40
#define SYNTHESIZER_MAX_RECIPES 20
#define SYNTHESIZER_MAX_QUEUE 40
#define RECIPE_MAX_STRING 160
#define RECIPE_MAX_STEPS 16

// Recipes are stored as a list which alternates between chemical id's and volumes to add, e.g. 1 = 'Carbon', 2 = 20, 3 = 'Silicon', 4 = 20
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
	density = TRUE
	panel_open = TRUE

	var/busy = FALSE
	var/production_mode = FALSE // Toggle between click-step input and comma-delineated text input for creating recipes.
	var/use_catalyst = TRUE // Determines whether or not the catalyst will be added to reagents while processing a recipe.
	var/stalled = FALSE  // Required for emergency stop to interrupt on-going recipes.
	var/drug_substance = 1 // Controls which form medicine takes (bottle, pill, etc). 1 for bottle, 2 for pill, 3 for patch.
	var/delay_modifier = 4 // This is multiplied by the volume of a step to determine how long each step takes. Bigger volume = slower.
	var/obj/item/reagent_containers/glass/catalyst = null // This is where the user adds catalyst. Usually phoron.

	var/bottle_icon = 4 // Determines icon states of bottles, pills, and patches.
	var/pill_icon = 2
	var/patch_icon = 2

	var/list/recipes = list() // This holds chemical recipes up to a maximum determined by SYNTHESIZER_MAX_RECIPES. Two-dimensional.
	var/list/queue = list() // This holds the recipe id's for queued up recipes.
	var/list/catalyst_ids = list() // This keeps track of the chemicals in the catalyst to remove before bottling.
	var/list/cartridges = list() // Associative, label -> cartridge

	var/list/spawn_cartridges = list(
			/obj/item/reagent_containers/chem_disp_cartridge/hydrogen,
			/obj/item/reagent_containers/chem_disp_cartridge/lithium,
			/obj/item/reagent_containers/chem_disp_cartridge/carbon,
			/obj/item/reagent_containers/chem_disp_cartridge/nitrogen,
			/obj/item/reagent_containers/chem_disp_cartridge/oxygen,
			/obj/item/reagent_containers/chem_disp_cartridge/fluorine,
			/obj/item/reagent_containers/chem_disp_cartridge/sodium,
			/obj/item/reagent_containers/chem_disp_cartridge/aluminum,
			/obj/item/reagent_containers/chem_disp_cartridge/silicon,
			/obj/item/reagent_containers/chem_disp_cartridge/phosphorus,
			/obj/item/reagent_containers/chem_disp_cartridge/sulfur,
			/obj/item/reagent_containers/chem_disp_cartridge/chlorine,
			/obj/item/reagent_containers/chem_disp_cartridge/potassium,
			/obj/item/reagent_containers/chem_disp_cartridge/iron,
			/obj/item/reagent_containers/chem_disp_cartridge/copper,
			/obj/item/reagent_containers/chem_disp_cartridge/mercury,
			/obj/item/reagent_containers/chem_disp_cartridge/radium,
			/obj/item/reagent_containers/chem_disp_cartridge/water,
			/obj/item/reagent_containers/chem_disp_cartridge/ethanol,
			/obj/item/reagent_containers/chem_disp_cartridge/sugar,
			/obj/item/reagent_containers/chem_disp_cartridge/sacid,
			/obj/item/reagent_containers/chem_disp_cartridge/tungsten,
			/obj/item/reagent_containers/chem_disp_cartridge/calcium
		)

	var/_recharge_reagents = TRUE
	var/process_tick = 0
	var/list/dispense_reagents = list(
		REAGENT_ID_HYDROGEN, REAGENT_ID_LITHIUM, REAGENT_ID_CARBON, REAGENT_ID_NITROGEN, REAGENT_ID_OXYGEN, REAGENT_ID_FLUORINE, REAGENT_ID_SODIUM,
		REAGENT_ID_ALUMINIUM, REAGENT_ID_SILICON, REAGENT_ID_PHOSPHORUS, REAGENT_ID_SULFUR, REAGENT_ID_CHLORINE, REAGENT_ID_POTASSIUM, REAGENT_ID_IRON,
		REAGENT_ID_COPPER, REAGENT_ID_MERCURY, REAGENT_ID_RADIUM, REAGENT_ID_WATER, REAGENT_ID_ETHANOL, REAGENT_ID_SUGAR, REAGENT_ID_SACID, REAGENT_ID_TUNGSTEN, REAGENT_ID_CALCIUM
		)

/obj/machinery/chemical_synthesizer/Initialize(mapload)
	. = ..()
	// Create the reagents datum which will act as the machine's reaction vessel.
	create_reagents(600)
	catalyst = new /obj/item/reagent_containers/glass/beaker(src)

	if(spawn_cartridges)
		for(var/type in spawn_cartridges)
			add_cartridge(new type(src))
		panel_open = FALSE

	var/obj/item/paper/P = new /obj/item/paper(get_turf(src))
	P.name = "Synthesizer Instructions"
	P.desc = "A photocopy of a handwritten note."
	P.info = {"Hello there! This device is a new NanoTrasen product currently being shipped to select facilities \
	for internal testing! We haven't finished the instruction manual yet so each unit shipped with this pamphlet \
	(I really hope you can read my handwriting). This machine is a programmable chemical synthesizer which, if used \
	correctly, will allow you to queue up some recipes and go work on something else while the medicine manufactures. \
	It's slower than doing things by hand but it also keeps your hands free! And yes, it bottles automatically. \
	<BR><BR>To get started, you need to program some recipes. The machine has two modes for this: tutorial and production. \
	Tutorial is intended to teach you how recipes work, or to create recipes for later use with production mode. This one \
	should be self-explanatory, just follow the prompts. Production mode allows you to rapidly import recipes in CSV format. \
	If I've lost you, just keep reading; once you give it a name and tell the machine how many steps are in the recipe, just \
	input the recipe as a comma-separated string of chemical names and volumes to be added, like "Chem1,10,Chem2,20,... \
	<BR><BR>If that still doesn't make sense, I've included an example for Dylovene at the bottom. Also, don't include \
	catalyst reagents in the recipe, read below for that part. Also also, remember that chemical names are case sensitive and \
	cartridge names are usually Capitalized Like These Words (AND FOR THE LOVE OF GOD KEVIN, STOP CHANGING THE NAMES ON THE \
	LABELS WHEN THE CHEMISTS AREN'T LOOKING IT ISN'T FUNNY ANYMORE). \
	<BR><BR>Next important concept is the catalyst, intended for catalyst reagents (usually phoron). When the catalyst option is \
	enabled, whatever is in the catalyst bottle gets added to the reaction chamber before synthesis begins. When the \
	recipe is done, it extracts the catalyst, bottles whatever you made, then adds the catalyst back before starting \
	the next recipe in the queue. It's up to you to make sure no unwanted side reactions happen, and yes, this means \
	you cannot queue up catalyst recipes with recipes ruined by the catalyst. Maybe add "NO CAT" or something to the \
	name for recipes like that? \
	<BR><BR>And that's the really important stuff. Remember you can export recipes for later shifts, just copy the \
	output into your PDA or something. Oh, and stalling. Say you're missing a cartridge or the vessel is full (the \
	capacity is [src.reagents.maximum_volume]) or you press the emergency stop button. The machine will stall, \
	clearing the temporary memory. To get it started again, you just need to empty the vessel. Anyway, here's \
	example recipe. \
	<BR><BR> Name: Dylovene (60u) \
	<BR> Number of steps: 3 \
	<BR> Recipe string: Silicon,20,Nitrogen,20,Potassium,20"}

/obj/machinery/chemical_synthesizer/examine(mob/user)
	. = ..()
	if(panel_open)
		. += "It has [cartridges.len] cartridges installed, and has space for [SYNTHESIZER_MAX_CARTRIDGES - cartridges.len] more."

/obj/machinery/chemical_synthesizer/power_change()
	. = ..()
	update_icon()

/obj/machinery/chemical_synthesizer/update_icon()
	underlays.Cut()
	if(stat & BROKEN)
		icon_state = "synth_broken"
		return
	if(stat & NOPOWER)
		icon_state = "synth_off"
		return
	if(!busy)
		if(catalyst)
			icon_state = "synth_idle_bottle"
		else
			icon_state = "synth_idle"
	else
		icon_state = "synth_working"
	if(catalyst) // All underlay icon_states requires the catalyst bottle to be present, so this works as a check.
		if(catalyst.reagents.reagent_list.len)
			var/image/cat_filling = image(icon, src, "synth_catalyst", -1)
			cat_filling.color = catalyst.reagents.get_color()
			underlays += cat_filling
		if(src.reagents.reagent_list.len)
			var/image/ves_filling = image(icon, src, "synth_vessel", -2)
			ves_filling.color = src.reagents.get_color()
			underlays += ves_filling

/obj/machinery/chemical_synthesizer/proc/add_cartridge(obj/item/reagent_containers/chem_disp_cartridge/C, mob/user)
	if(!panel_open)
		if(user)
			to_chat(user, span_warning("The panel is locked!"))
		return

	if(!istype(C))
		if(user)
			to_chat(user, span_warning("\The [C] will not fit in \the [src]!"))
		return

	if(cartridges.len >= SYNTHESIZER_MAX_CARTRIDGES)
		if(user)
			to_chat(user, span_warning("\The [src] does not have any slots open for \the [C] to fit into!"))
		return

	if(!C.label)
		if(user)
			to_chat(user, span_warning("\The [C] does not have a label!"))
		return

	if(cartridges[C.label])
		if(user)
			to_chat(user, span_warning("\The [src] already contains a cartridge with that label!"))
		return

	if(user)
		user.drop_from_inventory(C)
		to_chat(user, span_notice("You add \the [C] to \the [src]."))

	C.loc = src
	cartridges[C.label] = C
	cartridges = sortAssoc(cartridges)
	SStgui.update_uis(src)

/obj/machinery/chemical_synthesizer/proc/remove_cartridge(label)
	. = cartridges[label]
	cartridges -= label
	SStgui.update_uis(src)

/obj/machinery/chemical_synthesizer/attackby(obj/item/W, mob/user)
	// Why do so many people code in wrenching when there's already a proc for it?
	if(!busy && default_unfasten_wrench(user, W, 40))
		return

	if(istype(W, /obj/item/reagent_containers/chem_disp_cartridge))
		add_cartridge(W, user)
		return

	// But we won't use the screwdriver proc because chem dispenser behavior.
	if(panel_open && W.is_screwdriver())
		var/label = tgui_input_list(user, "Which cartridge would you like to remove?", "Chemical Synthesizer", cartridges)
		if(!label)
			return
		var/obj/item/reagent_containers/chem_disp_cartridge/C = remove_cartridge(label)
		if(C)
			to_chat(user, span_notice("You remove \the [C] from \the [src]."))
			C.loc = loc
			playsound(src, W.usesound, 50, 1)
			return

	// We don't need a busy check here as the catalyst slot must be occupied for the machine to function.
	if(istype(W, /obj/item/reagent_containers/glass))
		if(catalyst)
			to_chat(user, span_warning("There is already \a [catalyst] in \the [src] catalyst slot!"))
			return
		if(stat & (BROKEN|NOPOWER))
			to_chat(user, span_warning("The clamp will not secure the catalyst while the machine is down!"))
			return

		var/obj/item/reagent_containers/RC = W

		if(!RC.is_open_container())
			to_chat(user, span_warning("You don't see how \the [src] could extract reagents from \the [RC]."))
			return

		catalyst =  RC
		user.drop_from_inventory(RC)
		RC.loc = src
		to_chat(user, span_notice("You set \the [RC] on \the [src]."))
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
			var/obj/item/reagent_containers/chem_disp_cartridge/C = cartridges[R.name]
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
	data["drug_substance"] = drug_substance
	data["bottle_icon"] = bottle_icon
	data["pill_icon"] = pill_icon
	data["patch_icon"] = patch_icon

	var/list/tmp_queue = list()
	for(var/i = 1, i <= queue.len, i++)
		tmp_queue.Add(list(list("name" = queue[i], "index" = i))) // Thanks byond
	data["queue"] = tmp_queue

	// Convert the recipes list into an array of strings. The UI does not need the associative list attached to each string.
	var/list/tmp_recipes = list()
	for(var/i = 1, i <= recipes.len, i++)
		tmp_recipes.Add(list(list("name" = recipes[i])))
	data["recipes"] = tmp_recipes


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

	if(catalyst)
		data["catalystCurrentVolume"] = catalyst.reagents.total_volume
		data["catalystMaxVolume"] = catalyst.reagents.maximum_volume
	else
		data["catalystCurrentVolume"] = null
		data["catalystMaxVolume"] = null

	var/chemicals[0]
	for(var/label in cartridges)
		var/obj/item/reagent_containers/chem_disp_cartridge/C = cartridges[label]
		chemicals.Add(list(list("title" = label, "id" = label, "amount" = C.reagents.total_volume))) // list in a list because Byond merges the first list
	data["chemicals"] = chemicals

	data["modal"] = tgui_modal_data(src)

	return data

/obj/machinery/chemical_synthesizer/tgui_act(action, params, datum/tgui/ui, datum/tgui_state/state)
	if(..())
		return TRUE

	if(tgui_act_modal(action, params, ui, state))
		return TRUE

	add_fingerprint(usr)

	. = TRUE
	switch(action)
		if("start_queue")
			// Start up the queue.
			if(!busy)
				start_queue(usr)
		if("rem_queue")
			// Remove a single entry from the queue. Sanity checks also prevent removing the first entry if the machine is busy though UI should already prevent that.
			var/index = text2num(params["q_index"])
			if(!isnum(index) || !ISINTEGER(index) || !istype(queue) || (index<1 || index>length(queue) || (busy && index == 1)))
				return
			queue -= queue[index]
		if("clear_queue")
			// Remove all entries from the queue except the currently processing recipe.
			var/confirm = tgui_alert(usr, "Are you sure you want to clear the running queue?", "Confirm", list("No", "Yes"))
			if(confirm == "Yes")
				if(busy)
					// Oh no, I've broken code convention to remove all entries but the first.
					for(var/i = queue.len, i >= 2, i--)
						queue -= queue[i]
				else
					queue = list()
		if("eject_catalyst")
			// Removes the catalyst bottle from the machine.
			if(!busy && catalyst)
				catalyst.forceMove(get_turf(src))
				catalyst = null
				update_icon()
		if("toggle_catalyst")
			// Decides if the machine uses the catalyst.
			if(!busy)
				use_catalyst = !use_catalyst
		if("emergency_stop")
			// Stops everything if that's desirable for some reason.
			if(busy)
				var/confirm = tgui_alert(usr, "Are you sure you want to stall the machine?", "Confirm", list("Yes", "No"))
				if(confirm == "Yes")
					stalled = TRUE
		if("bottle_product")
			// Bottles the reaction mixture if stalled.
			if(!busy)
				bottle_product()
		if("panel_toggle")
			// Opens/closes the panel.
			if(!busy)
				panel_open = !panel_open
		if("mode_toggle")
			// Toggles production mode.
			production_mode = !production_mode
		if("add_recipe")
			// Allows the user to add a recipe. Kinda vital for this machine to do anything useful.
			if(recipes.len >= SYNTHESIZER_MAX_RECIPES)
				to_chat(usr, span_warning("Maximum recipes exceeded!"))
				return
			if(!production_mode)
				babystep_recipe(usr)
			else
				import_recipe(usr)
		if("rem_recipe")
			// Allows the user to remove recipes while the machine is idle.
			if(!busy)
				var/confirm = tgui_alert(usr, "Are you sure you want to remove this recipe?", "Confirm", list("No", "Yes"))
				if(confirm == "Yes")
					var/index = params["rm_index"]
					if(index in recipes)
						recipes.Remove(list(index)) // Fuck off Byond.
			else
				to_chat(usr, span_warning("You cannot remove recipes while the machine is running!"))
		if("exp_recipe")
			// Allows the user to export recipes to chat formatted for easy importing.
			var/index = params["exp_index"]
			export_recipe(usr, index)
		if("add_queue")
			// Adds recipes to the queue.
			if(queue.len >= SYNTHESIZER_MAX_QUEUE)
				to_chat(usr, span_warning("Synthesizer queue full!"))
				return
			var/index = params["qa_index"]
			// If you forgot, this is a string returned by the user pressing the "add to queue" button on a recipe.
			if(index in recipes)
				queue[++queue.len] = index
		if("drug_form")
			// Toggles between bottles, pills, and patches.
			drug_substance = params["drug_index"]

/obj/machinery/chemical_synthesizer/proc/tgui_act_modal(action, params, datum/tgui/ui, datum/tgui_state/state)
	. = TRUE
	var/id = params["id"] // The modal's ID
	var/list/arguments = istext(params["arguments"]) ? json_decode(params["arguments"]) : params["arguments"]
	switch(tgui_modal_act(src, action, params))
		if(TGUI_MODAL_OPEN)
			switch(id)
				if("change_pill_style")
					var/list/choices = list()
					for(var/i = 1 to MAX_PILL_SPRITE)
						choices += "chem_master32x32 pill[i]"
					tgui_modal_bento_spritesheet(src, id, "Please select the new style for pills:", null, arguments, pill_icon, choices)
				if("change_patch_style")
					var/list/choices = list()
					for(var/i = 1 to MAX_PATCH_SPRITE)
						choices += "chem_master32x32 patch[i]"
					tgui_modal_bento_spritesheet(src, id, "Please select the new style for patches:", null, arguments, patch_icon, choices)
				if("change_bottle_style")
					var/list/choices = list()
					for(var/i = 1 to MAX_BOTTLE_SPRITE)
						choices += "chem_master32x32 bottle-[i]"
					tgui_modal_bento_spritesheet(src, id, "Please select the new style for bottles:", null, arguments, bottle_icon, choices)
				else
					return FALSE
		if(TGUI_MODAL_ANSWER)
			var/answer = params["answer"]
			switch(id)
				if("change_pill_style")
					var/new_style = CLAMP(text2num(answer) || 0, 0, MAX_PILL_SPRITE)
					if(!new_style)
						return
					pill_icon = new_style
				if("change_patch_style")
					var/new_style = CLAMP(text2num(answer) || 0, 0, MAX_PATCH_SPRITE)
					if(!new_style)
						return
					patch_icon = new_style
				if("change_bottle_style")
					var/new_style = CLAMP(text2num(answer) || 0, 0, MAX_BOTTLE_SPRITE)
					if(!new_style)
						return
					bottle_icon = new_style
				else
					return FALSE
		else
			return FALSE

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

/obj/machinery/chemical_synthesizer/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet/chem_master),
	)

// This proc is lets users create recipes step-by-step and exports a comma delineated list to chat. It's intended to teach how to use the machine.
/obj/machinery/chemical_synthesizer/proc/babystep_recipe(mob/user)
	var/rec_name = sanitizeSafe(tgui_input_text(user, "Name your recipe. Consider including the output volume.", "Recipe naming"))
	if(!rec_name || (rec_name in recipes)) // Code requires each recipe to have a unique name.
		to_chat(user, "Please provide a unique recipe name!")
		return

	var/steps = 2 * tgui_input_number(user, "How many steps does your recipe contain (16 max)?", "Steps", 1, RECIPE_MAX_STEPS, 1) // Round to get a whole integer, clamp to ensure proper range.
	if(!steps)
		to_chat(user, "Please input a valid number of steps!")
		return

	var/list/new_rec = list() // This holds the actual recipe.
	for(var/i = 1, i < steps, i += 2) // For the user, 1 step is both text and volume. For list arithmetic, that's 2 steps.
		var/label = tgui_input_list(user, "Which chemical would you like to use?", "Chemical Synthesizer", cartridges)
		if(!label)
			to_chat(user, "Please select a chemical!")
			return
		new_rec[++new_rec.len] = label // Add the reagent ID.
		var/amount = tgui_input_number(user, "How much of the chemical would you like to add?", "Volume", 1, src.reagents.maximum_volume, 1)
		if(!amount)
			to_chat(user, "Please select a volume!")
			return
		new_rec[++new_rec.len] = amount // Add the amount of reagent.

	recipes[rec_name] = new_rec
	SStgui.update_uis(src)
	export_recipe(user, rec_name) // Now export the recipe to the user's chatbox formatted for import_recipe().
	return

// This proc allows users to copy-paste a comma delineated list to create a recipe. The recipe will cause a stall() if formatted incorrectly.
/obj/machinery/chemical_synthesizer/proc/import_recipe(mob/user)
	var/rec_name = sanitizeSafe(tgui_input_text(user, "Name your recipe. Consider including the output volume.", "Recipe naming", max_length=MAX_NAME_LEN), MAX_NAME_LEN)
	if(!rec_name || (rec_name in recipes)) // Code requires each recipe to have a unique name.
		to_chat(user, "Please provide a unique recipe name!")
		return

	var/rec_input = tgui_input_text(user, "Input your recipe as 'Chem1,vol1,Chem2,vol2,...'", "Import recipe")
	if(!rec_input || (length(rec_input) > RECIPE_MAX_STRING) || !findtext(rec_input, ",")) // The smallest possible recipe will contain 1 comma.
		to_chat(user, "Invalid input or recipe max length exceeded!")
		return

	rec_input = trim(rec_input) // Sanitize.
	var/list/new_rec = list() // This holds the actual recipe.
	var/vol = FALSE // This tracks if the next step is a chemical name or a volume.
	var/index = findtext(rec_input, ",") // This tracks the delineation index in the user-provided string. Should never be null at this point.
	var/i = 1 // This tracks the index for new_rec, the actual list which gets added to recipes[rec_name].
	while(index) // Alternates between text strings and numbers. When false, the rest of rec_input is the final step.
		new_rec[++new_rec.len] = copytext(rec_input, 1, index)
		if(vol)
			new_rec[i] = text2num(new_rec[i]) // If it's a volume step, convert to a number.
			vol = FALSE
		else
			vol = TRUE
		i++
		rec_input = copytext(rec_input, index + 1) // Trim previous substrings from rec_input.
		index = findtext(rec_input, ",")

	if(rec_input) // The remainder of rec_input should be the final volume step of the recipe. The if() is a sanity check.
		new_rec[++new_rec.len] = text2num(rec_input)

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
	if(stalled) // Incase SOMEHOW this var is true when the machine isn't running.
		stalled = FALSE

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
	update_icon()
	follow_recipe(queue[1], 1)


// This proc controls the timing for each step in a reaction. Step is the index for the current chem of our recipe, step + 1 is the volume of said chem.
/obj/machinery/chemical_synthesizer/proc/follow_recipe(var/r_id, var/step as num)
	if(stalled) // Emergency stop if() check.
		stalled = FALSE
		stall()
		return

	if(stat & (BROKEN|NOPOWER))
		stall()
		return

	if(!step)
		step = 1

	// The time between each step is the volume required by a step multiplied by the delay_modifier (in ticks/deciseconds).
	addtimer(CALLBACK(src, PROC_REF(perform_reaction), r_id, step), recipes[r_id][step + 1] * delay_modifier)

// This proc carries out the actual steps in each reaction.
/obj/machinery/chemical_synthesizer/proc/perform_reaction(var/r_id, var/step as num)
	if(stalled) // Emergency stop if() check.
		stalled = FALSE
		stall()
		return

	if(stat & (BROKEN|NOPOWER))
		stall()
		return

	//Let's store these as temporary variables to make the code more readable.
	var/label = recipes[r_id][step]
	var/quantity = recipes[r_id][step+1]

	// If we're missing a cartridge somehow or lack space for the next step, stall. It's now up to the chemist to fix this.
	if(!cartridges[label])
		visible_message(span_warning("The [src] beeps loudly, flashing a 'cartridge missing' error!"), "You hear loud beeping!")
		playsound(src, 'sound/weapons/smg_empty_alarm.ogg', 40)
		stall()
		return

	if(quantity > reagents.get_free_space())
		visible_message(span_warning("The [src] beeps loudly, flashing a 'maximum volume exceeded' error!"), "You hear loud beeping!")
		playsound(src, 'sound/weapons/smg_empty_alarm.ogg', 40)
		stall()
		return

	// If there isn't enough reagent left for this step, try again in a minute.
	var/obj/item/reagent_containers/chem_disp_cartridge/C = cartridges[label]
	if(quantity > C.reagents.total_volume)
		visible_message(span_notice("The [src] flashes an 'insufficient reagents' warning."))
		addtimer(CALLBACK(src, PROC_REF(perform_reaction), r_id, step), 1 MINUTE)
		return

	// After all this mess of code, we reach the line where the magic happens.
	C.reagents.trans_to_holder(src.reagents, quantity)
	update_icon() // Update underlays.
	playsound(src, 'modular_chomp/sound/machines/HPLC_binary_pump.ogg', 15, 1)

	// Advance to the next step in the recipe. If this is outside of the recipe's index, we're finished. Otherwise, proceed to next step.
	step += 2
	var/list/tmp = recipes[r_id]
	if(step > tmp.len)

		// First extract the catalyst(s), if any remain.
		if(use_catalyst)
			for(var/chem in catalyst_ids)
				var/amount = reagents.get_reagent_amount(chem)
				reagents.trans_id_to(catalyst, chem, amount)

		// Add a delay of 1 tick per unit of reagent. Clear the catalyst_ids.
		catalyst_ids = list()
		var/delay = reagents.total_volume
		update_icon() // Update the icon first to remove underlays, then switch to the new icon_state.
		icon_state = "synth_finished"
		addtimer(CALLBACK(src, PROC_REF(bottle_product), r_id), delay)

	else
		follow_recipe(r_id, step)

// Now that we're done, bottle up the product.
/obj/machinery/chemical_synthesizer/proc/bottle_product(var/r_id)
	if(stat & (BROKEN|NOPOWER))
		stall()
		return

	if(!r_id)
		r_id = "[reagents.get_master_reagent_name()]"

	// Copy-pasta go brr
	switch(drug_substance)
		if(2) // Pills
			while(reagents.total_volume)
				var/obj/item/reagent_containers/pill/P= new(src.loc)
				P.name = "[r_id]"
				P.pixel_x = rand(-7, 7) // random position
				P.pixel_y = rand(-7, 7)
				P.icon_state = "pill[pill_icon]"
				reagents.trans_to_obj(P, min(reagents.total_volume, MAX_UNITS_PER_PILL))
				if(P.icon_state in list("pill1", "pill2", "pill3", "pill4")) // if using greyscale, take colour from reagent
					P.color = P.reagents.get_color()
				P.update_icon()

		if(3) // Patches
			while(reagents.total_volume)
				var/obj/item/reagent_containers/pill/patch/P= new(src.loc)
				P.name = "[r_id]"
				P.pixel_x = rand(-7, 7) // random position
				P.pixel_y = rand(-7, 7)
				P.icon_state = "patch[patch_icon]"
				reagents.trans_to_obj(P, min(reagents.total_volume, MAX_UNITS_PER_PATCH))
				if(P.icon_state in list("patch1", "patch2", "patch3", "patch4")) // if using greyscale, take colour from reagent
					P.color = P.reagents.get_color()
				P.update_icon()

		else // Bottles. Official value is 1, but this works as a sanity check.
			while(reagents.total_volume)
				var/obj/item/reagent_containers/glass/bottle/B = new(src.loc)
				B.name = "[r_id] bottle"
				B.pixel_x = rand(-7, 7) // random position
				B.pixel_y = rand(-7, 7)
				B.icon_state = "bottle-[bottle_icon]"
				reagents.trans_to_obj(B, min(reagents.total_volume, MAX_UNITS_PER_BOTTLE))
				B.update_icon()

	// Sanity check when manual bottling is triggered.
	if(queue.len)
		queue -= queue[1]

	// If the queue is now empty, we're done. Otherwise, re-add catalyst and proceed to the next recipe.
	if(queue.len)
		if(use_catalyst)
			for(var/datum/reagent/chem in catalyst.reagents.reagent_list)
				catalyst_ids += chem.id
			catalyst.reagents.trans_to_holder(src.reagents, catalyst.reagents.total_volume)
		update_icon()
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
