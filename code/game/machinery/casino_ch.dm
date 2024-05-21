/obj/structure/casino_table
	name = "casino table"
	desc = "this is an unremarkable table for a casino."
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "roulette_table"
	density = 1
	anchored = 1
	climbable = 1
	layer = TABLE_LAYER
	throwpass = 1
	var/item_place = 1 //allows items to be placed on the table, but not on benches.

	var/busy = 0

/obj/structure/casino_table/attackby(obj/item/W as obj, mob/user as mob)
	if(item_place)
		user.drop_item(src.loc)
	return

/obj/structure/casino_table/roulette_table
	name = "roulette"
	desc = "Spin the roulette to try your luck."
	icon_state = "roulette_wheel"

	var/datum/effect/effect/system/confetti_spread
	var/confetti_strength = 5

/obj/structure/casino_table/roulette_table/attack_hand(mob/user as mob)
	if (busy)
		to_chat(user,"<span class='notice'>You cannot spin now! The roulette is already spinning.</span> ")
		return
	visible_message("<span class='notice'>\ [user]  spins the roulette and throws inside little ball.</span>")
	playsound(src.loc, 'sound/machines/roulette.ogg', 40, 1)
	busy = 1
	icon_state = "roulette_wheel_spinning"
	var/result = rand(0,36)
	var/color = "green"
	add_fingerprint(user)
	if (result == 0)
		color="gold"
	else
		if(result%2)
			color="red"
		else
			color="black"

	spawn(5 SECONDS)
		busy=0
		icon_state = "roulette_wheel"

		if(color=="gold") // Happy celebrations!
			visible_message("<span class='notice'>The roulette stops spinning, the ball lands on the golden zero! Fortune favors all bets!</span>")
			src.confetti_spread = new /datum/effect/effect/system/confetti_spread()
			src.confetti_spread.attach(src) //If somehow people start dragging roulette
			spawn(0)
				for(var/i = 1 to confetti_strength)
					src.confetti_spread.start()
					sleep(10)
		else
			visible_message("<span class='notice'>The roulette stops spinning, the ball landing on [result], [color].</span>")

/obj/structure/casino_table/roulette_chart
	name = "roulette chart"
	desc = "Roulette chart. Place your bets!"
	icon_state = "roulette_table"

/obj/structure/casino_table/blackjack_l
	name = "gambling table"
	desc = "Gambling table, try your luck and skills! "
	icon_state = "blackjack_l"

/obj/structure/casino_table/blackjack_r
	name = "gambling table"
	desc = "Gambling table, try your luck and skills! "
	icon_state = "blackjack_r"

/obj/structure/casino_table/blackjack_m
	name = "gambling table"
	desc = "Gambling table, try your luck and skills! "
	icon_state = "blackjack_m"

/obj/machinery/slot_machine
	name = "Slot machine"
	desc = "A gambling machine designed to give you false hope and rob you of your wealth, hence why it's often called a one armed bandit."
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "slotmachine"
	anchored = 1
	density = 1
	var/busy = 0
	var/symbol1 = null
	var/symbol2 = null
	var/symbol3 = null

	var/datum/effect/effect/system/confetti_spread
	var/confetti_strength = 8

/obj/machinery/slot_machine/attackby(obj/item/weapon/W as obj, mob/user as mob)

	var/handled = 0
	var/paid = 0

	if(istype(W, /obj/item/weapon/spacecasinocash))
		var/obj/item/weapon/spacecasinocash/C = W
		paid = insert_chip(C, user)
		handled = 1

		if(paid)
			return
		if(handled)
			SSnanoui.update_uis(src)
			return // don't smack that machine with your 2 chips

/obj/machinery/slot_machine/proc/insert_chip(var/obj/item/weapon/spacecasinocash/cashmoney, mob/user)
	if (busy)
		to_chat(user,"<span class='notice'>The slot machine is currently rolling.</span> ")
		return
	if(cashmoney.worth < 5)
		to_chat(user,"<span class='notice'>You dont have enough chips to gamble!</span> ")
		return

	to_chat(user,"<span class='notice'>You puts 5 credits in the slot machine and presses start.</span>")
	cashmoney.worth -= 5
	cashmoney.update_icon()

	if(cashmoney.worth <= 0)
		usr.drop_from_inventory(cashmoney)
		qdel(cashmoney)
		cashmoney.update_icon()

	busy = 1
	icon_state = "slotmachine_rolling"
	playsound(src.loc, 'sound/machines/slotmachine_pull.ogg', 15, 1)

	var/slot1 = rand(0,9)
	switch(slot1)
		if(0 to 3) symbol1 = "cherry"
		if(4 to 4) symbol1 = "lemon"
		if(5 to 5) symbol1 = "bell"
		if(6 to 6) symbol1 = "four leaf clover"
		if(7 to 7) symbol1 = "seven"
		if(8 to 8) symbol1 = "diamond"
		if(9 to 9) symbol1 = "platinum coin"

	var/slot2 = rand(0,16)
	switch(slot2)
		if(0 to 5) symbol2 = "cherry"
		if(6 to 7) symbol2 = "lemon"
		if(8 to 9) symbol2 = "bell"
		if(10 to 11) symbol2 = "four leaf clover"
		if(12 to 13) symbol2 = "seven"
		if(14 to 15) symbol2 = "diamond"
		if(16) symbol2 = "platinum coin"

	var/slot3 = rand(0,9)
	switch(slot3)
		if(0 to 3) symbol3 = "cherry"
		if(4 to 4) symbol3 = "lemon"
		if(5 to 5) symbol3 = "bell"
		if(6 to 6) symbol3 = "four leaf clover"
		if(7 to 7) symbol3 = "seven"
		if(8 to 8) symbol3 = "diamond"
		if(9 to 9) symbol3 = "platinum coin"

	var/output //Output variable to send out in chat after the large if statement.
	var/winnings = 0 //How much money will be given if any.
	// var/platinumwin = 0 // If you win the platinum chip or not - Ringa ding ding babe! No chips until further notice!
	var/celebrate = 0
	var/delaytime = 5 SECONDS


	spawn(delaytime)
		to_chat(user,"<span class='notice'>The slot machine flashes with bright colours as the slots lights up with a [symbol1], a [symbol2] and a [symbol3]!</span>")

		if (symbol1 == "cherry" && symbol2 == "cherry" && symbol3 == "cherry")
			output = "<span class='notice'>Three cherries! The slot machine deposits chips worth 25 credits!</span>"
			winnings = 25

		if ((symbol1 != "cherry" && symbol2 == "cherry" && symbol3 == "cherry") || (symbol1 == "cherry" && symbol2 != "cherry" && symbol3 == "cherry") ||(symbol1 == "cherry" && symbol2 == "cherry" && symbol3 != "cherry"))
			output = "<span class='notice'>Two cherries! The slot machine deposits a 10 credit chip!</span>"
			winnings = 10

		if (symbol1 == "lemon" && symbol2 == "lemon" && symbol3 == "lemon")
			output = "<span class='notice'>Three lemons! The slot machine deposits a 50 credit chip!</span>"
			winnings = 50

		if (symbol1 == "watermelon" && symbol2 == "watermelon" && symbol3 == "watermelon")
			output = "<span class='notice'>Three watermelons! The slot machine deposits chips worth 75 credits!</span>"
			winnings = 75

		if (symbol1 == "bell" && symbol2 == "bell" && symbol3 == "bell")
			output = "<span class='notice'>Three bells! The slot machine deposits chips a 100 credit chip!</span>"
			winnings = 100

		if (symbol1 == "four leaf clover" && symbol2 == "four leaf clover" && symbol3 == "four leaf clover")
			output = "<span class='notice'>Three four leaf clovers! The slot machine deposits a 200 credit chip!</span>"
			winnings = 200

		if (symbol1 == "seven" && symbol2 == "seven" && symbol3 == "seven")
			output = "<span class='notice'>Three sevens! The slot machine deposits a 300 credit chip!</span>"
			winnings = 300
			celebrate = 1

		if (symbol1 == "diamond" && symbol2 == "diamond" && symbol3 == "diamond")
			output = "<span class='notice'>Three diamonds! The slot machine deposits a 500 credit chip!</span>"
			winnings = 500
			celebrate = 1

		if (symbol1 == "platinum coin" && symbol2 == "platinum coin" && symbol3 == "platinum coin")
			output = "<span class='notice'>Three platinum coins! The slot machine deposits a 1000 credit chip!</span>"
			winnings = 1000
			celebrate = 1

		icon_state = initial(icon_state) // Set it back to the original iconstate.

		if(!output) // Is there anything to output? If not, consider it a loss.
			to_chat(user,"Better luck next time!")
			busy = FALSE
			return

		to_chat(user,output) //Output message

		/* Disabled until further notice, platinum now more rare
		if(platinumwin) // Did they win the platinum chip?
			new /obj/item/weapon/casino_platinum_chip(src.loc)
			playsound(src.loc, 'sound/machines/slotmachine.ogg', 25, 1)
		*/

		if(winnings) //Did the person win?
			icon_state = "slotmachine_winning"
			playsound(src.loc, 'sound/machines/slotmachine.ogg', 25, 1)
			spawn(delaytime)
				spawn_casinochips(winnings, src.loc)
				icon_state = "slotmachine"

		if(celebrate) // Happy celebrations!
			src.confetti_spread = new /datum/effect/effect/system/confetti_spread()
			src.confetti_spread.attach(src) //If somehow people start dragging slot machine
			spawn(0)
				for(var/i = 1 to confetti_strength)
					src.confetti_spread.start()
					sleep(10)

		busy = FALSE

