/mob/living/
	var/leash_dom = FALSE
	var/leash_freepet = FALSE
	var/leash_pet = FALSE
	var/mob/leash_owner = null

/obj/screen/alert/leash_dom
	name = "Leash Master"
	desc = "You've got a leash, and a cute pet on the other end."
	icon_state = "leash_master"

/obj/screen/alert/leash_freepet
	name = "Escaped Pet"
	desc = "You're on a leash, but you've no master. If anyone grabs the leash they'll gain control!"
	icon_state = "leash_freepet"

/obj/screen/alert/leash_pet
	name = "Leashed Pet"
	desc = "You're on the hook now! Be good for your master."
	icon_state = "leash_pet"

///// OBJECT /////
//The leash object itself
//The component variables are used for hooks, used later.
/obj/item/leash
	name = "leash"
	desc = "A simple tether that can easily be hooked onto a collar. Perfect for your pet."
	icon = 'modular_chomp/icons/obj/leash.dmi'
	icon_state = "leash"
	item_state = "leash"
	throw_range = 4
	slot_flags = SLOT_TIE
	force = 1
	throwforce = 1
	w_class = ITEMSIZE_SMALL
	var/mob/living/leash_pet = null //Variable to store our pet later
	var/mob/living/leash_master = null //And our master too
	var/mob/mobhook_leash_pet
	var/mob/mobhook_leash_master //Needed to watch for these entities to move
	var/mob/mobhook_leash_freepet

//This lets the pet resist their leash
/obj/item/leash/proc/owner_resist()
	SIGNAL_HANDLER
	if (leash_master == null)
		return
	to_chat(leash_master, "You reach for the hook on your collar...")
	//Determine how long it takes to remove the leash
	var/deleash = 15
	//if(owner.get_item_by_slot(SLOT_HANDCUFFED))  //Commented out because there is no clear way to make this proc BEFORE decuff on resist.
		//deleash = 100
	if(do_mob(leash_master, leash_master, deleash))//do_mob creates a progress bar and then enacts the code after. Owner, owner, because it's an act on themself
		if(!QDELETED(src))
			to_chat(leash_master, span_warning("[leash_master] has removed their leash!"))
			leash_master.leash_dom = FALSE
			leash_master.clear_alert(/obj/screen/alert/leash_pet)

/obj/item/leash/process()
	if(!leash_pet)
		return
	if(!is_wearing_collar(leash_pet)) //The pet has slipped their collar and is not the pet anymore.
		leash_pet.visible_message(
			span_warning("[leash_pet] has slipped out of their collar!"),
			span_warning("You have slipped out of your collar!")
		)
		leash_pet.clear_alert(/obj/screen/alert/leash_pet)
		leash_pet = null

	//draw_leash()

	if(!leash_pet || !leash_pet.leash_pet) //If there is no pet, there is no dom. Loop breaks.
		//QDEL_NULL(mobhook_leash_master)
		UnregisterSignal(mobhook_leash_master, COMSIG_MOVABLE_MOVED)
		//QDEL_NULL(mobhook_leash_pet)
		UnregisterSignal(mobhook_leash_pet, COMSIG_MOVABLE_MOVED)
		//QDEL_NULL(mobhook_leash_freepet)
		UnregisterSignal(mobhook_leash_freepet, COMSIG_MOVABLE_MOVED)
		leash_pet.clear_alert(/obj/screen/alert/leash_freepet)
		leash_pet.remove_a_modifier_of_type(/datum/modifier/leash)
		leash_master?.clear_alert(/obj/screen/alert/leash_dom)
		leash_pet = null
		return PROCESS_KILL

