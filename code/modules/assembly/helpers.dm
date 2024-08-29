/proc/isassembly(O)
	if(istype(O, /obj/item/assembly)) // CHOMPEdit - Removal of obj/item/device
		return 1
	return 0

/proc/isigniter(O)
	if(istype(O, /obj/item/assembly/igniter)) // CHOMPEdit - Removal of obj/item/device
		return 1
	return 0

/proc/isinfared(O)
	if(istype(O, /obj/item/assembly/infra)) // CHOMPEdit - Removal of obj/item/device
		return 1
	return 0

/proc/isprox(O)
	if(istype(O, /obj/item/assembly/prox_sensor)) // CHOMPEdit - Removal of obj/item/device
		return 1
	return 0

/proc/issignaler(O)
	if(istype(O, /obj/item/assembly/signaler)) // CHOMPEdit - Removal of obj/item/device
		return 1
	return 0

/proc/istimer(O)
	if(istype(O, /obj/item/assembly/timer)) // CHOMPEdit - Removal of obj/item/device
		return 1
	return 0
