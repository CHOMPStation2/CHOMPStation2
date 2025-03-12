/datum/category_item/catalogue/information/starfire_news
	desc = "A small news reporting agency based near Sif's New Reykjavik, the Starfire Report is somewhat infamous \
	for scrutinizing the actions of Trans-Stellar Corporations in the Vir system yet coming out on top in the legal \
	battles with inevitably follow. Aside from reporting, the agency is also known for inventing and manufacturing the \
	starcaster, a cheap device capable of accessing news articles from almost anywhere in the galaxy without need for \
	a stable exonet connection."
	value = CATALOGUER_REWARD_TRIVIAL

/obj/item/starcaster_news
	name = "\improper Starcaster"
	desc = "A device from the Starfire Report for reading the news and nothing else."
	icon = 'icons/obj/library.dmi'
	icon_state = "newscodex-open"
//	catalogue_data = list(/datum/category_item/catalogue/information/starfire_news) Commented out until I can figure out why this won't scan.

	var/datum/computer_file/data/news_article/loaded_article = null //You must specify the variable this far to avoid compilation errors.
	var/show_archived = null



/obj/item/starcaster_news/attack_self(mob/user as mob)

	user.set_machine(src)
	tgui_interact(user) //Activates tgui. Bless tgui.
	return

/obj/item/starcaster_news/tgui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "StarcasterCh", name)
		ui.open()

/obj/item/starcaster_news/tgui_data(mob/user, datum/tgui/ui, datum/tgui_state/state) //Mostly ripped off from news_browser.dm
	var/list/data = list()

	var/list/all_articles = list()
	data["showing_archived"] = show_archived
	data["article"] = null
	if(loaded_article) 	// Viewing an article.
		data["article"] = list(
			"title" = loaded_article.filename,
			"cover" = loaded_article.cover,
			"content" = loaded_article.stored_data,
		)
	else										// Viewing list of articles
		for(var/datum/computer_file/data/news_article/F in ntnet_global.available_news)
			if(!show_archived && F.archived)
				continue
			all_articles.Add(list(list(
				"name" = F.filename,
				"uid" = F.uid,
				"archived" = F.archived
			)))
	data["all_articles"] = all_articles

	return data

/obj/item/starcaster_news/tgui_act(action, list/params, datum/tgui/ui) //Also ripped from news_browser.dm. Bless tgui
	if(..())
		return TRUE
	switch(action)
		if("PRG_openarticle")
			. = TRUE
			if(loaded_article)
				return TRUE

			for(var/datum/computer_file/data/news_article/N in ntnet_global.available_news)
				if(N.uid == text2num(params["uid"]))
					loaded_article = N.clone()
					break
		if("PRG_reset")
			. = TRUE
			loaded_article = null
		if("PRG_toggle_archived")
			. = TRUE
			show_archived = !show_archived

/* Deprecated nanoUI code. Keeping mostly for reference.
/obj/item/starcaster_news/Topic(href, href_list) //Mostly ripped off from news_browser.dm
	if(..())
		return 1
	if(href_list["PRG_openarticle"])
		. = 1
		if(loaded_article)
			return 1

		for(var/datum/computer_file/data/news_article/N in ntnet_global.available_news)
			if(N.uid == text2num(href_list["PRG_openarticle"]))
				loaded_article = N.clone()
				break
	if(href_list["PRG_reset"])
		. = 1
		loaded_article = null
	if(href_list["PRG_toggle_archived"]) //Fuck nanoUI
		. = 1
		show_archived = !show_archived
	if(.)
		SSnanoui.update_uis(src)

/obj/item/starcaster_news/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1) //Also ripped from news_browser.dm. Fuck nanoUI
	var/obj/item/starcaster_news/PRG = src //If you're trying to understand this shit go to nano/templates/starcaster_ch.tmpl

	var/list/data = list()

	if(PRG.loaded_article) 	// Viewing an article.
		data["title"] = PRG.loaded_article.filename
		data["cover"] = PRG.loaded_article.cover
		data["article"] = PRG.loaded_article.stored_data
	else										// Viewing list of articles
		var/list/all_articles[0]
		for(var/datum/computer_file/data/news_article/F in ntnet_global.available_news)
			if(!PRG.show_archived && F.archived)
				continue
			all_articles.Add(list(list(
				"name" = F.filename,
				"uid" = F.uid,
				"archived" = F.archived
			)))
		data["all_articles"] = all_articles
		data["showing_archived"] = PRG.show_archived

	ui = SSnanoui.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "starcaster_ch.tmpl", "Starcaster News Browser", 575, 750)
		ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()
*/
