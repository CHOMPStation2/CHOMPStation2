/obj/structure/closet/crate/secure/lootsafe
	name = "secure safe"
	desc = "A huge chunk of metal with a dial embedded in it. Fine print on the dial reads \"Scarborough Arms - 2 tumbler safe, guaranteed thermite resistant, explosion resistant, and assistant resistant.\""
	icon = 'icons/obj/structures.dmi' //I should coder sprite something but for now using normal safe
	icon_state = "safe"
	anchored = TRUE
	density = TRUE
	health = 500 //Cause in heavy defended areas and thermite resistaint
	locked = 1
	var/hackguard = 10

/obj/structure/closet/crate/secure/lootsafe/emag_act(var/remaining_charges, var/mob/user)
	if (locked)
		if(prob(60 - hackguard))
			to_chat(user, "<span class='notice'>The safe unlocks!</span>")
			locked = 0
			return 1
		if(prob(15 + hackguard))
			to_chat(user, "<span class='notice'>The safe buzzes as a security drone is teleported in!</span>")
			new /mob/living/simple_mob/mechanical/combat_drone (src.loc) //if I ever make security stun drones remind me to replace this with those
			//new /effect/system/spark_spread (src.loc) I am to tired to make this work right now
			return 1
		else
			to_chat(user, "<span class='notice'>The safe buzzes but the security systems don't trigger.</span>")
			return 1

//Loot for lootsafes
/obj/structure/closet/crate/secure/lootsafe/proc/generate_loot()
	var/lootvalue = 0
	while(lootvalue <= 15) //if the initial generation gives you less than 10 points of stuff, add more stuff
		//pick a thing to add to the crate - the format is "list(filepath, value) = weight,"
		var/choice = list()
		choice = pickweight(list(
			list(/obj/item/spacecash/c500, 3) = 5,
			list(/obj/item/spacecash/c200, 3) = 5,
			list(/obj/item/spacecash/c100, 3) = 5,
			list(/obj/item/spacecash/c50, 3) = 5,
			list(/obj/item/spacecash/c20, 3) = 5,
			list(pick(/obj/item/multitool/alien,
				/obj/item/stack/cable_coil/alien,
				/obj/item/tool/crowbar/alien,
				/obj/item/tool/screwdriver/alien,
				/obj/item/weldingtool/alien,
				/obj/item/tool/wirecutters/alien,
				/obj/item/tool/wrench/alien), 3) = 10,
			list(/obj/item/seeds/random, 3) = 10,
			list(pick(subtypesof(/obj/item/storage/firstaid)), 3) = 15,
			list(/obj/item/grenade/flashbang/clusterbang, 3) = 10,
			list(pick(subtypesof(/obj/item/stock_parts) - /obj/item/stock_parts/subspace), 3) = 5,
			list(/obj/item/rig/ch/precursor, 3) = 5,
			list(/obj/item/rig/combat, 3) = 15,
			list(/obj/item/rig/merc, 3) = 10,
			list(/obj/item/rig/internalaffairs, 3) = 10,
			list(/obj/item/rig/baymed, 3) = 10,
			list(/obj/item/gun/energy/vepr/plasma, 3) = 5,
			list(/obj/item/gun/energy/laser/vepr, 3) = 5,
			list(/obj/item/gun/projectile/automatic/l6_saw, 3) = 10,
			list(/obj/item/gun/projectile/automatic/tommygun, 3) = 10,
			list(/obj/item/holosign_creator/combifan, 3) = 15,
			list(/obj/item/rcd, 3) = 15,
			list(/obj/item/gun/energy/medigun, 3) = 10,
			list(/obj/item/gun/energy/sickshot, 3) = 5,
			list(/obj/item/slime_extract/purple, 3) = 10,
			list(/obj/item/slime_extract/bluespace, 3) = 10,
			list(/obj/item/slime_extract/blue, 3) = 10,
			list(/obj/item/slime_extract/red, 3) = 10,
			list(/obj/item/slime_extract/emerald, 3) = 10,
			list(/obj/item/slime_extract/cerulean, 3) = 10,
			list(/obj/item/slime_extract/ruby, 3) = 10,
			list(/obj/item/slime_extract/green, 3) = 10,
			list(/obj/item/slime_extract/pink, 3) = 10,
			list(/obj/item/slime_extract/oil, 3) = 10,
			list(/obj/item/slime_extract/dark_blue, 3) = 10,
			list(/obj/item/slime_extract/dark_purple, 3) = 10,
			list(/obj/item/clothing/glasses/omni, 3) = 10,
			list(/obj/item/clothing/glasses/thermal, 3) = 10,
			list(/obj/item/clothing/glasses/night, 3) = 15,
			list(/obj/item/stack/material/void_opal, 3) = 5,
			list(/obj/item/inducer/syndicate, 3) = 10,
			list(/obj/item/melee/energy/axe, 3) = 10,
			list(/obj/item/rig_module/chem_dispenser/ninja, 3) = 10,
			list(/obj/item/rig_module/vision/multi, 3) = 5,
			list(/obj/item/rig_module/mounted/energy_blade, 3) = 5,
			list(/obj/item/perfect_tele, 3) = 15
			))
		var/path = choice[1]
		var/value = choice[2]
		contents += new path()
		lootvalue += value

