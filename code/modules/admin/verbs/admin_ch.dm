/client/proc/admin_teleport()
	set name = "Admin teleport"
	set category = "Admin.Game"
	set desc = "Teleports an atom to a set of coordinates or to the contents of another atom"

	var/list/value = vv_get_value(VV_ATOM_REFERENCE)
	if(!value["class"] || !value["value"])
		return
	var/atom/target = value["value"]
	var/atom/destination
	switch(alert("Would you like to teleport to a set of a coordinates, or to an atom?",,"coordinates","atom"))
		if("coordinates")
			var/list/inputlist = text2numlist(sanitize(input(usr,"Please input the coordinates, seperated by commas")),",")
			var/list/coords = list()
			for(var/content in inputlist)
				if(content != null)
					coords += content
			if(coords.len>3)
				tgui_alert(src, "You entered too many coordinates! Only 3 are required.")
				return
			if(coords.len<3)
				tgui_alert(src, "You didn't enter enough coordinates! 3 are required.")
				return
			destination = locate(coords[1],coords[2],coords[3])
			if(!destination)
				tgui_alert(src, "Invalid coordinates!")
				return
		if("atom")
			value = vv_get_value(VV_ATOM_REFERENCE)
			if(!value["class"] || !value["value"])
				return
			destination = value["value"]
	new /datum/teleport/instant/admin(target,destination)
/datum/teleport/instant/admin
	local=FALSE
