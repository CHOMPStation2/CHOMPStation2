SUBSYSTEM_DEF(vote)
	name = "Vote"
	wait = 10
	flags = SS_KEEP_TIMING | RUNLEVELS_DEFAULT

	var/datum/vote/active_vote

/datum/controller/subsystem/vote/fire()
	if(active_vote)
		active_vote.tick()

/datum/controller/subsystem/vote/proc/start_vote(datum/vote/V)
	active_vote = V
	active_vote.start()

/datum/controller/subsystem/vote/Topic(href, list/href_list)
	if(href_list["vote"] == "open")
		usr.client.vote()
