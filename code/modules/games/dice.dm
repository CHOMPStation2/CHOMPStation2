/obj/item/dice // CHOMPEdit - Removal of obj/item/weapon
	name = "d6"
	desc = "A dice with six sides."
	icon = 'icons/obj/dice.dmi'
	icon_state = "d66"
	w_class = ITEMSIZE_TINY
	var/sides = 6
	var/result = 6
	var/loaded = null //Set to an integer when the die is loaded
	var/cheater = FALSE //TRUE if the die is able to be weighted by hand
	var/tamper_proof = FALSE //Set to TRUE if the die needs to be unable to be weighted, such as for events
	attack_verb = list("diced")

/obj/item/dice/New() // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "[name][rand(1,sides)]"

/obj/item/dice/attackby(obj/item/W, mob/user) // CHOMPEdit - Removal of obj/item/weapon
	..()
	if(W.has_tool_quality(TOOL_WELDER) || istype(W, /obj/item/flame/lighter)) // CHOMPEdit - Removal of obj/item/weapon
		if(cheater)
			to_chat(user, "<span class='warning'>Wait, this [name] is already weighted!</span>")
		else if(tamper_proof)
			to_chat(user, "<span class='warning'>This [name] is proofed against tampering!</span>")
		else
			var/to_weight = input("What should the [name] be weighted towards? You can't undo this later, only change the number!","Set the desired result") as null|num
			if(isnull(to_weight) || (to_weight < 1) || (to_weight > sides)) //You must input a number higher than 0 and no greater than the number of sides
				return 0
			else
				to_chat(user, "You partially melt the [name], weighting it towards [to_weight]...")
				desc = "[initial(desc)] It looks a little misshapen, somehow..."
				loaded = to_weight

