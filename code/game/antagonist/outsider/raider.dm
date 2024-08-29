var/datum/antagonist/raider/raiders

/datum/antagonist/raider
	id = MODE_RAIDER
	role_type = BE_RAIDER
	role_text = "Raider"
	role_text_plural = "Raiders"
	bantype = "raider"
	antag_indicator = "mutineer"
	landmark_id = "voxstart"
	welcome_text = "Use :H to talk on your encrypted channel."
	flags = ANTAG_OVERRIDE_JOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_VOTABLE | ANTAG_SET_APPEARANCE | ANTAG_HAS_LEADER
	antaghud_indicator = "hudmutineer"

	hard_cap = 4
	hard_cap_round = 8
	initial_spawn_req = 3
	initial_spawn_target = 3

	id_type = /obj/item/card/id/syndicate // CHOMPEdit - Removal of obj/item/weapon

	// Heist overrides check_victory() and doesn't need victory or loss strings/tags.
	var/list/raider_uniforms = list(
		/obj/item/clothing/under/soviet,
		/obj/item/clothing/under/pirate,
		/obj/item/clothing/under/redcoat,
		/obj/item/clothing/under/serviceoveralls,
		/obj/item/clothing/under/captain_fly,
		/obj/item/clothing/under/det,
		/obj/item/clothing/under/color/brown,
		)

	var/list/raider_shoes = list(
		/obj/item/clothing/shoes/boots/jackboots,
		/obj/item/clothing/shoes/boots/workboots,
		/obj/item/clothing/shoes/brown,
		/obj/item/clothing/shoes/laceup
		)

	var/list/raider_glasses = list(
		/obj/item/clothing/glasses/thermal,
		/obj/item/clothing/glasses/thermal/plain/eyepatch,
		/obj/item/clothing/glasses/thermal/plain/monocle
		)

	var/list/raider_helmets = list(
		/obj/item/clothing/head/bearpelt,
		/obj/item/clothing/head/ushanka,
		/obj/item/clothing/head/pirate,
		/obj/item/clothing/head/bandana,
		/obj/item/clothing/head/hgpiratecap,
		)

	var/list/raider_suits = list(
		/obj/item/clothing/suit/pirate,
		/obj/item/clothing/suit/hgpirate,
		/obj/item/clothing/suit/storage/toggle/bomber,
		/obj/item/clothing/suit/storage/toggle/leather_jacket,
		/obj/item/clothing/suit/storage/toggle/brown_jacket,
		/obj/item/clothing/suit/storage/toggle/hoodie,
		/obj/item/clothing/suit/storage/toggle/hoodie/black,
		/obj/item/clothing/suit/unathi/mantle,
		/obj/item/clothing/accessory/poncho,
		)

	var/list/raider_guns = list(
		/obj/item/gun/energy/laser, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/retro, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/xray, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/mindflayer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/toxgun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/stunrevolver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/stunrevolver/vintage, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/ionrifle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/taser, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/crossbow/largecrossbow, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/launcher/crossbow, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/launcher/grenade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/launcher/pneumatic, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/automatic/mini_uzi, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/automatic/c20r, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/automatic/wt550, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/automatic/sts35, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/automatic/bullpup, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/automatic/tommygun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/silenced, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/shotgun/pump, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/shotgun/pump/combat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/shotgun/pump/rifle, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/shotgun/doublebarrel, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/shotgun/doublebarrel/pellet, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/shotgun/doublebarrel/sawn, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/colt/detective, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/pistol, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/p92x, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/revolver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/pirate, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/projectile/revolver/judge, // CHOMPEdit - Removal of obj/item/weapon
		list(/obj/item/gun/projectile/luger,/obj/item/gun/projectile/luger/brown), // CHOMPEdit - Removal of obj/item/weapon
		list(/obj/item/gun/projectile/deagle, /obj/item/gun/projectile/deagle/gold, /obj/item/gun/projectile/deagle/camo) // CHOMPEdit - Removal of obj/item/weapon
		)

	var/list/raider_holster = list(
		/obj/item/clothing/accessory/holster/armpit,
		/obj/item/clothing/accessory/holster/waist,
		/obj/item/clothing/accessory/holster/hip
		)

/datum/antagonist/raider/New()
	..()
	raiders = src

/datum/antagonist/raider/update_access(var/mob/living/player)
	for(var/obj/item/storage/wallet/W in player.contents) // CHOMPEdit - Removal of obj/item/weapon
		for(var/obj/item/card/id/id in W.contents) // CHOMPEdit - Removal of obj/item/weapon
			id.name = "[player.real_name]'s Passport"
			id.registered_name = player.real_name
			W.name = "[initial(W.name)] ([id.name])"

