/obj/item/stack/arcadeticket
	name = "arcade tickets"
	desc = "Wow! With enough of these, you could buy a bike! ...Pssh, yeah right."
	singular_name = "arcade ticket"
	icon_state = "arcade-ticket"
	item_state = "tickets"
	w_class = ITEMSIZE_TINY
	max_amount = 30

/obj/item/stack/arcadeticket/Initialize()
	. = ..()
	update_icon()

/obj/item/stack/arcadeticket/update_icon()
	var/amount = get_amount()
	switch(amount)
		if(12 to INFINITY)
			icon_state = "arcade-ticket_4"
		if(6 to 12)
			icon_state = "arcade-ticket_3"
		if(2 to 6)
			icon_state = "arcade-ticket_2"
		else
			icon_state = "arcade-ticket"

/obj/item/stack/arcadeticket/proc/pay_tickets()
	amount -= 2
	if(amount == 0)
		qdel(src)

/obj/item/stack/arcadeticket/thirty
	amount = 30

/obj/machinery/computer/arcade/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/stack/arcadeticket))
		var/obj/item/stack/arcadeticket/T = O
		var/amount = T.get_amount()
		if(amount <2)
			to_chat(user, "<span class='warning'>You need 2 tickets to claim a prize!</span>")
			return
		prizevend(user)
		T.pay_tickets()
		T.update_icon()
		O = T
		to_chat(user, "<span class='notice'>You turn in 2 tickets to the [src] and claim a prize!</span>")
		return