/obj/structure/bookcase/manuals/xenoarchaeology
	name = "Xenoarchaeology Manuals bookcase"

/obj/structure/bookcase/manuals/xenoarchaeology/Initialize()
	. = ..()
	new /obj/item/weapon/book/manual/excavation(src)
	new /obj/item/weapon/book/manual/mass_spectrometry(src)
	new /obj/item/weapon/book/manual/materials_chemistry_analysis(src)
	new /obj/item/weapon/book/manual/anomaly_testing(src)
	new /obj/item/weapon/book/manual/anomaly_spectroscopy(src)
	new /obj/item/weapon/book/manual/stasis(src)
	update_icon()

/obj/machinery/alarm/isolation
	req_one_access = list(access_research, access_atmospherics, access_engine_equip)

/obj/machinery/alarm/monitor/isolation
	req_one_access = list(access_research, access_atmospherics, access_engine_equip)

/obj/structure/noticeboard/airlock
	notices = 1
	icon_state = "nboard01"

/obj/structure/noticeboard/airlock/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Staff Notice: Airlock Proceedure"
	P.info = "<br>Due to the large amount of new staff unfamiliar with our proceedures we've left you some instructions. <br> To exit through an airlock, simply hit the button to open the interior, and then cycle to exterior once inside. To re-enter the station, enter the airlock, Close the exterior hatch, and look for the customized thermal regulators installed on the wall. <br>This should heat up the air in the airlock, allowing you to open the interior door with no issues."
	P.stamped = list(/obj/item/weapon/stamp/captain)
	P.overlays = list("paper_stamp-cap")
	src.contents += P