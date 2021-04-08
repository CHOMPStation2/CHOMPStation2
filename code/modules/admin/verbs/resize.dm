/client/proc/resize(var/mob/living/L in mob_list)
    set name = "Resize"
    set desc = "Resizes any living mob without any restrictions on size."
    set category = "Fun"
    if(!check_rights(R_ADMIN, R_FUN))
        return
    
<<<<<<< HEAD
    var/size_multiplier = input(usr, "Input size multiplier.", "Resize", 1)
    L.resize(size_multiplier, TRUE, TRUE)
    if(size_multiplier >= RESIZE_TINY && size_multiplier <= RESIZE_HUGE)
        L.size_uncapped = FALSE
    else
        L.size_uncapped = TRUE
||||||| parent of 4c52a2cdd4... Merge pull request #10095 from ShadowLarkens/better_resize_guard
    var/size_multiplier = input(usr, "Input size multiplier.", "Resize", 1) as num|null
    if(!size_multiplier)
        return //cancelled

    size_multiplier = clamp(size_multiplier, 0.01, 1000)
    var/can_be_big = L.has_large_resize_bounds()
    var/very_big = is_extreme_size(size_multiplier)

    if(very_big && can_be_big) // made an extreme size in an area that allows it, don't assume adminbuse
        to_chat(src,"<span class='warning'>[L] will lose this size upon moving into an area where this size is not allowed.</span>")
    else if(very_big) // made an extreme size in an area that doesn't allow it, assume adminbuse
        to_chat(src,"<span class='warning'>[L] will retain this normally unallowed size outside this area.</span>")
        L.size_uncapped = TRUE
    else if(L.size_uncapped) // made a normal size after having been an extreme adminbuse size
        to_chat(src,"<span class='warning'>[L] now returned to normal area-based size limitations.</span>")
        L.size_uncapped = FALSE

    L.resize(size_multiplier, animate = TRUE, uncapped = TRUE, ignore_prefs = TRUE)
=======
    var/size_multiplier = input(usr, "Input size multiplier.", "Resize", 1) as num|null
    if(!size_multiplier)
        return //cancelled

    size_multiplier = clamp(size_multiplier, 0.01, 1000)
    var/can_be_big = L.has_large_resize_bounds()
    var/very_big = is_extreme_size(size_multiplier)

    if(very_big && can_be_big) // made an extreme size in an area that allows it, don't assume adminbuse
        to_chat(src,"<span class='warning'>[L] will lose this size upon moving into an area where this size is not allowed.</span>")
    else if(very_big) // made an extreme size in an area that doesn't allow it, assume adminbuse
        to_chat(src,"<span class='warning'>[L] will retain this normally unallowed size outside this area.</span>")

    L.resize(size_multiplier, animate = TRUE, uncapped = TRUE, ignore_prefs = TRUE)
>>>>>>> 4c52a2cdd4... Merge pull request #10095 from ShadowLarkens/better_resize_guard

    log_and_message_admins("has changed [key_name(L)]'s size multiplier to [size_multiplier].")
    feedback_add_details("admin_verb","RESIZE")