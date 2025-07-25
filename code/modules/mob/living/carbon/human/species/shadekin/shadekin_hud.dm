/obj/screen/shadekin
	name = "shadekin status"
	icon = 'icons/mob/shadekin_hud.dmi'
	invisibility = INVISIBILITY_ABSTRACT

/obj/screen/movable/ability_master/shadekin
	name = "Shadekin Abilities"
	icon = 'icons/mob/screen_spells.dmi'
	icon_state = "grey_spell_ready"
	ability_objects = list()
	showing = 0

	open_state = "master_open"
	closed_state = "master_closed"

	screen_loc = ui_spell_master

/obj/screen/movable/ability_master/shadekin/update_abilities(forced = 0, mob/user)		//Different proc to prevent indexing
	update_icon()
	if(user && user.client)
		if(!(src in user.client.screen))
			user.client.screen += src
	for(var/obj/screen/ability/ability in ability_objects)
		ability.update_icon(forced)

/obj/screen/ability/verb_based/shadekin
	icon_state = "grey_spell_base"
	background_base_state = "grey"
	icon = 'icons/mob/shadekin_abilities.dmi'

/obj/screen/movable/ability_master/proc/add_shadekin_ability(var/object_given, var/verb_given, var/name_given, var/ability_icon_given, var/arguments)
	if(!object_given)
		message_admins("ERROR: add_shadekin_ability() was not given an object in its arguments.")
	if(!verb_given)
		message_admins("ERROR: add_shadekin_ability() was not given a verb/proc in its arguments.")
	if(get_ability_by_proc_ref(verb_given))
		return // Duplicate
	var/obj/screen/ability/verb_based/shadekin/A = new /obj/screen/ability/verb_based/shadekin()
	A.ability_master = src
	A.object_used = object_given
	A.verb_to_call = verb_given
	A.ability_icon_state = ability_icon_given
	A.name = name_given
	if(arguments)
		A.arguments_to_use = arguments
	ability_objects.Add(A)
	if(my_mob && my_mob.client) //If a shadekin is made (mannequins) prior to initialize being finished, my_mob won't be assigned and this will runtime. Mannequins need massive fixing because they shouldn't be getting all these special huds and overlays when they don't need them.
		toggle_open(2) //forces the icons to refresh on screen


/obj/screen/movable/ability_master/proc/remove_shadekin_ability(var/object_given, var/verb_given, var/arguments)
	if(!object_given)
		message_admins("ERROR: remove_shadekin_ability() was not given an object in its arguments.")
	if(!verb_given)
		message_admins("ERROR: remove_shadekin_ability() was not given a verb/proc in its arguments.")
	var/obj/screen/ability/verb_based/shadekin/A = get_ability_by_proc_ref(verb_given)
	if(!A)
		return // We don't have the ability, so ignore it.
	ability_objects.Remove(A)
	qdel(A)
	if(my_mob && my_mob.client) //If a shadekin is made (mannequins) prior to initialize being finished, my_mob won't be assigned and this will runtime. Mannequins need massive fixing because they shouldn't be getting all these special huds and overlays when they don't need them.
		toggle_open(2) //forces the icons to refresh on screen