/obj/structure/closet/crate/secure/lootsafe/numberlock
	desc = "A huge chunk of metal with a keypad embedded in it. Fine print above the keypad reads, Guaranteed thermite resistant, explosion resistant, and assistant resistant.\""
	var/list/code = list()
	var/list/lastattempt = list()
	var/attempts = 10
	var/codelen = 5

/obj/structure/closet/crate/secure/lootsafe/numberlock/extraguard
	hackguard = 20

/obj/structure/closet/crate/secure/lootsafe/numberlock/weak
	hackguard = 5
	codelen = 3

/obj/structure/closet/crate/secure/lootsafe/numberlock/New()
	..()
	var/list/digits = list("1", "2", "3", "4", "5", "6", "7", "8", "9", "0")

	for(var/i in 1 to codelen)
		code += pick(digits)
		digits -= code[code.len]

	generate_loot()


/obj/structure/closet/crate/secure/lootsafe/numberlock/togglelock(mob/user as mob)
	if(!locked)
		return

	to_chat(user, "<span class='notice'>The crate is locked with a Deca-code lock.</span>")
	var/input = tgui_input_text(usr, "Enter [codelen] digits. All digits must be unique.", "Deca-Code Lock", "")
	if(!Adjacent(user))
		return
	var/list/sanitised = list()
	var/sanitycheck = 1
	for(var/i=1,i<=length(input),i++) //put the guess into a list
		sanitised += text2num(copytext(input,i,i+1))
	for(var/i=1,i<=(length(input)-1),i++) //compare each digit in the guess to all those following it
		for(var/j=(i+1),j<=length(input),j++)
			if(sanitised[i] == sanitised[j])
				sanitycheck = null //if a digit is repeated, reject the input

	if(input == null || sanitycheck == null || length(input) != codelen)
		to_chat(user, "<span class='notice'>You leave the crate alone.</span>")
	else if(check_input(input))
		to_chat(user, "<span class='notice'>The crate unlocks!</span>")
		playsound(src, 'sound/machines/lockreset.ogg', 50, 1)
		set_locked(0)
	else
		visible_message("<span class='warning'>A red light on \the [src]'s control panel flashes briefly.</span>")
		attempts--
		if (attempts == 0)
			to_chat(user, "<span class='danger'>The crate's anti-tamper system activates!</span>")
			var/turf/T = get_turf(src.loc)
			explosion(T, 0, 0, 1, 2)
			qdel(src)

/obj/structure/closet/crate/secure/lootsafe/numberlock/proc/check_input(var/input)
	if(length(input) != codelen)
		return 0

	. = 1
	lastattempt.Cut()
	for(var/i in 1 to codelen)
		var/guesschar = copytext(input, i, i+1)
		lastattempt += guesschar
		if(guesschar != code[i])
			. = 0

/obj/structure/closet/crate/secure/lootsafe/numberlock/attackby(obj/item/W as obj, mob/user as mob)
	if(locked)
		if (istype(W, /obj/item/multitool)) // Greetings Urist McProfessor, how about a nice game of cows and bulls?
			to_chat(user, "<span class='notice'>DECA-CODE LOCK ANALYSIS:</span>")
			if (attempts == 1)
				to_chat(user, "<span class='warning'>* Anti-Tamper system will activate on the next failed access attempt.</span>")
			else
				to_chat(user, "<span class='notice'>* Anti-Tamper system will activate after [src.attempts] failed access attempts.</span>")
			if(lastattempt.len)
				var/bulls = 0
				var/cows = 0

				var/list/code_contents = code.Copy()
				for(var/i in 1 to codelen)
					if(lastattempt[i] == code[i])
						++bulls
					else if(lastattempt[i] in code_contents)
						++cows
					code_contents -= lastattempt[i]
				var/previousattempt = null //convert back to string for readback
				for(var/i in 1 to codelen)
					previousattempt = addtext(previousattempt, lastattempt[i])
				to_chat(user, "<span class='notice'>Last code attempt, [previousattempt], had [bulls] correct digits at correct positions and [cows] correct digits at incorrect positions.</span>")
			return
	..()


