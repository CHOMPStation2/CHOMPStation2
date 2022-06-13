/*
 proteans
*/
/obj/item/weapon/rig/protean
	name = "nanosuit control cluster"
	suit_type = "nanomachine"
	icon = 'icons/obj/rig_modules_ch.dmi'
	default_mob_icon = null	//Actually having a forced sprite for Proteans is ugly af. I'm not gonna make this a toggle
	icon_state = "nanomachine_rig"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 100, rad = 100)
	siemens_coefficient= 1
	slowdown = 0
	offline_slowdown = 0
	seal_delay = 1
	var/mob/living/myprotean
	//initial_modules = list(/obj/item/rig_module/power_sink)	//Commented out unless I end up needing roundstart modules

	helm_type = /obj/item/clothing/head/helmet/space/rig/protean //These are important for sprite pointers
	boot_type = /obj/item/clothing/shoes/magboots/rig/protean
	chest_type = /obj/item/clothing/suit/space/rig/protean
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/protean
	canremove = 0
	protean = 1
	offline_vision_restriction = 0
	open = 1
	cell_type =  /obj/item/weapon/cell/protean

/obj/item/weapon/rig/protean/relaymove(mob/user, var/direction)
	if(user.stat || user.stunned)
		return
	forced_move(direction, user, FALSE)

/obj/item/weapon/rig/protean/check_suit_access(mob/living/user)
	if(user == myprotean)
		return TRUE
	return ..()

/obj/item/weapon/rig/protean/digest_act(atom/movable/item_storage = null)
	return FALSE

/obj/item/weapon/rig/protean/New(var/newloc, var/mob/living/carbon/human/P)
	if(P)
		var/datum/species/protean/S = P.species
		S.OurRig = src
		if(P.back)
			addtimer(CALLBACK(src, .proc/AssimilateBag, P, 1, P.back), 3)

		else
			to_chat(P, "<span class='notice'>You should have spawned with a backpack to assimilate into your RIG. Try clicking it with a backpack.</span>")
	..(newloc)

/obj/item/weapon/rig/proc/AssimilateBag(var/mob/living/carbon/human/P, var/spawned, var/obj/item/weapon/storage/backpack/B)
	if(istype(B,/obj/item/weapon/storage/backpack))
		if(spawned)
			B = P.back
			P.unEquip(P.back)
		B.forceMove(src)
		rig_storage = B
		rig_storage.max_w_class = ITEMSIZE_LARGE
		rig_storage.max_storage_space = INVENTORY_STANDARD_SPACE
		P.drop_item(B)
		to_chat(P, "<span class='notice'>Your [B] has been integrated into your rigsuit.</span>")
		P.equip_to_slot_if_possible(src, slot_back)
		src.Moved()
	else
		to_chat(P,"<span class ='warning'>Your rigsuit can only assimilate a backpack into itself. If you are seeing this message, and you do not have a rigsuit, tell a coder.</span>")

/obj/item/weapon/rig/protean/attack_hand(mob/user as mob)
	if (src.loc == user)
		src.rig_storage.open(user)
	else
		..()
		for(var/mob/M in range(1))
			if (M.s_active == src)
				src.rig_storage.close(M)
	src.add_fingerprint(user)
	return

/obj/item/clothing/head/helmet/space/rig/protean
	name = "mass"
	desc = "A helmet-shaped clump of nanomachines."
	siemens_coefficient= 0
	light_overlay = "should not use a light overlay"
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN) //CHOMPEDIT: adding more races to the proto rig

/obj/item/clothing/gloves/gauntlets/rig/protean
	name = "mass"
	desc = "Glove-shaped clusters of nanomachines."
	siemens_coefficient= 0
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN) //CHOMPEDIT: adding more races to the proto rig

/obj/item/clothing/shoes/magboots/rig/protean
	name = "mass"
	desc = "Boot-shaped clusters of nanomachines."
	siemens_coefficient= 0
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN) //CHOMPEDIT: adding more races to the proto rig

/obj/item/clothing/suit/space/rig/protean
	name = "mass"
	desc = "A body-hugging mass of nanomachines."
	siemens_coefficient= 0
	can_breach = 0
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_PROMETHEAN, SPECIES_XENOHYBRID, SPECIES_VOX, SPECIES_TESHARI, SPECIES_VASILISSAN)
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/device/flashlight,
		/obj/item/weapon/tank,
		/obj/item/device/suit_cooling_unit,
		/obj/item/weapon/melee/baton,
		/obj/item/weapon/storage/backpack,
		)	//Subspace radio is in for the citadel version. IDK if we have that and I don't think we need it so I removed it from this list.




