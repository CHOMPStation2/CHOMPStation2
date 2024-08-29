/*
CONTAINS:
BEDSHEETS
LINEN BINS
*/

/obj/item/bedsheet // CHOMPEdit - Removal of obj/item/weapon
	name = "bedsheet"
	desc = "A surprisingly soft linen bedsheet."
	icon = 'icons/obj/items.dmi'
	icon_state = "sheet"
	slot_flags = SLOT_BACK
	plane = MOB_PLANE
	layer = BELOW_MOB_LAYER
	throwforce = 1
	throw_speed = 1
	throw_range = 2
	w_class = ITEMSIZE_SMALL
	drop_sound = 'sound/items/drop/clothing.ogg'
	pickup_sound = 'sound/items/pickup/clothing.ogg'

	/// Custom nouns to act as the subject of dreams
	var/list/dream_messages = list("white")

/obj/item/bedsheet/attack_self(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	user.drop_item()
	if(layer == initial(layer))
		layer = ABOVE_MOB_LAYER
	else
		reset_plane_and_layer()
	add_fingerprint(user)
	return

/obj/item/bedsheet/attackby(obj/item/I, mob/user) // CHOMPEdit - Removal of obj/item/weapon
	if(is_sharp(I))
		user.visible_message("<b>\The [user]</b> begins cutting up [src] with [I].", "<span class='notice'>You begin cutting up [src] with [I].</span>")
		if(do_after(user, 50))
			to_chat(user, "<span class='notice'>You cut [src] into pieces!</span>")
			for(var/i in 1 to rand(2,5))
				new /obj/item/reagent_containers/glass/rag(drop_location()) // CHOMPEdit - Removal of obj/item/weapon
			qdel(src)
		return
	..()

/obj/item/bedsheet/blue // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetblue"
	dream_messages = list("blue")

/obj/item/bedsheet/green // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetgreen"
	dream_messages = list("green")

/obj/item/bedsheet/orange // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetorange"
	dream_messages = list("orange")

/obj/item/bedsheet/purple // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetpurple"
	dream_messages = list("purple")

/obj/item/bedsheet/rainbow // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetrainbow"
	dream_messages = list("red", "orange", "yellow", "green", "blue", "purple", "a rainbow")

/obj/item/bedsheet/red // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetred"
	dream_messages = list("red")

/obj/item/bedsheet/yellow // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetyellow"
	dream_messages = list("yellow")

/obj/item/bedsheet/mime // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetmime"
	dream_messages = list("silence", "gestures", "a pale face", "a gaping mouth", "the mime")

/obj/item/bedsheet/clown // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetclown"
	item_state = "sheetrainbow"
	dream_messages = list("honk", "laughter", "a prank", "a joke", "a smiling face", "the clown")

/obj/item/bedsheet/captain // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetcaptain"
	dream_messages = list("authority", "a golden ID", "sunglasses", "a green disc", "an antique gun", "the captain")

/obj/item/bedsheet/rd // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetrd"
	dream_messages = list("authority", "a silvery ID", "a bomb", "a mech", "a facehugger", "maniacal laughter", "the research director")

/obj/item/bedsheet/medical // CHOMPEdit - Removal of obj/item/weapon
	name = "medical blanket"
	desc = "It's a sterilized* blanket commonly used in the Medbay.  *Sterilization is voided if a virologist is present onboard the station."
	icon_state = "sheetmedical"
	dream_messages = list("healing", "life", "surgery", "a doctor")

/obj/item/bedsheet/hos // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheethos"
	dream_messages = list("authority", "a silvery ID", "handcuffs", "a baton", "a flashbang", "sunglasses", "the head of security")

/obj/item/bedsheet/hop // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheethop"
	dream_messages = list("authority", "a silvery ID", "obligation", "a computer", "an ID", "a corgi", "the head of personnel")

/obj/item/bedsheet/ce // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetce"
	dream_messages = list("authority", "a silvery ID", "the engine", "power tools", "an APC", "a parrot", "the chief engineer")

/obj/item/bedsheet/brown // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetbrown"
	dream_messages = list("brown")

/obj/item/bedsheet/ian // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "sheetian"
	dream_messages = list("a dog", "a corgi", "woof", "bark", "arf")

/obj/item/bedsheet/double // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheet"
	item_state = "sheet"

/obj/item/bedsheet/bluedouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetblue"
	item_state = "sheetblue"

/obj/item/bedsheet/greendouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetgreen"
	item_state = "sheetgreen"

/obj/item/bedsheet/orangedouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetorange"
	item_state = "sheetorange"

/obj/item/bedsheet/purpledouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetpurple"
	item_state = "sheetpurple"

/obj/item/bedsheet/rainbowdouble //all the way across the sky. // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetrainbow"
	item_state = "sheetrainbow"

/obj/item/bedsheet/reddouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetred"
	item_state = "sheetred"

/obj/item/bedsheet/yellowdouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetyellow"
	item_state = "sheetyellow"

/obj/item/bedsheet/mimedouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetmime"
	item_state = "sheetmime"

/obj/item/bedsheet/clowndouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetclown"
	item_state = "sheetrainbow"

/obj/item/bedsheet/captaindouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetcaptain"
	item_state = "sheetcaptain"

/obj/item/bedsheet/rddouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetrd"
	item_state = "sheetrd"

/obj/item/bedsheet/hosdouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheethos"
	item_state = "sheethos"

/obj/item/bedsheet/hopdouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheethop"
	item_state = "sheethop"

/obj/item/bedsheet/cedouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetce"
	item_state = "sheetce"

/obj/item/bedsheet/browndouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetbrown"
	item_state = "sheetbrown"

/obj/item/bedsheet/iandouble // CHOMPEdit - Removal of obj/item/weapon
	icon_state = "doublesheetian"
	item_state = "sheetian"

/obj/structure/bedsheetbin
	name = "linen bin"
	desc = "A linen bin. It looks rather cosy."
	icon = 'icons/obj/structures.dmi'
	icon_state = "linenbin-full"
	anchored = TRUE
	var/amount = 20
	var/list/sheets = list()
	var/obj/item/hidden = null


/obj/structure/bedsheetbin/examine(mob/user)
	. = ..()

	if(amount < 1)
		. += "There are no bed sheets in the bin."
	else if(amount == 1)
		. += "There is one bed sheet in the bin."
	else
		. += "There are [amount] bed sheets in the bin."

/obj/structure/bedsheetbin/update_icon()
	if(amount == 0)
		icon_state = "linenbin-empty"
	else if(amount <= (amount / 2))
		icon_state = "linenbin-half"
	else
		icon_state = "linenbin-full"


/obj/structure/bedsheetbin/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/bedsheet)) // CHOMPEdit - Removal of obj/item/weapon
		user.drop_item()
		I.loc = src
		sheets.Add(I)
		amount++
		to_chat(user, "<span class='notice'>You put [I] in [src].</span>")
	else if(amount && !hidden && I.w_class < ITEMSIZE_LARGE)	//make sure there's sheets to hide it among, make sure nothing else is hidden in there.
		user.drop_item()
		I.loc = src
		hidden = I
		to_chat(user, "<span class='notice'>You hide [I] among the sheets.</span>")

