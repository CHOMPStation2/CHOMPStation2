SUBSYSTEM_DEF(vote)
	name = "Vote"
	wait = 10
	priority = FIRE_PRIORITY_VOTE
	runlevels = RUNLEVEL_LOBBY | RUNLEVELS_DEFAULT
	flags = SS_KEEP_TIMING | SS_NO_INIT

	var/datum/vote/active_vote

/datum/controller/subsystem/vote/fire()
	if(active_vote)
		active_vote.tick()

/datum/controller/subsystem/vote/proc/start_vote(datum/vote/V)
	active_vote = V
	active_vote.start()

/datum/controller/subsystem/vote/Topic(href, list/href_list)
    if(href_list["vote"] == "open")
        if(active_vote)
            active_vote.tgui_interact(usr)
        else
            to_chat(usr, "There is no active vote to participate in.")
