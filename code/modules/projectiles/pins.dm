/************************/
/*    Firing Pin Def    */
/************************/

/obj/item/firing_pin
	name = "electronic firing pin"
	desc = "A small authentication device, to be inserted into a firearm receiver to allow operation."
	icon = 'tbd'
	icon_state = "firing_pin"
	item_state = "pen"
	attack_verb = list("poked")
	var/fail_message = "<span class='warning'>INVALID USER.</span>"
	var/selfdestruct = 0	// Explode when user check is failed.
	var/force_replace = 0	// Can forcefully replace other pins.
	var/pin_removeable = 0	// Can be replaced by any pin.
	var/obj/item/weapon/gun
	var/emagged = 0

/obj/item/firing_pin/New(newloc)
	..()
	if(istype(target, /obj/item/weapon/gun))
		gun = newloc

/obj/item/firing_pin/afterattack(atom/target, mob/user, adjacent, params)
	. = ..()
	if(adjacent)
		if(istype(target, /obj/item/weapon/gun))
			var/obj/item/weapon/gun/G = target
			var/obj/item/firing_pin/old_pin = G.pin
			if(old_pin && (force_replace || old_pin.pin_removeable))
				to_chat(user, "<span class='notice'>You remove [old_pin] from [G].</span>")
			if(Adjacent(user))
				user.put_in_hands(old_pin)
			else
				old_pin.forceMove(G.drop_location())
			old_ppin.gun_remove(user)
		
		if(!G.pin)
			gun_insert(user, G)
			to_chat(user, "<span class='notice'>You insert [src] into [G].</span>")
		else
			to_chat(user, "<span class='notice'>This firearm already has a firing pin installed.</span>")
		
/obj/item/firing_pin/emag_act(var/remaining_charges, var/mob/user)
	if(emagged)
		return
	emagged = !emagged
	to_chat(user, "<span class='notice'>You override the authentication mechanism.</span>")

/obj/item/firing_pin/proc/gun_insert(mob/living/user, obj/item/gun/G)
	gun = G
	forceMove(gun)
	gun.pin = src
	return

/obj/item/firing_pin/proc/gun_remove(mob/living/user)
	gun.pin = null
	gun = null
	return

/obj/item/firing_pin/proc/pin_auth(mob/living/user)
	return TRUE

/obj/item/firing_pin/proc/auth_fail(mob/living/user)
	if(user)
		user.show_message(fail_message, MSG_VISUAL)
	if(selfdestruct)
		if(user)
			user.show_message("<span class='danger'>SELF-DESTRUCTING...</span>")
			to_chat(user, "<span class='userdanger'>[gun] explodes!</span>")
			explosion(get_turf(gun), -1, 0, 2, 3)
			if(gun)
				qdel(gun)

/*********************/
/*    Firing Pins    */
/*********************/

// Magic weapon pin
/obj/item/firing_pin/magic
	name = "magic crystal shard"
	desc = "A small enchanted shard which allows magical weapons to fire."


// Test pin, works only near firing range.
/obj/item/firing_pin/test_range
	name = "test-range firing pin"
	desc = "This safety firing pin allows weapons to be fired within proximity to a firing range."
	fail_message = "<span class='warning'>TEST RANGE CHECK FAILED.</span>"
	pin_removeable = TRUE

/obj/item/firing_ppin/test_range/pin_auth(mob/living/user)
	if(!istype(user))
		return FALSE
	for(var/obj/machinery/magnetic_controller/M in range(user, 3))
		return TRUE
	return FALSE


// Implant pin, checks for implant
/obj/item/firing_pin/implant
	name = "implant-keyed firing pin"
	desc = "This is a security firing pin which only authorizes users who are implanted with a certain device."
	fail_message = "<span class='warning'>IMPLANT CHECK FAILED.</span>"
	var/obj/item/implant/req_implant = null

obj/item/firing_pin/implant/pin_auth(mob/living/user)
	if(user)
		for(var/obj/item/organ/external/E in user.organs)
			for(var/obj/item/weapon/implant/I in E.implants)
				if(req_implant && I.type == req_implant)
					return TRUE
	return FALSE

  // Loyalty implant
/obj/item/firing_pin/implant/loyalty
	name = "loyalty firing pin"
	desc = "This Security firing pin authorizes the weapon for only loyalty-implanted users."
	icon_state = "firing_pin_loyalty"
	req_implant = /obj/item/weapon/implant/loyalty