/obj/structure/bedsheetbin/attack_hand(mob/user as mob)
	if(amount >= 1)
		amount--

		var/obj/item/bedsheet/B // CHOMPEdit - Removal of obj/item/weapon
		if(sheets.len > 0)
			B = sheets[sheets.len]
			sheets.Remove(B)

		else
			B = new /obj/item/bedsheet(loc) // CHOMPEdit - Removal of obj/item/weapon

		B.loc = user.loc
		user.put_in_hands(B)
		to_chat(user, "<span class='notice'>You take [B] out of [src].</span>")

		if(hidden)
			hidden.loc = user.loc
			to_chat(user, "<span class='notice'>[hidden] falls out of [B]!</span>")
			hidden = null


	add_fingerprint(user)

/obj/structure/bedsheetbin/attack_tk(mob/user as mob)
	if(amount >= 1)
		amount--

		var/obj/item/bedsheet/B // CHOMPEdit - Removal of obj/item/weapon
		if(sheets.len > 0)
			B = sheets[sheets.len]
			sheets.Remove(B)

		else
			B = new /obj/item/bedsheet(loc) // CHOMPEdit - Removal of obj/item/weapon

		B.loc = loc
		to_chat(user, "<span class='notice'>You telekinetically remove [B] from [src].</span>")
		update_icon()

		if(hidden)
			hidden.loc = loc
			hidden = null


	add_fingerprint(user)
