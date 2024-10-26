GLOBAL_LIST_EMPTY(mapped_autostrips)
GLOBAL_LIST_EMPTY(mapped_autostrips_mob)

/*
This should actually be refactored if it ever needs to be used again into just being
an event controller with more graceful solutions.
Creating lockers was not graceful, in practice, and creates clutter, for example.
Repurpose this idea into a self contained machine in the future that stores and auto-equips someones gear.

But for now, for what it's been used for, it works.

*/

//Admin tool to automatically strip a human victim of all their equipment and genetics powers, and store them in a closet.
//Equips Vox/Zaddat survival gear, and a few basic pieces of clothing
/obj/effect/step_trigger/autostrip
	name = "Autostrip trigger. Set the targetid to match the effect/autostriptarget"
	var/targetid = "Default"
	var/obj/effect/autostriptarget/target
	var/obj/effect/autostriptarget/mob/Mtarget
	var/remove_implants = 0	//Havn't bothered to implement this yet
	var/remove_mutations = 0

/obj/effect/step_trigger/autostrip/Initialize(mapload)
	. = ..()
	initMappedLink()

/obj/effect/step_trigger/autostrip/Trigger(mob/living/carbon/human/H as mob)
	if(!istype(H))
		return
	if(!target)
		if(!initMappedLink())
			return
	if(Mtarget)
		H.forceMove(Mtarget.loc)
	var/obj/locker = new /obj/structure/closet/secure_closet/mind(target.loc, mind_target = H.mind)
	for(var/obj/item/W in H)
		if(istype(W, /obj/item/implant/backup) || istype(W, /obj/item/nif))
			continue	//VOREStation Edit
		if(H.drop_from_inventory(W))
			W.forceMove(locker)

	if(remove_mutations)
		var/needs_update = H.mutations.len > 0
		for(var/entry in H.mutations)
			var/mut
			switch(entry)
				if(TK)
					mut = TELEBLOCK
				if(XRAY)
					mut = XRAYBLOCK
				if(HULK)
					mut = HULKBLOCK
				if(mRemotetalk)
					mut = REMOTETALKBLOCK
				if(COLD_RESISTANCE)
					mut = FIREBLOCK
			if(mut)
				new /obj/item/dnainjector/safe(locker, block_type = mut)
				H.dna.SetSEState(mut,0)
		H.mutations = list()
		H.disabilities = 0
		H.sdisabilities = 0
		if(needs_update)
			domutcheck(H,null,MUTCHK_FORCED)
			H.update_mutations()
	if(H.species.name == SPECIES_VOX || SPECIES_ZADDAT)	//Species that 'actually' require survival gear to live. The rest don't.
		H.species.equip_survival_gear(H)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/chameleon(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/radio/headset(H),slot_l_ear)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/permit(H), slot_l_hand)


/obj/effect/step_trigger/autostrip/proc/initMappedLink()
	. = FALSE
	target = GLOB.mapped_autostrips[targetid]
	Mtarget = GLOB.mapped_autostrips_mob[targetid]
	if(target)
		. = TRUE

/obj/effect/autostriptarget
	name = "Autostrip target. Link me via targetid to an autostrip trigger."
	icon = 'icons/mob/screen1.dmi'
	icon_state = "no_item1"
	var/targetid = "Default"
	unacidable = 1
	layer = 99
	anchored = 1
	invisibility = 99


/obj/effect/autostriptarget/Initialize(mapload)
	. = ..()
	if(targetid)
		GLOB.mapped_autostrips[targetid] = src

/obj/effect/autostriptarget/mob
	name = "Autostrip target to send mobs to."

/obj/effect/autostriptarget/mob/Initialize(mapload)
	if(targetid)
		GLOB.mapped_autostrips_mob[targetid] = src