//Called when someone is clicked with the leash
/obj/item/leash/attack(mob/living/carbon/C, mob/living/user, attackchain_flags, damage_multiplier) //C is the target, user is the one with the leash
	if(C.leash_pet) //If the pet is already leashed, do not leash them. For the love of god.
		to_chat(user, span_notice("[C] has already been leashed."))
		return

	if (!is_wearing_collar(C))
		to_chat(user, span_notice("[C] needs a collar before you can attach a leash to it."))
		return

	var/leashtime = 50
	if(C.handcuffed)
		leashtime = 5
	if (C != user)
		user.visible_message(span_danger("\The [user] is attempting to put the leash on \the [C]!"), span_danger("\The [user] tries to put a leash on you"))
	else
		to_chat(user, span_danger("You try to attach a leash to your collar."))
	add_attack_logs(user,C,"Leashed (attempt)")
	if(!do_mob(user, C, leashtime)) //do_mob adds a progress bar, but then we also check to see if they have a collar
		return

	user.visible_message(span_danger("\The [user] puts a leash on \the [C]!"), span_danger("The leash clicks onto your collar!"))
	//TODO: Figure out how to make an easy breakout for leashed leash_pets
	C.leash_pet = TRUE
	C.leash_owner = user
	C.throw_alert("leashed", /obj/screen/alert/leash_pet, 1)//Has now been leashed
	user.throw_alert("leash", /obj/screen/alert/leash_dom, 1) //Is the leasher
	leash_pet = C //Save pet reference for later
	leash_master = user //Save dom reference for later
	RegisterSignal(leash_pet, COMSIG_LIVING_RESIST, PROC_REF(owner_resist), override = TRUE)
	RegisterSignal(leash_pet, COMSIG_MOVABLE_MOVED, PROC_REF(on_pet_move), override = TRUE)
	mobhook_leash_pet = leash_pet
	to_chat(leash_pet, span_userdanger("You have been leashed!"))
	RegisterSignal(leash_master, COMSIG_MOVABLE_MOVED, PROC_REF(on_master_move), override = TRUE)
	mobhook_leash_master = leash_master
	if(!leash_pet.leash_dom) //Add slowdown if the pet didn't leash themselves
		leash_pet.add_modifier(/datum/modifier/leash)
	if(leash_pet.leash_dom) //Pet leashed themself. They are not the dom
		leash_pet.leash_freepet = TRUE
		leash_pet.clear_alert(/obj/screen/alert/leash_dom)
		leash_pet.throw_alert("leash", /obj/screen/alert/leash_freepet, 1)
	START_PROCESSING(SSfastprocess, src) // The original while loop here ran every 2 deciseconds, and so does SSfastprocess.

//Called when the leash is used in hand
//Tugs the pet closer
/obj/item/leash/attack_self(mob/living/user)
	if(!leash_pet) //No pet, no tug.
		return
	//Yank the pet. Yank em in close.
	apply_tug_mob_to_mob(leash_pet, leash_master, 1)

/obj/item/leash/proc/on_master_move()
	SIGNAL_HANDLER

	//Make sure the dom still has a pet
	if(!leash_master) //There must be a master
		return
	if(!leash_pet) //There must be a pet
		return
	if(leash_pet == leash_master) //Pet is the master
		return
	if(!leash_pet.leash_pet)
		UnregisterSignal(mobhook_leash_master, COMSIG_MOVABLE_MOVED)
		mobhook_leash_master = null
		leash_master.clear_alert(/obj/screen/alert/leash_dom)
		return
	addtimer(CALLBACK(src, PROC_REF(after_master_move)), 0.2 SECONDS)

/obj/item/leash/proc/after_master_move()
	//If the master moves, pull the pet in behind
	//Also, the timer means that the distance check for master happens before the pet, to prevent both from proccing.

	if(!leash_master) //Just to stop error messages
		return
	if(!leash_pet)
		return
	apply_tug_mob_to_mob(leash_pet, leash_master, 2)

	//Knock the pet over if they get further behind. Shouldn't happen too often.
	sleep(3) //This way running normally won't just yank the pet to the ground.
	if(!leash_master || !leash_pet) //Just to stop error messages. Break the loop early if something removed the master
		return
	if(get_dist(leash_pet, leash_master) > 3)
		leash_pet.visible_message(
			span_warning("[leash_pet] is pulled to the ground by their leash!"),
			span_warning("You are pulled to the ground by your leash!")
		)
		leash_pet.apply_effect(20, STUN, 0)

	//This code is to check if the pet has gotten too far away, and then break the leash.
	sleep(3) //Wait to snap the leash
	if(!leash_master) //Just to stop error messages
		return
	if(!leash_pet)
		return
	if(get_dist(leash_pet, leash_master) > 5)
		leash_pet.visible_message(
			span_warning("The leash snaps free from [leash_pet]'s collar!"),
			span_warning("Your leash pops from your collar!")
		)
		leash_pet.apply_effect(20, STUN, 0)
		leash_pet.adjustOxyLoss(5)
		leash_pet.clear_alert(/obj/screen/alert/leash_pet)
		leash_pet.add_modifier(/datum/modifier/leash)
		leash_master.clear_alert(/obj/screen/alert/leash_dom)
		UnregisterSignal(mobhook_leash_master, COMSIG_MOVABLE_MOVED)
		UnregisterSignal(mobhook_leash_pet, COMSIG_MOVABLE_MOVED)
		mobhook_leash_master = null
		mobhook_leash_pet = null
		leash_pet = null
		leash_master = null