// Honk pin, clown's joke item.
// Can replace other pins. Replace a pin in cap's laser for extra fun!
// Left in for my own peace of mind. -Gear
/obj/item/firing_pin/clown
	name = "hilarious firing pin"
	desc = "Adcanced clowntech that can convert any firearm into a far more useful object."
	color = "#FFFF00"
	fail_message = "<span class='warning'>HONK!</span>"
	force_replace = TRUE

/obj/item/firing_pin/clown/pin_auth(mob/living/user)
	playsound(src, 'sound/items/bikehorn.ogg', 50, TRUE)
	return FALSE // :^)


/**********************************************************************/
/* Temporarily removed, as I have no clue how med systems work! -Gear */
/**********************************************************************/
/*
// DNA-keyed pin.
// When you want to keep your toys for yourself.
/obj/item/firing_pin/dna
	name = "DNA-keyed firing pin"
	desc = "This is a DNA-locked firing pin which only authorizes one user. Attempt to fire once to DNA-link."
	icon_state = "firing_pin_dna"
	fail_message = "<span class='warning'>DNA CHECK FAILED.</span>"
	var/unique_enzymes = null

/obj/item/firing_pin/dna/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	if(proximity_flag && iscarbon(target))
		var/mob/living/carbon/M = target
		if(M.dna && M.dna.unique_enzymes)
			unique_enzymes = M.dna.unique_enzymes
			to_chat(user, "<span class='notice'>DNA-LOCK SET.</span>")

/obj/item/firing_pin/dna/pin_auth(mob/living/carbon/user)
	if(user && user.dna && user.dna.unique_enzymes)
		if(user.dna.unique_enzymes == unique_enzymes)
			return TRUE
	return FALSE

/obj/item/firing_pin/dna/auth_fail(mob/living/carbon/user)
	if(!unique_enzymes)
		if(user && user.dna && user.dna.unique_enzymes)
			unique_enzymes = user.dna.unique_enzymes
			to_chat(user, "<span class='notice'>DNA-LOCK SET.</span>")
	else
		..()

/obj/item/firing_pin/dna/dredd
	desc = "This is a DNA-locked firing pin which only authorizes one user. Attempt to fire once to DNA-link. It has a small explosive charge on it."
	selfdestruct = TRUE
*/


// Explorer firing pin
// Usage restricted to off station Z-level
/obj/item/firing_pin/explorer
	name = "outback firing pin"
	desc = "A firing pin used by the australian defense force, retrofit to prevent weapon discharge on the station."
	icon_state = "firing_pin_explorer"
	fail_message = "<span class='warning'>CANNOT FIRE WHILE ON STATION, MATE!</span>"

// Checks that the user isn't on station Z-level
/obj/item/firing_pin/explorer/pin_auth(mob/living/user)
	var/turf/station_check = get_turf(user)
	if(!station_check||is_station_level(station_check.z))
		to_chat(user, "<span class='warning'>You cannot use your weapon while on the station!</span>")
		return FALSE
	return TRUE


// Laser tag pins
/obj/item/firing_pin/tag
	name = "laser tag firing pin"
	desc = "A recreational firing pin, used in laser tag units to ensure users have their vests on."
	fail_message = "<span class='warning'>SUIT CHECK FAILED.</span>"
	var/obj/item/clothing/suit/suit_requirement = null
	var/tagcolor = ""

/obj/item/firing_pin/tag/pin_auth(mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/M = user
		if(istype(M.wear_suit, suit_requirement))
			return TRUE
	to_chat(user, "<span class='warning'>You need to be wearing [tagcolor] laser tag armor!</span>")
	return FALSE

  // Red laser tag firing pin
/obj/item/firing_pin/tag/red
	name = "red laser tag firing pin"
	icon_state = "firing_pin_red"
	suit_requirement = /obj/item/clothing/suit/redtag
	tagcolor = "red"

  // Blue laser tag firing pin
/obj/item/firing_pin/tag/blue
	name = "blue laser tag firing pin"
	icon_state = "firing_pin_blue"
	suit_requirement = /obj/item/clothing/suit/bluetag
	tagcolor = "blue"

/obj/item/firing_pin/Destroy()
	if(gun)
		gun.pin = null
	return ..()