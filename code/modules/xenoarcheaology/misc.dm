/obj/structure/bookcase/manuals/xenoarchaeology
	name = "Xenoarchaeology Manuals bookcase"

/obj/structure/bookcase/manuals/xenoarchaeology/Initialize()
	. = ..()
	new /obj/item/book/manual/excavation(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/book/manual/mass_spectrometry(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/book/manual/materials_chemistry_analysis(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/book/manual/anomaly_testing(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/book/manual/anomaly_spectroscopy(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/book/manual/stasis(src) // CHOMPEdit - Removal of obj/item/weapon
	update_icon()

/obj/machinery/alarm/isolation
	req_one_access = list(access_research, access_atmospherics, access_engine_equip)

/obj/machinery/alarm/monitor/isolation
	req_one_access = list(access_research, access_atmospherics, access_engine_equip)