#define DISPENSER_MAX_CARTRIDGES 90

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
	if ((result>0 && result<11) || (result>18 && result<29))
		if (result%2)
			color="red"
	else
		color="black"
	if ( (result>10 && result<19) || (result>28) )
		if (result%2)
			color="black"
	else
		color="red"
	spawn(5 SECONDS)
		visible_message("<span class='notice'>The roulette stops spinning, the ball landing on [result], [color].</span>")
		busy=0
		icon_state = "roulette_wheel"

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
		if(1 to 3) symbol1 = "cherry"
		if(4 to 4) symbol1 = "lemon"
		//if(4 to 4) symbol1 = "watermelon"
		if(5 to 5) symbol1 = "bell"
		if(6 to 6) symbol1 = "four leaf clover"
		if(7 to 7) symbol1 = "seven"
		if(8 to 8) symbol1 = "diamond"
		if(9 to 9) symbol1 = "platinum coin"

	var/slot2 = rand(0,9)
	switch(slot2)
		if(1 to 3) symbol2 = "cherry"
		if(4 to 4) symbol2 = "lemon"
		//if(4 to 4) symbol2 = "watermelon"
		if(5 to 5) symbol2 = "bell"
		if(6 to 6) symbol2 = "four leaf clover"
		if(7 to 7) symbol2 = "seven"
		if(8 to 8) symbol2 = "diamond"
		if(9 to 9) symbol2 = "platinum coin"

	var/slot3 = rand(0,9)
	switch(slot3)
		if(1 to 3) symbol3 = "cherry"
		if(4 to 4) symbol3 = "lemon"
		//if(4 to 4) symbol3 = "watermelon"
		if(5 to 5) symbol3 = "bell"
		if(6 to 6) symbol3 = "four leaf clover"
		if(7 to 7) symbol3 = "seven"
		if(8 to 8) symbol3 = "diamond"
		if(9 to 9) symbol3 = "platinum coin"

	var/output //Output variable to send out in chat after the large if statement.
	var/winnings = 0 //How much money will be given if any.
	var/platinumwin = 0 // If you win the platinum chip or not
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
			output = "<span class='notice'>Three sevens! The slot machine deposits a 500 credit chip!</span>"
			winnings = 500
			celebrate = 1

		if (symbol1 == "diamond" && symbol2 == "diamond" && symbol3 == "diamond")
			output = "<span class='notice'>Three diamonds! The slot machine deposits a 1000 credit chip!</span>"
			winnings = 1000
			celebrate = 1

		if (symbol1 == "platinum coin" && symbol2 == "platinum coin" && symbol3 == "platinum coin")
			output = "<span class='notice'>Three platinum coins! The slot machine deposits a platinum chip!</span>"
			platinumwin = TRUE;
			celebrate = 1

		icon_state = initial(icon_state) // Set it back to the original iconstate.

		if(!output) // Is there anything to output? If not, consider it a loss.
			to_chat(user,"Better luck next time!")
			busy = FALSE
			return

		to_chat(user,output) //Output message

		if(platinumwin) // Did they win the platinum chip?
			new /obj/item/weapon/casino_platinum_chip(src.loc)
			playsound(src.loc, 'sound/machines/slotmachine.ogg', 25, 1)

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


/obj/structure/wheel_of_fortune
	name = "wheel of fortune"
	desc = "May fortune favour the lucky one!"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "wheel_of_fortune"
	density = 1
	anchored = 1
	var/interval = 1
	var/busy = 0

/obj/structure/wheel_of_fortune/verb/setinterval()
	set name = "Change interval"
	set category = "Object"
	set src in view(1)

	if(usr.incapacitated())
		return
	if(ishuman(usr) || istype(usr, /mob/living/silicon/robot))
		interval = input("Put the desired interval (1-100)", "Set Interval") as num
		if(interval>100 || interval<1)
			usr << "<span class='notice'>Invalid interval.</span>"
			return
		usr << "<span class='notice'>You set the interval to [interval]</span>"
	return


/obj/structure/wheel_of_fortune/attack_hand(mob/user as mob)
	if (busy)
		to_chat(user,"<span class='notice'>The wheel of fortune is already spinning!</span> ")
		return
	visible_message("<span class='notice'>\ [user]  spins the wheel of fortune!</span>")
	busy = 1
	icon_state = "wheel_of_fortune_spinning"
	var/result = rand(1,interval)
	add_fingerprint(user)
	spawn(5 SECONDS)
		visible_message("<span class='notice'>The wheel of fortune stops spinning, the number is [result]!</span>")
		busy=0
		icon_state = "wheel_of_fortune"

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


