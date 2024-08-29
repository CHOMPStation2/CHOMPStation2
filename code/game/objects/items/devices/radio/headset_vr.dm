/obj/item/radio/headset/centcom // CHOMPEdit - Removal of obj/item/device
	name = "centcom radio headset"
	desc = "The headset of the boss's boss."
	icon_state = "cent_headset"
	item_state = "headset"
	centComm = 1
	ks2type = /obj/item/encryptionkey/ert // CHOMPEdit - Removal of obj/item/device

/obj/item/radio/headset/centcom/alt // CHOMPEdit - Removal of obj/item/device
	name = "centcom bowman headset"
	icon_state = "com_headset_alt"

/obj/item/radio/headset/nanotrasen // CHOMPEdit - Removal of obj/item/device
	name = "\improper NT radio headset"
	desc = "The headset of a Nanotrasen corporate employee."
	icon_state = "nt_headset"
	centComm = 1
	ks2type = /obj/item/encryptionkey/ert // CHOMPEdit - Removal of obj/item/device

/obj/item/radio/headset/nanotrasen/alt // CHOMPEdit - Removal of obj/item/device
	name = "\improper NT bowman headset"
	icon_state = "nt_headset_alt"

/obj/item/radio/headset // CHOMPEdit - Removal of obj/item/device
	sprite_sheets = list(SPECIES_TESHARI = 'icons/inventory/ears/mob_teshari.dmi',
						SPECIES_WEREBEAST = 'icons/inventory/ears/mob_vr_werebeast.dmi')

/obj/item/radio/headset/mob_headset	//Adminbus headset for simplemob shenanigans. // CHOMPEdit - Removal of obj/item/device
	name = "nonhuman radio receiver"
	desc = "An updated, self-adhesive modular intercom that requires no hands to operate or ears to hold, just stick it on. Takes encryption keys"

/obj/item/radio/headset/mob_headset/receive_range(freq, level) // CHOMPEdit - Removal of obj/item/device
	if(ismob(src.loc))
		return ..(freq, level, 1)
	return -1

/obj/item/radio/headset/mob_headset/afterattack(var/atom/movable/target, mob/living/user, proximity) // CHOMPEdit - Removal of obj/item/device
	if(!proximity)
		return
	if(istype(target,/mob/living/simple_mob))
		var/mob/living/simple_mob/M = target
		if(!M.mob_radio)
			user.drop_item()
			forceMove(M)
			M.mob_radio = src
			return
		if(M.mob_radio)
			M.mob_radio.forceMove(M.loc)
			M.mob_radio = null
			return
	..()

/obj/item/radio/headset/headset_cargo // CHOMPEdit - Removal of obj/item/device
	desc = "A headset used by the QM's slaves."

/obj/item/radio/headset/headset_cargo/alt // CHOMPEdit - Removal of obj/item/device
	desc = "A bowman headset used by the QM's slaves."

/obj/item/radio/headset/headset_qm // CHOMPEdit - Removal of obj/item/device
	name = "qm radio headset"
	desc = "A headset used by the QM."
	icon_state = "cargo_headset"
	ks2type = /obj/item/encryptionkey/qm // CHOMPEdit - Removal of obj/item/device

/obj/item/radio/headset/headset_qm/alt // CHOMPEdit - Removal of obj/item/device
	name = "qm bowman headset"
	desc = "A bowman headset used by the QM."
	icon_state = "cargo_headset_alt"

/obj/item/radio/headset/pathfinder // CHOMPEdit - Removal of obj/item/device
	name = "pathfinder's headset"
	desc = "Headset used by pathfinders for exploring. Access to the explorer and command channels."
	icon_state = "exp_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/pathfinder // CHOMPEdit - Removal of obj/item/device

/obj/item/radio/headset/pathfinder/alt // CHOMPEdit - Removal of obj/item/device
	name = "pathfinder's bowman headset"
	desc = "Bowman headset used by pathfinders for exploring. Access to the explorer and command channels."
	icon_state = "exp_headset_alt"

/obj/item/radio/headset/pilot // CHOMPEdit - Removal of obj/item/device
	name = "pilot's headset"
	desc = "A headset used by pilots."
	icon_state = "pilot_headset"
	adhoc_fallback = TRUE

/obj/item/radio/headset/pilot/alt // CHOMPEdit - Removal of obj/item/device
	name = "pilot's bowman headset"
	desc = "A bowman headset used by pilots."
	icon_state = "pilot_headset_alt"

/obj/item/radio/headset/explorer // CHOMPEdit - Removal of obj/item/device
	name = "explorer's headset" //CHOMP explo keep
	desc = "Headset used by explorers for exploring. Access to the explorer channel." //CHOMP explo keep
	icon_state = "exp_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/explorer // CHOMPEdit - Removal of obj/item/device

/obj/item/radio/headset/explorer/alt // CHOMPEdit - Removal of obj/item/device
	name = "explorer's bowman headset" //CHOMP explo keep
	desc = "Bowman headset used by explorers for exploring. Access to the explorer channel." //CHOMP explo keep
	icon_state = "exp_headset_alt"

/obj/item/radio/headset/sar // CHOMPEdit - Removal of obj/item/device
	name = "fm radio headset"
	desc = "A headset for field medics."
	icon_state = "sar_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/sar // CHOMPEdit - Removal of obj/item/device

/obj/item/radio/headset/sar/alt // CHOMPEdit - Removal of obj/item/device
	name = "fm radio bowman headset"
	desc = "A bowman headset for field medics."
	icon_state = "sar_headset_alt"

 //CHOMP explo removed wide comment field
/obj/item/radio/headset/volunteer // CHOMPEdit - Removal of obj/item/device
	name = "volunteer's headset"
	desc = "A headset used by volunteers to expedition teams, has access to the exploration channel." //CHOMP explo keep
	icon_state = "pilot_headset"
	adhoc_fallback = TRUE
	ks2type = /obj/item/encryptionkey/explorer // CHOMPEdit - Removal of obj/item/device
 //CHOMP explo keep removed wide comment field end

/obj/item/radio/headset/talon // CHOMPEdit - Removal of obj/item/device
	name = "talon headset"
	desc = "A headset for communication between the crew of the ITV Talon."
	adhoc_fallback = TRUE
	icon_state = "pilot_headset"
	ks2type = /obj/item/encryptionkey/talon // CHOMPEdit - Removal of obj/item/device