//Backend stuff to make the sprites work. Copied and pasted from rig_pieces_vr.dm, but added ch to everything. Only reason for this to be touched is to add or remove species. This might just need to go in a new file named rig_pieces_ch.dm.
/obj/item/clothing/head/helmet/space/rig/protean
	sprite_sheets = list(
		SPECIES_HUMAN			= 'modular_chomp/icons/mob/head_ch.dmi',
		SPECIES_TAJ 			= 'modular_chomp/icons/mob/species/tajaran/helmet_ch.dmi',
		SPECIES_SKRELL 			= 'modular_chomp/icons/mob/species/skrell/helmet_ch.dmi',
		SPECIES_UNATHI 			= 'modular_chomp/icons/mob/species/unathi/helmet_ch.dmi',
		SPECIES_XENOHYBRID		= 'modular_chomp/icons/mob/species/unathi/helmet_ch.dmi',
		SPECIES_AKULA 			= 'modular_chomp/icons/mob/species/akula/helmet_ch.dmi',
		SPECIES_SERGAL			= 'modular_chomp/icons/mob/species/sergal/helmet_ch.dmi',
		SPECIES_NEVREAN			= 'modular_chomp/icons/mob/species/sergal/helmet_ch.dmi',
		SPECIES_VULPKANIN 		= 'modular_chomp/icons/mob/species/vulpkanin/helmet_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'modular_chomp/icons/mob/species/fox/helmet_ch.dmi',
		SPECIES_FENNEC 			= 'modular_chomp/icons/mob/species/vulpkanin/helmet_ch.dmi',
		SPECIES_PROMETHEAN		= 'modular_chomp/icons/mob/species/skrell/helmet_ch.dmi',
		SPECIES_TESHARI 		= 'icons/inventory/head/mob_ch_teshari.dmi',
		SPECIES_VASILISSAN		= 'modular_chomp/icons/mob/species/skrell/helmet_ch.dmi',
		SPECIES_VOX				= 'modular_chomp/icons/mob/species/vox/head_ch.dmi'
		)

	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_TAJ 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/hats_ch.dmi',
		SPECIES_VOX				= 'icons/obj/clothing/hats_ch.dmi'
		)

/obj/item/clothing/suit/space/rig/protean
	sprite_sheets = list(
		SPECIES_HUMAN			= 'modular_chomp/icons/mob/spacesuit_ch.dmi',
		SPECIES_TAJ 			= 'modular_chomp/icons/mob/species/tajaran/suit_ch.dmi',
		SPECIES_SKRELL 			= 'modular_chomp/icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_UNATHI 			= 'modular_chomp/icons/mob/species/unathi/suit_ch.dmi',
		SPECIES_XENOHYBRID		= 'modular_chomp/icons/mob/species/unathi/suit_ch.dmi',
		SPECIES_AKULA 			= 'modular_chomp/icons/mob/species/akula/suit_ch.dmi',
		SPECIES_SERGAL			= 'modular_chomp/icons/mob/species/sergal/suit_ch.dmi',
		SPECIES_NEVREAN			= 'modular_chomp/icons/mob/species/sergal/suit_ch.dmi',
		SPECIES_VULPKANIN		= 'modular_chomp/icons/mob/species/vulpkanin/suit_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'modular_chomp/icons/mob/species/fox/suit_ch.dmi',
		SPECIES_FENNEC			= 'modular_chomp/icons/mob/species/vulpkanin/suit_ch.dmi',
		SPECIES_PROMETHEAN		= 'modular_chomp/icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_TESHARI 		= 'icons/inventory/suit/mob_ch_teshari.dmi',
		SPECIES_VASILISSAN		= 'modular_chomp/icons/mob/species/skrell/suit_ch.dmi',
		SPECIES_VOX				= 'modular_chomp/icons/mob/species/vox/suit_ch.dmi'
		)

	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_TAJ 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/spacesuits_ch.dmi',
		SPECIES_VOX				= 'icons/obj/clothing/spacesuits_ch.dmi'
		)

/obj/item/clothing/gloves/gauntlets/rig/protean
	sprite_sheets = list(
		SPECIES_HUMAN			= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_TAJ 			= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_SKRELL 			= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_UNATHI 			= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_XENOHYBRID		= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_AKULA 			= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_SERGAL			= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_NEVREAN			= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_VULPKANIN		= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_FENNEC			= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_PROMETHEAN		= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_TESHARI 		= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_VASILISSAN		= 'modular_chomp/icons/mob/hands_ch.dmi',
		SPECIES_VOX				= 'modular_chomp/icons/mob/species/vox/gloves_ch.dmi'
		)

	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_TAJ 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/gloves_ch.dmi',
		SPECIES_VOX				= 'icons/obj/clothing/gloves_ch.dmi'
		)

