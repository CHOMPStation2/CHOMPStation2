/*
A collection of Protean rigsuit modules, intended to encourage Symbiotic relations with a host.
All of these should require someone else to be wearing the Protean to function.
These should come standard with the Protean rigsuit, unless you want them to work for some upgrades.
*/


//This rig module feeds nutrition directly from the wearer to the Protean, to help them stay charged while worn.
/obj/item/rig_module/protean
	permanent = 1

/obj/item/rig_module/protean/syphon
	name = "Protean Metabolic Syphon"
	desc = "This should never be outside of a RIG."
	icon_state = "flash"
	interface_name = "Protean Metabolic Syphon"
	interface_desc = "Toggle to drain nutrition/power from the user directly into the Protean's own energy stores."
	toggleable = 1
	activate_string = "Enable Syphon"
	deactivate_string = "Disable Syphon"

/obj/item/rig_module/protean/syphon/activate()
	if(!..())
		return 0

	var/mob/living/carbon/human/H = holder.wearer
	if(H)
		to_chat(usr, "<font color='blue'><b>You activate the suit's energy syphon.</b></font>")
		to_chat(H, "<span class='warning'>Your suit begins to sap at your own energy stores.</span>")
		active = 1
	else
		return 0

/obj/item/rig_module/protean/syphon/deactivate(var/forced)
	if(!..())
		return 0
	if(forced)
		active = 0
		return
	var/mob/living/carbon/human/H = holder.wearer
	if(H)
		to_chat(usr, "<font color='blue'><b>You deactivate the suit's energy syphon.</b></font>")
		to_chat(H, "<span class='warning'>Your suit ceases from sapping your own energy.</span>")
		active = 0
	else
		return 0

/obj/item/rig_module/protean/syphon/process()
	if(active)
		var/mob/living/carbon/human/H = holder.wearer
		var/mob/living/P = holder?:myprotean
		if(istype(H.species, /datum/species/protean))
			to_chat(H, "<span class='warning'>Your Protean modules do not function on yourself.</span>")
			deactivate(1)
		else
			P = P?:humanform
			if((H.nutrition >= 100) && (P.nutrition <= 5000))
				H.nutrition -= 10
				P.nutrition += 10

//This rig module allows a worn Protean to toggle and configure its armor settings.
/obj/item/rig_module/protean/armor
	name = "Protean Adaptive Armor"
	desc = "This should never be outside of a RIG."
	interface_name = "Protean Adaptive Armor"
	interface_desc = "Adjusts the proteans deployed armor values to fit the needs of the wearer. Incurs a slowdown penalty that scales with the amount of armor provided."
	usable = 1
	toggleable = 1
	activate_string = "Enable Armor"
	deactivate_string = "Disable Armor"
	engage_string = "Configure Armor"
	var/list/armor_settings = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0)
	var/armor_weight_ratio = 0.01	//This amount of slowdown per 1% of armour. 3 slowdown at the max armour.

/obj/item/rig_module/protean/armor/engage()
	var/armor_chosen = input(usr, "Which armor to adjust?", "Protean Armor") as null|anything in armor_settings
	if(armor_chosen)
		var/value = input(usr, "Set armour reduction value (Max of 60%)", "Protean Armor") as num
		if(value)
			if((value > 60) || (value < 0))
				to_chat(usr, "<span class ='warning'>Invalid armor value. Can only be between 0-60</span>")
			else
				value = round(value)
				armor_settings[armor_chosen] = value


/obj/item/rig_module/protean/armor/activate()
	if(!..(1))
		return 0

	var/mob/living/carbon/human/H = holder.wearer
	if(H)
		var/list/temparmor = list("bio" = 100, "rad" = 100)
		temparmor = armor_settings + temparmor
		to_chat(usr, "<font color='blue'><b>You signal the suit to harden.</b></font>")
		to_chat(H, "<span class='notice'>Your suit hardens in response to physical trauma.</span>")
		holder.armor = temparmor.Copy()
		for(var/obj/item/piece in list(holder.gloves,holder.helmet,holder.boots,holder.chest))
			piece.armor = temparmor.Copy()
		for(var/entry in armor_settings)
			holder.slowdown += temparmor[entry]*armor_weight_ratio
			message_admins(temparmor[entry])
		//holder.slowdown -= (armor_weight_ratio*200)
		active = 1
	else
		return 0

/obj/item/rig_module/protean/armor/deactivate(var/forced)
	if(!..(1))
		return 0
	if(forced)
		holder.armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 100)
		for(var/obj/item/piece in list(holder.gloves,holder.helmet,holder.boots,holder.chest))
			piece.armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 100)
		holder.slowdown = initial(slowdown)
		active = 0
		return
	var/mob/living/carbon/human/H = holder.wearer
	if(H)
		to_chat(usr, "<font color='blue'><b>You signal the suit to relax.</b></font>")
		to_chat(H, "<span class='warning'>Your suit softens.</span>")
		holder.armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 100)
		for(var/obj/item/piece in list(holder.gloves,holder.helmet,holder.boots,holder.chest))
			piece.armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 100)
		holder.slowdown = initial(slowdown)
		active = 0
	else
		return 0

/obj/item/rig_module/protean/armor/process()
	if(active)
		var/mob/living/carbon/human/H = holder.wearer
		if(istype(H.species, /datum/species/protean))
			to_chat(H, "<span class='warning'>Your Protean modules do not function on yourself.</span>")
			deactivate(1)


//This rig module lets a Protean expend its metal stores to heal its host
/obj/item/rig_module/protean/healing
	name = "Protean Restorative Nanites"
	desc = "This should never be outside of a RIG."
	icon_state = "flash"
	interface_name = "Protean Restorative Nanites"
	interface_desc = "Utilises stored steel from the Protean to slowly heal and repair the wearer."
	usable = 1
	engage_string = "Toggle Mode"