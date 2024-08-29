var/list/holder_mob_icon_cache = list()

//Helper object for picking dionaea (and other creatures) up.
/obj/item/holder // CHOMPEdit - Removal of obj/item/weapon
	name = "holder"
	desc = "You shouldn't ever see this."
	icon = 'icons/obj/objects.dmi'
	randpixel = 0
	center_of_mass_x = 0 //CHOMPEdit
	center_of_mass_y = 0 //CHOMPEdit
	slot_flags = SLOT_HEAD | SLOT_HOLSTER
	show_messages = 1

	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/inventory/head/mob_teshari.dmi',
		SPECIES_VOX = 'icons/inventory/head/mob_vox.dmi'
		)

	origin_tech = null
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_holder.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_holder.dmi',
		)
	pixel_y = 8
	var/mob/living/held_mob
	var/matrix/original_transform
	var/original_vis_flags = NONE

/obj/item/holder/Initialize(mapload, mob/held) // CHOMPEdit - Removal of obj/item/weapon
	ASSERT(ismob(held))
	. = ..()
	held.forceMove(src)
	held.reset_view(src)
	START_PROCESSING(SSobj, src)

//CHOMPEdit Start - Add status so that you can see where you are...
/mob/living/get_status_tab_items()
	. = ..()
	if(. && istype(loc, /obj/item/holder)) // CHOMPEdit - Removal of obj/item/weapon
		var/location = ""
		var/obj/item/holder/H = loc // CHOMPEdit - Removal of obj/item/weapon
		if(ishuman(H.loc))
			var/mob/living/carbon/human/HH = H.loc
			if(HH.l_hand == H)
				location = "[HH]'s left hand"
			else if(HH.r_hand == H)
				location = "[HH]'s right hand"
			else if(HH.r_store == H || HH.l_store == H)
				location = "[HH]'s pocket"
			else if(HH.head == H)
				location = "[HH]'s head"
			else if(HH.shoes == H)
				location = "[HH]'s feet"
			else
				location = "[HH]"
		else if(ismob(H.loc))
			var/mob/living/M = H.loc
			if(M.l_hand == H)
				location = "[M]'s left hand"
			else if(M.r_hand == H)
				location = "[M]'s right hand"
			else
				location = "[M]"
		else if(ismob(H.loc.loc))
			location = "[H.loc.loc]'s [H.loc]"
		else
			location = "[H.loc]"
		if (location != "")
			. += ""
			. += "Location: [location]"
//CHOMPEdit End

/obj/item/holder/Entered(mob/held, atom/OldLoc) // CHOMPEdit - Removal of obj/item/weapon
	if(held_mob)
		held.forceMove(get_turf(src))
		held.reset_view(null)
		return
	ASSERT(ismob(held))
	. = ..()
	held_mob = held
	original_vis_flags = held.vis_flags
	held.vis_flags = VIS_INHERIT_ID|VIS_INHERIT_LAYER|VIS_INHERIT_PLANE
	vis_contents += held
	name = held.name
	original_transform = held.transform
	held.transform = null

/obj/item/holder/Exited(atom/movable/thing, atom/OldLoc) // CHOMPEdit - Removal of obj/item/weapon
	if(thing == held_mob)
		held_mob.transform = original_transform
		held_mob.update_transform() //VOREStation edit
		held_mob.vis_flags = original_vis_flags
		held_mob = null
	..()

/obj/item/holder/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	STOP_PROCESSING(SSobj, src)
	if(held_mob)
		dump_mob()
	if(ismob(loc))
		var/mob/M = loc
		M.drop_from_inventory(src, get_turf(src))
	return ..()

/obj/item/holder/process() // CHOMPEdit - Removal of obj/item/weapon
	if(held_mob?.loc != src || isturf(loc))
		qdel(src)

/obj/item/holder/proc/dump_mob() // CHOMPEdit - Removal of obj/item/weapon
	if(!held_mob)
		return
	if (held_mob.loc == src || isnull(held_mob.loc)) //VOREStation edit
		held_mob.transform = original_transform
		held_mob.update_transform() //VOREStation edit
		held_mob.vis_flags = original_vis_flags
		held_mob.forceMove(get_turf(src))
		held_mob.reset_view(null)
		held_mob = null
	invisibility = INVISIBILITY_ABSTRACT //VOREStation edit

/obj/item/holder/throw_at(atom/target, range, speed, thrower) // CHOMPEdit - Removal of obj/item/weapon
	if(held_mob)
		var/mob/localref = held_mob
		dump_mob()
		var/thrower_mob_size = 1
		if(ismob(thrower))
			var/mob/M = thrower
			thrower_mob_size = M.mob_size
		var/mob_range = round(range * min(thrower_mob_size / localref.mob_size, 1))
		localref.throw_at(target, mob_range, speed, thrower)

