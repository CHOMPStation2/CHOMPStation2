//////////////////////////
//		Vox Bodies
//////////////////////////

/obj/effect/landmark/mobcorpse/vox
	name = "vox"
	corpseid = 0

/obj/effect/landmark/mobcorpse/vox/New()
	createvoxCorpse()

/obj/effect/landmark/mobcorpse/vox/proc/createvoxCorpse() //Creates a mob and checks for gear in each slot before attempting to equip it.
	var/mob/living/carbon/human/vox/M = new /mob/living/carbon/human/vox (src.loc)
	M.real_name = src.name
	M.stat = 2 //Kills the new mob
	if(src.corpseuniform)
		M.equip_to_slot_or_del(new src.corpseuniform(M), slot_w_uniform)
		if(M.w_uniform)
			M.w_uniform?:sensor_mode = corpsesensormode
	if(src.corpsesuit)
		M.equip_to_slot_or_del(new src.corpsesuit(M), slot_wear_suit)
	if(src.corpseshoes)
		M.equip_to_slot_or_del(new src.corpseshoes(M), slot_shoes)
	if(src.corpsegloves)
		M.equip_to_slot_or_del(new src.corpsegloves(M), slot_gloves)
	if(src.corpseradio)
		M.equip_to_slot_or_del(new src.corpseradio(M), slot_l_ear)
	if(src.corpseglasses)
		M.equip_to_slot_or_del(new src.corpseglasses(M), slot_glasses)
	if(src.corpsemask)
		M.equip_to_slot_or_del(new src.corpsemask(M), slot_wear_mask)
	if(src.corpsehelmet)
		M.equip_to_slot_or_del(new src.corpsehelmet(M), slot_head)
	if(src.corpsebelt)
		M.equip_to_slot_or_del(new src.corpsebelt(M), slot_belt)
	if(src.corpsepocket1)
		M.equip_to_slot_or_del(new src.corpsepocket1(M), slot_r_store)
	if(src.corpsepocket2)
		M.equip_to_slot_or_del(new src.corpsepocket2(M), slot_l_store)
	if(src.corpseback)
		M.equip_to_slot_or_del(new src.corpseback(M), slot_back)
	if(src.corpseid == 1)
		var/obj/item/weapon/card/id/W = new(M)
		W.name = "[M.real_name]'s ID Card"
		var/datum/job/jobdatum
		for(var/jobtype in typesof(/datum/job))
			var/datum/job/J = new jobtype
			if(J.title == corpseidaccess)
				jobdatum = J
				break
		if(src.corpseidicon)
			W.icon_state = corpseidicon
		if(src.corpseidaccess)
			if(jobdatum)
				W.access = jobdatum.get_access()
			else
				W.access = list()
		if(corpseidjob)
			W.assignment = corpseidjob
		W.registered_name = M.real_name
		M.equip_to_slot_or_del(W, slot_wear_id)
	delete_me = 1
	qdel(src)


//Types of Vox corpses:

/obj/effect/landmark/mobcorpse/vox/pirate
	name = "vox pirate"
	corpseuniform = /obj/item/clothing/under/color/black
	corpsesuit = /obj/item/clothing/suit/armor/vox_scrap
	corpseshoes = /obj/item/clothing/shoes/boots/workboots
	corpsegloves = /obj/item/clothing/gloves/light_brown
	corpsemask = /obj/item/clothing/mask/breath
	corpseid = 0

/obj/effect/landmark/mobcorpse/vox/boarder_m
	name = "vox melee boarder"
	corpseuniform = /obj/item/clothing/under/vox/vox_casual
	corpsesuit = /obj/item/clothing/suit/armor/vox_scrap
	corpseshoes = /obj/item/clothing/shoes/boots/workboots
	corpsegloves = /obj/item/clothing/gloves/light_brown
	corpsemask = /obj/item/clothing/mask/breath
	corpseid = 0

/obj/effect/landmark/mobcorpse/vox/boarder_r
	name = "vox ranged boarder"
	corpseuniform = /obj/item/clothing/under/rank/bartender
	corpsesuit = /obj/item/clothing/suit/armor/bulletproof
	corpseshoes = /obj/item/clothing/shoes/boots/workboots
	corpsemask = /obj/item/clothing/mask/breath
	corpseid = 0

/obj/effect/landmark/mobcorpse/vox/boarder_t
	name = "vox salvage technician"
	corpseuniform = /obj/item/clothing/under/rank/bartender
	corpsesuit = /obj/item/clothing/suit/armor/bulletproof
	corpseshoes = /obj/item/clothing/shoes/boots/workboots
	corpsemask = /obj/item/clothing/mask/breath
	corpseid = 0

/obj/effect/landmark/mobcorpse/vox/suppressor
	name = "vox suppressor"
	corpseuniform = /obj/item/clothing/under/color/red
	corpsesuit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	corpseshoes = /obj/item/clothing/shoes/orange
	corpsegloves = /obj/item/clothing/gloves/red
	corpsemask = /obj/item/clothing/mask/gas/half
	corpseid = 0

/obj/effect/landmark/mobcorpse/vox/captain
	name = "vox captain"
	corpseuniform = /obj/item/clothing/under/color/black
	corpsesuit = /obj/item/clothing/suit/space/vox/carapace
	corpseshoes = /obj/item/clothing/shoes/magboots/vox
	corpsegloves = /obj/item/clothing/gloves/light_brown
	corpsemask = /obj/item/clothing/mask/breath
	corpsehelmet = /obj/item/clothing/head/helmet/riot
	corpseid = 0