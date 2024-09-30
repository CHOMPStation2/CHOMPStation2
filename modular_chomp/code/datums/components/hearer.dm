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
	if(inbelly && !(parent_atom.loc == source.loc))
		return
	if(parent_atom in exclude_mobs)
		return

	var/turf/source_turf = get_turf(source)
	var/turf/parent_turf = get_turf(parent_atom)

	if(!istype(source_turf) || !istype(parent_turf))
		return

	if(!AreConnectedZLevels(source_turf.z,parent_turf.z))
		return

	//Most expensive checks last
	if(get_dist(source_turf,parent_turf) > range)
		return

	if(source_turf.z != parent_turf.z)
		if(source_turf.z > parent_turf.z)
			var/turf/curturf = GetAbove(parent_turf)
			while(isopenspace(curturf) && curturf.z != source_turf.z)
				curturf = GetAbove(curturf)

			if(!isopenspace(curturf)) //Last also has to be open space
				return

			if(curturf.z != source_turf.z)
				return
		else
			var/turf/curturf = GetAbove(source_turf)

			while(isopenspace(curturf) && curturf.z != parent_turf.z)
				curturf = GetAbove(curturf)

			if(!isopenspace(curturf)) //Last also has to be open space
				return

			if(curturf.z != parent_turf.z)
				return
	else
		//mmm vision flags
		var/flags_any = SEE_THRU
		flags_any |= (isturf(source) * SEE_TURFS) | (ismob(source) * SEE_MOBS) | (isobj(source) * SEE_OBJS) //speedy boys don't branch
		var/mob/M = parent_atom
		if(!istype(M) || !(flags_any & M.sight)) //If we're a mob and we have the correct vision flags we will see the source through walls anyways
			if(!can_see(source, parent_atom, length = range * 2)) //Length is 2 * range because diagonals are funny with can_see
				return //no can see, fuck off

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
	else if (source.invisibility <= SEE_INVISIBLE_LIVING)
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

/obj/item/uav/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//AIcard definition

/obj/item/aicard/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//Tape recorder definition

/obj/item/taperecorder/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//Portal definition

/obj/effect/map_effect/portal/master/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

//Communicator definition

/obj/item/communicator/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)

/obj/item/paicard/Initialize()
	. = ..()
	hearer = AddComponent(/datum/component/hearer)