/obj/item/dice/AltClick(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	..()
	if(cheater)
		if(!loaded)
			var/to_weight = input("What should the [name] be weighted towards?","Set the desired result") as null|num
			if(isnull(to_weight) || (to_weight < 1) || (to_weight > sides) ) //You must input a number higher than 0 and no greater than the number of sides
				return 0
			else
				to_chat(user, "You sneakily set the [name] to land on [to_weight]...")
				loaded = to_weight
		else
			to_chat(user, "You set the [name] to roll randomly again.")
			loaded = null

/obj/item/dice/loaded // CHOMPEdit - Removal of obj/item/weapon
	description_info = "This is a loaded die! To change the number it's weighted to, alt-click it. To put it back to normal, alt-click it again."
	cheater = TRUE

/obj/item/dice/d4 // CHOMPEdit - Removal of obj/item/weapon
	name = "d4"
	desc = "A dice with four sides."
	icon_state = "d44"
	sides = 4
	result = 4

/obj/item/dice/d8 // CHOMPEdit - Removal of obj/item/weapon
	name = "d8"
	desc = "A dice with eight sides."
	icon_state = "d88"
	sides = 8
	result = 8

/obj/item/dice/d10 // CHOMPEdit - Removal of obj/item/weapon
	name = "d10"
	desc = "A dice with ten sides."
	icon_state = "d1010"
	sides = 10
	result = 10

/obj/item/dice/d12 // CHOMPEdit - Removal of obj/item/weapon
	name = "d12"
	desc = "A dice with twelve sides."
	icon_state = "d1212"
	sides = 12
	result = 12

/obj/item/dice/d20 // CHOMPEdit - Removal of obj/item/weapon
	name = "d20"
	desc = "A dice with twenty sides."
	icon_state = "d2020"
	sides = 20
	result = 20

/obj/item/dice/d100 // CHOMPEdit - Removal of obj/item/weapon
	name = "d100"
	desc = "A dice with ten sides. This one is for the tens digit."
	icon_state = "d10010"
	sides = 10
	result = 10

/obj/item/dice/attack_self(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	rollDice(user, 0)

/obj/item/dice/proc/rollDice(mob/user as mob, var/silent = 0) // CHOMPEdit - Removal of obj/item/weapon
	result = rand(1, sides)
	if(loaded)
		if(cheater)
			if(prob(90))
				result = loaded
		else if(prob(75)) //makeshift weighted dice don't always work
			result = loaded
	icon_state = "[name][result]"

	if(!silent)
		var/comment = ""
		if(sides == 20 && result == 20)
			comment = "Nat 20!"
		else if(sides == 20 && result == 1)
			comment = "Ouch, bad luck."

		user.visible_message("<span class='notice'>[user] has thrown [src]. It lands on [result]. [comment]</span>", \
							 "<span class='notice'>You throw [src]. It lands on a [result]. [comment]</span>", \
							 "<span class='notice'>You hear [src] landing on a [result]. [comment]</span>")

/*
 * Dice packs
 */

/obj/item/storage/pill_bottle/dice	//7d6 // CHOMPEdit - Removal of obj/item/weapon
	name = "bag of dice"
	desc = "It's a small bag with dice inside."
	icon = 'icons/obj/dice.dmi'
	icon_state = "dicebag"
	drop_sound = 'sound/items/drop/hat.ogg'
	pickup_sound = 'sound/items/pickup/hat.ogg'

/obj/item/storage/pill_bottle/dice/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	for(var/i = 1 to 7)
		new /obj/item/dice( src ) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/pill_bottle/dice_nerd	//DnD dice // CHOMPEdit - Removal of obj/item/weapon
	name = "bag of gaming dice"
	desc = "It's a small bag with gaming dice inside."
	icon = 'icons/obj/dice.dmi'
	icon_state = "magicdicebag"
	drop_sound = 'sound/items/drop/hat.ogg'
	pickup_sound = 'sound/items/pickup/hat.ogg'

/obj/item/storage/pill_bottle/dice_nerd/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	new /obj/item/dice/d4( src ) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/dice( src ) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/dice/d8( src ) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/dice/d10( src ) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/dice/d12( src ) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/dice/d20( src ) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/dice/d100( src ) // CHOMPEdit - Removal of obj/item/weapon

/*
 *Liar's Dice cup
 */

/obj/item/storage/dicecup // CHOMPEdit - Removal of obj/item/weapon
	name = "dice cup"
	desc = "A cup used to conceal and hold dice."
	icon = 'icons/obj/dice.dmi'
	icon_state = "dicecup"
	w_class = ITEMSIZE_SMALL
	storage_slots = 5
	can_hold = list(
		/obj/item/dice, // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/item/storage/dicecup/attack_self(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	user.visible_message("<span class='notice'>[user] shakes [src].</span>", \
							 "<span class='notice'>You shake [src].</span>", \
							 "<span class='notice'>You hear dice rolling.</span>")
	rollCup(user)

/obj/item/storage/dicecup/proc/rollCup(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	for(var/obj/item/dice/I in src.contents) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/dice/D = I // CHOMPEdit - Removal of obj/item/weapon
		D.rollDice(user, 1)

/obj/item/storage/dicecup/proc/revealDice(var/mob/viewer) // CHOMPEdit - Removal of obj/item/weapon
	for(var/obj/item/dice/I in src.contents) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/dice/D = I // CHOMPEdit - Removal of obj/item/weapon
		to_chat(viewer, "The [D.name] shows a [D.result].")

/obj/item/storage/dicecup/verb/peekAtDice() // CHOMPEdit - Removal of obj/item/weapon
	set category = "Object"
	set name = "Peek at Dice"
	set desc = "Peek at the dice under your cup."

	revealDice(usr)

/obj/item/storage/dicecup/verb/revealDiceHand() // CHOMPEdit - Removal of obj/item/weapon

	set category = "Object"
	set name = "Reveal Dice"
	set desc = "Reveal the dice hidden under your cup."

	for(var/mob/living/player in viewers(3))
		to_chat(player, "[usr] reveals their dice.")
		revealDice(player)


/obj/item/storage/dicecup/loaded/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	for(var/i = 1 to 5)
		new /obj/item/dice( src ) // CHOMPEdit - Removal of obj/item/weapon
