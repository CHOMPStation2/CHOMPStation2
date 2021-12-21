#define CANBROADCAST_INNERBOX 0.7071067811865476    //This is sqrt(2)/2
/obj/item/device/radio/proc/can_broadcast_to()
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
/obj/item/device/radio/intercom
    var/list/broadcast_tiles

/obj/item/device/radio/intercom/proc/update_broadcast_tiles()
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

/obj/item/device/radio/intercom/forceMove(atom/destination)
    . = ..()
    update_broadcast_tiles()

/obj/item/device/radio/intercom/Initialize()
    . = ..()
    update_broadcast_tiles()

/obj/item/device/radio/intercom/can_broadcast_to()
    if(!broadcast_tiles)
        update_broadcast_tiles()
    return broadcast_tiles
#undef CANBROADCAST_INNERBOX
