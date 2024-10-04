/obj/effect/step_trigger/message
	var/message	//the message to give to the mob
	var/once = 1
	var/list/mobs = list()	//CHOMPEdit - mobs we've sent our message to

/obj/effect/step_trigger/message/Trigger(mob/M as mob)
	//CHOMPEdit start - tweaked message trigger to be more sane
	if(M.client)
		if(once)
			if(M in mobs)
				return
			else
				mobs += M
		to_chat(M, span_info("[message]"))
	//CHOMPEdit end

/obj/effect/step_trigger/teleport_fancy
	var/locationx
	var/locationy
	var/locationz	//CHOMPEdit - Why wasn't there a z for this
	var/uses = 1	//0 for infinite uses
	var/entersparks = 0
	var/exitsparks = 0
	var/entersmoke = 0
	var/exitsmoke = 0

/obj/effect/step_trigger/teleport_fancy/Trigger(mob/M as mob)
	if(!locationz)
		locationz = src.z	//CHOMPEdit - Safety net to not break existing teleport triggers
	var/dest = locate(locationx, locationy, locationz)	//CHOMPEdit - added locationz
	M.forceMove(dest)	//CHOMPEdit - Teleports should be forceMove, not Move

	if(entersparks)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(4, 1, src)
		s.start()
	if(exitsparks)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(4, 1, dest)
		s.start()

	if(entersmoke)
		var/datum/effect/effect/system/smoke_spread/s = new /datum/effect/effect/system/smoke_spread
		s.set_up(4, 1, src, 0)
		s.start()
	if(exitsmoke)
		var/datum/effect/effect/system/smoke_spread/s = new /datum/effect/effect/system/smoke_spread
		s.set_up(4, 1, dest, 0)
		s.start()

	uses--
	if(uses == 0)
		qdel(src)
