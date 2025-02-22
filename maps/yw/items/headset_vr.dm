//Original Source: Southern Cross

/obj/item/radio/headset/pilot
	desc = "A headset used by pilots, has access to the explorer channel."

/obj/item/radio/headset/alt/pilot
	desc = "A bowman headset used by pilots, has access to the explorer channel."

/obj/item/radio/headset/explorer
	desc = "Headset used by explorers for exploring. Access to explorer and science channels."

/obj/item/radio/headset/alt/explorer
	desc = "Bowman headset used by explorers for exploring. Access to explorer and science channels."

/obj/item/radio/headset/sar
	name = "fm radio headset"
	desc = "A headset for field medics."

/obj/item/radio/headset/alt/sar
	name = "fm radio bowman headset"
	desc = "A bowman headset for field medics."

/obj/item/radio/headset/volunteer
	name = "volunteer's headset"
	desc = "A headset used by volunteers to expedition teams, has access to the exploration channel."
	icon_state = "pilot_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/pilot
