//TFF 17/1/20 - Xenobio camera console circuitboard
#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/weapon/circuitboard/security/xenobio
	name = T_BOARD("xenobiology camera monitor")
	build_path = /obj/machinery/computer/security/xenobio
	network = list(NETWORK_XENOBIO)
	req_access = list()