/obj/structure/stripper_pole
	name = "stripper pole"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "stripper_pole"
	plane = MOB_PLANE
	layer = BELOW_MOB_LAYER
	density = 0

/obj/structure/stripper_pole/attack_hand(mob/user)
	dance(user)
	user.spin(32,2)
	..()

/obj/structure/stripper_pole/proc/dance(mob/user)
	if(layer == BELOW_MOB_LAYER)
		layer = ABOVE_MOB_LAYER
	else
		layer = BELOW_MOB_LAYER

/obj/machinery/chemical_dispenser/deluxe
	name = "deluxe drink dispenser"
	desc = "The premium within dispenser for drinks, its made with bluespace technology!"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "deluxe_dispenser"
	ui_title = "Deluxe Drink Dispenser"
	accept_drinking = 1
	var/max_cartridges = 90 //Because it keeps getting borked by upstream, now gotta do it with variable until we can make more permanent solution - Jack


/obj/machinery/chemical_dispenser/deluxe
	dispense_reagents = list(
		"water", "ice", "coffee", "cream", "tea", "icetea", "cola", "spacemountainwind", "dr_gibb", "space_up", "tonic",
		"sodawater", "lemon_lime", "sugar", "orangejuice", "limejuice", "watermelonjuice", "thirteenloko", "grapesoda",
		"coffee", "cafe_latte", "soy_latte", "hot_coco", "milk", "cream", "tea", "ice", "orangejuice", "lemonjuice",
		"limejuice", "berryjuice", "mint", "lemon_lime", "sugar", "orangejuice", "limejuice", "sodawater",
		"tonic", "beer", "kahlua", "whiskey", "redwine", "vodka", "gin", "rum", "tequilla", "vermouth", "cognac",
		"ale", "mead", "bitters", "champagne", "singulo", "doctorsdelight", "nothing", "banana", "honey", "egg",
		"coco", "cherryjelly", "carrotjuice", "applejuice", "tomatojuice", "peanutbutter", "soymilk", "grenadine", "gingerale", "roy_rogers",
		"patron", "goldschlager", "gelatin", "melonliquor", "bluecuracao", "thirteenloko", "deadrum", "sake", "acidspit",
		"amasec", "beepskysmash", "atomicbomb", "nuka_cola", "threemileisland", "manhattan_proj", "psilocybin", "moonshine",
		"specialwhiskey", "unathiliquor", "winebrandy", "matcha_latte", "snaps"
		)

/obj/machinery/chemical_dispenser/deluxe/full
	spawn_cartridges = list(
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/water,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/coffee,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cream,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tea,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/icetea,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cola,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/smw,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/dr_gibb,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/spaceup,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tonic,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sodawater,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lemon_lime,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sugar,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/orange,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lime,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/watermelon,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lemon,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/coffee,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cafe_latte,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/soy_latte,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/hot_coco,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/milk,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cream,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tea,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/mint,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/orange,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lemon,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lime,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/berry,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lemon_lime,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sugar,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/orange,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lime,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sodawater,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tonic,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/beer,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/kahlua,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/whiskey,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/redwine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/vodka,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/gin,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/rum,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tequila,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/vermouth,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cognac,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ale,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/mead,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/champagne,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/grapesoda,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/singulo,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/doctorsdelight,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/nothing,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/banana,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/honey,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/egg,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/coco,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cherryjelly,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/carrotjuice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/applejuice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tomatojuice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/soymilk,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/peanutbutter,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/matcha_latte,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/gelatin,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/grenadine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/gingerale,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/roy_rogers,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/patron,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/goldschlager,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/melonliquor,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/bluecuracao,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/thirteenloko,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/deadrum,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sake,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/acidspit,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/amasec,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/beepskysmash,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/atomicbomb,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/nuka_cola,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/threemileisland,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/manhattan_proj,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/psilocybin,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/moonshine,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/specialwhiskey,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/unathiliquor,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/winebrandy,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/snaps
			)

/obj/machinery/chemical_dispenser/deluxe/New()
	..()

	if(spawn_cartridges)
		for(var/type in spawn_cartridges)
			add_cartridge_deluxe(new type(src))
			world << "test 1"

/obj/machinery/chemical_dispenser/deluxe/examine(mob/user)
	user << desc
	user << "It has [cartridges.len] cartridges installed, and has space for [max_cartridges - cartridges.len] more."

/obj/machinery/chemical_dispenser/deluxe/proc/add_cartridge_deluxe(obj/item/weapon/reagent_containers/chem_disp_cartridge/C, mob/user)
	if(!istype(C))
		if(user)
			user << "<span class='warning'>\The [C] will not fit in \the [src]!</span>"
		return

	if(cartridges.len >= max_cartridges)
		if(user)
			user << "<span class='warning'>\The [src] does not have any slots open for \the [C] to fit into!</span>"
		return

	if(!C.label)
		if(user)
			user << "<span class='warning'>\The [C] does not have a label!</span>"
		return

	if(cartridges[C.label])
		if(user)
			user << "<span class='warning'>\The [src] already contains a cartridge with that label!</span>"
		return

	if(user)
		user.drop_from_inventory(C)
		user << "<span class='notice'>You add \the [C] to \the [src].</span>"

	C.loc = src
	cartridges[C.label] = C
	cartridges = sortAssoc(cartridges)
	SSnanoui.update_uis(src)

/obj/machinery/chemical_dispenser/deluxe/attackby(obj/item/weapon/W, mob/user)
	if(W.is_wrench())
		playsound(src, W.usesound, 50, 1)
		user << "<span class='notice'>You begin to [anchored ? "un" : ""]fasten \the [src].</span>"
		if (do_after(user, 20 * W.toolspeed))
			user.visible_message(
				"<span class='notice'>\The [user] [anchored ? "un" : ""]fastens \the [src].</span>",
				"<span class='notice'>You have [anchored ? "un" : ""]fastened \the [src].</span>",
				"You hear a ratchet.")
			anchored = !anchored
		else
			user << "<span class='notice'>You decide not to [anchored ? "un" : ""]fasten \the [src].</span>"

	else if(istype(W, /obj/item/weapon/reagent_containers/chem_disp_cartridge))
		add_cartridge_deluxe(W, user)

	else if(W.is_screwdriver())
		var/label = input(user, "Which cartridge would you like to remove?", "Chemical Dispenser") as null|anything in cartridges
		if(!label) return
		var/obj/item/weapon/reagent_containers/chem_disp_cartridge/C = remove_cartridge(label)
		if(C)
			user << "<span class='notice'>You remove \the [C] from \the [src].</span>"
			C.loc = loc
			playsound(src, W.usesound, 50, 1)

	else if(istype(W, /obj/item/weapon/reagent_containers/glass) || istype(W, /obj/item/weapon/reagent_containers/food))
		if(container)
			user << "<span class='warning'>There is already \a [container] on \the [src]!</span>"
			return

		var/obj/item/weapon/reagent_containers/RC = W

		if(!accept_drinking && istype(RC,/obj/item/weapon/reagent_containers/food))
			user << "<span class='warning'>This machine only accepts beakers!</span>"
			return

		if(!RC.is_open_container())
			user << "<span class='warning'>You don't see how \the [src] could dispense reagents into \the [RC].</span>"
			return

		container =  RC
		user.drop_from_inventory(RC)
		RC.loc = src
		user << "<span class='notice'>You set \the [RC] on \the [src].</span>"
		SSnanoui.update_uis(src)

	else
		return ..()

