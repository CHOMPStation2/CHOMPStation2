/datum/admin_secret_item/admin_secret/show_crew_manifest
	name = "Show Crew Manifest"

/datum/admin_secret_item/admin_secret/show_crew_manifest/execute(var/mob/user)
	. = ..()
	if(!.)
		return
	/* CHOMPEdit Start - Crew Manifest
	var/dat
	dat += "<h4>Crew Manifest</h4>"
	dat += data_core.get_manifest_html()

	user << browse(dat, "window=manifest;size=370x420;can_close=1")
	*/

	if(!GLOB.crew_manifest_tgui)
		GLOB.crew_manifest_tgui = new /datum/crew_manifest(src)

	GLOB.crew_manifest_tgui.tgui_interact(src)
	// CHOMPedit End
