var/global/list/special_roles = list( //keep synced with the defines BE_* in setup.dm --rastaf
//some autodetection here.
// Change these to 0 if the equivalent mode is disabled for whatever reason!
	"traitor" = 1,										// 0
	"operative" = 1,									// 1
	"changeling" = 1,									// 2
	"wizard" = 1,										// 3
	"malf AI" = 1,										// 4
	"revolutionary" = 1,								// 5
	"alien candidate" = 1,								// 6
	"positronic brain" = 1,								// 7
	"cultist" = 1,										// 8
	"renegade" = 1,										// 9
	"ninja" = 1,										// 10
	"raider" = 1,										// 11
	"diona" = 1,										// 12
	"mutineer" = 1,										// 13
	"loyalist" = 1,										// 14
	"GHOST" = 0,										// CHOMPEDIT - add seperate section for ghost roles
	"pAI candidate" = 1,								// 15
	//VOREStation Add
	"lost drone" = 1,									// 16
	"maint pred" = 1,									// 17
	"stowaway" = 1,										// 18 // CHOMPEdit
	"morph" = 1,										// 19
	"corgi" = 1,										// 20
	"cursed sword" = 1,									// 21
	"Ship Survivor" = 1,								// 22
	//VOREStation Add End
)

/datum/category_item/player_setup_item/antagonism/candidacy
	name = "Candidacy"
	sort_order = 2

/datum/category_item/player_setup_item/antagonism/candidacy/load_character(list/save_data)
	pref.be_special = save_data["be_special"]

/datum/category_item/player_setup_item/antagonism/candidacy/save_character(list/save_data)
	save_data["be_special"] = pref.be_special

/datum/category_item/player_setup_item/antagonism/candidacy/sanitize_character()
	pref.be_special	= sanitize_integer(pref.be_special, 0, 16777215, initial(pref.be_special)) //VOREStation Edit - 24 bits of support

/datum/category_item/player_setup_item/antagonism/candidacy/content(var/mob/user)
	if(jobban_isbanned(user, JOB_SYNDICATE))
		. += span_bold("You are banned from antagonist roles.")
		pref.be_special = 0
	else
		var/n = 0
		for (var/i in special_roles)
			if(special_roles[i]) //if mode is available on the server
				if(jobban_isbanned(user, i) || (i == "positronic brain" && jobban_isbanned(user, JOB_AI) && jobban_isbanned(user, JOB_CYBORG)) || (i == "pAI candidate" && jobban_isbanned(user, JOB_PAI)))
					. += span_bold("Be [i]:") + " <font color=red><b> \[BANNED]</b></font><br>"
				else
					. += span_bold("Be [i]:") + " <a href='?src=\ref[src];be_special=[n]'>" + span_bold("[pref.be_special&(1<<n) ? "Yes" : "No"]") + " </a><br>"
			// CHOMPEdit Start -  Add header for Ghost roles section
			if(i == "GHOST")
				. += "<h4>" + span_underline("GHOST ROLES") + " - Roles that are joinable as ghosts, but not true antags.</h4><br>"
			else
			//CHOMPEdit End
				n++

/datum/category_item/player_setup_item/antagonism/candidacy/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["be_special"])
		var/num = text2num(href_list["be_special"])
		pref.be_special ^= (1<<num)
		return TOPIC_REFRESH

	return ..()