/obj/item/holder/GetID() // CHOMPEdit - Removal of obj/item/weapon
	return held_mob?.GetIdCard()

/obj/item/holder/GetAccess() // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/I = GetID()
	return I?.GetAccess() || ..()

/obj/item/holder/container_resist(mob/living/held) // CHOMPEdit - Removal of obj/item/weapon
	if(ismob(loc))
		var/mob/M = loc
		M.drop_from_inventory(src) // If it's another item, we can just continue existing, or if it's a turf we'll qdel() in Moved()
		to_chat(M, "<span class='warning'>\The [held] wriggles out of your grip!</span>")
		to_chat(held, "<span class='warning'>You wiggle out of [M]'s grip!</span>")
	else if(istype(loc, /obj/item/clothing/accessory/holster))
		var/obj/item/clothing/accessory/holster/holster = loc
		if(holster.holstered == src)
			holster.clear_holster()
		to_chat(held, "<span class='warning'>You extricate yourself from [holster].</span>")
		forceMove(get_turf(src))
		held.reset_view(null)
	else if(isitem(loc))
		var/obj/item/I = loc
		to_chat(held, "<span class='warning'>You struggle free of [loc].</span>")
		forceMove(get_turf(src))
		held.reset_view(null)
		if(istype(I))
			I.on_holder_escape(src)

//Mob specific holders.
/obj/item/holder/diona // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_MAGNET = 3, TECH_BIO = 5)
	slot_flags = SLOT_HEAD | SLOT_OCLOTHING | SLOT_HOLSTER
	item_state = "diona"

/obj/item/holder/drone // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 5)
	item_state = "repairbot"

/obj/item/holder/drone/swarm // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_MAGNET = 6, TECH_ENGINEERING = 7, TECH_PRECURSOR = 2, TECH_ARCANE = 1)
	item_state = "constructiondrone"

/obj/item/holder/pai // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_DATA = 2)

/obj/item/holder/pai/Initialize(mapload, mob/held) // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	item_state = held.icon_state

/obj/item/holder/mouse // CHOMPEdit - Removal of obj/item/weapon
	name = "mouse"
	desc = "It's a small rodent."
	item_state = "mouse_gray"
	slot_flags = SLOT_EARS | SLOT_HEAD | SLOT_ID
	origin_tech = list(TECH_BIO = 2)
	w_class = ITEMSIZE_TINY

/obj/item/holder/mouse/white // CHOMPEdit - Removal of obj/item/weapon
	item_state = "mouse_white"

/obj/item/holder/mouse/gray // CHOMPEdit - Removal of obj/item/weapon
	item_state = "mouse_gray"

/obj/item/holder/mouse/brown // CHOMPEdit - Removal of obj/item/weapon
	item_state = "mouse_brown"

/obj/item/holder/mouse/black // CHOMPEdit - Removal of obj/item/weapon
	item_state = "mouse_black"

/obj/item/holder/mouse/operative // CHOMPEdit - Removal of obj/item/weapon
	item_state = "mouse_operative"

/obj/item/holder/mouse/rat // CHOMPEdit - Removal of obj/item/weapon
	item_state = "mouse_rat"

/obj/item/holder/possum // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "possum"

/obj/item/holder/possum/poppy // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2, TECH_ENGINEERING = 4)
	item_state = "poppy"

/obj/item/holder/cat // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "cat"

/obj/item/holder/cat/runtime // CHOMPEdit - Removal of obj/item/weapon

/obj/item/holder/fennec // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)

/obj/item/holder/cat/runtime // CHOMPEdit - Removal of obj/item/weapon

	origin_tech = list(TECH_BIO = 2, TECH_DATA = 4)

/obj/item/holder/cat/cak // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "cak"

/obj/item/holder/cat/bluespace // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2, TECH_BLUESPACE = 6)
	item_state = "bscat"

/obj/item/holder/cat/spacecat // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2, TECH_MATERIAL = 4)
	item_state = "spacecat"

/obj/item/holder/cat/original // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2, TECH_BLUESPACE = 4)
	item_state = "original"

/obj/item/holder/cat/breadcat // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "breadcat"

/obj/item/holder/corgi // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "corgi"

/obj/item/holder/lisa // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "lisa"

/obj/item/holder/old_corgi // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "old_corgi"

/obj/item/holder/void_puppy // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2, TECH_BLUESPACE = 3)
	item_state = "void_puppy"

/obj/item/holder/narsian // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2, TECH_ILLEGAL = 3)
	item_state = "narsian"

/obj/item/holder/bullterrier // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "bullterrier"

/obj/item/holder/fox // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "fox"

/obj/item/holder/pug // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "pug"

/obj/item/holder/sloth // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 2)
	item_state = "sloth"

/obj/item/holder/borer // CHOMPEdit - Removal of obj/item/weapon
	origin_tech = list(TECH_BIO = 6)
	item_state = "brainslug"

