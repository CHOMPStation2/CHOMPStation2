/obj/item/device/encryptionkey/heads/hop //YW Edit: removes Explorer channel access, not in line with our chain of command.
	name = "head of personnel's encryption key"
	icon_state = "hop_cypherkey"
	channels = list("Supply" = 1, "Service" = 1, "Command" = 1, "Security" = 1)

/obj/item/device/encryptionkey/heads/ai_integrated
	name = "ai integrated encryption key"
	desc = "Integrated encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/heads/captain
	name = "colony director's encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/heads/rd //YW Edit: adds Explorer channel access, to come in line with our chain of command.
	name = "research director's encryption key"
	icon_state = "rd_cypherkey"
	channels = list("Command" = 1, "Science" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/ert
	channels = list("Response Team" = 1, "Science" = 1, "Command" = 1, "Medical" = 1, "Engineering" = 1, "Security" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/omni		//Literally only for the admin intercoms
	channels = list("Mercenary" = 1, "Raider" = 1, "Response Team" = 1, "Science" = 1, "Command" = 1, "Medical" = 1, "Engineering" = 1, "Security" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/pathfinder //YW Edit: removes command channel access, not in line with our chain of command.
	name = "pathfinder's encryption key"
	icon_state = "com_cypherkey"
	channels = list("Explorer" = 1)

/obj/item/device/encryptionkey/qm //YW Edit: removes command channel access, not in line with our chain of command.
	name = "quartermaster's encryption key"
	icon_state = "qm_cypherkey"
	channels = list("Supply" = 1)

/obj/item/device/encryptionkey/pilot
	name = "pilot's encryption key"
	icon_state = "cypherkey"
	channels = list("Explorer" = 1)

/obj/item/device/encryptionkey/explorer
	name = "explorer's encryption key"
	icon_state = "rob_cypherkey"
	channels = list("Explorer" = 1)

/obj/item/device/encryptionkey/sar
	name = "fm's encryption key"
	icon_state = "med_cypherkey"
	channels = list("Medical" = 1, "Explorer" = 1)

/obj/item/device/encryptionkey/talon
	channels = list("Talon" = 1)
