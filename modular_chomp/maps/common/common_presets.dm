//
// Cameras
//

// Networks
/obj/machinery/camera/network/third_deck
	network = list(NETWORK_THIRD_DECK)

/obj/machinery/camera/network/second_deck
	network = list(NETWORK_SECOND_DECK)

/obj/machinery/camera/network/first_deck
	network = list(NETWORK_FIRST_DECK)

/obj/machinery/camera/network/main_outpost
	network = list(NETWORK_MAIN_OUTPOST)

/obj/machinery/camera/network/supply
	network = list(NETWORK_SUPPLY)

/obj/machinery/camera/network/carrier
	network = list(NETWORK_CARRIER)

/obj/machinery/camera/network/maint_deck
	network = list(NETWORK_MAINT_DECK)

// ### Preset machines  ###


// #### Relays ####
// Telecomms doesn't know about connected z-levels, so we need relays even for the other surface levels.
/obj/machinery/telecomms/relay/preset/southerncross/d0
	id = "Station Relay 0"
	autolinkers = list("d0_relay")

/obj/machinery/telecomms/relay/preset/southerncross/d1
	id = "Station Relay 1"
	autolinkers = list("d1_relay")

/obj/machinery/telecomms/relay/preset/southerncross/d2
	id = "Station Relay 2"
	autolinkers = list("d2_relay")

/obj/machinery/telecomms/relay/preset/southerncross/d3
	id = "Station Relay 3"
	autolinkers = list("d3_relay")

/obj/machinery/telecomms/relay/preset/southerncross/planet
	id = "Planet Relay"
	autolinkers = list("pnt_relay")

/obj/machinery/telecomms/relay/preset/southerncross/cave
	id = "Cave Relay"
	autolinkers = list("cve_relay")

/obj/machinery/telecomms/relay/preset/southerncross/wild
	id = "Wild Relay"
	autolinkers = list("wld_relay")

/obj/machinery/telecomms/relay/preset/southerncross/transit
	id = "Transit Relay"
	autolinkers = list("tns_relay")

/obj/machinery/telecomms/relay/preset/southerncross/explorer
	id = "Carrier Relay"
	autolinkers = list("exp_relay")

/obj/machinery/telecomms/relay/preset/southerncross/centcomm
	id = "Centcom Relay"
	autolinkers = list("cnt_relay")

/obj/machinery/telecomms/hub/preset/southerncross
	id = "Hub"
	network = "tcommsat"
	autolinkers = list("hub",
		"d0_relay", "d1_relay", "d2_relay", "d3_relay", "pnt_relay", "cve_relay", "wld_relay", "tns_relay", "cnt_relay", "explorer", "exp_relay",
		"science", "medical", "supply", "service", "common", "command", "engineering", "security", "unused",
		"hb_relay", "receiverA", "broadcasterA"
	)

/obj/machinery/telecomms/hub/preset/southerncross/centcomm
	id = "CentCom Hub"
	network = "tcommsat"
	produces_heat = 0
	autolinkers = list("hub_cent", "centcom", "receiverCent", "broadcasterCent",
		"d0_relay", "d1_relay", "d2_relay", "d3_relay", "pnt_relay", "cve_relay", "wld_relay", "tns_relay"
	)

/obj/machinery/telecomms/receiver/preset_right/southerncross
	freq_listening = list(AI_FREQ, SCI_FREQ, MED_FREQ, SUP_FREQ, SRV_FREQ, COMM_FREQ, ENG_FREQ, SEC_FREQ, ENT_FREQ, BDCM_FREQ, EXP_FREQ)

/obj/machinery/telecomms/bus/preset_two/southerncross
	freq_listening = list(SUP_FREQ, SRV_FREQ, EXP_FREQ)

/obj/machinery/telecomms/server/presets/service/southerncross
	freq_listening = list(SRV_FREQ, EXP_FREQ)
	autolinkers = list("service", "explorer")

/datum/map/southern_cross/default_internal_channels()
	return list(
		num2text(PUB_FREQ) = list(),
		num2text(AI_FREQ)  = list(ACCESS_SYNTH),
		num2text(ENT_FREQ) = list(),
		num2text(ERT_FREQ) = list(ACCESS_CENT_SPECOPS),
		num2text(COMM_FREQ)= list(ACCESS_HEADS),
		num2text(ENG_FREQ) = list(ACCESS_ENGINE_EQUIP, ACCESS_ATMOSPHERICS),
		num2text(MED_FREQ) = list(ACCESS_MEDICAL_EQUIP),
		num2text(MED_I_FREQ)=list(ACCESS_MEDICAL_EQUIP),
		num2text(BDCM_FREQ) =list(ACCESS_SECURITY),
		num2text(SEC_FREQ) = list(ACCESS_SECURITY),
		num2text(SEC_I_FREQ)=list(ACCESS_SECURITY),
		num2text(SCI_FREQ) = list(ACCESS_TOX,ACCESS_ROBOTICS,ACCESS_XENOBIOLOGY),
		num2text(SUP_FREQ) = list(ACCESS_CARGO, ACCESS_MINING_STATION),
		num2text(SRV_FREQ) = list(ACCESS_JANITOR, ACCESS_LIBRARY, ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN),
		num2text(EXP_FREQ) = list(ACCESS_EXPLORER)
	)
