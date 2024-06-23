///Passes Stat Browser Panel clicks to the game and calls client click on an atom
/atom/Topic(href, list/href_list)
	. = ..()
	if(!usr?.client)
		return
	var/client/usr_client = usr.client
	var/list/paramslist = list()

	if(href_list["statpanel_item_click"])
		switch(href_list["statpanel_item_click"])
			if("left")
				paramslist["left"] = "1"
			if("right")
				paramslist["right"] = "1"
			if("middle")
				paramslist["middle"] = "1"
			else
				return

		if(href_list["statpanel_item_shiftclick"])
			paramslist["shift"] = "1"
		if(href_list["statpanel_item_ctrlclick"])
			paramslist["ctrl"] = "1"
		if(href_list["statpanel_item_altclick"])
			paramslist["alt"] = "1"

		var/mouseparams = list2params(paramslist)
		usr_client.Click(src, loc, null, mouseparams)
		return TRUE

/atom/proc/contains(var/atom/location)
	if(!location)
		return 0
	if(location == src)
		return 1

	return contains(location.loc)
