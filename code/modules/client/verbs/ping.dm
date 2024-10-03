/client/proc/pingfromtime(time)
	return ((world.time+world.tick_lag*world.tick_usage/100)-time)*100

/client/verb/display_ping(time as num)
	set instant = TRUE
	set name = ".display_ping"
	to_chat(src, span_notice("Round trip ping took [round(pingfromtime(time),1)]ms"))

/client/verb/ping()
	set name = "Ping"
<<<<<<< HEAD
	set category = "OOC.Debug" //CHOMPEdit
=======
	set category = "OOC"
>>>>>>> 7b5dfe54be... Merge pull request #16413 from Kashargul/span_rework
	winset(src, null, "command=.display_ping+[world.time+world.tick_lag*world.tick_usage/100]")
