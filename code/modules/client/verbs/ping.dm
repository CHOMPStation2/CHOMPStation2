/client/proc/pingfromtime(time)
	return ((world.time+world.tick_lag*TICK_USAGE_REAL/100)-time)*100 //CHOMPEdit

/client/verb/display_ping(time as num)
	set instant = TRUE
	set name = ".display_ping"
	to_chat(src, span_notice("Round trip ping took [round(pingfromtime(time),1)]ms"))//CHOMPEdit

/client/verb/ping()
	set name = "Ping"
	set category = "OOC.Debug" //CHOMPEdit
	winset(src, null, "command=.display_ping+[world.time+world.tick_lag*TICK_USAGE_REAL/100]") //CHOMPEdit