/datum/antagonist/raider/create_global_objectives()

	if(!..())
		return 0

	var/i = 1
	var/max_objectives = pick(2,2,2,2,3,3,3,4)
	global_objectives = list()
	while(i<= max_objectives)
		var/list/goals = list("kidnap","loot","salvage")
		var/goal = pick(goals)
		var/datum/objective/heist/O

		if(goal == "kidnap")
			goals -= "kidnap"
			O = new /datum/objective/heist/kidnap()
		else if(goal == "loot")
			O = new /datum/objective/heist/loot()
		else
			O = new /datum/objective/heist/salvage()
		O.choose_target()
		global_objectives |= O

		i++

	global_objectives |= new /datum/objective/heist/preserve_crew
	return 1

/datum/antagonist/raider/check_victory()
	// Totally overrides the base proc.
	var/win_type = "Major"
	var/win_group = "Crew"
	var/win_msg = ""

	//No objectives, go straight to the feedback.
	if(CONFIG_GET(flag/objectives_disabled) || !global_objectives.len) // CHOMPEdit
		return

	var/success = global_objectives.len
	//Decrease success for failed objectives.
	for(var/datum/objective/O in global_objectives)
		if(!(O.check_completion())) success--
	//Set result by objectives.
	if(success == global_objectives.len)
		win_type = "Major"
		win_group = "Raider"
	else if(success > 2)
		win_type = "Minor"
		win_group = "Raider"
	else
		win_type = "Minor"
		win_group = "Crew"
	//Now we modify that result by the state of the crew.
	if(antags_are_dead())
		win_type = "Major"
		win_group = "Crew"
		win_msg += "<B>The Raiders have been wiped out!</B>"
	else if(is_raider_crew_safe())
		if(win_group == "Crew" && win_type == "Minor")
			win_type = "Major"
		win_group = "Crew"
		win_msg += "<B>The Raiders have left someone behind!</B>"
	else
		if(win_group == "Raider")
			if(win_type == "Minor")
				win_type = "Major"
			win_msg += "<B>The Raiders escaped the station!</B>"
		else
			win_msg += "<B>The Raiders were repelled!</B>"

	to_world("<span class='danger'><font size = 3>[win_type] [win_group] victory!</font></span>")
	to_world("[win_msg]")
	feedback_set_details("round_end_result","heist - [win_type] [win_group]")

/datum/antagonist/raider/proc/is_raider_crew_safe()

	if(!current_antagonists || current_antagonists.len == 0)
		return 0

	for(var/datum/mind/player in current_antagonists)
		if(!player.current || get_area(player.current) != locate(/area/shuttle/skipjack)) // CHOMPEdit: Changed locate to work with new condensed shuttles
			return 0
	return 1

/datum/antagonist/raider/equip(var/mob/living/carbon/human/player)

	if(!..())
		return 0

	if(player.species && player.species.get_bodytype() == SPECIES_VOX)
		equip_vox(player)
	else
		var/new_shoes =   pick(raider_shoes)
		var/new_uniform = pick(raider_uniforms)
		var/new_glasses = pick(raider_glasses)
		var/new_helmet =  pick(raider_helmets)
		var/new_suit =    pick(raider_suits)

		player.equip_to_slot_or_del(new new_shoes(player),slot_shoes)
		if(!player.shoes)
			//If equipping shoes failed, fall back to equipping sandals
			var/fallback_type = pick(/obj/item/clothing/shoes/sandal, /obj/item/clothing/shoes/boots/jackboots/toeless)
			player.equip_to_slot_or_del(new fallback_type(player), slot_shoes)

		player.equip_to_slot_or_del(new new_uniform(player),slot_w_uniform)
		player.equip_to_slot_or_del(new new_glasses(player),slot_glasses)
		player.equip_to_slot_or_del(new new_helmet(player),slot_head)
		player.equip_to_slot_or_del(new new_suit(player),slot_wear_suit)
		equip_weapons(player)

	var/obj/item/card/id/id = create_id("Visitor", player, equip = 0) // CHOMPEdit - Removal of obj/item/weapon
	id.name = "[player.real_name]'s Passport"
	id.assignment = "Visitor"
	var/obj/item/storage/wallet/W = new(player) // CHOMPEdit - Removal of obj/item/weapon
	W.handle_item_insertion(id)
	player.equip_to_slot_or_del(W, slot_wear_id)
	spawn_money(rand(50,150)*10,W)
	create_radio(RAID_FREQ, player)

	return 1

