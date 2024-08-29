
/obj/item/encryptionkey/ // CHOMPEdit - Removal of obj/item/device
	name = "standard encryption key"
	desc = "An encryption key for a radio headset. Contains cypherkeys."
	icon = 'icons/obj/radio.dmi'
	icon_state = "cypherkey"
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	var/translate_binary = 0
	var/translate_hive = 0
	var/syndie = 0
	var/list/channels = list()

/obj/item/encryptionkey/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon // CHOMPEdit - Removal of obj/item/device

/obj/item/encryptionkey/syndicate // CHOMPEdit - Removal of obj/item/device
	icon_state = "syn_cypherkey"
	channels = list("Mercenary" = 1)
	origin_tech = list(TECH_ILLEGAL = 3)
	syndie = 1//Signifies that it de-crypts Syndicate transmissions

/obj/item/encryptionkey/raider // CHOMPEdit - Removal of obj/item/device
	icon_state = "cypherkey"
	channels = list("Raider" = 1)
	origin_tech = list(TECH_ILLEGAL = 2)
	syndie = 1

/obj/item/encryptionkey/binary // CHOMPEdit - Removal of obj/item/device
	icon_state = "bin_cypherkey"
	translate_binary = 1
	origin_tech = list(TECH_ILLEGAL = 3)

/obj/item/encryptionkey/headset_sec // CHOMPEdit - Removal of obj/item/device
	name = "security radio encryption key"
	icon_state = "sec_cypherkey"
	channels = list("Security" = 1)

/obj/item/encryptionkey/headset_eng // CHOMPEdit - Removal of obj/item/device
	name = "engineering radio encryption key"
	icon_state = "eng_cypherkey"
	channels = list("Engineering" = 1)

/obj/item/encryptionkey/headset_rob // CHOMPEdit - Removal of obj/item/device
	name = "robotics radio encryption key"
	icon_state = "rob_cypherkey"
	channels = list("Engineering" = 1, "Science" = 1)

/obj/item/encryptionkey/headset_med // CHOMPEdit - Removal of obj/item/device
	name = "medical radio encryption key"
	icon_state = "med_cypherkey"
	channels = list("Medical" = 1)

/obj/item/encryptionkey/headset_sci // CHOMPEdit - Removal of obj/item/device
	name = "science radio encryption key"
	icon_state = "sci_cypherkey"
	channels = list("Science" = 1)

/obj/item/encryptionkey/headset_medsci // CHOMPEdit - Removal of obj/item/device
	name = "medical research radio encryption key"
	icon_state = "medsci_cypherkey"
	channels = list("Medical" = 1, "Science" = 1)

/obj/item/encryptionkey/headset_com // CHOMPEdit - Removal of obj/item/device
	name = "command radio encryption key"
	icon_state = "com_cypherkey"
	channels = list("Command" = 1)

/obj/item/encryptionkey/heads/captain // CHOMPEdit - Removal of obj/item/device
	name = "site manager's encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1)

/obj/item/encryptionkey/heads/ai_integrated // CHOMPEdit - Removal of obj/item/device
	name = "ai integrated encryption key"
	desc = "Integrated encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "AI Private" = 1)

/obj/item/encryptionkey/heads/rd // CHOMPEdit - Removal of obj/item/device
	name = "research director's encryption key"
	icon_state = "rd_cypherkey"
	channels = list("Science" = 1, "Command" = 1)

/obj/item/encryptionkey/heads/hos // CHOMPEdit - Removal of obj/item/device
	name = "head of security's encryption key"
	icon_state = "hos_cypherkey"
	channels = list("Security" = 1, "Command" = 1)

/obj/item/encryptionkey/heads/ce // CHOMPEdit - Removal of obj/item/device
	name = "chief engineer's encryption key"
	icon_state = "ce_cypherkey"
	channels = list("Engineering" = 1, "Command" = 1)

/obj/item/encryptionkey/heads/cmo // CHOMPEdit - Removal of obj/item/device
	name = "chief medical officer's encryption key"
	icon_state = "cmo_cypherkey"
	channels = list("Medical" = 1, "Command" = 1)

/obj/item/encryptionkey/heads/hop // CHOMPEdit - Removal of obj/item/device
	name = "head of personnel's encryption key"
	icon_state = "hop_cypherkey"
	channels = list("Supply" = 1, "Service" = 1, "Command" = 1, "Security" = 1)
/*
/obj/item/encryptionkey/headset_mine // CHOMPEdit - Removal of obj/item/device
	name = "mining radio encryption key"
	icon_state = "mine_cypherkey"
	channels = list("Mining" = 1)

/obj/item/encryptionkey/heads/qm // CHOMPEdit - Removal of obj/item/device
	name = "quartermaster's encryption key"
	icon_state = "qm_cypherkey"
	channels = list("Cargo" = 1, "Mining" = 1)
*/
/obj/item/encryptionkey/headset_cargo // CHOMPEdit - Removal of obj/item/device
	name = "supply radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list("Supply" = 1)

/obj/item/encryptionkey/headset_service // CHOMPEdit - Removal of obj/item/device
	name = "service radio encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Service" = 1)

/obj/item/encryptionkey/ert // CHOMPEdit - Removal of obj/item/device
	name = "\improper ERT radio encryption key"
	icon_state = "cent_cypherkey"
	channels = list("Response Team" = 1, "Science" = 1, "Command" = 1, "Medical" = 1, "Engineering" = 1, "Security" = 1, "Supply" = 1, "Service" = 1)

/obj/item/encryptionkey/omni		//Literally only for the admin intercoms // CHOMPEdit - Removal of obj/item/device
	channels = list("Mercenary" = 1, "Raider" = 1, "Response Team" = 1, "Science" = 1, "Command" = 1, "Medical" = 1, "Engineering" = 1, "Security" = 1, "Supply" = 1, "Service" = 1, "Outsider" = 1) //CHOMPedit: Added Outsider
	syndie = 1//Signifies that it de-crypts Syndicate transmissions

/obj/item/encryptionkey/ent // CHOMPEdit - Removal of obj/item/device
	name = "entertainment encryption key"
	channels = list("Entertainment" = 1)