/obj/item/leash/proc/on_pet_move()
	SIGNAL_HANDLER
	//This should only work if there is a pet and a master.
	//This is here pretty much just to stop the console from flooding with errors
	if(!leash_master)
		return
	if(!leash_pet)
		return
	//Make sure the pet is still a pet
	if(!leash_pet.leash_pet)
		//QDEL_NULL(mobhook_leash_pet) //Probably redundant, but it's nice to be safe
		UnregisterSignal(mobhook_leash_pet, COMSIG_MOVABLE_MOVED)
		return

	//The pet has escaped. There is no DOM. GO PET RUN.
	if(leash_pet.leash_freepet)//If the pet is free, break
		return
	//If the pet gets too far away, they get tugged back
	addtimer(CALLBACK(src, PROC_REF(after_pet_move)), 0.3 SECONDS) //A short timer so the pet kind of bounces back after they make the step

/obj/item/leash/proc/after_pet_move()
	if(!leash_master)
		return
	if(!leash_pet)
		return
	for(var/i in 3 to get_dist(leash_pet, leash_master)) // Move the pet to a minimum of 2 tiles away from the master, so the pet trails behind them.
		step_towards(leash_pet, leash_master)

/obj/item/leash/proc/on_freepet_move()
	SIGNAL_HANDLER
	//Pet is on the run. Let's drag the leash behind them.
	if(leash_master) //If there is a master, don't do this
		return
	if(!leash_pet) //If there is no pet, don't do this
		return
	if(leash_pet.item_is_in_hands(src)) //If the pet is holding the leash, don't do this
		return

	//If the pet gets too far away, we get tugged to them.
	addtimer(CALLBACK(src, PROC_REF(after_freepet_move)), 0.2 SECONDS, TIMER_UNIQUE) //A short timer so the leash trails behind us.

/obj/item/leash/proc/after_freepet_move()
	if(!leash_pet)
		return

	for(var/i in 3 to get_dist(src, leash_pet)) // Move us to a minimum of 2 tiles away from the pet, so we trail behind them.
		step_towards(src, leash_pet)

	sleep(1)
	//Just to prevent error messages
	if(!leash_pet)
		return
	if(get_dist(src, leash_pet) > 5)
		leash_pet.visible_message(span_warning("\The [src] snaps free from \the [leash_pet]!"), span_warning("Your leash pops free from your collar!"))
		leash_pet.apply_effect(20, STUN, 0)
		leash_pet.adjustOxyLoss(5)
		leash_pet.clear_alert(/obj/screen/alert/leash_pet)
		leash_pet.clear_alert(/obj/screen/alert/leash_freepet)
		//QDEL_NULL(mobhook_leash_pet)
		UnregisterSignal(mobhook_leash_pet, COMSIG_MOVABLE_MOVED)
		//QDEL_NULL(mobhook_leash_freepet)
		UnregisterSignal(mobhook_leash_freepet, COMSIG_MOVABLE_MOVED)
		leash_pet = null

/obj/item/leash/dropped(mob/user, silent)
	 //Drop the leash, and the leash effects stop
	. = ..()
	if(!leash_pet) //There is no pet. Stop this silliness
		return
	if(!leash_master)
		return
	//Dropping procs any time the leash changes slots. So, we will wait a tick and see if the leash was actually dropped
	addtimer(CALLBACK(src, PROC_REF(drop_effects), user, silent), 1)

/obj/item/leash/proc/drop_effects(mob/user, silent)
	SIGNAL_HANDLER
	if(leash_master.item_is_in_hands(src) || leash_master.get_item_by_slot(SLOT_TIE) == src)
		return  //Dom still has the leash as it turns out. Cancel the proc.
	leash_master.visible_message(span_notice("\The [leash_master] drops \the [src]."), span_notice("You drop \the [src]."))
	//DOM HAS DROPPED LEASH. PET IS FREE. SCP HAS BREACHED CONTAINMENT.
	leash_pet.remove_modifiers_of_type(/datum/modifier/leash)
	UnregisterSignal(leash_pet, COMSIG_MOVABLE_MOVED)
	mobhook_leash_freepet = leash_pet
	RegisterSignal(mobhook_leash_freepet, COMSIG_MOVABLE_MOVED, PROC_REF(on_freepet_move), override = TRUE)
	leash_master.clear_alert(/obj/screen/alert/leash_dom) //No dom with no leash. We will get a new dom if the leash is picked back up.
	leash_master = null
	//QDEL_NULL(mobhook_leash_master)
	UnregisterSignal(mobhook_leash_master, COMSIG_MOVABLE_MOVED)