/datum/antagonist/raider/proc/equip_weapons(var/mob/living/carbon/human/player)
	var/new_gun = pick(raider_guns)
	var/new_holster = pick(raider_holster) //raiders don't start with any backpacks, so let's be nice and give them a holster if they can use it.
	var/turf/T = get_turf(player)

	var/obj/item/primary = new new_gun(T)
	var/obj/item/clothing/accessory/holster/holster = null

	//Give some of the raiders a pirate gun as a secondary
	if(prob(60))
		var/obj/item/secondary = new /obj/item/gun/projectile/pirate(T) // CHOMPEdit - Removal of obj/item/weapon
		if(!(primary.slot_flags & SLOT_HOLSTER))
			holster = new new_holster(T)
			holster.holstered = secondary
			secondary.loc = holster
		else
			player.equip_to_slot_or_del(secondary, slot_belt)

	if(primary.slot_flags & SLOT_HOLSTER)
		holster = new new_holster(T)
		holster.holstered = primary
		primary.loc = holster
	else if(!player.belt && (primary.slot_flags & SLOT_BELT))
		player.equip_to_slot_or_del(primary, slot_belt)
	else if(!player.back && (primary.slot_flags & SLOT_BACK))
		player.equip_to_slot_or_del(primary, slot_back)
	else
		player.put_in_any_hand_if_possible(primary)

	//If they got a projectile gun, give them a little bit of spare ammo
	equip_ammo(player, primary)

	if(holster)
		var/obj/item/clothing/under/uniform = player.w_uniform
		if(istype(uniform) && uniform.can_attach_accessory(holster))
			uniform.attackby(holster, player)
		else
			player.put_in_any_hand_if_possible(holster)

/datum/antagonist/raider/proc/equip_ammo(var/mob/living/carbon/human/player, var/obj/item/gun/gun) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(gun, /obj/item/gun/projectile)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/gun/projectile/bullet_thrower = gun // CHOMPEdit - Removal of obj/item/weapon
		if(bullet_thrower.magazine_type)
			player.equip_to_slot_or_del(new bullet_thrower.magazine_type(player), slot_l_store)
			if(prob(20)) //don't want to give them too much
				player.equip_to_slot_or_del(new bullet_thrower.magazine_type(player), slot_r_store)
		else if(bullet_thrower.ammo_type)
			var/obj/item/storage/box/ammobox = new(get_turf(player.loc)) // CHOMPEdit - Removal of obj/item/weapon
			for(var/i in 1 to rand(3,5) + rand(0,2))
				new bullet_thrower.ammo_type(ammobox)
			player.put_in_any_hand_if_possible(ammobox)
		return
	if(istype(gun, /obj/item/gun/launcher/grenade)) // CHOMPEdit - Removal of obj/item/weapon
		var/list/grenades = list(
			/obj/item/grenade/empgrenade, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/grenade/smokebomb, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/grenade/flashbang // CHOMPEdit - Removal of obj/item/weapon
			)
		var/obj/item/storage/box/ammobox = new(get_turf(player.loc)) // CHOMPEdit - Removal of obj/item/weapon
		for(var/i in 1 to 7)
			var/grenade_type = pick(grenades)
			new grenade_type(ammobox)
		player.put_in_any_hand_if_possible(ammobox)

/datum/antagonist/raider/proc/equip_vox(var/mob/living/carbon/human/player)

	var/uniform_type = pick(list(/obj/item/clothing/under/vox/vox_robes,/obj/item/clothing/under/vox/vox_casual))

	player.equip_to_slot_or_del(new uniform_type(player), slot_w_uniform)
	player.equip_to_slot_or_del(new /obj/item/clothing/shoes/magboots/vox(player), slot_shoes) // REPLACE THESE WITH CODED VOX ALTERNATIVES.
	player.equip_to_slot_or_del(new /obj/item/clothing/gloves/vox(player), slot_gloves) // AS ABOVE.
	player.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat/vox(player), slot_wear_mask)
	player.equip_to_slot_or_del(new /obj/item/tank/vox(player), slot_back) // CHOMPEdit - Removal of obj/item/weapon
	player.equip_to_slot_or_del(new /obj/item/flashlight(player), slot_r_store) // CHOMPEdit - Removal of obj/item/device

	player.internal = locate(/obj/item/tank) in player.contents // CHOMPEdit - Removal of obj/item/weapon
	if(istype(player.internal,/obj/item/tank) && player.internals) // CHOMPEdit - Removal of obj/item/weapon
		player.internals.icon_state = "internal1"

	return 1