/obj/machinery/vending/deluxe_boozeomat
	name = "Deluxe Drink Distributor"
	desc = "A top of the line and experimental drink vendor, it uses bluespace technology for storage!"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "deluxe_boozeomat"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/glass2/square = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/rocks = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/shake = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/cocktail = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/shot = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/pint = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/mug = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/wine = 25,
					/obj/item/weapon/reagent_containers/food/drinks/metaglass = 25,
					/obj/item/weapon/reagent_containers/food/drinks/metaglass/metapint = 25,
					/obj/item/weapon/glass_extra/stick = 50,
					/obj/item/weapon/glass_extra/straw = 50,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/gin = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/bluecuracao = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/cognac = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/grenadine = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/kahlua = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/melonliquor = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/rum = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/sake = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/specialwhiskey = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/tequilla = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/vermouth = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/wine = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/redeemersbrew = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/patron = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/snaps = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/holywater = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/small/ale = 50,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer = 50,
					/obj/item/weapon/reagent_containers/food/drinks/cans/tonic = 50,
					/obj/item/weapon/reagent_containers/food/drinks/cans/gingerale = 50,
					/obj/item/weapon/reagent_containers/food/drinks/cans/sodawater = 50,
					/obj/item/weapon/reagent_containers/food/drinks/tea = 50,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/cola = 15,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/space_up = 15,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/space_mountain_wind = 15,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/orangejuice = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/tomatojuice = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/limejuice = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/lemonjuice = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/applejuice = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/milk = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/cream = 10,
					/obj/item/weapon/reagent_containers/food/drinks/ice = 10,
					/obj/item/weapon/reagent_containers/food/drinks/flask/barflask = 10,
					/obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask = 10
					)

	contraband = list()
	vend_delay = 15
	idle_power_usage = 300
	req_access = list(access_bar)
	req_log_access = access_bar
	has_logs = 1

/obj/machinery/vending/deluxe_dinner
	name = "Deluxe Dining Distributor"
	desc = "A top of the line and experimental food vendor, it uses bluespace technology for storage!"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "deluxe_dining"
	products = list(/obj/item/weapon/tray = 8,
		/obj/item/weapon/material/kitchen/utensil/fork = 15,
		/obj/item/weapon/material/knife/plastic = 15,
		/obj/item/weapon/material/kitchen/utensil/spoon = 15,
		/obj/item/weapon/material/kitchen/rollingpin = 5,
		/obj/item/weapon/material/knife = 5,
		/obj/item/weapon/material/knife/butch = 3,
		/obj/item/clothing/suit/chef/classic = 3,
		/obj/item/weapon/storage/bag/food = 3,
		/obj/item/weapon/storage/toolbox/lunchbox = 10,
		/obj/item/weapon/storage/toolbox/lunchbox/heart = 10,
		/obj/item/weapon/storage/toolbox/lunchbox/cat = 10,
		/obj/item/weapon/storage/toolbox/lunchbox/nt = 10,
		/obj/item/weapon/storage/toolbox/lunchbox/mars = 10,
		/obj/item/weapon/storage/toolbox/lunchbox/cti = 10,
		/obj/item/weapon/storage/toolbox/lunchbox/nymph = 10,
		/obj/item/weapon/storage/toolbox/lunchbox/syndicate = 10,
		/obj/item/weapon/reagent_containers/food/snacks/bigbiteburger = 30,
		/obj/item/weapon/reagent_containers/food/snacks/meatsteak = 30,
		/obj/item/weapon/reagent_containers/food/snacks/fries = 30,
		/obj/item/weapon/reagent_containers/food/snacks/onionrings = 30,
		/obj/item/weapon/reagent_containers/food/snacks/cheeseburrito= 30,
		/obj/item/weapon/reagent_containers/food/snacks/enchiladas= 30,
		/obj/item/weapon/reagent_containers/food/snacks/meatburrito= 30,
		/obj/item/weapon/reagent_containers/food/snacks/taco= 30,
		/obj/item/weapon/reagent_containers/food/snacks/cheesenachos= 30,
		/obj/item/weapon/reagent_containers/food/snacks/cubannachos= 30,
		/obj/item/weapon/reagent_containers/food/snacks/tamales = 30,
		/obj/item/weapon/reagent_containers/food/snacks/bigos = 30,
		/obj/item/weapon/reagent_containers/food/snacks/concha = 30,
		/obj/item/weapon/reagent_containers/food/snacks/pandenata = 30,
		/obj/item/weapon/reagent_containers/food/snacks/tocino = 30,
		/obj/item/weapon/reagent_containers/food/snacks/stew= 20,
		/obj/item/weapon/reagent_containers/food/snacks/roastbeef = 20,
		/obj/item/weapon/reagent_containers/food/snacks/aesirsalad = 20,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/sushi = 20,
		/obj/item/weapon/reagent_containers/food/snacks/kitsuneudon = 20,
		/obj/item/weapon/reagent_containers/food/snacks/baguette = 30,
		/obj/item/weapon/reagent_containers/food/snacks/appletart = 30,
		/obj/item/weapon/reagent_containers/food/snacks/muffin = 30,
		/obj/item/weapon/reagent_containers/food/snacks/berrymuffin = 30,
		/obj/item/weapon/reagent_containers/food/snacks/cherrypie = 30,
		/obj/item/weapon/reagent_containers/food/snacks/sugarcookie = 30,
		/obj/item/weapon/reagent_containers/food/snacks/croissant = 30,
		/obj/item/weapon/reagent_containers/food/snacks/pie = 30,
		/obj/item/weapon/reagent_containers/food/snacks/poppypretzel = 30,
		/obj/item/weapon/reagent_containers/food/snacks/sugarcookie = 30,
		/obj/item/weapon/reagent_containers/food/snacks/waffles = 30,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/applecake = 10,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/birthdaycake = 10,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/carrotcake = 10,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/cheesecake = 10,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/chocolatecake = 10,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/lemoncake = 10,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/limecake = 10,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/orangecake = 10,
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/plaincake = 10)

	contraband = list()
	vend_delay = 15
	idle_power_usage = 300
	req_access = list(access_bar)
	req_log_access = access_bar
	has_logs = 1

/obj/item/weapon/storage/wallet/casino
	name = "casino wallet"
	desc = "A fancy casino wallet with flashy lights, oooh~"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "casinowallet_black"
	can_hold = list(
		/obj/item/weapon/spacecash,
		/obj/item/weapon/card,
		/obj/item/clothing/mask/smokable/cigarette/,
		/obj/item/device/flashlight/pen,
		/obj/item/device/tape,
		/obj/item/weapon/cartridge,
		/obj/item/device/encryptionkey,
		/obj/item/seeds,
		/obj/item/stack/medical,
		/obj/item/weapon/coin,
		/obj/item/weapon/dice,
		/obj/item/weapon/disk,
		/obj/item/weapon/implanter,
		/obj/item/weapon/flame/lighter,
		/obj/item/weapon/flame/match,
		/obj/item/weapon/forensics,
		/obj/item/weapon/glass_extra,
		/obj/item/weapon/haircomb,
		/obj/item/weapon/hand,
		/obj/item/weapon/key,
		/obj/item/weapon/lipstick,
		/obj/item/weapon/paper,
		/obj/item/weapon/pen,
		/obj/item/weapon/photo,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/sample,
		/obj/item/weapon/tool/screwdriver,
		/obj/item/weapon/stamp,
		/obj/item/clothing/accessory/permit,
		/obj/item/clothing/accessory/badge,
		/obj/item/weapon/makeover,
		/obj/item/weapon/spacecasinocash,
		/obj/item/weapon/casino_platinum_chip,
		/obj/item/weapon/deck,
		/obj/item/weapon/book/codex/casino
		)

/obj/item/weapon/storage/wallet/casino/verb/toggle_design()
	set category = "Object"
	set name = "Toggle design"
	set src in usr

	if (icon_state == "casinowallet_black")
		icon_state = "casinowallet_brown"
		return
	if (icon_state == "casinowallet_brown")
		icon_state = "casinowallet_white"
		return
	else
		icon_state = "casinowallet_black"

/obj/machinery/casino_chip_exchanger
	name = "Casino Chip Exchanger"
	desc = "Converts thalers to casino chips at a ratio of 5 thalers to 1 chip! It can also convert chips back to thalers at the same rate."
	icon = 'icons/obj/casino_ch.dmi'
	icon_state ="casino_atm"
	anchored = 1