/obj/item/clothing/shoes/magboots/rig/protean
	sprite_sheets = list(
		SPECIES_HUMAN			= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_TAJ 			= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_SKRELL 			= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_UNATHI 			= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_XENOHYBRID		= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_AKULA 			= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_SERGAL			= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_NEVREAN			= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_VULPKANIN		= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_FENNEC			= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_PROMETHEAN		= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_TESHARI 		= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_VASILISSAN		= 'modular_chomp/icons/mob/feet_ch.dmi',
		SPECIES_VOX				= 'modular_chomp/icons/mob/species/vox/shoes_ch.dmi'
		)

	sprite_sheets_obj = list(
		SPECIES_HUMAN			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_TAJ 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_SKRELL 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_UNATHI 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_XENOHYBRID		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_AKULA 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_SERGAL			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_NEVREAN			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_VULPKANIN 		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_ZORREN_HIGH 	= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_FENNEC 			= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_PROMETHEAN		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_TESHARI 		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_VASILISSAN		= 'icons/obj/clothing/shoes_ch.dmi',
		SPECIES_VOX				= 'icons/obj/clothing/shoes_ch.dmi'
		)

//Copy pasted most of this proc from base because I don't feel like rewriting the base proc with a shit load of exceptions
/obj/item/weapon/rig/protean/attackby(obj/item/W as obj, mob/living/user as mob)
	if(!istype(user))
		return 0
	if(istype(W,/obj/item/weapon/tank)) //Todo, some kind of check for suits without integrated air supplies.
		if(air_supply)
			to_chat(user, "\The [src] already has a tank installed.")
			return

		if(!user.unEquip(W))
			return

		air_supply = W
		W.forceMove(src)
		to_chat(user, "You slot [W] into [src] and tighten the connecting valve.")
		return

		// Check if this is a hardsuit upgrade or a modification.
	else if(istype(W,/obj/item/rig_module))
		if(!installed_modules)
			installed_modules = list()
		if(installed_modules.len)
			for(var/obj/item/rig_module/installed_mod in installed_modules)
				if(!installed_mod.redundant && istype(installed_mod,W))
					to_chat(user, "The hardsuit already has a module of that class installed.")
					return 1

		var/obj/item/rig_module/mod = W
		to_chat(user, "You begin installing \the [mod] into \the [src].")
		if(!do_after(user,40))
			return
		if(!user || !W)
			return
		if(!user.unEquip(mod))
			return
		to_chat(user, "You install \the [mod] into \the [src].")
		installed_modules |= mod
		mod.forceMove(src)
		mod.installed(src)
		update_icon()
		return 1
	else if(W.is_wrench())
		if(!air_supply)
			to_chat(user, "There is no tank to remove.")
			return

		if(user.r_hand && user.l_hand)
			air_supply.forceMove(get_turf(user))
		else
			user.put_in_hands(air_supply)
		to_chat(user, "You detach and remove \the [air_supply].")
		air_supply = null
		return
	else if(W.is_screwdriver())
		var/list/possible_removals = list()
		for(var/obj/item/rig_module/module in installed_modules)
			if(module.permanent)
				continue
			possible_removals[module.name] = module

		if(!possible_removals.len)
			to_chat(user, "There are no installed modules to remove.")
			return

		var/removal_choice = tgui_input_list(usr, "Which module would you like to remove?", "Removal Choice", possible_removals)
		if(!removal_choice)
			return

		var/obj/item/rig_module/removed = possible_removals[removal_choice]
		to_chat(user, "You detach \the [removed] from \the [src].")
		removed.forceMove(get_turf(src))
		removed.removed()
		installed_modules -= removed
		update_icon()
		return
	for(var/obj/item/rig_module/module in installed_modules)
		if(module.accepts_item(W,user)) //Item is handled in this proc
			return
	if(rig_storage)
		var/obj/item/weapon/storage/backpack = rig_storage
		if(backpack.can_be_inserted(W, 1))
			backpack.handle_item_insertion(W)
	else
		if(istype(W,/obj/item/weapon/storage/backpack))
			AssimilateBag(user,0,W)
	..()


/obj/item/weapon/cell/protean
	name = "Protean power cell"
	desc = "Something terrible must have happened if you're managing to see this."
	maxcharge = 10000
	charge_amount = 100
	var/mob/living/carbon/human/charger

/obj/item/weapon/cell/protean/New()
	charge = maxcharge
	update_icon()
	addtimer(CALLBACK(src, .proc/search_for_protean), 60)

/obj/item/weapon/cell/protean/proc/search_for_protean()
	if(istype(src.loc, /obj/item/weapon/rig/protean))
		var/obj/item/weapon/rig/protean/prig = src.loc
		charger = prig.wearer
	if(charger)
		START_PROCESSING(SSobj, src)

/obj/item/weapon/cell/protean/process()
	var/C = charge
	if(charger)
		if((world.time >= last_use + charge_delay) && charger.nutrition > 100)
			give(charge_amount)
			charger.nutrition -= ((1/200)*(charge - C))	//Take nutrition relative to charge. Change the 1/200 if you want to alter the nutrition to charge ratio
	else
		return PROCESS_KILL