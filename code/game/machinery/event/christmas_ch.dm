/obj/structure/event/present
	name = "decorative present"
	desc = "A gift! What cou- oh, it's made of plastic.."
	icon = 'icons/obj/items_ch.dmi'
	icon_state = "gift1_g"

	var/chaos = "I can do anything!"
	anchored = 1.0
	density = 0

/obj/structure/event/present/New()
	..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)
	icon_state = "gift[pick("1", "2", "3")]_[pick("g", "r", "b", "y", "p")]"
	return

/obj/structure/event/santa_sack

	name = "Santa's sack"
	desc = "A huge velvet sack full of presents! Only those who has been nice gets one from Santa!"
	icon = 'icons/obj/storage_ch.dmi'
	icon_state = "santasack"

	var/santa_ckey = null //The ckey set for the person acting as Santa, will be the only one able to anchor/unachor as well as retrieve presents.
	var/list/nice_list_log = list() //The log that will contain all characters and their ckeys that the santa has given a gift to.
	var/list/ckey_log = list() //The log that ensures nobody is naughty and tries to trick Santa into giving them twice!
	anchored = 1.0
	density = 1

/obj/structure/event/santa_sack/verb/setanchor()
	set name = "Bind/unbind sack"
	set category = "Object"
	set src in view(1)

	if(usr.incapacitated())
		return
	if(usr.ckey == santa_ckey)
		if(anchored == 0)
			anchored = 1
			to_chat(usr,"<span class='notice'>You bind the sack, none can make off with it now!</span> ")
		else
			anchored = 0
			to_chat(usr,"<span class='notice'>You unbind the sack, you can now drag it off. But so can anyone else!</span> ")
	else
		to_chat(usr, span("warning", "Only Santa can bind and unbind his sack!"))
	return

/obj/structure/event/santa_sack/attack_hand(mob/user as mob)
	. = ..()
	if(usr.ckey != santa_ckey)
		to_chat(usr, span("warning", "Only Santa can give presents! (Be nice or you might end up in Santa's sack!)"))
		return

	var/list/receivers = list()
	for(var/mob/living/R in oview(user.loc,1))
		receivers += R

	var/mob/living/T = input("Choose who to give a present to.") as null| mob in view(user.loc,1)
	if(!T || !T.ckey)
		return

	if(ckey_log[T.ckey])
		to_chat(usr, span("warning", "This one already got a present!"))
		return

	new /obj/item/a_gift/advanced(src.loc)
	for(var/mob/O in view(src, null))
		O.show_message("<span class='warning'>Santa pulls out a present for [T.name]! \"Merry Christmas!</span>",1)

	var/santa_log = "[T.ckey] playing as [T.name] got a present!"
	nice_list_log[++nice_list_log.len] = santa_log
	ckey_log[user.ckey] = TRUE
	//Currently doesnt have an ingame way to show. Can only be viewed through View-Variables, to ensure theres no chance of players ckeys exposed - Jack
