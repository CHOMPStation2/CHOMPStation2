/client/proc/vv_get_class(var_name, var_value)
	if(isnull(var_value))
		. = VV_NULL

	else if(isnum(var_value))
		if(length(get_valid_bitflags(var_name)))
			. = VV_BITFIELD
		else
			. = VV_NUM

	else if(istext(var_value))
		if(findtext(var_value, "\n"))
			. = VV_MESSAGE
		else if(findtext(var_value, GLOB.is_color))
			. = VV_COLOR
		else
			. = VV_TEXT

	else if(isicon(var_value))
		. = VV_ICON

	else if(ismob(var_value))
		. = VV_MOB_REFERENCE

	else if(isloc(var_value))
		. = VV_ATOM_REFERENCE

	else if(istype(var_value, /client))
		. = VV_CLIENT

	else if(isweakref(var_value))
		. = VV_WEAKREF

	else if(isdatum(var_value))
		. = VV_DATUM_REFERENCE

	else if(ispath(var_value))
		if(ispath(var_value, /atom))
			. = VV_ATOM_TYPE
		else if(ispath(var_value, /datum))
			. = VV_DATUM_TYPE
		else
			. = VV_TYPE

	else if(islist(var_value))
		if(var_name in GLOB.color_vars)
			. = VV_COLOR_MATRIX
		else
			. = VV_LIST

	else if(isfile(var_value))
		. = VV_FILE
	else
		. = VV_NULL