/obj/item/holder/leech // CHOMPEdit - Removal of obj/item/weapon
	color = "#003366"
	origin_tech = list(TECH_BIO = 5, TECH_PHORON = 2)

/obj/item/holder/cat/fluff/tabiranth // CHOMPEdit - Removal of obj/item/weapon
	name = "Spirit"
	desc = "A small, inquisitive feline, who constantly seems to investigate his surroundings."
	gender = MALE
	icon_state = "kitten"
	w_class = ITEMSIZE_SMALL

/obj/item/holder/cat/kitten // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "kitten"
	w_class = ITEMSIZE_SMALL

/obj/item/holder/cat/fluff/bones // CHOMPEdit - Removal of obj/item/weapon
	name = "Bones"
	desc = "It's Bones! Meow."
	gender = MALE
	icon_state = "cat3"

/obj/item/holder/bird // CHOMPEdit - Removal of obj/item/weapon
	name = "bird"
	desc = "It's a bird!"
	icon_state = null
	item_icons = null
	w_class = ITEMSIZE_SMALL

/obj/item/holder/bird/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	held_mob?.lay_down()

/obj/item/holder/fish // CHOMPEdit - Removal of obj/item/weapon
	attack_verb = list("fished", "disrespected", "smacked", "smackereled")
	hitsound = 'sound/effects/slime_squish.ogg'
	slot_flags = SLOT_HOLSTER
	origin_tech = list(TECH_BIO = 3)

/obj/item/holder/fish/afterattack(var/atom/target, var/mob/living/user, proximity) // CHOMPEdit - Removal of obj/item/weapon
	if(!target)
		return
	if(!proximity)
		return
	if(isliving(target))
		var/mob/living/L = target
		if(prob(10))
			L.Stun(2)

/obj/item/holder/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	//CHOMPADDITION: MicroHandCrush
	if(W == src && user.a_intent == I_HURT)
		for(var/mob/living/M in src.contents)
			if(user.size_multiplier > M.size_multiplier)
				var/dam = (user.size_multiplier - M.size_multiplier)*(rand(2,5))
				to_chat(user, "<span class='danger'>You roughly squeeze [M]!</span>")
				to_chat(M, "<span class='danger'>You are roughly squeezed by [user]!</span>")
				log_and_message_admins("[key_name(M)] has been harmsqueezed by [key_name(user)]")
				M.apply_damage(dam)
	//CHOMPADDITION: MicroHandCrush END
	for(var/mob/M in src.contents)
		M.attackby(W,user)

//Mob procs and vars for scooping up
/mob/living/var/holder_type

/mob/living/MouseDrop(var/atom/over_object)
	var/mob/living/carbon/human/H = over_object
	if(holder_type && issmall(src) && istype(H) && !H.lying && Adjacent(H) && (src.a_intent == I_HELP && H.a_intent == I_HELP)) //VOREStation Edit
		if(!issmall(H) || !istype(src, /mob/living/carbon/human))
			get_scooped(H, (usr == src))
		return
	return ..()

/mob/living/proc/get_scooped(var/mob/living/carbon/grabber, var/self_grab)

	if(!holder_type || buckled || pinned.len)
		return

	if(self_grab)
		if(src.incapacitated()) return
	else
		if(grabber.incapacitated()) return

	//YW edit - size diff check
	var/sizediff = grabber.size_multiplier - size_multiplier
	if(sizediff < -0.5)
		if(self_grab)
			to_chat(src, "<span class='warning'>You are too big to fit in \the [grabber]\'s hands!</span>")
		else
			to_chat(grabber, "<span class='warning'>\The [src] is too big to fit in your hands!</span>")
		return
	//end YW edit

	var/obj/item/holder/H = new holder_type(get_turf(src), src) // CHOMPEdit - Removal of obj/item/weapon
	H.sync(src)	//CHOMPEdit - See modular_chomp/code/modules/mob/holder.dm for what this does
	grabber.put_in_hands(H)

	if(self_grab)
		to_chat(grabber, "<span class='notice'>\The [src] clambers onto you!</span>")
		to_chat(src, "<span class='notice'>You climb up onto \the [grabber]!</span>")
		grabber.equip_to_slot_if_possible(H, slot_back, 0, 1)
	else
		to_chat(grabber, "<span class='notice'>You scoop up \the [src]!</span>")
		to_chat(src, "<span class='notice'>\The [grabber] scoops you up!</span>")

	add_attack_logs(grabber, H.held_mob, "Scooped up", FALSE) // Not important enough to notify admins, but still helpful.
	return H

/obj/item/holder/human // CHOMPEdit - Removal of obj/item/weapon
	icon = 'icons/mob/holder_complex.dmi'
	var/list/generate_for_slots = list(slot_l_hand_str, slot_r_hand_str, slot_back_str)
	slot_flags = SLOT_BACK
