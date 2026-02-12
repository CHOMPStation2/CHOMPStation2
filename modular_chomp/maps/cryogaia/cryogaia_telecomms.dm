// ### Preset machines  ###


// #### Relays ####
// Telecomms doesn't know about connected z-levels, so we need relays even for the other surface levels.
/obj/machinery/telecomms/relay/preset/cryogaia/basement_1
	id = "Base Relay 1"
	listening_level = Z_LEVEL_CRYOGAIA_LOWER
	autolinkers = list("l_relay")

/obj/machinery/telecomms/relay/preset/cryogaia/basement_2
	id = "Mining Relay"
	listening_level = Z_LEVEL_CRYOGAIA_MINE
	autolinkers = list("m_relay")

/obj/machinery/telecomms/relay/preset/cryogaia/residential
	id = "Residential Relay"
	listening_level = Z_LEVEL_CRYOGAIA_RESIDENTIAL
	autolinkers = list("res_relay")

/obj/machinery/telecomms/relay/preset/cryogaia/main
	id = "Main Complex Relay"
	listening_level =Z_LEVEL_CRYOGAIA_MAIN
	autolinkers = list("s_relay")


/obj/machinery/telecomms/hub/preset/cryogaia
	id = "Hub"
	network = "tcommsat"
	autolinkers = list("hub", "relay", "c_relay", "s_relay", "m_relay", "r_relay", "science", "medical",
	"supply", "service", "common", "command", "engineering", "security", "unused", "hb_relay","Away Team", "unused" ,
	"receiverA", "broadcasterA", "l_relay", "res_relay") //VOREStation Edit - Added "hb_relay"


/obj/machinery/telecomms/receiver/preset_right/cryogaia
	id = "cryogaia_rx"
	freq_listening = list(AI_FREQ, SCI_FREQ, MED_FREQ, SUP_FREQ, SRV_FREQ, COMM_FREQ, ENG_FREQ, SEC_FREQ, ENT_FREQ, EXP_FREQ)

/obj/machinery/telecomms/broadcaster/preset_right/cryogaia
	id = "cryogaia_tx"

/obj/machinery/telecomms/bus/preset_two/cryogaia
	freq_listening = list(SUP_FREQ, SRV_FREQ, EXP_FREQ)

/obj/machinery/telecomms/server/presets/service/cryogaia
	freq_listening = list(SRV_FREQ, EXP_FREQ)
	autolinkers = list("service", "Away Team")



/datum/map/cryogaia/default_internal_channels()
	return list(
		num2text(PUB_FREQ) = list(),
		num2text(AI_FREQ)  = list(ACCESS_SYNTH),
		num2text(ENT_FREQ) = list(),
		num2text(ERT_FREQ) = list(ACCESS_CENT_SPECOPS),
		num2text(COMM_FREQ)= list(ACCESS_HEADS),
		num2text(ENG_FREQ) = list(ACCESS_ENGINE_EQUIP, ACCESS_ATMOSPHERICS),
		num2text(MED_FREQ) = list(ACCESS_MEDICAL_EQUIP),
		num2text(MED_I_FREQ)=list(ACCESS_MEDICAL_EQUIP),
		num2text(SEC_FREQ) = list(ACCESS_SECURITY),
		num2text(SEC_I_FREQ)=list(ACCESS_SECURITY),
		num2text(SCI_FREQ) = list(ACCESS_TOX,ACCESS_ROBOTICS,ACCESS_XENOBIOLOGY),
		num2text(SUP_FREQ) = list(ACCESS_CARGO),
		num2text(SRV_FREQ) = list(ACCESS_JANITOR, ACCESS_HYDROPONICS),
		num2text(EXP_FREQ) = list(ACCESS_EXPLORER)
	)

/obj/item/multitool/station_buffered
	name = "pre-linked multitool (tether hub)"
	desc = "This multitool has already been linked to the Tether telecomms hub and can be used to configure one (1) relay."

/obj/item/multitool/station_buffered/Initialize()
	. = ..()
	buffer = locate(/obj/machinery/telecomms/hub/preset/cryogaia)