/obj/machinery/casino_chip_exchanger/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I,/obj/item/weapon/spacecash))
		//consume the money
		if(prob(50))
			playsound(loc, 'sound/items/polaroid1.ogg', 50, 1)
		else
			playsound(loc, 'sound/items/polaroid2.ogg', 50, 1)

		user << "<span class='info'>You insert [I] into [src].</span>"
		spawn_casinochips(round(I:worth/5), src.loc)
		src.attack_hand(user)
		qdel(I)
	if(istype(I,/obj/item/weapon/spacecasinocash))
		//consume the money
		if(prob(50))
			playsound(loc, 'sound/items/polaroid1.ogg', 50, 1)
		else
			playsound(loc, 'sound/items/polaroid2.ogg', 50, 1)

		user << "<span class='info'>You insert [I] into [src].</span>"
		spawn_money(round(I:worth*5), src.loc)
		src.attack_hand(user)
		qdel(I)

/obj/machinery/wheel_of_fortune
	name = "wheel of fortune"
	desc = "The Wheel of Fortune! Insert chips and may fortune favour the lucky one at the next lottery!"
	icon = 'icons/obj/64x64_ch.dmi'
	icon_state = "wheel_of_fortune"
	density = 1
	anchored = 1
	pixel_x = -16

	req_access = list(300)
	var/interval = 1
	var/busy = 0
	var/public_spin = 0
	var/lottery_sale = "disabled"
	var/lottery_price = 100
	var/lottery_entries = 0
	var/lottery_tickets = list()
	var/lottery_tickets_ckeys = list()

	var/datum/effect/effect/system/confetti_spread
	var/confetti_strength = 15


/obj/machinery/wheel_of_fortune/attack_hand(mob/user as mob)
	if (busy)
		to_chat(user,"<span class='notice'>The wheel of fortune is already spinning!</span> ")
		return

	if(usr.incapacitated())
		return
	if(ishuman(usr) || istype(usr, /mob/living/silicon/robot))
		switch(input(user,"Choose what to do","Wheel Of Fortune") in list("Spin the Wheel! (Not Lottery)", "Set the interval", "Cancel"))
			if("Cancel")
				return
			if("Spin the Wheel! (Not Lottery)")
				if(public_spin == 0)
					to_chat(user,"<span class='notice'>The Wheel makes a sad beep, public spins are not enabled right now..</span> ")
					return
				else
					to_chat(user,"<span class='notice'>You spin the wheel!</span> ")
					spin_the_wheel("not_lottery")
			if("Set the interval")
				setinterval()


/obj/machinery/wheel_of_fortune/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (busy)
		to_chat(user,"<span class='notice'>The wheel of fortune is already spinning!</span> ")
		return

	if(usr.incapacitated())
		return

	if(istype(W, /obj/item/weapon/card/id)||istype(W, /obj/item/device/pda))
		if(!check_access(W))
			to_chat(user, "<span class='warning'>Access Denied.</span>")
			return
		else
			to_chat(user, "<span class='warning'>Proper access, allowed staff controls.</span>")
			if(ishuman(usr) || istype(usr, /mob/living/silicon/robot))
				switch(input(user,"Choose what to do (Management)","Wheel Of Fortune (Management)") in list("Spin the Lottery Wheel!", "Toggle Lottery Sales", "Toggle Public Spins", "Reset Lottery", "Cancel"))
					if("Cancel")
						return
					if("Spin the Lottery Wheel!")
						to_chat(user,"<span class='notice'>You spin the wheel for the lottery!</span> ")
						spin_the_wheel("lottery")

					if("Toggle Lottery Sales")
						if(lottery_sale == "disabled")
							lottery_sale = "enabled"
							to_chat(user,"<span class='notice'>Public Lottery sale has been enabled.</span> ")
						else
							lottery_sale = "disabled"
							to_chat(user,"<span class='notice'>Public Lottery sale has been disabled.</span> ")

					if("Toggle Public Spins")
						if(public_spin == 0)
							public_spin = 1
							to_chat(user,"<span class='notice'>Public spins has been enabled.</span> ")
						else
							public_spin = 0
							to_chat(user,"<span class='notice'>Public spins has been disabled.</span> ")

					if("Reset Lottery")
						var/confirm = tgui_alert(usr, "Are you sure you want to reset Lottery?", "Confirm Lottery Reset", list("Yes", "No"))
						if(confirm == "Yes")
							to_chat(user, "<span class='warning'>Lottery has been Reset!</span>")
							lottery_entries = 0
							lottery_tickets = list()
							lottery_tickets_ckeys = list()

	if(istype(W, /obj/item/weapon/spacecasinocash))
		if(lottery_sale == "disabled")
			to_chat(user, "<span class='warning'>Lottery sales are currently disabled.</span>")
			return
		else
			if(user.client.ckey in lottery_tickets_ckeys)
				to_chat(user, "<span class='warning'>The scanner beeps in an upset manner, you already have a ticket!</span>")
				return
			else
				var/obj/item/weapon/spacecasinocash/C = W
				insert_chip(C, user)

/obj/machinery/wheel_of_fortune/proc/insert_chip(var/obj/item/weapon/spacecasinocash/cashmoney, mob/user)
	if (busy)
		to_chat(user,"<span class='notice'>The Wheel of Fortune is busy, wait for it to be done to buy a lottery ticket.</span> ")
		return
	if(cashmoney.worth < lottery_price)
		to_chat(user,"<span class='notice'>You dont have enough chips to buy a lottery ticket!</span> ")
		return

	to_chat(user,"<span class='notice'>You put [lottery_price] credits worth of chips into the Wheel of Fortune and it pings to notify of your lottery ticket registered!</span>")
	cashmoney.worth -= lottery_price
	cashmoney.update_icon()

	if(cashmoney.worth <= 0)
		usr.drop_from_inventory(cashmoney)
		qdel(cashmoney)
		cashmoney.update_icon()

	lottery_entries++
	lottery_tickets += "Number.[lottery_entries] [user.name]"
	lottery_tickets_ckeys += user.client.ckey

/obj/machinery/wheel_of_fortune/proc/spin_the_wheel(var/mode)
	var/result = 0

	if(mode == "not_lottery")
		busy = 1
		icon_state = "wheel_of_fortune_spinning"
		result = rand(1,interval)

		spawn(5 SECONDS)
			visible_message("<span class='notice'>The wheel of fortune stops spinning, the number is [result]!</span>")
			src.confetti_spread = new /datum/effect/effect/system/confetti_spread()
			src.confetti_spread.attach(src) //If somehow people start dragging slot machine
			spawn(0)
				for(var/i = 1 to confetti_strength)
					src.confetti_spread.start()
					sleep(10)

			flick("[icon_state]-winning",src)
			busy = 0
			icon_state = "wheel_of_fortune"

	if(mode == "lottery")
		if(lottery_entries == 0)
			visible_message("<span class='notice'>There are no tickets in the system!</span>")
			return

		busy = 1
		icon_state = "wheel_of_fortune_spinning"
		result = pick(lottery_tickets)

		spawn(5 SECONDS)
			visible_message("<span class='notice'>The wheel of fortune stops spinning, and the winner is [result]!</span>")
			src.confetti_spread = new /datum/effect/effect/system/confetti_spread()
			src.confetti_spread.attach(src) //If somehow people start dragging slot machine
			spawn(0)
				for(var/i = 1 to confetti_strength)
					src.confetti_spread.start()
					sleep(10)

			flick("[icon_state]-winning",src)
			busy = 0
			icon_state = "wheel_of_fortune"


/obj/machinery/wheel_of_fortune/verb/setinterval()
	set name = "Change interval"
	set category = "Object"
	set src in view(1)

	if(usr.incapacitated())
		return
	if(ishuman(usr) || istype(usr, /mob/living/silicon/robot))
		interval = input("Put the desired interval (1-1000)", "Set Interval") as num
		if(interval>1000 || interval<1)
			usr << "<span class='notice'>Invalid interval.</span>"
			return
		usr << "<span class='notice'>You set the interval to [interval]</span>"
	return

/obj/machinery/casinoslave_handler
	name = "Sentient Prize Automated Sales Machinery"
	desc = "The Sentient Prize Automated Sales Machinery, also known as SPASM! Here one can see who is on sale as sentinet prizes, as well as selling self and also buying prizes."
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "casinoslave_hub_off"
	density = 1
	anchored = 1
	req_access = list(300)

	var/casinoslave_sale = "disabled"
	var/casinoslave_price = 100
	var/collar_list = list()
	var/slaves_ckeys_list = list() //Same trick as lottery, to keep life simple
	var/obj/item/clothing/accessory/collar/casinoslave/selected_collar = null

