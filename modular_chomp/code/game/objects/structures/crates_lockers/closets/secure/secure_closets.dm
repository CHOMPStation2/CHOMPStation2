/obj/structure/closet/secure_closet/mind
	name = "mind secured locker"
	var/datum/mind/owner
	var/self_del = 1
	anchored = 0

/obj/structure/closet/secure_closet/mind/New(var/datum/mind/mind_target, var/del_self = 1)
	.=..()
	self_del = del_self
	if(mind_target)
		owner = mind_target
		name = "Owned by [owner.name]"
		if(owner.current)
			var/icon/I = get_flat_icon(owner.current, dir=SOUTH, no_anim=TRUE)
			var/image/IM = image(I, pixel_x = (32 - I.Width()))
			//icon2base64(get_flat_icon(owner.current,dir=SOUTH,no_anim=TRUE))
			/*
			I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
			I.plane = MOB_PLANE
			I.layer = MOB_LAYER
			*/
			add_overlay(IM)
			qdel(I)

/obj/structure/closet/secure_closet/mind/allowed(mob/user)
	if(user.mind == owner)
		return TRUE
	else
		return FALSE

/obj/structure/closet/secure_closet/mind/open()
	.=..()
	if(self_del)
		qdel(src)

/obj/structure/closet/secure_closet/mind/LateInitialize()
	if(ispath(closet_appearance))
		closet_appearance = GLOB.closet_appearances[closet_appearance]
		if(istype(closet_appearance))
			icon = closet_appearance.icon
			color = null
	update_icon()