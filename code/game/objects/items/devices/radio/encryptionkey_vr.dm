/obj/item/encryptionkey/heads/hop // CHOMPEdit - Removal of obj/item/device
	name = "head of personnel's encryption key"
	icon_state = "hop_cypherkey"
	channels = list("Supply" = 1, "Service" = 1, "Command" = 1, "Security" = 1) //YW Edit: removes Explorer channel access, not in line with our chain of command. CHOMP: We accept this

/obj/item/encryptionkey/heads/ai_integrated // CHOMPEdit - Removal of obj/item/device
	name = "ai integrated encryption key"
	desc = "Integrated encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1, "Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/heads/captain // CHOMPEdit - Removal of obj/item/device
	name = "site manager's encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/heads/rd // CHOMPEdit - Removal of obj/item/device
	name = "research director's encryption key"
	icon_state = "rd_cypherkey"
	channels = list("Command" = 1, "Science" = 1, "Explorer" = 1) //YW Edit: adds Explorer channel access, to come in line with our chain of command. CHOMP: We accept this

/obj/item/encryptionkey/ert // CHOMPEdit - Removal of obj/item/device
	channels = list("Response Team" = 1, "Science" = 1, "Command" = 1, "Medical" = 1, "Engineering" = 1, "Security" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/omni		//Literally only for the admin intercoms // CHOMPEdit - Removal of obj/item/device
	channels = list("Mercenary" = 1, "Raider" = 1, "Response Team" = 1, "Science" = 1, "Command" = 1, "Medical" = 1, "Engineering" = 1, "Security" = 1, "Supply" = 1, "Service" = 1, "Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/pathfinder // CHOMPEdit - Removal of obj/item/device
	name = "pathfinder's encryption key"
	icon_state = "com_cypherkey"
	channels = list("Explorer" = 1) //YW Edit: removes command channel access, not in line with our chain of command. CHOMP: We accept this

/obj/item/encryptionkey/qm // CHOMPEdit - Removal of obj/item/device
	name = "quartermaster's encryption key"
	icon_state = "qm_cypherkey"
	channels = list("Supply" = 1) //YW Edit: removes command channel access, not in line with our chain of command. CHOMP: We accept this

/obj/item/encryptionkey/pilot // CHOMPEdit - Removal of obj/item/device
	name = "pilot's encryption key"
	icon_state = "cypherkey"
	channels = list("Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/explorer // CHOMPEdit - Removal of obj/item/device
	name = "explorer's encryption key" //CHOMP explo keep
	icon_state = "rob_cypherkey"
	channels = list("Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/sar // CHOMPEdit - Removal of obj/item/device
	name = "fm's encryption key"
	icon_state = "med_cypherkey"
	channels = list("Medical" = 1, "Explorer" = 1) //CHOMP explo keep

/obj/item/encryptionkey/talon // CHOMPEdit - Removal of obj/item/device
	channels = list("Talon" = 1)