/obj/machinery/casinoslave_handler/attack_hand(mob/living/user as mob)
	if(usr.incapacitated())
		return
	if(casinoslave_sale == "disabled")
		to_chat(user,"<span class='notice'>The SPASM is disabled.</span> ")
		return

	if(ishuman(usr) || istype(usr, /mob/living/silicon/robot))
		switch(input(user,"Choose what to do","SPASM") in list("Show selected Prize", "Select Prize", "Become Prize (Please examine yourself first)", "Cancel"))
			if("Cancel")
				return
			if("Show selected Prize")
				if(QDELETED(selected_collar))
					collar_list -= selected_collar
					slaves_ckeys_list -= selected_collar.slaveckey
					to_chat(user, "<span class='warning'>No collar is currently selected or the currently selected one has been destroyed or disabled.</span>")
					selected_collar = null
					return
				to_chat(user, "<span class='warning'>Sentient Prize information</span>")
				to_chat(user, "<span class='notice'>Name: [selected_collar.slavename]</span>")
				to_chat(user, "<span class='notice'>Description: [selected_collar.slaveflavor]</span>")
				to_chat(user, "<span class='notice'>OOC: [selected_collar.slaveooc]</span>")
				if(selected_collar.ownername != null)
					to_chat(user, "<span class='warning'>This prize is already owned by [selected_collar.ownername]</span>")

			if("Select Prize")
				selected_collar = tgui_input_list(user, "Select a prize", "Chose a collar", collar_list)
				if(QDELETED(selected_collar))
					collar_list -= selected_collar
					slaves_ckeys_list -= selected_collar.slaveckey
					to_chat(user, "<span class='warning'>No collars to chose, or selected collar has been destroyed or deactived, selection has been removed from list.</span>")
					selected_collar = null
					return

			if("Become Prize (Please examine yourself first)") //Its awkward, but no easy way to obtain flavor_text due to server not loading text of mob until its been examined at least once.
				var/safety_ckey = user.client.ckey
				if(safety_ckey in slaves_ckeys_list)
					to_chat(user, "<span class='warning'>The SPASM beeps in an upset manner, you already have a collar!</span>")
					return
				var/confirm = tgui_alert(usr, "Are you sure you want to become a sentient prize?", "Confirm Sentient Prize", list("Yes", "No"))
				if(confirm == "Yes")
					to_chat(user, "<span class='warning'>You are now a prize!</span>")
				if(confirm == "No")
					to_chat(user, "<span class='warning'>The SPASM beeps in a sad manner at your impolite decline..</span>")
					return
				if(safety_ckey in slaves_ckeys_list)
					to_chat(user, "<span class='warning'>The SPASM beeps in an upset manner, you already have a collar!</span>")
					return
				slaves_ckeys_list += user.ckey
				var/obj/item/clothing/accessory/collar/casinoslave/C = new(src.loc)
				C.slavename = "[user.name]"
				C.slaveckey = "[user.ckey]"
				C.slaveflavor = user.flavor_text
				C.slaveooc = user.ooc_notes
				C.name = "Sentient Prize Collar: Available! [user.name] purchaseable at the SPASM!"
				C.desc = "Golden Goose Sentient Prize collar. The tags shows in flashy colorful text the wearer is [user.name] and is currently available to buy at the Sentient Prize Automated Sales Machinery!"
				C.icon_state = "casinoslave_available"
				C.update_icon()
				collar_list += C

				spawn_casinochips(casinoslave_price, src.loc)

/obj/machinery/casinoslave_handler/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(usr.incapacitated())
		return

	if(istype(W, /obj/item/weapon/spacecasinocash))
		if(casinoslave_sale == "disabled")
			to_chat(user, "<span class='warning'>Sentient Prize sales are currently disabled.</span>")
			return
		if(!selected_collar.ownername)
			var/obj/item/weapon/spacecasinocash/C = W
			if(user.client.ckey == selected_collar.slaveckey)
				insert_chip(C, user, "selfbuy")
				return
			else
				insert_chip(C, user, "buy")
				return
		else
			to_chat(user, "<span class='warning'>This Sentient Prize is already owned! If you are the owner you can release the prize by swiping the collar on the SPASM!</span>")
			return

	if(istype(W, /obj/item/clothing/accessory/collar/casinoslave))
		var/obj/item/clothing/accessory/collar/casinoslave/C = W
		if(user.name != C.slavename && user.name != C.ownername)
			to_chat(user, "<span class='warning'>This Sentient Prize collar isn't yours, please give it to the one it tagged for, belongs to, or a casino staff member!</span>")
			return
		if(user.name == C.slavename)
			if(!C.ownername)
				to_chat(user,"<span class='notice'>If collar isn't disabled and entry removed, please select your entry and insert chips. Or contact staff if you need assistance.</span> ")
				return
			else
				to_chat(user,"<span class='notice'>If collar isn't disabled and entry removed, please ask your owner to free you with collar swipe on the SPASM, or contact staff if you need assistance.</span> ")
				return
		if(user.name == C.ownername)
			var/confirm = tgui_alert(usr, "Are you sure you want to wipe [C.slavename] entry?", "Confirm Sentient Prize Release", list("Yes", "No"))
			if(confirm == "Yes")
				to_chat(user, "<span class='warning'>[C.slavename] collar has been deleted from registry!</span>")
				C.icon_state = "casinoslave"
				C.update_icon()
				C.name = "a disabled Sentient Prize Collar: [C.slavename]"
				C.desc = "A collar worn by sentient prizes on the Golden Goose Casino. The tag says its registered to [C.slavename], but harsh red text informs you its been disabled."
				slaves_ckeys_list -= C.slaveckey
				C.slaveckey = null
				collar_list -= C

	if(istype(W, /obj/item/weapon/card/id)||istype(W, /obj/item/device/pda))
		if(!check_access(W))
			to_chat(user, "<span class='warning'>Access Denied.</span>")
			return
		else
			to_chat(user, "<span class='warning'>Proper access, allowed staff controls.</span>")
			if(ishuman(usr) || istype(usr, /mob/living/silicon/robot))
				switch(input(user,"Choose what to do (Management)","SPASM (Management)") in list("Toggle Sentient Prize Sales", "Wipe Selected Prize Entry", "Change Prize Value", "Cancel"))
					if("Cancel")
						return

					if("Toggle Sentient Prize Sales")
						if(casinoslave_sale == "disabled")
							casinoslave_sale = "enabled"
							icon_state = "casinoslave_hub_on"
							update_icon()
							to_chat(user,"<span class='notice'>Prize sale has been enabled.</span> ")
						else
							casinoslave_sale = "disabled"
							icon_state = "casinoslave_hub_off"
							update_icon()
							to_chat(user,"<span class='notice'>Prize sale has been disabled.</span> ")

					if("Wipe Selected Prize Entry")
						if(!selected_collar)
							to_chat(user, "<span class='warning'>No collar selected!</span>")
							return
						if(QDELETED(selected_collar))
							collar_list -= selected_collar
							slaves_ckeys_list -= selected_collar.slaveckey
							to_chat(user, "<span class='warning'>Collar has been destroyed!</span>")
							selected_collar = null
							return
						var/safety_ckey = selected_collar.slaveckey
						var/confirm = tgui_alert(usr, "Are you sure you want to wipe [selected_collar.slavename] entry?", "Confirm Sentient Prize", list("Yes", "No"))
						if(confirm == "Yes")
							if(safety_ckey == selected_collar.slaveckey)
								to_chat(user, "<span class='warning'>[selected_collar.slavename] collar has been deleted from registry!</span>")
								selected_collar.icon_state = "casinoslave"
								selected_collar.update_icon()
								selected_collar.name = "a disabled Sentient Prize Collar: [selected_collar.slavename]"
								selected_collar.desc = "A collar worn by sentient prizes on the Golden Goose Casino. The tag says its registered to [selected_collar.slavename], but harsh red text informs you its been disabled."
								slaves_ckeys_list -= selected_collar.slaveckey
								selected_collar.slaveckey = null
								collar_list -= selected_collar
								selected_collar = null
							else
								to_chat(user, "<span class='warning'>Registry deletion aborted! Changed collar selection!</span>")
								return

					if("Change Prize Value")
						setprice(user)

