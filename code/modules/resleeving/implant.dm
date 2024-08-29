////////////////////////////////
//// Resleeving implant
//// for both organic and synthetic crew
////////////////////////////////

//The backup implant itself
/obj/item/implant/backup // CHOMPEdit - Removal of obj/item/weapon
	name = "backup implant"
	desc = "A mindstate backup implant that occasionally stores a copy of one's mind on a central server for backup purposes."
	catalogue_data = list(/datum/category_item/catalogue/information/organization/vey_med,
						/datum/category_item/catalogue/technology/resleeving)
	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "backup_implant"
	known_implant = TRUE

	// Resleeving database this machine interacts with. Blank for default database
	// Needs a matching /datum/transcore_db with key defined in code
	var/db_key
	var/datum/transcore_db/our_db // These persist all round and are never destroyed, just keep a hard ref

/obj/item/implant/backup/get_data() // CHOMPEdit - Removal of obj/item/weapon
	var/dat = {"
<b>Implant Specifications:</b><BR>
<b>Name:</b> [using_map.company_name] Employee Backup Implant<BR>
<b>Life:</b> ~8 hours.<BR>
<b>Important Notes:</b> Due to the sensitive nature of the implant, it is programmed to dissolve into harmless bio-material after 24 hours, to prevent unforseen issues with poorly maintained implants<BR>
<HR>
<b>Implant Details:</b><BR>
<b>Function:</b> Contains a small swarm of nanobots that perform neuron scanning to create mind-backups.<BR>
<b>Special Features:</b> Will allow restoring of backups during the 8-hour period it is active.<BR>
<b>Integrity:</b> Generally very survivable. Susceptible to being destroyed by acid."}
	return dat

/obj/item/implant/backup/New(newloc, db_key) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	src.db_key = db_key

/obj/item/implant/backup/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	our_db = SStranscore.db_by_key(db_key)

/obj/item/implant/backup/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	our_db.implants -= src
	return ..()

/obj/item/implant/backup/post_implant(var/mob/living/carbon/human/H) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(H))
		BITSET(H.hud_updateflag, BACKUP_HUD)
		our_db.implants |= src

		return 1

//New, modern implanter instead of old style implanter.
/obj/item/backup_implanter // CHOMPEdit - Removal of obj/item/weapon
	name = "backup implanter"
	desc = "After discovering that Nanotrasen was just re-using the same implanters over and over again on organics, leading to cross-contamination, Vey-Medical designed this self-cleaning model. Holds four backup implants at a time."
	catalogue_data = list(/datum/category_item/catalogue/information/organization/vey_med,
						/datum/category_item/catalogue/technology/resleeving)
	icon = 'icons/obj/device_alt.dmi'
	icon_state = "bimplant"
	item_state = "syringe_0"
	throw_speed = 1
	throw_range = 5
	w_class = ITEMSIZE_SMALL
	matter = list(MAT_STEEL = 2000, MAT_GLASS = 2000)
	var/list/obj/item/implant/backup/imps = list() // CHOMPEdit - Removal of obj/item/weapon
	var/max_implants = 4 //Iconstates need to exist due to the update proc!

	var/db_key // To give to the baby implants

/obj/item/backup_implanter/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	for(var/i = 1 to max_implants)
		var/obj/item/implant/backup/imp = new(src, db_key) // CHOMPEdit - Removal of obj/item/weapon
		imps |= imp
		imp.germ_level = 0
	update()

/obj/item/backup_implanter/proc/update() // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "[initial(icon_state)][imps.len]"
	germ_level = 0

/obj/item/backup_implanter/attack_self(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(!istype(user))
		return

	if(imps.len)
		to_chat(user, "<span class='notice'>You eject a backup implant.</span>")
		var/obj/item/implant/backup/imp = imps[imps.len] // CHOMPEdit - Removal of obj/item/weapon
		imp.forceMove(get_turf(user))
		imps -= imp
		user.put_in_any_hand_if_possible(imp)
		update()
	else
		to_chat(user, "<span class='warning'>\The [src] is empty.</span>")

	return

/obj/item/backup_implanter/attackby(obj/W, mob/user) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(W,/obj/item/implant/backup)) // CHOMPEdit - Removal of obj/item/weapon
		if(imps.len < max_implants)
			user.unEquip(W)
			imps |= W
			W.germ_level = 0
			W.forceMove(src)
			update()
			to_chat(user, "<span class='notice'>You load \the [W] into \the [src].</span>")
		else
			to_chat(user, "<span class='warning'>\The [src] is already full!</span>")

/obj/item/backup_implanter/attack(mob/M as mob, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if (!istype(M, /mob/living/carbon))
		return
	if (user && imps.len)
		M.visible_message("<span class='notice'>[user] is injecting a backup implant into [M].</span>")

		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		user.do_attack_animation(M)

		var/turf/T1 = get_turf(M)
		if (T1 && ((M == user) || do_after(user, 5 SECONDS, M)))
			if(user && M && (get_turf(M) == T1) && src && src.imps.len)
				M.visible_message("<span class='notice'>[M] has been backup implanted by [user].</span>")

				var/obj/item/implant/backup/imp = imps[imps.len] // CHOMPEdit - Removal of obj/item/weapon
				if(imp.handle_implant(M,user.zone_sel.selecting))
					imp.post_implant(M)
					imps -= imp
					add_attack_logs(user,M,"Implanted backup implant")

				update()

//The glass case for the implant
/obj/item/implantcase/backup // CHOMPEdit - Removal of obj/item/weapon
	name = "glass case - 'backup'"
	desc = "A case containing a backup implant."
	icon_state = "implantcase-b"

/obj/item/implantcase/backup/New() // CHOMPEdit - Removal of obj/item/weapon
	src.imp = new /obj/item/implant/backup(src) // CHOMPEdit - Removal of obj/item/weapon
	..()
	return

//The box of backup implants
/obj/item/storage/box/backup_kit // CHOMPEdit - Removal of obj/item/weapon
	name = "backup implant kit"
	desc = "Box of stuff used to implant backup implants."
	icon_state = "implant"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")

/obj/item/storage/box/backup_kit/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	for(var/i = 1 to 7)
		new /obj/item/implantcase/backup(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/implanter(src) // CHOMPEdit - Removal of obj/item/weapon

/*
/obj/item/implant/backup/full // CHOMPEdit - Removal of obj/item/weapon
	name = "khi backup implant"
	desc = "A normal KHI wireless cortical stack with neutrino and QE transmission for constant-stream consciousness upload."
*/
