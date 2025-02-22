//The RD console designed for outsider pods, no access and no access to NT servers.
/obj/machinery/computer/rdconsole/public
	name = "Outsider R&D control console"
	sync = 0
	is_public = TRUE
	req_access = ""
	circuit = /obj/item/circuitboard/rdconsole/public
	LockedPrinterDesigns = list(/datum/design/circuit/protolathe,
								/datum/design/circuit/circuit_imprinter,
								/datum/design/circuit/destructive_analyzer,
								/datum/design/circuit/rdconsole,
								/datum/design/circuit/rdservercontrol
								)
