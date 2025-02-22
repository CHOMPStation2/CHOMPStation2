//Public RND console for outsider pod use
/obj/item/circuitboard/rdconsole/public
	name = T_BOARD("Outsider R&D control console")
	build_path = /obj/machinery/computer/rdconsole/public

/obj/item/circuitboard/rdconsole/public/attackby(obj/item/I as obj, mob/user as mob) //It has access change interactions with screwdriver for the main board, you cant change them here.
	return
