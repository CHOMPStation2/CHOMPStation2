/datum/admin_secret_item/admin_secret/bombing_list
	name = "Bombing List"

/datum/admin_secret_item/admin_secret/bombing_list/execute(var/mob/user)
	. = ..()
	if(!.)
		return

	var/dat = span_bold("Bombing List")
	for(var/l in GLOB.bombers)
		dat += text("[l]<BR>")
	user << browse("<html>[dat]</html>", "window=bombers")
