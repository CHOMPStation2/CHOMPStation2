/datum/preferences
	var/wingdings = 1
	var/colorblind_mono = 0
	var/colorblind_vulp = 0
	var/colorblind_taj = 0
	var/haemophilia = 1

//proc for setting disabilities
/datum/category_item/player_setup_item/general/body/proc/Disabilities_YW(mob/user)
	var/dat = "<body>"
	dat += "<html><center>"

	if(pref.species == "Grey")
		dat += "Speak Wingdings: <a href='?src=\ref[src];wingdings=1'><b>[pref.wingdings ? "Yes" : "No"]</b></a><br>"
	dat += "Needs Glasses: <a href='?src=\ref[src];disabilities=[NEARSIGHTED]'><b>[pref.disabilities & NEARSIGHTED ? "Yes" : "No"]</b></a><br>"
	if(pref.colorblind_vulp == 0 && pref.colorblind_taj == 0)
		dat += "Colorblind - Monochromacy): <a href='?src=\ref[src];colorblind_mono=1'><b>[pref.colorblind_mono ? "Yes" : "No"]</b></a><br>"
	if(pref.colorblind_mono == 0 && pref.colorblind_taj == 0)
		dat += "Colorblind - Green-Red): <a href='?src=\ref[src];colorblind_vulp=1'><b>[pref.colorblind_vulp ? "Yes" : "No"]</b></a><br>"
	if(pref.colorblind_mono == 0 && pref.colorblind_vulp == 0)
		dat += "Colorblind - Blue-Red): <a href='?src=\ref[src];colorblind_taj=1'><b>[pref.colorblind_taj ? "Yes" : "No"]</b></a><br>"
	dat += "Haemophilia: <a href='?src=\ref[src];haemophilia=1'><b>[pref.haemophilia ? "Yes" : "No"]</b></a><br>"

	dat +=  "<a href='?src=\ref[src];reset_disabilities=1'>Reset</a><br>"

	dat += "</center></html>"
	var/datum/browser/popup = new(user, "disabil", "<div align='center'>Choose Disabilities</div>", 350, 380, src)
	popup.set_content(dat)
	popup.open()

