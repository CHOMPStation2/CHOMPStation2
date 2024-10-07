/obj/item/paicard/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/card/id/ID = W.GetID()
	if(ID)
		if (src.pai.idaccessible == 1)
			switch(alert(user, "Do you wish to add access to [src] or remove access from [src]?",,"Add Access","Remove Access", "Cancel"))
				if("Add Access")
					src.pai.idcard.access |= ID.access
					to_chat(user, span_notice("You add the access from the [W] to [src]."))
					return
				if("Remove Access")
					src.pai.idcard.access = list()
					to_chat(user, span_notice("You remove the access from [src]."))
					return
				if("Cancel")
					return
		else if (istype(W, /obj/item/card/id) && src.pai.idaccessible == 0)
			to_chat(user, span_notice("[src] is not accepting access modifications at this time."))
			return