/obj/machinery/casinoslave_handler/proc/insert_chip(var/obj/item/weapon/spacecasinocash/cashmoney, mob/user, var/buystate)
	if(cashmoney.worth < casinoslave_price)
		to_chat(user,"<span class='notice'>You dont have enough chips to pay for the sentient prize!</span> ")
		return

	cashmoney.worth -= casinoslave_price
	cashmoney.update_icon()

	if(cashmoney.worth <= 0)
		usr.drop_from_inventory(cashmoney)
		qdel(cashmoney)
		cashmoney.update_icon()

	if(buystate == "selfbuy")
		to_chat(user,"<span class='notice'>You put [casinoslave_price] credits worth of chips into the SPASM and nullify your collar!</span> ")
		selected_collar.icon_state = "casinoslave"
		selected_collar.update_icon()
		selected_collar.name = "a disabled Sentient Prize Collar: [selected_collar.slavename]"
		selected_collar.desc = "A collar worn by sentient prizes on the Golden Goose Casino. The tag says its registered to [selected_collar.slavename], but harsh red text informs you its been disabled."
		slaves_ckeys_list -= selected_collar.slaveckey
		selected_collar.slaveckey = null
		collar_list -= selected_collar
		selected_collar = null

	if(buystate == "buy")
		to_chat(user,"<span class='notice'>You put [casinoslave_price] credits worth of chips into the SPASM and it pings to inform you bought [selected_collar.slavename]!</span> ")
		selected_collar.icon_state = "casinoslave_owned"
		selected_collar.update_icon()
		selected_collar.ownername = user.name
		selected_collar.name =  "Sentient Prize Collar: [selected_collar.slavename] owned by [selected_collar.ownername]!"
		selected_collar.desc = "A collar worn by sentient prizes on the Golden Goose Casino. The tag says its registered to [selected_collar.slavename] and they are owned by [selected_collar.ownername]."
		selected_collar = null

/obj/machinery/casinoslave_handler/proc/setprice(mob/living/user as mob)
	if(usr.incapacitated())
		return
	if(ishuman(usr) || istype(usr, /mob/living/silicon/robot))
		casinoslave_price = input("Select the desired price (1-1000)", "Set Price") as num
		if(casinoslave_price>1000 || casinoslave_price<1)
			to_chat(user,"<span class='notice'>Invalid price.</span> ")
			return
		to_chat(user,"<span class='notice'>You set the price to [casinoslave_price]</span> ")



/obj/item/weapon/book/codex/casino
	name = "A Dummy Guide To Losing Your Thalers"
	desc = "A pristine book with the detailed and golden framed card on the front of the leather covers. \ It's written by an an author you have never heard of before, 'Sleazy Serpent Saren' does sound pretty trustworthy!"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "casinomanual"
	item_state = "casinomanual"
	unique = TRUE
	w_class = 2 // To allow it to be stuffed away into wallets for easy readings during events
	root_type = /datum/lore/codex/category/casinomanual
	libcategory = "Reference"

/datum/lore/codex/category/casinomanual
	name = "Foreword"
	data = "It's not about winning, it's about having fun!\
	<br><br>\
	In this book I'll teach you all about how to gamble your money away or at least get lucky and win some at The Golden Space Goose!\
	This book also has a handy little overview of the prizes one can earn and the limitations of what can do with the living and breathing ones.\
	(This book will also contain out of character information to help people be aware of how touchy subjects like sentient prizes are to be handled."

	children = list(
		/datum/lore/codex/category/casinomanual_games,
		/datum/lore/codex/category/casinomanual_casinoactivites,
		/datum/lore/codex/category/casinomanual_prizes,
		/datum/lore/codex/page/casinomanual_sentientprizes
		)

		//datum/lore/codex/page/casinomanual_history
		//datum/lore/codex/page/casinomanual_managementguide

/datum/lore/codex/page/casinomanual_history/add_content()
	name = "Golden Space Goose History"
	keywords += list("Casino History")
	data = "WIP"

/datum/lore/codex/category/casinomanual_games
	name = "Casino Games"
	data = "Currently the Golden Space Goose offers Blackjack, Poker and Roulette for crew aside from the other more sociable and non-gambling activities.\
	The information presented in these topics sets the standards of rules for a default game as well as help you get an idea of how the games work.\
	Individual dealers can decide to alter the rules at their table but are required to inform all players of the non-default conditions."

	children = list(
		/datum/lore/codex/page/casinomanual_blackjack,
		/datum/lore/codex/page/casinomanual_poker,
		/datum/lore/codex/page/casinomanual_roulette
		)

/datum/lore/codex/page/casinomanual_blackjack/add_content()
	name = "Blackjack"
	keywords += list("Gambling", "Blackjack", "Games")
	data = "First up is the classic sport of blackjack, blackjack is played normally between a gambler and a dealer, the goal is to have the higher number than the opponent but not go above 21 or it will be a bust and one loses automatically.<br>\
			The values of cards are as follow:<br>\
			Ace - 1 or 11, can be freely decided at any moment<br>\
			2 - 10 - value coresponding to their number<br>\
			All face cards excluding joker - Value of 10<br><br>\
			A game of blackjack begins with the dealer giving the gambler two cards, in normal blackjack all cards dealt to gambler and dealer are always shown. The two cards dealt have their values put together, the gambler has three choices, stand, hit, or double down.<br><br>\
			Stand - Gambler or dealer decides not to draw any more cards and it becomes the dealers turn or ends.<br>\
			Hit - 10 - The dealer draws a new card, adding to the existing hand, if its a bust the game will end and they will lose.<br>\
			Double down - A risky move the gambler can do, the dealer draws one more card and the bet is doubled, but no more cards can be drawn and it becomes the dealer's turn.<br><br>\
			When it becomes the dealer's turn they do the same as the gambler, though their only goal is to get a higher or equal value to gambler.<br>\
			The dealer cant double down, and the large majority of casino's has the rule that a dealer cant draw anymore cards once they reach or go above a value. The most common value is 17, and there are two variants to that rule, soft and hard 17.<br>\
			Soft 17 - If the gambler gets 17 or above, they can draw another card unless they value has been reached by an ace counting as 11.<br>\
			Hard 17 - They dealer must stop if they get a value of 17. No matter what value ace represents.<br><br>\
			The casino who supplies this version of the manual follows the rule of hard 17 as well as revealing the first card the dealer gets before the gambler can begin hit, stand and doubling down.<br>\
			The game ends when the gambler or dealer busts, dealer reaches the threshold of what they are allowed to draw, or if they get a higher value than the gambler.<br>\
			Again, the one who has the highest value that isnt higher than 21 wins, but if both has the same value no one wins and the bet goes back to the gambler.<br>\
			And thats it! Now go out there and gamble your savings away! This casino allows bets between 10 and 100 by default with individual dealer free to decide highher betting roof."

/datum/lore/codex/page/casinomanual_poker/add_content()
	name = "Poker"
	keywords += list("Gambling", "Poker", "Games")
	data = "Aaah yes, good old poker. This casino runs by the rules of texas hold em, though the might be a little modified to be simpler for the average joe. In a game of poker it can be a single gambler and a dealer against each other,<br>\
			but most often its the dealer making the game proceed while several gamblers fights tooth and nail to steal each others chips, but the dealer can still join in on the free for all if they so wish!<br>\
			To simply explain the game, people gamble with each other, a game of trying to get the best hand and raise bets or back out depending on what the outcome may be. The game starts with everyone betting a certain amount,<br>\
			it can be 5 to 50 chips depending on dealer, but if one wants to join, there needs to be chips on that table! Once everyone has made their initial bet, everyone gets two cards face down, these are kept hidden, <br>\
			no one not even dealer gets to see players cards until the end, not even folded cards are to be shown unless wanted to, sometimes its better making people unsure if you dropped out with bad cards or if you have other motives, deception is a large part of this game!<br>\
			With everyone having cards dealt, its time for the dealer to lay three on the table face up, these cards are 3 of 5 cards in the community pool, everyone can use these cards to make sets like pairs and such,<br>\
			this doesnt mean they are taken, multiple people can use the same community card for their own sets!<br><br>\
			With the community having three we enter the second betting stage, here people have two options, standing or raising. Standing means you dont want to raise, raising explains itself, though if someone bets, people have three options,<br>\
			commit putting the chips in to risk as much as the raised bet, but if one doesnt have enough, then they can still go all in with their remaining chips, one can also drop out if its too risky, the chips bet will remain on the table, but at least you wont lose more eh?<br>\
			Final one is to raise further, sometimes people can dare each other to raise more, but its not allowed for someone to raise, then raise further if no one else raises after them!<br>\
			As said earlier, we got like a community pool of 5 cards total, this time another card is revealed and we enter a new betting phase, then the final fifth card is revealed and final bets are made, and then the cards are revealed so it can be determined who has the best hand!<br>\
			If two or more have equally good sets, then the chips are split evenly between them. But notice, if someone is left because everyone else didnt dare to raise with their bet, they can decide to not reveal their hand,<br>\
			they might have had a winning hand, or maybe its terrible and they just bluffed their way to victory, only they know and can decide if they want to expose their cards to gloat or confuse their opponents. So in summary, the game can be simple, but hard to master!<br>\
			And here is the order of winning hands folks!<br><br>\
			Royal flush - The big and best one, this is a set of a 10, Ace, Knave/Jack, Queen and King of the same suit.<br>\
			Straight flush - This one is also definently a winner, though can be easier to get as it just needs to be five cards making a sraight of the same suit, an example being black 3 to 7.<br>\
			Four of a kind - Nice one, if you get this then you got a good chance to win. The value of the cards determine who wins, so ace is the best followed by king, queen and jack, then the peasant number cards!<br>\
			Full House - This one is good, but it requires you have three of a kind and a two of a kind, obviously value is part of the house, so the best roof is made of Ace with king making a strong foundation!<br>\
			Flush - This one requires the gambler to have 5 cards of a suit, not in any order, but the highest value card determines worth, so hope you got an Ace in your combo!<br>\
			Straight - Its like the royal flush, but can be any suits in combo, Ace can be lowest from Ace to 5 or highest from 10 to Ace!<br>\
			Three of a kind - Explains itself well enough, get three together and you got something going, lets hope you can build a house!<br>\
			Two pairs - You almost got yourself a house! But at least at this point its something!<br>\
			A pair - The worst set you can get, but you might be extremely lucky and have this while others have an inferior pair or the worst possible hand ever which is...<br>\
			High card - The absolute worst, if you cant get any of those sets, then you got this sad case, if a game mananages to end with no one getting a set, then the one with the highest value cards wins<br><br>\
			Wew, what a long lesson, but thats how one does the Texas hold em here at this casino, hope you guys have fun winning and losing your hard earned cash with this one!"

