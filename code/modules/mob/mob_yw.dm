mob
	var/atom/movable/mobonback	//all vehicles can take a load, since they should all be a least drivable

mob/proc/ride()
	set category = "IC"
	set name = "Ride on"
	set desc = "Ride on the person's back..."
	set src in view(1)

	if(!isliving(usr) || !usr.canClick())
		return

	if(usr.stat == 1)
		usr << "You are unconcious and cannot do that!"
		return

	if(usr.restrained())
		usr << "You are restrained and cannot do that!"
		return

	if(src.lying)
		usr << "They are lying down and can't be ridden!"
		return

	if(usr == src)
		usr << "You can't ride yourself.. Lewd"
		return

	if(mobonback)
		usr << "There is already someone occupying [src.name]'s back!"

	visible_message("<span class='notice'>[usr.name] begins climbing on [src.name]'s back.</span>")

	if(!do_after(usr,15))
		return

	if(rideback(usr))
		src.verbs += /mob/proc/getoff
		visible_message("<span class='notice'>[usr.name] climbs on [src.name]'s back!</span>")
		return 1

	return

mob/proc/getoff()
	set category = "IC"
	set name = "Jump off / Throw off"
	set desc = "Get off the person's back...Or get thrown off.."
	set src in view(1)

	if(usr == src.mobonback)
		unrideback(pick(0, 1, 2, 4, 8))
		src.verbs -= /mob/proc/getoff
		visible_message("<span class='notice'>[usr.name] gets off of [src.name]</span>")
	else
		visible_message("<span class='notice'>[usr.name] tries to get [mobonback.name] off of [src.name]!</span>")
		if(!do_after(usr,15))
			return

		unrideback(pick(0, 1, 2, 4, 8))
		src.verbs -= /mob/proc/getoff
		visible_message("<span class='notice'>[mobonback.name] gets thrown off of [src.name] by [usr.name]!</span>")


//Load the object "inside" the trolley and add an overlay of it.
//This prevents the object from being interacted with until it has
// been unloaded. A dummy object is loaded instead so the loading
// code knows to handle it correctly.
mob/proc/rideback(var/atom/movable/C)
	if(get_dist(C, src) > 1 || !isturf(C.loc))
		return 0

	C.forceMove(loc)
	sleep(2)
	if(C.loc != loc) //To prevent you from going onto more than one bot.
		return 0
	C.forceMove(src)
	mobonback = C

	if(C.layer < layer)
		C.layer = layer + 0.1

	if(dir == NORTH)
		C.pixel_x = 0
	else if(dir == SOUTH)
		C.pixel_x = 0
		C.layer = layer - 0.1
	else if(dir == EAST)
		C.pixel_x = -12
	else if(dir == WEST)
		C.pixel_x = 12

	C.pixel_y += 9
	overlays += C

	return 1

mob/proc/unrideback(var/dirn = 0)
	if(!mobonback)
		return

	overlays.Cut()

	mobonback.forceMove(loc)
	mobonback.pixel_y = 0
	mobonback.pixel_x = 0
	mobonback.layer = initial(mobonback.layer)

	if(dirn)
		step(mobonback, dirn)

	mobonback = null
	update_icons()