/obj/item/leash/proc/is_wearing_collar(var/mob/living/carbon/human/human)
	if (!istype(human)) {
		return FALSE
	}
	for (var/obj/item/clothing/worn in human.worn_clothing) {
		if (istype(worn, /obj/item/clothing/accessory/collar) || (locate(/obj/item/clothing/accessory/collar) in worn.accessories)) {
			return TRUE
		}
	}
	return FALSE

/*
/obj/item/leash/proc/draw_leash()
    if(!leash_pet || !leash_master) return
    var/turf/turf1 = leash_pet.loc
    var/turf/turf2 = leash_master.loc
    if(!turf1 || !turf2) return

    var/icon/line_icon = icon('line.dmi') // Replace with your own line base icon
    line_icon.DrawLine(turf1.x, turf1.y, turf2.x, turf2.y) // Draw a line from turf1 to turf2

    // Optionally, you can apply the line to the world or an object
    var/obj/line = new /obj
    line.icon = line_icon
    line.loc = locate((turf1.x + turf2.x) / 2, (turf1.y + turf2.y) / 2, turf1.z)*/

/obj/item/leash/equipped(mob/user)
	. = ..()
	if(!leash_pet) //Don't apply statuses with a petless leash.
		return
	addtimer(CALLBACK(src, PROC_REF(equip_effects), user), 2)

/obj/item/leash/proc/equip_effects(mob/user)
	if(!leash_pet)
		return
	if(leash_master == user)
		return // Don't double-register.
	if(leash_pet == user) //Pet picked up their own leash.
		leash_master = null
		return
	leash_master = user
	leash_master.leash_dom = TRUE
	leash_master.throw_alert("leash", /obj/screen/alert/leash_dom, 1)
	RegisterSignal(leash_master, COMSIG_MOVABLE_MOVED, PROC_REF(on_master_move), override = TRUE)
	mobhook_leash_master = leash_master
	leash_pet.leash_freepet = FALSE
	leash_pet.clear_alert(/obj/screen/alert/leash_freepet)
	//QDEL_NULL(mobhook_leash_freepet)
	if(mobhook_leash_freepet)
		UnregisterSignal(mobhook_leash_freepet, COMSIG_MOVABLE_MOVED)
	leash_pet.add_modifier(/datum/modifier/leash)

/datum/modifier/leash
	name = "Leash"
	slowdown = 5

// Utility functions
/obj/item/proc/apply_tug_mob_to_mob(mob/living/carbon/tug_pet, mob/living/carbon/tug_master, distance = 2)
	apply_tug_position(tug_pet, tug_pet.x, tug_pet.y, tug_master.x, tug_master.y, distance)

/obj/item/proc/apply_tug_mob_to_object(mob/living/carbon/tug_pet, obj/tug_master, distance = 2)
	apply_tug_position(tug_pet, tug_pet.x, tug_pet.y, tug_master.x, tug_master.y, distance)

/obj/item/proc/apply_tug_object_to_mob(obj/tug_pet, mob/living/carbon/tug_master, distance = 2)
	apply_tug_position(tug_pet, tug_pet.x, tug_pet.y, tug_master.x, tug_master.y, distance)

// TODO: improve this for bigger distances, where it's easy to hide behind something and break the tugging
/obj/item/proc/apply_tug_position(tug_pet, tug_pet_x, tug_pet_y, tug_master_x, tug_master_y, distance = 2)
	if(tug_pet_x > tug_master_x + distance)
		step(tug_pet, WEST, 1) //"1" is the speed of movement. We want the tug to be faster than their slow current walk speed.
		if(tug_pet_y > tug_master_y)//Check the other axis, and tug them into alignment so they are behind the master
			step(tug_pet, SOUTH, 1)
		if(tug_pet_y < tug_master_y)
			step(tug_pet, NORTH, 1)
	if(tug_pet_x < tug_master_x - distance)
		step(tug_pet, EAST, 1)
		if(tug_pet_y > tug_master_y)
			step(tug_pet, SOUTH, 1)
		if(tug_pet_y < tug_master_y)
			step(tug_pet, NORTH, 1)
	if(tug_pet_y > tug_master_y + distance)
		step(tug_pet, SOUTH, 1)
		if(tug_pet_x > tug_master_x)
			step(tug_pet, WEST, 1)
		if(tug_pet_x < tug_master_x)
			step(tug_pet, EAST, 1)
	if(tug_pet_y < tug_master_y - distance)
		step(tug_pet, NORTH, 1)
		if(tug_pet_x > tug_master_x)
			step(tug_pet, WEST, 1)
		if(tug_pet_x < tug_master_x)
			step(tug_pet, EAST, 1)
