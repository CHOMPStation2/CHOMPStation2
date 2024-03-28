// visible_message is way too fucking expensive because it recursively searches through turf contents to find something which should actually recieve the message.
// so I'm sick of it and I'm making a component to keep track of anything that needs visible_message
// note: this is seperate from normal Say(), objects that need to listen to dialogue don't need this component.
// Love and sorry if this horribly breaks - Cadyn
/datum/component/hearer
	var/atom/movable/parent_atom

/datum/component/hearer/RegisterWithParent()
	. = ..()
	parent_atom = parent
	if(!istype(parent_atom))
		CRASH("hearer intialized on non-atom")
	RegisterSignal(SSdcs, COMSIG_VISIBLE_MESSAGE, PROC_REF(on_message))

/datum/component/hearer/UnregisterFromParent()
	. = ..()
	parent_atom = null
	UnregisterSignal(SSdcs, COMSIG_VISIBLE_MESSAGE)

/datum/component/hearer/proc/on_message(var/dcs,var/atom/source, var/message, var/blind_message, var/list/exclude_mobs, var/range, var/runemessage = "<span style='font-size: 1.5em'>👁</span>", var/inbelly)
	if(!AreConnectedZLevels(source.z,parent_atom.z))
		return
	if(inbelly && !(parent_atom.loc == source.loc))
		return
	if(parent_atom in exclude_mobs)
		return
	//Most expensive checks last
	if(get_dist(source,parent_atom) > range)
		return

	if(source.z != parent_atom.z)
		if(source.z > parent_atom.z)
			var/turf/curturf = GetAbove(get_turf(parent_atom))
			while(isopenspace(curturf) && curturf.z != source.z)
				curturf = GetAbove(curturf)

			if(curturf.z != source.z)
				return
		else
			var/turf/curturf = GetAbove(get_turf(source))
			while(isopenspace(curturf) && curturf.z != parent_atom.z)
				curturf = GetAbove(curturf)

			if(curturf.z != parent_atom.z)
				return


	if(ismob(parent_atom))
		var/mob/M = parent_atom
		if(!M.ckey)
			return
		if((M.see_invisible >= source.invisibility) && MOB_CAN_SEE_PLANE(M, source.plane))
			M.show_message(message, VISIBLE_MESSAGE, blind_message, AUDIBLE_MESSAGE)
			if(runemessage != -1)
				M.create_chat_message(source, "[runemessage]", FALSE, list("emote"), audible = FALSE)
		else if(blind_message)
			M.show_message(blind_message, AUDIBLE_MESSAGE)
	else
		parent_atom.show_message(message, VISIBLE_MESSAGE, blind_message, AUDIBLE_MESSAGE)

//Atom definition (base)

/atom/movable
	var/datum/component/hearer/hearer

/atom/movable/Destroy()
	if(hearer) QDEL_NULL(hearer)
	. = ..()

//Mob definition

/mob/Login()
	. = ..()
	if(!hearer) hearer = AddComponent(/datum/component/hearer) //Only add these to mobs that have a client at some point in time

//Overmap ship definition (I have no idea why they use show_message?? but ok)

/obj/effect/overmap/visitable/ship/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//Holopad definition

/obj/machinery/hologram/holopad/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//UAV definition

/obj/item/device/uav/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//AIcard definition

/obj/item/device/aicard/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//Tape recorder definition

/obj/item/device/taperecorder/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//Portal definition

/obj/effect/map_effect/portal/master/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//Communicator definition

/obj/item/device/communicator/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

/obj/item/device/paicard/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)
