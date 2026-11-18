////////////////////////////////////////////////////////////
// Sif surface
////////////////////////////////////////////////////////////
/obj/machinery/alarm/sifwilderness
	breach_detection = 0
	report_danger_level = 0

/obj/machinery/alarm/sifwilderness/set_initial_TLV()
	. = ..()

	TLV["oxygen"] =			list(16, 17, 135, 140)
	TLV["pressure"] =		list(0,ONE_ATMOSPHERE*0.10,ONE_ATMOSPHERE*1.50,ONE_ATMOSPHERE*1.60)
	TLV["temperature"] =	list(T0C - 40, T0C - 31, T0C + 40, T0C + 120)


////////////////////////////////////////////////////////////
// Cryogaia
////////////////////////////////////////////////////////////
/obj/machinery/alarm/yw/set_initial_TLV()
	. = ..()

	TLV[GAS_O2] =			list(16, 19, 135, 140) // Partial pressure, kpa
	TLV[GAS_N2] =			list(0, 0, 135, 140) // Partial pressure, kpa
	TLV[GAS_CO2] = 			list(-1.0, -1.0, 5, 10) // Partial pressure, kpa
	TLV[GAS_PHORON] =		list(-1.0, -1.0, 0, 0.5) // Partial pressure, kpa
	TLV["other"] =			list(-1.0, -1.0, 0.5, 1.0) // Partial pressure, kpa
	TLV["pressure"] =		list(ONE_ATMOSPHERE * 0.65, ONE_ATMOSPHERE * 0.90, ONE_ATMOSPHERE * 1.10, ONE_ATMOSPHERE * 1.20) /* kpa */
	TLV["temperature"] =	list(T0C - 80, T0C, T0C + 40, T0C + 66) // K

/obj/machinery/alarm/yw/nobreach
	breach_detection = 0

/obj/machinery/alarm/yw/monitor
	report_danger_level = 0
	breach_detection = 0

/obj/machinery/alarm/yw/isolation
	req_one_access = list(ACCESS_RESEARCH, ACCESS_ATMOSPHERICS, ACCESS_ENGINE_EQUIP)

/obj/machinery/alarm/yw/monitor/isolation
	req_one_access = list(ACCESS_RESEARCH, ACCESS_ATMOSPHERICS, ACCESS_ENGINE_EQUIP)
