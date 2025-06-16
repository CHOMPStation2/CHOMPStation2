/obj/item
	var/user_vars_to_edit //fun times :3 - pretty much just grabbed from tg immabehonest - list(variable_name = variable_value) eg list("name" = "Wizardly Wizard", "real_name" = "Wizardly Wizard")
	var/user_vars_remembered //not needed for manual editing, just stores the original vars from the above list to make sure they go back to normal later

/obj/item/Destroy(force, ...)
	if(item_tf_spawn_allowed)
		item_tf_spawnpoints -= src
	user_vars_remembered = null
	return ..()

/obj/item/dropped(mob/living/user)
	. = ..()
	if (!istype(user))
		return
	if(LAZYLEN(user_vars_remembered))
		for(var/variable in user_vars_remembered)
			if(variable in user.vars)
				if(user.vars[variable] == user_vars_to_edit[variable])
					user.vars[variable] = user_vars_remembered[variable]
		user_vars_remembered = initial(user_vars_remembered)

/obj/item/equipped(mob/living/user, slot_equipped)
	. = ..()
	if (!istype(user))
		return
	if(("[slot_equipped]" in slot_flags_enumeration) && (slot_flags & slot_flags_enumeration["[slot_equipped]"]))
		if (LAZYLEN(user_vars_to_edit))
			for(var/variable in user_vars_to_edit)
				if(variable in user.vars)
					LAZYSET(user_vars_remembered, variable, user.vars[variable])
					user.vv_edit_var(variable, user_vars_to_edit[variable])
	else
		if(LAZYLEN(user_vars_remembered))
			for(var/variable in user_vars_remembered)
				if(variable in user.vars)
					if(user.vars[variable] == user_vars_to_edit[variable])
						user.vars[variable] = user_vars_remembered[variable]
			user_vars_remembered = initial(user_vars_remembered)