/datum/lore/codex/page/casinomanual_roulette/add_content()
	name = "Roulette"
	keywords += list("Gambling", "Roulette", "Games")
	data = "So this game of roulette is all about chance! what happens is that people bet on different odds and hope for the best as the dealer rolls the ball and makes that roulette thingy make than fun addicting spin!<br>\
			Once it lands on a number between 0 and 36 its either bust or payout! Pretty simple, right?<br>\
			Everyone starts by putting their bets down, people can bet more than once before the ball goes rolling, the odds and their payoffs are these:<br><br>\
			Single number - 35/1 payoff - The most unlikely one to get, but if the ball lands on your number, then youre loaded!<br>\
			Split Number - 17/1 - Choose an interval of 2, not very likely and therefore big reward!<br>\
			Row - 11/1 - Choose an interval of 3, more likely so not the biggest outcome!<br>\
			Split - 8/1 - Choose an interval of 4, not gonna win big time.<br>\
			Split row - 5/1 - Choose an interval of 6, getting to the safer bets.<br>\
			Column - 2/1 - Choose an interval of 12, boring, but likely.<br>\
			Red/Black - 1/1 - Red are odd numbers while black are even, simple stuff. These are the safest bets there are!<br><br>\
			Theres not much more to it! Bets made, ball rolls, number announced, people win, people lose! Bets allowed here are from 5 to 50 per bet.<br>\
			Oh, im also being told this casino has the fancy rule that if ball lands on 0, one wins at least one bet no matter what it is! So lets hope you got that big bet on a single number!"

/datum/lore/codex/category/casinomanual_casinoactivites
	name = "Social Casino Games"
	data = "While the Golden Space Goose constantly moves and visits new places, it also arranges activities if it lands somewhere on the surface of planets.\
	Some crew might be down on their luck or prefering obtaining chips in a manner that doesn't take from others or gamble their current funds.\
	As explained in the history of the casino, crew have socially strengthening and teambuilding activities to gain chips by the generous and benevolent funding from NanoTransen.\
	So far the casino always offer to endorse Cards Against The Galaxy and toy Mech battles with crews participating and winning gaining chips risk free and having a laugh with fellow crew!"

	children = list(
		/datum/lore/codex/page/casinomanual_cog,
		/datum/lore/codex/page/casinomanual_mechbattle
		)

/datum/lore/codex/page/casinomanual_cog/add_content()
	name = "Cards Against The Galaxy"
	keywords += list("Social", "Cards Against The Galaxy", "Games")
	data = "The idea with Cards Against The Galaxy is that 3 or more players, preferably 4 to 5 players sits with 7 white cards on their hands with random words on them.<br>\
	 One player each round is the 'Card Czar' and draws a black card with a question or phrase, there are one or more blank lines and each player draws cards and lays out secretly for the Czar to read.<br>\
	 The Czar reads them and chooses the combination of the black and white cards that they like best, and the player who put those cards down wins the round and the black card as a point.<br><br>\
	 It's a simple and fun game, far more focused on crew having fun and a good laugh together. Best part is that if a casino staffmember verifies you all played a round, everyone gets 25 chips with the winner of the round getting an additional 25!"

/datum/lore/codex/page/casinomanual_mechbattle/add_content()	//WIP, in future events set up proper mech toy fighting if feature isnt broken
	name = "Mech Battle Showdown"
	keywords += list("Gambling", "Mech toys", "Games")
	data = "At the current date The Golden Space Goose isn't officially hosting toy mech showdowns where crew fights each other with their toy mechs, with winner gaining more chips than loser if a casino crewmember is around to verify a proper fight. Please visit both to see if there is informational documents about mech showdowns being hosted or not."

/datum/lore/codex/category/casinomanual_prizes
	name = "Prizes"
	data = "Hey folks, welcome to the prize section! First off I wanna tell you some great news! Nanotransen has gone along with a nice deal that allows crew to occasionally keep their hard earned rewards on station for a limited time,<br>\
	 now you can enjoy your new fancy toolbelt or bluespace beaker for more than just the shift where the casino comes around!<br>\
     (Be aware, there can be limitations on how many rewards you get to keep after the shift, it might be unfair if some shows up and wins one thing, while they watch as command staff crew with high background income as well as hyperactive miners walks home with 20 prizes they get to enjoy while having almost done no gambling at all.))<br><br>\
	Lets get to the prizes and exchange rate before we get started on the stuff specifically for the booth operators, so heres the current prizes one can win and their costs! Be aware there might be new prizes or absent ones from time to time!<br>\

	EXCHANGE RATE<br>\
	FROM	=	TO<br>\
	5 Thalers = 1 casino chip<br>\
	1 casino chip = 2.5 Thalers (rounded down)"

	children = list(
		/datum/lore/codex/page/casinomanual_weapons,
		/datum/lore/codex/page/casinomanual_gear,
		/datum/lore/codex/page/casinomanual_clothing,
		/datum/lore/codex/page/casinomanual_miscellaneous,
		/datum/lore/codex/page/casinomanual_drinks,
		/datum/lore/codex/page/casinomanual_pets,
		/datum/lore/codex/page/casinomanual_mechs,
		/datum/lore/codex/page/casinomanual_implants
		)

/datum/lore/codex/page/casinomanual_weapons/add_content()
	name = "Prizes: Weapons"
	keywords += list("Prizes", "Weapons")
	data = "(disclaimer, giving out guns will mean you get a weapons license as well with the shifts you have it, abusing these weapons will quickly get them removed!)\
	<br><br> Scepter	500 <br>Chain of command 250 <br>Sizegun 100 <br>Advanced anti particle rifle 500 <br>Temperature gun 250 <br>Alien pistol 1000 <br>Floral somatoray 250 <br>Net gun 500"

/datum/lore/codex/page/casinomanual_gear/add_content()
	name = "Prizes: Gear"
	keywords += list("Prizes", "Gear")
	data = "experimental welder 500 <br>alien belt 750 <br>alien enhancement vest 750 <br>The monocoole 1000 <br>Chameleon black tie 250 <br>Cryostasis beaker 200 <br>Bluespace beaker 200 <br>Chem sprayer 250"

/datum/lore/codex/page/casinomanual_clothing/add_content()
	name = "Prizes: Clothing"
	keywords += list("Prizes", "Clothing")
	data = "Masks and hats - All masks and hats are 50 except chameleon!<br>\
		Costumes - All costumes are 100 except the hoodies which are 50!<br><br>\
		Assistant hat <br>Shark mask <br>Pig mask <br>Luchador mask <br>Horse mask <br>Goblin mask <br>Fake moustache <br>Dolphin mask <br>Demon mask <br>Chameleon gas mask 250\
		<br><br>Black bunny girl outfit (black suit and rabbit ears) <br>White bunny girl outfit (white suit and rabbit ears) <br>Corgi hoodie <br>Sexy clown <br>Nyan girl <br>Wizard <br>Chicken\
		<br>Carp hoodie <br>Sexy mime <br>Pirate <br>Commie <br>Plague doctor <br>Imperium monk <br>Cute witch <br>Gladiator"