//Currently Admeme things but due to chatter I have ideas on how to expand this later
//Concept is you either A) go and get the keycard, or B) brute force.
/obj/structure/closet/crate/secure/lootsafe/devillock
	desc = "A huge chunk of metal with a keyboard imprinted in it.\""
	hackguard = 45
	req_access = list(150)
	var/list/code = list()
	var/list/lastattempt = list()
	var/attempts = 100
	var/codelen = 10

/obj/item/card/id/bosskey
	name = "Strange ID"
	desc = "A golden card which seems unnatural in nature."
	icon_state = "gold-id"
	item_state = "gold_id"
	access = list(150)


/obj/structure/closet/crate/secure/lootsafe/devillock/New()
	..()
	var/list/digits = list("1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")

	for(var/i in 1 to codelen)
		code += pick(digits)
		digits -= code[code.len]

	generate_loot()



/obj/structure/closet/crate/secure/lootsafe/devillock/togglelock(mob/user as mob)
	if(!locked)
		return

	to_chat(user, "<span class='notice'>The crate is locked with a Deca-code lock.</span>")
	var/input = tgui_input_text(usr, "Enter [codelen] digits. All digits must be unique.", "Deca-Code Lock", "")
	if(!Adjacent(user))
		return
	var/list/sanitised = list()
	var/sanitycheck = 1
	for(var/i=1,i<=length(input),i++) //put the guess into a list
		sanitised += text2num(copytext(input,i,i+1))
	for(var/i=1,i<=(length(input)-1),i++) //compare each digit in the guess to all those following it
		for(var/j=(i+1),j<=length(input),j++)
			if(sanitised[i] == sanitised[j])
				sanitycheck = null //if a digit is repeated, reject the input

	if(input == null || sanitycheck == null || length(input) != codelen)
		to_chat(user, "<span class='notice'>You leave the crate alone.</span>")
	else if(check_input(input))
		to_chat(user, "<span class='notice'>The crate unlocks!</span>")
		playsound(src, 'sound/machines/lockreset.ogg', 50, 1)
		set_locked(0)
	else
		visible_message("<span class='warning'>A red light on \the [src]'s control panel flashes briefly.</span>")
		attempts--
		if (attempts == 0)
			to_chat(user, "<span class='danger'>The crate's anti-tamper system activates!</span>")
			var/turf/T = get_turf(src.loc)
			explosion(T, 0, 0, 1, 2)
			qdel(src)

/obj/structure/closet/crate/secure/lootsafe/devillock/proc/check_input(var/input)
	if(length(input) != codelen)
		return 0

	. = 1
	lastattempt.Cut()
	for(var/i in 1 to codelen)
		var/guesschar = copytext(input, i, i+1)
		lastattempt += guesschar
		if(guesschar != code[i])
			. = 0

/obj/structure/closet/crate/secure/lootsafe/devillock/attackby(obj/item/W as obj, mob/user as mob)
	if(locked)
		if (istype(W, /obj/item/multitool)) // Greetings Urist McProfessor, how about a nice game of cows and bulls?
			to_chat(user, "<span class='notice'>DECA-CODE LOCK ANALYSIS:</span>")
			if (attempts == 1)
				to_chat(user, "<span class='warning'>* Anti-Tamper system will activate on the next failed access attempt.</span>")
			else
				to_chat(user, "<span class='notice'>* Anti-Tamper system will activate after [src.attempts] failed access attempts.</span>")
			if(lastattempt.len)
				var/bulls = 0
				var/cows = 0

				var/list/code_contents = code.Copy()
				for(var/i in 1 to codelen)
					if(lastattempt[i] == code[i])
						++bulls
					else if(lastattempt[i] in code_contents)
						++cows
					code_contents -= lastattempt[i]
				var/previousattempt = null //convert back to string for readback
				for(var/i in 1 to codelen)
					previousattempt = addtext(previousattempt, lastattempt[i])
				to_chat(user, "<span class='notice'>Last code attempt, [previousattempt], had [bulls] correct digits at correct positions and [cows] correct digits at incorrect positions.</span>")
			return
	..()
