#define CANBROADCAST_INNERBOX 0.7071067811865476    //This is sqrt(2)/2
/obj/item/radio/proc/can_broadcast_to()
    var/list/output = list()
    var/turf/T = get_turf(src)
    var/dnumber = canhear_range*CANBROADCAST_INNERBOX
    for(var/cand_x = max(0, T.x - canhear_range), cand_x <= T.x + canhear_range, cand_x++)
        for(var/cand_y = max(0, T.y - canhear_range), cand_y <= T.y + canhear_range, cand_y++)
            var/turf/cand_turf = locate(cand_x,cand_y,T.z)
            if(!cand_turf) 
                continue
            if((abs(T.x - cand_x) < dnumber) || (abs(T.y - cand_y) < dnumber))
                output += cand_turf
                continue
            if(sqrt((T.x - cand_x)**2 + (T.y - cand_y)**2) <= canhear_range) 
                output += cand_turf
                continue
    return output
/obj/item/radio/intercom
    var/list/broadcast_tiles

/obj/item/radio/intercom/proc/update_broadcast_tiles()
    var/list/output = list()
    var/turf/T = get_turf(src)
    if(!T)
        return
    var/dnumber = canhear_range*CANBROADCAST_INNERBOX
    for(var/cand_x = max(0, T.x - canhear_range), cand_x <= T.x + canhear_range, cand_x++)
        for(var/cand_y = max(0, T.y - canhear_range), cand_y <= T.y + canhear_range, cand_y++)
            var/turf/cand_turf = locate(cand_x,cand_y,T.z)
            if(!cand_turf) 
                continue
            if((abs(T.x - cand_x) < dnumber) || (abs(T.y - cand_y) < dnumber))
                output += cand_turf
                continue
            if(sqrt((T.x - cand_x)**2 + (T.y - cand_y)**2) <= canhear_range) 
                output += cand_turf
                continue
    broadcast_tiles = output

/obj/item/radio/intercom/forceMove(atom/destination)
    . = ..()
    update_broadcast_tiles()

/obj/item/radio/intercom/Initialize()
    . = ..()
    update_broadcast_tiles()

/obj/item/radio/intercom/can_broadcast_to()
    if(!broadcast_tiles)
        update_broadcast_tiles()
    return broadcast_tiles

//*Subspace Radio*//
/obj/item/radio/subspace
	adhoc_fallback = 1
	canhear_range = 8
	desc = "A heavy duty radio that can pick up all manor of shortwave and subspace frequencies. It's a bit bulkier than a normal radio thanks to the extra hardware."
	description_info = "This radio can broadcast over any headset frequency that the user has access to. It has a shortwave fallback to directly broadcast to all radio equipment on the same Z-Level/Map in the event of a telecommunications failure. This device requires a functioning Telecommunications Network/Relay to send and receive signals meant for headsets. Additionally, the volume knob seems to be stuck on the max setting. You could hear this thing clear across a room... Not good for discretely listening in on secure channels or being stealthy!"
	icon_state = "radio"
	name = "subspace radio"
	subspace_transmission = 1
	throwforce = 5
	throw_range = 7
	throw_speed = 1

//* Bluespace Radio *//
/obj/item/bluespaceradio/southerncross_prelinked
	name = "bluespace radio (southerncross)"
	handset = /obj/item/radio/bluespacehandset/linked/southerncross_prelinked

/obj/item/radio/bluespacehandset/linked/southerncross_prelinked
	bs_tx_preload_id = "Receiver A" //Transmit to a receiver
	bs_rx_preload_id = "Broadcaster A" //Recveive from a transmitter

#undef CANBROADCAST_INNERBOX