/client/proc/vv_get_value(class, default_class, current_value, list/restricted_classes, list/extra_classes, list/classes, var_name)
	. = list("class" = class, "value" = null)
	if(!class)
		if(!classes)
			classes = list (
				VV_NUM,
				VV_TEXT,
				VV_MESSAGE,
				VV_ICON,
				VV_COLOR,
				//VV_COLOR_MATRIX,
				VV_ATOM_REFERENCE,
				VV_DATUM_REFERENCE,
				VV_MOB_REFERENCE,
				VV_CLIENT,
				VV_ATOM_TYPE,
				VV_DATUM_TYPE,
				VV_TYPE,
				VV_FILE,
				VV_NEW_ATOM,
				VV_NEW_DATUM,
				VV_NEW_TYPE,
				VV_NEW_LIST,
				VV_NULL,
				VV_INFINITY,
				VV_RESTORE_DEFAULT,
				VV_TEXT_LOCATE,
				VV_PROCCALL_RETVAL,
				VV_WEAKREF,
				)

		var/markstring
		if(!(VV_MARKED_DATUM in restricted_classes))
			markstring = "[VV_MARKED_DATUM] (CURRENT: [(istype(holder) && istype(holder.marked_datum))? holder.marked_datum.type : "NULL"])"
			classes += markstring

		var/list/tagstrings = new
		if(!(VV_TAGGED_DATUM in restricted_classes) && holder && LAZYLEN(holder.tagged_datums))
			var/i = 0
			for(var/datum/iter_tagged_datum as anything in holder.tagged_datums)
				i++
				var/new_tagstring = "[VV_TAGGED_DATUM] #[i]: [iter_tagged_datum.type])"
				tagstrings[new_tagstring] = iter_tagged_datum
				classes += new_tagstring

		if(restricted_classes)
			classes -= restricted_classes

		if(extra_classes)
			classes += extra_classes

		.["class"] = tgui_input_list(src, "What kind of data?", "Variable Type", classes, default_class)
		if(holder && holder.marked_datum && .["class"] == markstring)
			.["class"] = VV_MARKED_DATUM

		if(holder && tagstrings[.["class"]])
			var/datum/chosen_datum = tagstrings[.["class"]]
			.["value"] = chosen_datum
			.["class"] = VV_TAGGED_DATUM


	switch(.["class"])
		if(VV_TEXT)
			.["value"] = tgui_input_text(usr, "Enter new text:", "Text", current_value)
			if(.["value"] == null)
				.["class"] = null
				return
		if(VV_MESSAGE)
			.["value"] = tgui_input_text(usr, "Enter new text:", "Text", current_value, multiline = TRUE)
			if(.["value"] == null)
				.["class"] = null
				return


		if(VV_NUM)
			.["value"] = tgui_input_number(usr, "Enter new number:", "Num", current_value, INFINITY, -INFINITY, round_value = FALSE)
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_BITFIELD)
			.["value"] = input_bitfield(usr, "Editing bitfield: [var_name]", var_name, current_value)
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_ATOM_TYPE)
			.["value"] = pick_closest_path(FALSE)
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_DATUM_TYPE)
			.["value"] = pick_closest_path(FALSE, get_fancy_list_of_datum_types())
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_TYPE)
			var/type = current_value
			var/error = ""
			do
				type = tgui_input_text(usr, "Enter type:[error]", "Type", type)
				if(!type)
					break
				type = text2path(type)
				error = "\nType not found, Please try again"
			while(!type)
			if(!type)
				.["class"] = null
				return
			.["value"] = type

		if(VV_ATOM_REFERENCE)
			var/type = pick_closest_path(FALSE)
			var/subtypes = vv_subtype_prompt(type)
			if(subtypes == null)
				.["class"] = null
				return
			var/list/things = vv_reference_list(type, subtypes)
			var/value = tgui_input_list(usr, "Select reference:", "Reference", things, current_value)
			if(!value)
				.["class"] = null
				return
			.["value"] = things[value]

		if(VV_DATUM_REFERENCE)
			var/type = pick_closest_path(FALSE, get_fancy_list_of_datum_types())
			var/subtypes = vv_subtype_prompt(type)
			if(subtypes == null)
				.["class"] = null
				return
			var/list/things = vv_reference_list(type, subtypes)
			var/value = tgui_input_list(usr, "Select reference:", "Reference", things, current_value)
			if(!value)
				.["class"] = null
				return
			.["value"] = things[value]

		if(VV_MOB_REFERENCE)
			var/type = pick_closest_path(FALSE, make_types_fancy(typesof(/mob)))
			var/subtypes = vv_subtype_prompt(type)
			if(subtypes == null)
				.["class"] = null
				return
			var/list/things = vv_reference_list(type, subtypes)
			var/value = tgui_input_list(usr, "Select reference:", "Reference", things, current_value)
			if(!value)
				.["class"] = null
				return
			.["value"] = things[value]

		if(VV_WEAKREF)
			var/type = pick_closest_path(FALSE, get_fancy_list_of_datum_types())
			var/subtypes = vv_subtype_prompt(type)
			if(subtypes == null)
				.["class"] = null
				return
			var/list/things = vv_reference_list(type, subtypes)
			var/value = tgui_input_list(usr, "Select reference:", "Reference", things, current_value)
			if(!value)
				.["class"] = null
				return
			.["value"] = WEAKREF(things[value])

		if(VV_CLIENT)
			.["value"] = tgui_input_list(usr, "Select reference:", "Reference", GLOB.clients, current_value)
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_FILE)
			.["value"] = input(usr, "Pick file:", "File") as null|file
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_ICON)
			.["value"] = pick_and_customize_icon(pick_only=TRUE)
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_MARKED_DATUM)
			.["value"] = holder.marked_datum
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_TAGGED_DATUM)
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_PROCCALL_RETVAL)
			var/list/get_retval = list()
			callproc_blocking(get_retval)
			.["value"] = get_retval[1] //should have been set in proccall!
			if(.["value"] == null)
				.["class"] = null
				return

		if(VV_NEW_ATOM)
			var/type = pick_closest_path(FALSE)
			if(!type)
				.["class"] = null
				return
			.["type"] = type
			var/atom/newguy = new type()
			newguy.datum_flags |= DF_VAR_EDITED
			.["value"] = newguy

		if(VV_NEW_DATUM)
			var/type = pick_closest_path(FALSE, get_fancy_list_of_datum_types())
			if(!type)
				.["class"] = null
				return
			.["type"] = type
			var/datum/newguy = new type()
			newguy.datum_flags |= DF_VAR_EDITED
			.["value"] = newguy

		if(VV_NEW_TYPE)
			var/type = current_value
			var/error = ""
			do
				type = tgui_input_text(usr, "Enter type:[error]", "Type", type)
				if(!type)
					break
				type = text2path(type)
				error = "\nType not found, Please try again"
			while(!type)
			if(!type)
				.["class"] = null
				return
			.["type"] = type
			var/datum/newguy = new type()
			if(istype(newguy))
				newguy.datum_flags |= DF_VAR_EDITED
			.["value"] = newguy

		if(VV_NEW_LIST)
			.["type"] = /list
			var/list/value = list()

			var/expectation = alert("Would you like to populate the list", "Populate List?", "Yes", "No")
			if(!expectation || expectation == "No")
				.["value"] = value
				return .

			var/list/insert = null
			while(TRUE)
				insert = vv_get_value(restricted_classes = list(VV_RESTORE_DEFAULT))
				if(!insert["class"])
					break
				value += LIST_VALUE_WRAP_LISTS(insert["value"])


			.["value"] = value

		if(VV_TEXT_LOCATE)
			var/datum/D
			do
				var/ref = tgui_input_text(usr, "Enter reference:", "Reference")
				if(!ref)
					break
				D = locate(ref)
				if(!D)
					tgui_alert(usr,"Invalid ref!")
					continue
				if(!D.can_vv_mark())
					tgui_alert(usr,"Datum can not be marked!")
					continue
			while(!D)
			.["type"] = D.type
			.["value"] = D

		if(VV_COLOR)
			.["value"] = tgui_color_picker(src, "Enter new color:", "Color", current_value)
			if(.["value"] == null)
				.["class"] = null
				return

		//if(VV_COLOR_MATRIX)
		//	.["value"] = open_color_matrix_editor()
		//	if(.["value"] == COLOR_MATRIX_IDENTITY) //identity is equivalent to null
		//		.["class"] = null

		if(VV_INFINITY)
			.["value"] = INFINITY