/datum/lore/codex/page/casinomanual_miscellaneous/add_content()
	name = "Prizes: Miscellaneous"
	keywords += list("Prizes", "Miscellaneous")
	data = "Toys and misc - Everything that isn't instruments are 50, instruments are 100 with few excecptions!<br><br>\
		Toy sword <br>Water flower <br>Stick horse <br>Replica katana <br>Magic conch <br>Magic 8-ball <br>Foam sword <br>Foam crossbow (with 5 bolts) <br>Bosun's whistle <br>Golden cup\
		<br>Havana cigar case <br>Casino wallet (to keep after shift) <br>Casino card deck (to keep after shift) <br>Casino Sentient Prize Collar (to keep after shift)<br>\
		Accordion<br>Banjo<br>Musical Bikehorn<br>Electric Guitar<br>Glockenspiel<br>Guitar<br>Harmonica<br>Keytar<br>Musical Moth (Illegal in multiple systems for obvious reasons.. You monster..)<br>\
		Synthethic Piano<br>Recorder<br>Saxophone<br>Haunted Saxophone 200<br>Trombone<br>Haunted Trombone 200<br>Trumpet<br>Haunted Trumpet 200<br>Violin<br>Golden Fiddle 250<br>Xylophone"

/datum/lore/codex/page/casinomanual_drinks/add_content()
	name = "Prizes: Drinks"
	keywords += list("Prizes", "Drinks")
	data = "All is 50!<br><br>\
		 Redeemer brew <br>Warlock velvet <br>Wrapp artiste patron <br>Flask of holy water <br>College girl goldschlager <br>Gilthari luxury champagne <br>Bottle of nothing <br>Special blend whiskey <br>Akvavit"

/datum/lore/codex/page/casinomanual_pets/add_content()
	name = "Prizes: Pets"
	keywords += list("Prizes", "Pets")
	data = "Armadillo 150 <br>Cat 150 <br>Goat 150 <br>Fox 150 <br>Lizard 150 <br>Penguin 150 <br>Goose 200	<br>Chicken 200	<br>Cow 200	<br>Corgi 200 <br>Yithian 200 <br>Tindalos 200 <br>Fennec 300 <br>Red Panda 300\
		<br>Horse 300 <br>Otie 500 <br>Chonker Otie 500 <br>Zorgoia 500"

/datum/lore/codex/page/casinomanual_mechs/add_content()
	name = "Prizes: Mechs and Rigs"
	keywords += list("Prizes", "Mechs", "Rigs")
	data = "Mining Ripley 1000 <br>\
		Mech: Firefighter Ripley 750 <br>\
		Mech: Serenity 1500	<br>\
		Mech: Odysseus 1250 <br>\
		Mech: Phazon Scuttlebug 2000 <br>\
		Mech: Phazon Janus 2500 <br>\
		Mech: Scarab 500 <br>\
		Mech: Shuttlepod 250 <br>\
		Mech: Shuttlecraft 500<br>\
		Rig: Solgov engineering hardsuit control module 500 <br>\
		Rig: Solgov medical hardsuit control module 500 <br>\
		Rig: Advanced hardsuit control module 500 <br>\
		Rig: Pursuit hardsuit control module 750 <br>\
		Rig: Combat hardsuit control module 750 <br>\
		Rig: ERT-J suit control module (Elite Janitor NT approved) 250 <br>\
		Rig: Augmented tie (Elite Paper-Pusher NT approved) 250 <br>\
		Rig: Industrial suit control module 300 <br>\
		Rig: Rescue suit control module 300"

/datum/lore/codex/page/casinomanual_implants/add_content()
	name = "Prizes: Implants and Genemods"
	keywords += list("Prizes", "Implants", "Genemods")
	data = "Implanter 100 (A basic empty implanter, you are going to need this to implant yourself with cyberntic augments)<br>\
		Implant: Tazer 1000 (A cybernetic implant that allows one to spawn a personal defense taser)<br>\
		Implant: Medkit 500 (A cybernetic implant that allows you to spawn all the tools needed for surgery)<br>\
		Implant: Shades 750 (A cybernetic implant that will spawn protective thermoshades upon your eyes, AR included!)<br>\
		Implant: Sprinter 1500 (A cybernetic implant that will give you that extra kick of energy to run faster!)<br>\
		Implant: Toolkit 500 (A cybernetic implant that allows you to spawn all the tools needed for engineering)<br>\
		Implant: Language 500 (A cybernetic implant that allows you to understand almost all languages)<br>\
		Implant: Analyzer 500 (A cybernetic implant that allows one to spawn a Portable Resonant Analyzer for any science needs)<br>\
		Implant: Size Control 500 (A cybernetic implant that allows one to change the size of others via specific voice commands)<br>\
		Implant: Adrenalin 500 (Subjects injected with implant can activate a massive injection of adrenalin)<br>\
		Implant: Armblade 1000 (Nanite fabricator capeable of making a large blade on arm)<br>\
		Implant: Wrist dartgun 1000 (Nanite fabricator capeable of making a dart gun on arm)<br>\
		Implant: Freedom 500 (Use this to escape from those evil Red Shirts.)<br>\
		Implant: Handblade 1000 (Nanite fabricator capeable of making a small blade on wrist)<br>\
		Implant: Armlaser 1000 (Nanite fabricator capeable of making a laser on arm)<br>\
		Implant: Loyalty 500 (Makes you loyal or such.)<br>\
		Implant: Arm restraining bolt 1000 (Nanite fabricator capeable of making a restraining bolt gun on arm)<br>\
		Implant: Surge 500 (A muscle overclocker, for when you need to punch extra hard!)<br>\
		Implant: Sword arm 1000 (Nanite fabricator capeable of making a large sword attached to arm)<br>\
		Genemod: No breath:  1000 (No need to breath)<br>\
		Genemod: Regenerate:  1000 (Regeration conveniently packaged in a syringe)<br>\
		Genemod: Remote view:  1000 (See further than ever before!)<br>\
		Genemod: Sprinter:  1000 (You run faster)<br>\
		Genemod: Telepathy:  1000 (Mysterious telepathic powers are within your grasp!)<br>\
		Genemod: X-ray:  1000 (A genetic shoot that allows for view through matter)"

/datum/lore/codex/page/casinomanual_sentientprizes/add_content()
	name = "Sentient Prizes"
	keywords += list("Sentient Prizes", "Prizes")
	data = "Goodness me this is quite the casino huh? Who would have thought one could win other people as a prize? <br>\
	Well you can do just about anything you want with them! Be it just company, some less children friendly company, heck you can even eat them or make them eat you! <br>\
	The options and possibilities are quite frankly limitless! Now you might ask, how does one get these fancy prizes? <br>\
	Well they can be obtained by checking in at and see the list the Sentient Prize Automatic Sales Machinery (SPASM). There might be none, there might be many, it depends on volunteers and losers! <br><br>\
	This brings us first to volunteers and then to losers! Volunteering is simple! Anyone can walk up to the SPASM and select to be a prize (examine yourself first, else flavor text might not have been generated for system to copy.)<br>\
	The SPASM will dispense a collar and 100 chips for you to spend as you please!<br>\
	Whether it's staff or crewmember that loses a bet with themselves on the line, the winner has the rights to keep the loser as a prize, or donate them to the SPASM. It goes like volunteering, except the winner gets the 100 chips dispensed and use to buy the prize instantly if deciding to keep.<br><br>\
	The collar made for volunteers or losers will be added to a list, and remotely show the prize's status, with everyone at the terminal able to see if you're owned or available, neat huh?<br>\
	When a collar has been selected it can be examined at the SPASM, allowing crew to see information about the prize to see in advance if they might be to their liking.<br><br>\
	For crew wishing to buy a prize, you first select the prize, and then insert chips into the system, if the person in question is the prize, they buy themselves out of the system and collar is deactivated.<br>\
	If an owner thinks they had enough fun and wants to cut their prize slack, simply take the collar from the prize, and swipe through system, the system will then ask if the ownership and collar should be nullified. If you need help just ask staff!<br><br>\

	(Sour part, but very important. These sentient prizes can be fun, but one thing always dictates how these things goes down, preferences and ooc wants. If preferences dont line up and people dont agree to do winner/loser scene it becomes sentient prize on list. <br>\
	And someone cant win a prize if the prize ooc doesnt want to do what the winner wants to do. We still wish people to try and reach out and try things with new people and/or new things they are comfortable doing, but never shall anyone be forced into a situation they dont want!)"

/datum/lore/codex/page/casinomanual_managementguide/add_content()
	name = "Golden Space Goose Management Guide"
	keywords += list("Staff", "Guide")
	data = "WIP"