/obj/machinery/chemical_dispenser/deluxe
	dispense_reagents = list(
		"water", "ice", "coffee", "cream", "tea", "icetea", "cola", "spacemountainwind", "dr_gibb", "space_up", "tonic",
		"sodawater", "lemon_lime", "sugar", "orangejuice", "limejuice", "watermelonjuice", "thirteenloko", "grapesoda",
		"coffee", "cafe_latte", "soy_latte", "hot_coco", "milk", "cream", "tea", "ice", "orangejuice", "lemonjuice",
		"limejuice", "berryjuice", "mint", "lemon_lime", "sugar", "orangejuice", "limejuice", "sodawater",
		"tonic", "beer", "kahlua", "whiskey", "wine", "vodka", "gin", "rum", "tequilla", "vermouth", "cognac",
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
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/wine,
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

/obj/machinery/chemical_dispenser/deluxe/examine(mob/user)
	user << desc
	user << "It has [cartridges.len] cartridges installed, and has space for [DISPENSER_MAX_CARTRIDGES - cartridges.len] more."

/obj/machinery/chemical_dispenser/deluxe/proc/add_cartridge_deluxe(obj/item/weapon/reagent_containers/chem_disp_cartridge/C, mob/user)
	if(!istype(C))
		if(user)
			user << "<span class='warning'>\The [C] will not fit in \the [src]!</span>"
		return

	if(cartridges.len >= DISPENSER_MAX_CARTRIDGES)
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
	icon_deny = "deluxe_boozeomat_deny"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/glass2/square = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/rocks = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/shake = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/cocktail = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/shot = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/pint = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/mug = 25,
					/obj/item/weapon/reagent_containers/food/drinks/glass2/wine = 25,
					/obj/item/weapon/reagent_containers/food/drinks/metaglass = 25,
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

	/*/obj/item/weapon/reagent_containers/food/drinks/metaglass/metapint = 25,*/ //Metapint glass not ported yet - Jack

/obj/machinery/vending/deluxe_dinner
	name = "Deluxe Dining Distributor"
	desc = "A top of the line and experimental food vendor, it uses bluespace technology for storage!"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "deluxe_dining"
	icon_deny = "deluxe_dining_deny"
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
		/obj/item/weapon/reagent_containers/food/snacks/cookie = 30,
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


/obj/item/weapon/book/manual/casino
	name = "A dummy guide to losing your thalers"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state ="casinomanual"
	author = "Sleazy Serpent Saren"
	title = "A dummy guide to losing your thalers"
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1><a name="Contents">Contents</a></h1>
				<ol>
					<li><a href="#Foreword">Foreword: Welcome to gambling!</a></li>
					<li><a href="#Blackjack">Blackjack</a></li>
					<li><a href="#Roulette">Roulette</a></li>
					<li><a href="#Poker">Poker</a></li>
					<li><a href="#CoH">Cards against the galaxy</a></li>
					<li><a href="#Prizes">Prizes</a></li>
					<li><a href="#SentientPrizes">Sentient prizes</a></li>
				</ol>
				<br>
				<h1><a name="Foreword">Foreword: Welcome to gambling!</a></h1>
				In this book I'll teach you all about how to gamble your money away or at least get lucky and win some! This book also has a handy little overview of the prizes one can earn and the limitations of what can do with the living and breathing ones.<br>
				(This book will also contain out of character information to help people be aware of how touchy subjects like sentient prizes are to be handled.)

				<h1><a name="Blackjack">Blackjack</a></h1>
				First up is the classic sport of blackjack, blackjack is played normally between a gambler and a dealer, the goal is to have the higher number than the opponent but not go above 21 or it will be a bust and one loses automatically. <br>
				The values of cards are as follow:
				<ul>
					<li>Ace - 1 or 11, can be freely decided at any moment</li>
					<li>2 - 10 - value coresponding to their number</li>
					<li>All face cards excluding joker - Value of 10</li>
				</ul>
				A game of blackjack begins with the dealer giving the gambler two cards, in normal blackjack all cards dealt to gambler and dealer are always shown. The two cards dealt have their values put together, the gambler has three choices, stand, hit, or double down.
				<ul>
					<li>Stand - Gambler or dealer decides not to draw any more cards and it becomes the dealers turn or ends.</li>
					<li>Hit - 10 - The dealer draws a new card, adding to the existing hand, if its a bust the game will end and they will lose.</li>
					<li>Double down - A risky move the gambler can do, the dealer draws one more card and the bet is doubled, but no more cards can be drawn and it becomes the dealer's turn.</li>
				</ul>
				When it becomes the dealer's turn they do the same as the gambler, though their only goal is to get a higher or equal value to gambler. The dealer cant double down, and the large majority of casino's has the rule that a dealer cant draw anymore cards once they reach or go above a value. The most common value is 17, and there are two variants to that rule, soft and hard 17.
				<ul>
					<li>Soft 17 - If the gambler gets 17, they can draw another card.</li>
					<li>Hard 17 - They dealer must stop if they get a value of 17.</li>
				</ul>
				The casino who supplies this version of the manual follows the rule of hard 17. <br>
				The game ends when the dealer busts, reaches the threshold of what they are allowed to draw, or if they get a higher value than the gambler. Again, the one who has the highest value that isnt higher than 21 wins, but if both has the same value no one wins and the bet goes back to the gambler. <br>
				And thats it! Now go out there and gamble your savings away! This casino allows bets between 5 and 50 with double down ignoring that limit! <br><br>

				But wait! Theres more! Theres also group blackjack! This game is a little different, the dealer can be part of it or simple deal for players, this game works differently with everyone keeping their hands hidden, everyone makes initial bets, gets two facedown cards, then its a matter of trying to get as good a hand as possible, but if you go bust, its over. But dont tell or show until everyone reveals! If youre going down, its best if youre opponents dont know they simply can play safe and win, if youre lucky everyone else gets themselves busted and you dont lose your beloved chips! <br>
				Its kinda like texas hold em in a way, everyone draws, folks can raise bets or fold, then draw more. Rinse and repeat until no one wants to raise any more nor draw cards, if everyone except one person has folded, they win by default even if they have busted, cause they dont need to reveal their hand that game, so you can choose to either sit and wait and fold if someone raise the bets, or you can gamble and make it look like you have an amazing hand and win by default since everyone else folds and no one is wise that you had a bust! This game has turned from simple probability and chance against the dealer to a game of risk and deception, fun fun fun!

				<h1><a name="Roulette">Roulette</a></h1>
				So this game of roulette is all about chance! what happens is that people bet on different odds and hope for the best as the dealer rolls the ball and makes that roulette thingy make than fun addicting spin! Once it lands on a number between 0 and 36 its either bust or payout! Pretty simple, right? <br>
				Everyone starts by putting their bets down, people can bet more than once before the ball goes rolling, the odds and their payoffs are these:
				<ul>
					<li>Single number - 35/1 payoff - The most unlikely one to get, but if the ball lands on your number, then youre loaded!</li>
					<li>Split Number - 17/1 - Choose an interval of 2, not very likely and therefore big reward!</li>
					<li>Row - 11/1 - Choose an interval of 3, more likely so not the biggest outcome!</li>
					<li>Split - 8/1 - Choose an interval of 4, not gonna win big time.</li>
					<li>Split row - 5/1 - Choose an interval of 6, getting to the safer bets.</li>
					<li>Column - 2/1 - Choose an interval of 12, boring, but likely.</li>
					<li>Red/Black or even/odd numbers - 1/1 - Odd or even numbers explains themselves. Red numbers are from 0 to 11 and 18 to 29 while the rest is black. These are the safest bets there are!</li>
				</ul>
				Theres not much more to it! Bets made, ball rolls, number announced, people win, people lose! Bets allowed here are from 1 to 25 per bet. Oh, im also being told this casino has the fancy rule that if ball lands on 0, one wins at least one bet no matter what it is! So lets hope you got that big bet on a single number!

				<h1><a name="Poker">Poker</a></h1>
				Aaah yes, good old poker. This casino runs by the rules of texas hold em, though the might be a little modified to be simpler for the average joe. In a game of poker it can be a single gambler and a dealer against each other, but most often its the dealer making the game proceed while several gamblers fights tooth and nail to steal each others chips, but the dealer can still join in on the free for all if they so wish! <br>
				To simply explain the game, people gamble with each other, a game of trying to get the best hand and raise bets or back out depending on what the outcome may be. The game starts with everyone betting a certain amount, it can be 5 or 10 chips depending on dealer, but if one wants to join, there needs to be chips on that table! Once everyone has made their initial bet, everyone gets two cards face down, these are kept hidden, no one not even dealer gets to see players cards until the end, not even folded cards are to be shown unless wanted to, sometimes its better making people unsure if you dropped out with bad cards or if you have other motives, deception is a large part of this game! <br>
				With everyone having cards dealt, its time for the dealer to lay three on the table face up, these cards are 3 of 5 cards in the community pool, everyone can use these cards to make sets like pairs and such, this doesnt mean they are taken, multiple people can use the same community card for their own sets! <br>
				With the community having three we enter the second betting stage, here people have two options, standing or raising. Standing means you dont want to raise, raising explains itself, though if someone bets, people have three options, commit putting the chips in to risk as much as the raised bet, but if one doesnt have enough, then they can still go all in with their remaining chips, one can also drop out if its too risky, the chips bet will remain on the table, but at least you wont lose more eh? Final one is to raise further, sometimes people can dare each other to raise more, but its not allowed for someone to raise, then raise further if no one else raises after them! <br>
				As said earlier, we got like a community pool of 5 cards total, this time another card is revealed and we enter a new betting phase, then the final fifth card is revealed and final bets are made, and then the cards are revealed so it can be determined who has the best hand! If two or more have equally good sets, then the chips are split evenly between them. <br>
				But notice, if someone is left because everyone else didnt dare to raise with their bet, they can decide to not reveal their hand, they might have had a winning hand, or maybe its terrible and they just bluffed their way to victory, only they know and can decide if they want to expose their cards to gloat or confuse their opponents. So in summary, the game can be simple, but hard to master! <br><br>
				And here is the order of winning hands folks!
				<ul>
					<li>Royal flush - The big and best one, this is a set of a 10, Ace, Knave/Jack, Queen and King of the same suit.</li>
					<li>Straight flush - This one is also definently a winner, though can be easier to get as it just needs to be five cards making a sraight of the same suit, an example being black 3 to 7.</li>
					<li>Four of a kind - Nice one, if you get this then you got a good chance to win. The value of the cards determine who wins, so ace is the best followed by king, queen and jack, then the peasant number cards!</li>
					<li>Full House - This one is good, but it requires you have three of a kind and a two of a kind, obviously value is part of the house, so the best roof is made of Ace with king making a strong foundation!</li>
					<li>Flush - This one requires the gambler to have 5 cards of a suit, not in any order, but the highest value card determines worth, so hope you got an Ace in your combo!</li>
					<li>Straight - Its like the royal flush, but can be any suits in combo, Ace can be lowest from Ace to 5 or highest from 10 to Ace!</li>
					<li>Three of a kind - Explains itself well enough, get three together and you got something going, lets hope you can build a house!</li>
					<li>Two pairs - You almost got yourself a house! But at least at this point its something!</li>
					<li>A pair - The worst set you can get, but you might be extremely lucky and have this while others have an inferior pair or the worst possible hand ever which is...</li>
					<li>High card - The absolute worst, if you cant get any of those sets, then you got this sad case, if a game mananages to end with no one getting a set, then the one with the highest value cards wins!</li>

				</ul>
				Wew, what a long lesson, but thats how one does the Texas hold em here at this casino, hope you guys have fun winning and losing your hard earned cash with this one!

				<h1><a name="CoH">Cards against the galaxy</a></h1>

				So hear this, NT is now sponsoring team building at the casino, so folks who wants to just relax with friends, play some games, earn chips with no risk, even the ones broke can join in on a fun game of Cards against the galaxy and have fun! <br>
				The idea is that once a round has concluded and a casino member is present to see the game being actually played, everyone gets 10 chips while the one who won the round gets 25 instead! Interested? Good! Its easy and simple to play and very fun and vulgar! <br><br>

				The game is best played with at least 4 players and starts with everyone drawing 7 white cards, the person who most recently pooped starts as the 'card czar', but folks can agree on another criteria for the czar or simply pick one. Each round the current card czar draws a black card that has text written on it and blank lines, everyone aside from the czar takes a white card from their hand for every blank line which they find funny in that sentence and puts on the table face down with the others. The card czar cant know who has which white card and simply reads the black card with the white ones, the most funniest combination is choosen by the czar and the one who made that combination is the current rounds winner and the next rounds czar. At the end of each round everyone makes sure to draw enough white card to have 7 on hand and if theres a casino staff member playing or watching, they note down or hand out chips for everyone, and if they are playing, they get to add chips to their own personal stockpile too! <br>
				Thats it for cards against the galaxy! Simple, fun and vulgar, whats there not to love?

				<h1><a name="Prizes">Prizes</a></h1>

				Hey folks, welcome to the prize section! This part is definently important for you folks operating the prize booth! First off I wanna tell you some great news! Nanotransen has gone along with a nice deal that allows crew to occasionally keep their hard earned rewards on station for a limited time, now you can enjoy your new fancy toolbelt or bluespace beaker for more than just the shift where the casino comes around! <br>
				((Be aware, there can be limitations on how many rewards you get to keep after the shift, it might be unfair if some shows up and wins one thing, while they watch as command staff crew with high background income as well as hyperactive miners walks home with 20 prizes they get to enjoy while having almost done no gambling at all.)) <br><br>

				Lets get to the prizes and exchange rate before we get started on the stuff specifically for the booth operators, so heres the current prizes one can win and their costs! Be aware there might be new prizes or absent ones from time to time! <br>

				EXCHANGE RATE <br>
				FROM	=	TO <br>
				10 Thalers = 1 casino chip <br>
				1 casino chip = 5 Thalers <br> <br>

				The special sentient prize is 50 chips! More about it in section below! <br> <br>

				Melee weapons
				<ul>
					<li>scepter 500</li>
					<li>chain of command	250</li>
				</ul>
				Guns and 'guns' ((disclaimer, giving out guns will mean you get a weapons license as well with the shifts you have it, abusing these weapons will quickly get them removed!))
				<ul>
					<li>sizegun 100</li>
					<li>advanced anti particle rifle 500</li>
					<li>temperature gun 250</li>
					<li>alien pistol 1000</li>
					<li>floral somatoray 250</li>
					<li>net gun 500</li>
				</ul>
				Gear
				<ul>
					<li>experimental welder 500</li>
					<li>alien belt 750</li>
					<li>alien enhancement vest 750</li>
					<li>The monocoole 1000</li>
					<li>chameleon black tie 250</li>
					<li>cryostasis beaker 200</li>
					<li>bluespace beaker 200</li>
					<li>chem sprayer 250</li>
				</ul>
				Masks and hats - EVERYTHING IS 50 except chameleon!
				<ul>
					<li>assistant hat</li>
					<li>Shark mask</li>
					<li>Pig mask</li>
					<li>Luchador mask</li>
					<li>Horse mask</li>
					<li>Goblin mask</li>
					<li>Fake moustache</li>
					<li>Dolphin mask</li>
					<li>Demon mask</li>
					<li>Chameleon gas mask 250</li>
				</ul>
				Costumes - All costumes are 100 except the hoodies which are 50!
				<ul>
					<li>Black bunny girl outfit (black suit and rabbit ears)</li>
					<li>White bunny girl outfit (white suit and rabbit ears)</li>
					<li>Corgi hoodie</li>
					<li>Sexy clown</li>
					<li>nyan girl</li>
					<li>Wizard</li>
					<li>Chicken</li>
					<li>Carp hoodie</li>
					<li>Sexy mime</li>
					<li>Pirate</li>
					<li>Commie</li>
					<li>Plague doctor</li>
					<li>Imperium monk</li>
					<li>Cute witch</li>
					<li>Gladiator</li>
				</ul>
				Toys and misc - ALL THESE ARE 50
				<ul>
					<li>Toy sword</li>
					<li>Water flower</li>
					<li>Stick horse</li>
					<li>Replica katana</li>
					<li>Magic conch</li>
					<li>Magic 8-ball</li>
					<li>Foam sword</li>
					<li>Foam crossbow (with 5 bolts)</li>
					<li>Bosun's whistle</li>
					<li>Golden cup</li>
					<li>Havana cigar case</li>
					<li>Casino wallet (to keep after shift)</li>
					<li>Casino card deck (to keep after shift)</li>
				</ul>
				Booze - ALL BOOZE IS 50
				<ul>
					<li>Redeemer brew</li>
					<li>Warlock velvet</li>
					<li>Wrapp artiste patron</li>
					<li>Flask of holy water</li>
					<li>College girl goldschlager</li>
					<li>Gilthari luxury champagne</li>
					<li>Bottle of nothing</li>
					<li>Special blend whiskey</li>
					<li>Akvavit</li>
				</ul>
				Thats it for prizes! <br><br>

				Now comes the part for the both operators, you got a very important job, it has a lot of responsibility, so it means that you gotta put that first before your own fun, cause unless you do it, a lot of folks are gonna be left sad and dissappointed they cant get any goodies! But the process is simple and can be quick, someone comes to you, they want some chips, or thalers back or a prize, you simply check this nice guide above to determine cost and ask for the amount of thalers or chips needed, if its a prize, then you follow this procedure:
				<ol>
					<li>First get the thalers or chips for payment.</li>
					<li>Before giving the prize you take out your prize winner folder and a piece of paper, this paper will be named after the one getting the reward and will have further prizes noted down into it, so make sure its safe in that folder!</li>
					<li>You write at the top of the document the winner's name, then below write in big letters 'PRIZES' and put each new reward on its own line! ((You skip to a new line by writing < br > without the space between the br and the clamps))</li>
					<li>Once written down, you just put the paper back in the folder and hand over the prize!</li>
				</ol>
				((When shift is nearing its end you pray to staff or DM the one responsible for the event, they will get the folder and copy paste all the reward info before shift is over and ensure people get their rewards. This is a very important job and we understand it might not be so fun being restricted during an event, but just like the rest of volunteer staff, you get rewarded with guaranteed prizes to enjoy after the shift for being a big help!)) <br>
				((This gets to the sour part, cheating and giving others and yourself free prizes and/or chips is absolutely forbidden, this has OOC consequences and will likely blacklist you from being important roles in future events. Though dont fear getting punished even if you havent done anything wrong, we will rather let cheaters slip than let honest players get wrongfully punished!))

				<h1><a name="SentientPrizes">Sentient prizes</a></h1>
				Goodness me this is quite the casino huh? Who would have thought one could win other people as a prize? Well you can do just about anything you want with them! Be it just company, some less children friendly company, heck you can even eat them or make them eat you! The options and possibilities are quite frankly limitless! <br>
				Now you might ask, how does one get these fancy prizes? Well they can be obtained by checking in at the exchange both and see the list of prizes, there might be none, there might be many, it depends on volunteers and losers! This brings us first to volunteers and then to losers! <br>
				Volunteering is simple! Anyone can walk up to the booth and ask to be a sentient prize, what this means is that you get a nice sum of 250 chips for you to do whatever you want, but someone might come at any point and claim you! <br>
				Losers are obtained differently, if youre completly busted and have nothing left, you become a prize that the one you lost to can do whatever they want with, this means both gamblers and dealers can end up as a prize, though if for whatever reason you dont become their prize, you get added to the list for someone else to enjoy. Becoming a prize means you also get 100 chips in compensation! <br>

				Now hear this! The casino has decided that to spice things up, folks can bet themselves at any time and arent already a prize on the list! Doesnt matter if youre rich or broke, playing blackjack or roulette, you can bet yourself in any game and youre worth 250 chips! But be careful, cause if you lose, youre the winners prize! They can keep you, give you to someone else. or to the prize booth and get the chips you would have gotten as volunteer! But if given to the booth, the winner cant buy their prize back for the lower cost!<br><br>

				((Sour part again, but very important. These sentient prizes can be fun, but one thing always dictates how these things goes down, preferences and ooc wants. If preferences dont line up and people dont agree to do winner/loser scene it becomes sentient prize on list. And someone cant win a prize if the prize ooc doesnt want to do what the winner wants to do. We still wish people to try and reach out and try things with new people and/or new things they are comfortable doing, but never shall anyone be forced into a situation they dont want!))

				</body>
				</html>
			"}

/obj/item/weapon/storage/wallet/casino
	name = "casino wallet"
	desc = "A fancy casino wallet with flashy lights, oooh~"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "casinowallet_black"

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
	desc = "Takes all your cash and gives you chips back! No change and no refund!"
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


/////////////CASINO PRIZE DISPENSER////////////////////////

/obj/machinery/casino_prize_dispenser //WIP sprites and variables and prize lists
	name = "Casino Prize Exchanger"
	desc = "Exchange your chips to obtain wonderful prizes! Hoepfully you'll get to keep some of them for a while."
	icon = 'icons/obj/casino_ch.dmi'
	icon_state ="casino_prize_dispenser"
	var/icon_vend ="casino_prize_dispenser-vend"
	anchored = 1
	opacity = 0

	// Vending-related
	var/active = 1 //No sales pitches if off!
	var/vend_ready = 1 //Are we ready to vend?? Is it time??
	var/vend_delay = 40 //How long does it take to vend?
	var/datum/stored_item/vending_product/currently_vending = null // What we're requesting payment for right now
	var/category_selection = null
	var/currently_selecting = null //Which category of prizes is currently displayed
	var/prize_payout_mode = null	//Is the currently selected prize being given or just logged?
	var/status_message = "" // Status screen messages like "insufficient funds", displayed in NanoUI
	var/status_error = 0 // Set to 1 if status_message is an error

	var/list/list_weapons	= list()
	var/list/list_gear		= list()
	var/list/list_clothing 	= list()
	var/list/list_misc 		= list()
	var/list/list_drinks 	= list()
	var/list/prices    		= list() // Prices for each item, list(/type/path = price), items not in the list don't have a price.

	// List of vending_product items available.
	var/list/weapons_product_records	 = list()
	var/list/gear_product_records		 = list()
	var/list/clothing_product_records	 = list()
	var/list/misc_product_records		 = list()
	var/list/drinks_product_records		 = list()

	var/category_weapons	 = 1	//For listing categories, if false then prizes of this categories cant be obtained nor bought for post-shift enjoyment
	var/category_gear		 = 1	//If 1 prizes will be only logged
	var/category_clothing	 = 1	//If 2 prizes will both be logged and spawned
	var/category_misc		 = 1
	var/category_drinks		 = 1

	list_weapons = list(
		/obj/item/weapon/scepter,
		/obj/item/weapon/melee/chainofcommand,
		/obj/item/weapon/gun/energy/sizegun,
		/obj/item/weapon/gun/energy/particle/advanced,
		/obj/item/weapon/gun/energy/temperature,
		/obj/item/weapon/gun/energy/alien,
		/obj/item/weapon/gun/energy/floragun,
		/obj/item/weapon/gun/energy/netgun
		)

	list_gear = list(
		/obj/item/weapon/weldingtool/experimental,
		/obj/item/weapon/storage/belt/utility/alien,
		/obj/item/clothing/suit/armor/alien,
		/obj/item/clothing/glasses/monocoole,
		/obj/item/clothing/accessory/chameleon,
		/obj/item/weapon/reagent_containers/spray/chemsprayer,
		/obj/item/weapon/reagent_containers/glass/beaker/bluespace,
		/obj/item/weapon/reagent_containers/glass/beaker/noreact
		)

	list_clothing = list(
		/obj/item/clothing/head/soft/purple/wah,
		/obj/item/clothing/mask/shark,
		/obj/item/clothing/mask/pig,
		/obj/item/clothing/mask/luchador,
		/obj/item/clothing/mask/horsehead,
		/obj/item/clothing/mask/goblin,
		/obj/item/clothing/mask/fakemoustache,
		/obj/item/clothing/mask/dolphin,
		/obj/item/clothing/mask/demon,
		/obj/item/clothing/under/chameleon,

		/obj/item/clothing/suit/storage/hooded/ian_costume,
		/obj/item/clothing/suit/storage/hooded/carp_costume,
		/obj/item/weapon/storage/box/casino/costume_whitebunny,
		/obj/item/weapon/storage/box/casino/costume_blackbunny,
		/obj/item/weapon/storage/box/casino/costume_sexymime,
		/obj/item/weapon/storage/box/casino/costume_sexyclown,
		/obj/item/weapon/storage/box/casino/costume_nyangirl,
		/obj/item/weapon/storage/box/casino/costume_wizard,
		/obj/item/weapon/storage/box/casino/costume_chicken,
		/obj/item/weapon/storage/box/casino/costume_gladiator,
		/obj/item/weapon/storage/box/casino/costume_pirate,
		/obj/item/weapon/storage/box/casino/costume_commie,
		/obj/item/weapon/storage/box/casino/costume_imperiummonk,
		/obj/item/weapon/storage/box/casino/costume_plaguedoctor,
		/obj/item/weapon/storage/box/casino/costume_cutewitch
		)

	list_misc = list(
		/obj/item/toy/sword,
		/obj/item/toy/waterflower,
		/obj/item/toy/stickhorse,
		/obj/item/toy/katana,
		/obj/item/toy/eight_ball/conch,
		/obj/item/toy/eight_ball,
		/obj/item/weapon/material/sword/foam,
		/obj/item/weapon/storage/box/casino/foamcrossbow,
		/obj/item/toy/bosunwhistle,
		/obj/item/weapon/reagent_containers/food/drinks/golden_cup,
		/obj/item/weapon/storage/fancy/cigar/havana,
		/obj/item/weapon/storage/wallet/casino,
		/obj/item/weapon/deck/cards/casino
		)

	list_drinks = list(
		/obj/item/weapon/reagent_containers/food/drinks/bottle/redeemersbrew,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/pwine,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/patron,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/holywater,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/specialwhiskey,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/snaps
		)


	prices = list(
		/obj/item/weapon/scepter = 500,
		/obj/item/weapon/melee/chainofcommand = 250,
		/obj/item/weapon/gun/energy/sizegun = 100,
		/obj/item/weapon/gun/energy/particle/advanced = 500,
		/obj/item/weapon/gun/energy/temperature = 250,
		/obj/item/weapon/gun/energy/alien = 1000,
		/obj/item/weapon/gun/energy/floragun = 250,
		/obj/item/weapon/gun/energy/netgun = 500,

		/obj/item/weapon/weldingtool/experimental = 500,
		/obj/item/weapon/storage/belt/utility/alien = 500,
		/obj/item/clothing/suit/armor/alien = 750,
		/obj/item/clothing/glasses/monocoole = 1000,
		/obj/item/clothing/accessory/chameleon = 250,
		/obj/item/weapon/reagent_containers/spray/chemsprayer = 250,
		/obj/item/weapon/reagent_containers/glass/beaker/bluespace = 200,
		/obj/item/weapon/reagent_containers/glass/beaker/noreact = 200,

		/obj/item/clothing/head/soft/purple/wah = 50,
		/obj/item/clothing/mask/shark = 50,
		/obj/item/clothing/mask/pig = 50,
		/obj/item/clothing/mask/luchador = 50,
		/obj/item/clothing/mask/horsehead = 50,
		/obj/item/clothing/mask/goblin = 50,
		/obj/item/clothing/mask/fakemoustache = 50,
		/obj/item/clothing/mask/dolphin = 50,
		/obj/item/clothing/mask/demon = 50,
		/obj/item/clothing/under/chameleon = 250,

		/obj/item/clothing/suit/storage/hooded/ian_costume = 50,
		/obj/item/clothing/suit/storage/hooded/carp_costume = 50,
		/obj/item/weapon/storage/box/casino/costume_whitebunny = 100,
		/obj/item/weapon/storage/box/casino/costume_blackbunny = 100,
		/obj/item/weapon/storage/box/casino/costume_sexymime = 100,
		/obj/item/weapon/storage/box/casino/costume_sexyclown = 100,
		/obj/item/weapon/storage/box/casino/costume_nyangirl = 100,
		/obj/item/weapon/storage/box/casino/costume_wizard = 100,
		/obj/item/weapon/storage/box/casino/costume_chicken = 100,
		/obj/item/weapon/storage/box/casino/costume_gladiator = 100,
		/obj/item/weapon/storage/box/casino/costume_pirate = 100,
		/obj/item/weapon/storage/box/casino/costume_commie = 100,
		/obj/item/weapon/storage/box/casino/costume_imperiummonk = 100,
		/obj/item/weapon/storage/box/casino/costume_plaguedoctor = 100,
		/obj/item/weapon/storage/box/casino/costume_cutewitch = 100,

		/obj/item/toy/sword = 50,
		/obj/item/toy/waterflower = 50,
		/obj/item/toy/stickhorse = 50,
		/obj/item/toy/katana = 50,
		/obj/item/toy/eight_ball/conch = 50,
		/obj/item/toy/eight_ball = 50,
		/obj/item/weapon/material/sword/foam = 50,
		/obj/item/weapon/storage/box/casino/foamcrossbow = 50,
		/obj/item/toy/bosunwhistle = 50,
		/obj/item/weapon/reagent_containers/food/drinks/golden_cup = 50,
		/obj/item/weapon/storage/fancy/cigar/havana = 50,
		/obj/item/weapon/storage/wallet/casino = 50,
		/obj/item/weapon/deck/cards/casino = 50,

		/obj/item/weapon/reagent_containers/food/drinks/bottle/redeemersbrew = 50,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/pwine = 50,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/patron = 50,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/holywater = 50,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager = 50,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/champagne = 50,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing = 50,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/specialwhiskey = 50,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/snaps = 50
		)


	var/list/log = list()
	var/req_log_access = access_cargo //default access for checking logs is cargo
	var/has_logs = 0 //defaults to 0, set to anything else for vendor to have logs

/obj/machinery/casino_prize_dispenser/Initialize()
	build_inventory()

/obj/machinery/casino_prize_dispenser/proc/build_inventory() //Awkward yeah
	var/list/weapons_products = list(
		list(list_weapons, "cat_weapons"))
	for(var/current_list in weapons_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/stored_item/vending_product/product = new/datum/stored_item/vending_product(src, entry)

			product.price = (entry in prices) ? prices[entry] : 0
			product.category = category
			weapons_product_records.Add(product)

	var/list/gear_products = list(
		list(list_gear, "cat_gear"))
	for(var/current_list in gear_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/stored_item/vending_product/product = new/datum/stored_item/vending_product(src, entry)

			product.price = (entry in prices) ? prices[entry] : 0
			product.category = category
			gear_product_records.Add(product)

	var/list/clothing_products = list(
		list(list_clothing, "cat_clothing"))
	for(var/current_list in clothing_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/stored_item/vending_product/product = new/datum/stored_item/vending_product(src, entry)

			product.price = (entry in prices) ? prices[entry] : 0
			product.category = category
			clothing_product_records.Add(product)

	var/list/misc_products = list(
		list(list_misc, "cat_misc"))
	for(var/current_list in misc_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/stored_item/vending_product/product = new/datum/stored_item/vending_product(src, entry)

			product.price = (entry in prices) ? prices[entry] : 0
			product.category = category
			misc_product_records.Add(product)

	var/list/drinks_products = list(
		list(list_drinks, "cat_drinks"))
	for(var/current_list in drinks_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/stored_item/vending_product/product = new/datum/stored_item/vending_product(src, entry)

			product.price = (entry in prices) ? prices[entry] : 0
			product.category = category
			drinks_product_records.Add(product)

/obj/machinery/casino_prize_dispenser/Destroy()
	for(var/datum/stored_item/vending_product/R in weapons_product_records)
		qdel(R)
	weapons_product_records = null

	for(var/datum/stored_item/vending_product/R in gear_product_records)
		qdel(R)
	gear_product_records = null

	for(var/datum/stored_item/vending_product/R in clothing_product_records)
		qdel(R)
	clothing_product_records = null

	for(var/datum/stored_item/vending_product/R in misc_product_records)
		qdel(R)
	misc_product_records = null

	for(var/datum/stored_item/vending_product/R in drinks_product_records)
		qdel(R)
	drinks_product_records = null
	return ..()

/obj/machinery/casino_prize_dispenser/attackby(obj/item/weapon/W as obj, mob/user as mob)

	if(currently_vending)
		var/paid = 0
		var/handled = 0

		if(istype(W, /obj/item/weapon/spacecasinocash))
			var/obj/item/weapon/spacecasinocash/C = W
			paid = pay_with_chips(C, user)
			handled = 1

		if(paid)
			vend(currently_vending, usr)
			return
		else if(handled)
			SSnanoui.update_uis(src)
			return // don't smack that machine with your 2 chips

	if(istype(W, /obj/item/weapon/spacecasinocash))
		attack_hand(user)
		return
	..()

/obj/machinery/casino_prize_dispenser/attack_hand(mob/user as mob)
	if(stat & (BROKEN|NOPOWER))
		return

	ui_interact(user)

/obj/machinery/casino_prize_dispenser/proc/pay_with_chips(var/obj/item/weapon/spacecasinocash/cashmoney, mob/user)
	if(currently_vending.price > cashmoney.worth)

		// This is not a status display message, since it's something the character
		// themselves is meant to see BEFORE putting the money in
		to_chat(usr, "\icon[cashmoney] <span class='warning'>That is not enough chips.</span>")
		return 0

	if(istype(cashmoney, /obj/item/weapon/spacecasinocash))

		visible_message("<span class='info'>\The [usr] inserts some chips into \the [src].</span>")
		cashmoney.worth -= currently_vending.price

		if(cashmoney.worth <= 0)
			usr.drop_from_inventory(cashmoney)
			qdel(cashmoney)
		else
			cashmoney.update_icon()

	return 1

/obj/machinery/casino_prize_dispenser/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	user.set_machine(src)

	var/list/data = list()

	if(currently_vending)
		data["mode"] = 2
		data["product"] = currently_vending.item_name
		data["price"] = currently_vending.price
		data["message_err"] = 0
		data["message"] = status_message
		data["message_err"] = status_error

	else if(currently_selecting)
		data["mode"] = 1
		var/list/listed_products = null
		listed_products = list()

		switch(currently_selecting)
			if("cat_weapons")
				for(var/key = 1 to weapons_product_records.len)
					var/datum/stored_item/vending_product/I = weapons_product_records[key]

					listed_products.Add(list(list(
						"key" = key,
						"name" = I.item_name,
						"price" = I.price,
						"color" = I.display_color)))
			if("cat_gear")
				for(var/key = 1 to gear_product_records.len)
					var/datum/stored_item/vending_product/I = gear_product_records[key]

					listed_products.Add(list(list(
						"key" = key,
						"name" = I.item_name,
						"price" = I.price,
						"color" = I.display_color)))
			if("cat_clothing")
				for(var/key = 1 to clothing_product_records.len)
					var/datum/stored_item/vending_product/I = clothing_product_records[key]

					listed_products.Add(list(list(
						"key" = key,
						"name" = I.item_name,
						"price" = I.price,
						"color" = I.display_color)))
			if("cat_misc")
				for(var/key = 1 to misc_product_records.len)
					var/datum/stored_item/vending_product/I = misc_product_records[key]

					listed_products.Add(list(list(
						"key" = key,
						"name" = I.item_name,
						"price" = I.price,
						"color" = I.display_color)))
			if("cat_drinks")
				for(var/key = 1 to drinks_product_records.len)
					var/datum/stored_item/vending_product/I = drinks_product_records[key]

					listed_products.Add(list(list(
						"key" = key,
						"name" = I.item_name,
						"price" = I.price,
						"color" = I.display_color)))
			else
				return

		data["products"] = listed_products

	else
		data["mode"] = 0

		data["category_weapons"] 	= category_weapons
		data["category_gear"] 		= category_gear
		data["category_clothing"] 	= category_clothing
		data["category_misc"] 		= category_misc
		data["category_drinks"] 	= category_drinks


	ui = SSnanoui.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "casino_prize_dispenser_ch.tmpl", name, 440, 600)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/casino_prize_dispenser/Topic(href, href_list)
	if(stat & (BROKEN|NOPOWER))
		return
	if(usr.stat || usr.restrained())
		return

	if((usr.contents.Find(src) || (in_range(src, usr) && istype(src.loc, /turf)))) //WIP check the vending_product
		if((href_list["Select"]) && (vend_ready) && (!currently_vending))
			switch(href_list["Select"])
				if("selected_weapons")
					currently_selecting = "cat_weapons"
					prize_payout_mode = category_weapons
				if("selected_gear")
					currently_selecting = "cat_gear"
					prize_payout_mode = category_gear
				if("selected_clothing")
					currently_selecting = "cat_clothing"
					prize_payout_mode = category_clothing
				if("selected_misc")
					currently_selecting = "cat_misc"
					prize_payout_mode = category_misc
				if("selected_drinks")
					currently_selecting = "cat_drinks"
					prize_payout_mode = category_drinks
				else
					currently_selecting = null
					prize_payout_mode = null

		if((href_list["vend"]) && (vend_ready) && (!currently_vending))
			var/key = text2num(href_list["vend"])

			switch(currently_selecting)
				if("cat_weapons")
					var/datum/stored_item/vending_product/R = weapons_product_records[key]
					currently_selecting = null

					if(R.price <= 0)
						vend(R, usr)
					else
						currently_vending = R
						status_message = "Please insert chips to pay for the prize!"
						status_error = 0

				if("cat_gear")
					var/datum/stored_item/vending_product/R = gear_product_records[key]
					currently_selecting = null

					if(R.price <= 0)
						vend(R, usr)
					else
						currently_vending = R
						status_message = "Please insert chips to pay for the prize!"
						status_error = 0

				if("cat_clothing")
					var/datum/stored_item/vending_product/R = clothing_product_records[key]
					currently_selecting = null

					if(R.price <= 0)
						vend(R, usr)
					else
						currently_vending = R
						status_message = "Please insert chips to pay for the prize!"
						status_error = 0

				if("cat_misc")
					var/datum/stored_item/vending_product/R = misc_product_records[key]
					currently_selecting = null

					if(R.price <= 0)
						vend(R, usr)
					else
						currently_vending = R
						status_message = "Please insert chips to pay for the prize!"
						status_error = 0

				if("cat_drinks")
					var/datum/stored_item/vending_product/R = drinks_product_records[key]
					currently_selecting = null

					if(R.price <= 0)
						vend(R, usr)
					else
						currently_vending = R
						status_message = "Please insert chips to pay for the prize!"
						status_error = 0
				else
					return

		else if(href_list["cancelpurchase"])
			currently_vending = null


		SSnanoui.update_uis(src)

/obj/machinery/casino_prize_dispenser/proc/vend(datum/stored_item/vending_product/R, mob/user) //WIP
	vend_ready = 0 //One thing at a time!!
	status_message = "Vending..."
	status_error = 0
	SSnanoui.update_uis(src)

	if(icon_vend) //Show the vending animation if needed
		flick(icon_vend,src)

	spawn(vend_delay)
		if(prize_payout_mode == 2)
			new R.item_path(src.loc)
			playsound(src, 'sound/items/vending.ogg', 50, 1, 1)

		status_message = "Thank you for your purchase, your prize has been logged!"
		to_chat(user,status_message)
		do_logging(R.item_path, user)

		status_message = ""
		status_error = 0
		vend_ready = 1
		currently_vending = null
		SSnanoui.update_uis(src)

	return 1

/obj/machinery/casino_prize_dispenser/proc/do_logging(item, mob/user)
	var/prize_log = "[user.ckey] playing as [user.name] bought a [item]."
	log[++log.len] = prize_log
	//Currently doesnt have in game way to show, to ensure theres no chance of players ckeys exposed - Jack