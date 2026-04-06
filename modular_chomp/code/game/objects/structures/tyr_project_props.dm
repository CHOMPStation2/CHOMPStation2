//oooh, shiny
/obj/structure/prop/tyr_elevator //This won't function for a while, if ever
	name = "odd elevator"
	desc = "A strange metal cylandir, a partially functioning elevator it seems. However the doors need to be pried open."
	description_info = "Utlize a weapon or tool to get warped somewhere else."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "elevator"
	anchored = TRUE
	var/descendx
	var/descendy

/obj/structure/prop/tyr_elevator/attackby(var/obj/item/W as obj, var/mob/user as mob)
	if (do_after(user, 30, target = src))
		do_teleport(user, locate(descendx,descendy,src.z), channel = TELEPORT_CHANNEL_QUANTUM)

/obj/machinery/door/blast/puzzle/tyrdoor
	name = "strange door"
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'

/obj/machinery/door/blast/puzzle/tyrdoor
	name = "strange door"
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state_open = "open_door"
	icon_state_closed = "star_door"
	icon_state = "star_door"

/obj/machinery/door/blast/puzzle/tyrdoor/finale
	name = "strange door"
	desc = "A strange door. With no way to open it, they will remain shut for quite some time.."
	icon_state_closed = "final_door"

//Okay, actual special puzzle doors for reals
/obj/machinery/door/blast/puzzle/tyrdoor/keypad
	icon_state_closed = "star_door"
	var/list/code = list()
	var/list/lastattempt = list()
	var/codelen = 6

/obj/machinery/door/blast/puzzle/tyrdoor/keypad/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/multitool))
		to_chat(user, span_notice("The door is locked."))
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
			to_chat(user, span_notice("You leave the lock alone."))
		else if(check_input(input))
			to_chat(user, span_notice("The door unlocks and open!"))
			playsound(src, 'sound/machines/lockreset.ogg', 50, 1)
			open()
		else
			visible_message(span_warning("A red light on \the [src]'s control panel flashes briefly."))
	..()

/obj/machinery/door/blast/puzzle/tyrdoor/keypad/proc/check_input(var/input)
	if(length(input) != codelen)
		return 0

	. = 1
	lastattempt.Cut()
	for(var/i in 1 to codelen)
		var/guesschar = copytext(input, i, i+1)
		lastattempt += guesschar
		if(guesschar != code[i])
			. = 0

/obj/machinery/door/blast/puzzle/tyrdoor/firedoor
	icon_state_closed = "fog_door"
	var/heatcheck = 300

/obj/machinery/door/blast/puzzle/tyrdoor/firedoor/proc/ignite(exposed_temperature)
	if(exposed_temperature > heatcheck)
		open()

/*
/obj/machinery/door/blast/puzzle/tyrdoor/

/obj/machinery/door/blast/puzzle/tyrdoor/
*/

/obj/machinery/door/blast/tyremittercheck //Desire is for them to set up an emitter, and break the door that way.
	name = "strange door"
	desc = "A strange door, but seems weaker then others. May break under extreme firepower.."
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state_closed = "ultra_blast_door"
	health = 4500

/*
//Funky Buildings
/obj/machinery/restoration_cell
	name = "restoration cell"
	desc = "A precusor device that generators a healing fluid"
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state = "pod_preview"
	density = TRUE
	anchored = TRUE

	use_power = USE_POWER_IDLE
	idle_power_usage = 200
	active_power_usage = 7500
	buckle_lying = FALSE
	buckle_dir = SOUTH

	var/mob/living/carbon/occupant = null

/obj/machinery/restoration_cell/attackby(var/obj/item/G as obj, var/mob/user as mob)
	if(istype(G, /obj/item/grab))
		var/obj/item/grab/grab = G
		if(!ismob(grab.affecting))
			return
		if(occupant)
			to_chat(user,span_warning("\The [src] is already occupied by [occupant]."))
		if(grab.affecting.has_buckled_mobs())
			to_chat(user, span_warning("\The [grab.affecting] has other entities attached to it. Remove them first."))
			return
		var/mob/M = grab.affecting
		qdel(grab)
		put_mob(M)

	return

/obj/machinery/restoration_cell/proc/process_occupant()
	if(occupant)
		if(occupant.radiation || occupant.accumulated_rads)
			occupant.radiation -= 40
			occupant.accumulated_rads -= 40
		occupant.heal_organ_damage(8,8)

/obj/machinery/restoration_cell/proc/go_out()
	if(!(occupant))
		return
	//for(var/obj/O in src)
	//	O.loc = src.loc
	if(occupant.client)
		occupant.client.eye = occupant.client.mob
		occupant.client.perspective = MOB_PERSPECTIVE
	vis_contents -= occupant
	occupant.pixel_x = occupant.default_pixel_x
	occupant.pixel_y = occupant.default_pixel_y
	occupant.loc = get_step(src.loc, SOUTH)
	unbuckle_mob(occupant, force = TRUE)
	occupant = null
	update_use_power(USE_POWER_IDLE)
	return

/obj/machinery/restoration_cell/proc/put_mob(mob/living/carbon/M as mob)
	if(stat & (NOPOWER|BROKEN))
		to_chat(usr, span_warning("The cryo cell is not functioning."))
		return
	if(!istype(M))
		to_chat(usr, span_danger("The cryo cell cannot handle such a lifeform!"))
		return
	if(occupant)
		to_chat(usr, span_danger("The cryo cell is already occupied!"))
		return
	if(M.abiotic())
		to_chat(usr, span_warning("Subject may not have abiotic items on."))
		return
	if(M.client)
		M.client.perspective = EYE_PERSPECTIVE
		M.client.eye = src
	M.stop_pulling()
	M.loc = src
	M.ExtinguishMob()
	if(M.health > -100 && (M.health < 0 || M.sleeping))
		to_chat(M, span_notice("<b>You feel a warm liquid surround you.</b>"))
	occupant = M
	buckle_mob(occupant, forced = TRUE, check_loc = FALSE)
	vis_contents |= occupant
	occupant.pixel_y += 19
	update_use_power(USE_POWER_ACTIVE)
	add_fingerprint(usr)
	update_icon()
	return 1

/obj/machinery/restoration_cell/verb/move_eject()
	set name = "Eject occupant"
	set category = "Object"
	set src in oview(1)
	if(usr == occupant)//If the user is inside the tube...
		if(usr.stat == 2)//and he's not dead....
			return
		to_chat(usr, span_notice("Release sequence activated. This will take one minute."))
		sleep(600)
		if(!src || !usr || !occupant || (occupant != usr)) //Check if someone's released/replaced/bombed him already
			return
		go_out()//and release him from the eternal prison.
	else
		if(usr.stat != 0)
			return
		go_out()
	add_fingerprint(usr)
	return

/obj/machinery/restoration_cell/verb/move_inside()
	set name = "Move Inside"
	set category = "Object"
	set src in oview(1)
	if(isliving(usr))
		var/mob/living/L = usr
		if(L.has_buckled_mobs())
			to_chat(L, span_warning("You have other entities attached to yourself. Remove them first."))
			return
		if(L.stat != CONSCIOUS)
			return
		put_mob(L)

*/

//Rocc and stone


/obj/structure/outcrop/diamond/tyr
	mindrop = 4
	upperdrop = 8

/obj/structure/outcrop/phoron/tyr
	mindrop = 8
	upperdrop = 16

/obj/structure/outcrop/iron/tyr
	mindrop = 20
	upperdrop = 40

/obj/structure/outcrop/coal/tyr
	mindrop = 20
	upperdrop = 40

/obj/structure/outcrop/lead/tyr
	mindrop = 4
	upperdrop = 10

/obj/structure/outcrop/gold/tyr
	mindrop = 8
	upperdrop = 12

/obj/structure/outcrop/silver/tyr
	mindrop = 12
	upperdrop = 16

/obj/structure/outcrop/platinum/tyr
	mindrop = 4
	upperdrop = 10

/obj/structure/outcrop/uranium/tyr
	mindrop = 8
	upperdrop = 16

/obj/structure/outcrop/hydrogen
	name = "spiky outcrop"
	desc = "A spiky rocky outcrop."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "outcrop-hydrogen"
	mindrop = 4
	upperdrop = 8
	outcropdrop = /obj/item/ore/hydrogen

/obj/structure/outcrop/verdantium
	name = "spiky outcrop"
	desc = "A spiky rocky outcrop."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "outcrop-verdantium"
	mindrop = 4
	upperdrop = 8
	outcropdrop = /obj/item/ore/verdantium

/obj/random/tyroutcrop //In case you want an outcrop without pre-determining the type of ore.
	name = "random rock outcrop"
	desc = "This is a random rock outcrop."
	icon = 'icons/obj/outcrop.dmi'
	icon_state = "outcrop-random"


/obj/random/tyroutcrop/item_to_spawn()
	return pick(prob(3);/obj/structure/outcrop/verdantium,
				prob(1);/obj/structure/outcrop/iron/tyr,
				prob(1);/obj/structure/outcrop/coal/tyr,
				prob(1);/obj/structure/outcrop/silver/tyr,
				prob(1);/obj/structure/outcrop/gold/tyr,
				prob(1);/obj/structure/outcrop/uranium/tyr,
				prob(3);/obj/structure/outcrop/diamond/tyr,
				prob(1);/obj/structure/outcrop/platinum/tyr,
				prob(5);/obj/structure/outcrop/weathered_gate,
				prob(3);/obj/structure/outcrop/hydrogen,
				prob(1);/obj/structure/outcrop/lead/tyr)

/obj/item/prop/tyrlore
	name = "alien disk"
	desc = "A disc for storing data."
	icon = 'modular_chomp/icons/obj/weather_ruins.dmi'
	icon_state = "disc_alter"
	w_class = ITEMSIZE_SMALL

//The following are for Base Neon

/obj/item/prop/tyrlore/baseneon
	name = "data disc"
	desc = "A disc for storing data."
	catalogue_data = list(/datum/category_item/catalogue/technology/base_neon)
	icon_state = "neon_disc"

/obj/item/prop/tyrlore/neonsec
	name = "data disc"
	desc = "A disc for storing data."
	catalogue_data = list(/datum/category_item/catalogue/technology/base_neon_forward)
	icon_state = "sec_disc"

/obj/item/prop/tyrlore/neonmedi
	name = "data disc"
	desc = "A disc for storing data."
	catalogue_data = list(/datum/category_item/catalogue/technology/base_neon_virus)
	icon_state = "medi_disc"

/obj/item/prop/tyrlore/monodisc
	name = "strange disk"
	desc = "A disc for storing data, but it appears to have none on it"
	icon_state = "mono_disc"

/obj/item/prop/tyrlore/neonengi
	name = "data disc"
	desc = "A disc for storing data."
	catalogue_data = list(/datum/category_item/catalogue/technology/base_neon_anomalous)
	icon_state = "engi_disc"

/obj/item/prop/tyrlore/neonsci
	name = "data disc"
	desc = "A disc for storing data."
	catalogue_data = list(/datum/category_item/catalogue/technology/base_neon_planetary_report)
	icon_state = "sci_disc"

/datum/category_item/catalogue/technology/base_neon
	name = "Goal Manifest"
	desc = "After we activation of the seal upon sif our foundation collapsed.\
	We have migrated most of this systems forces to new hidden sights as a result.\
	The discovery of three siginals lead us here, along with two other locals.\
	The discovery of this cool point in an overheated planet proved anomalous,\
	precursor ruins being swiftly discovered.\
	However they appear to be diffrent then the ones upon Sif. \
	No signs of the shadelurkers here, nor in the other two new sights.\
	We have been given the second most resources of this branch, with potential\
	for further. Praying for all three leads to give us support."
	value = CATALOGUER_REWARD_HARD

/datum/category_item/catalogue/technology/base_neon_forward
	name = "Going Forward"
	desc = "Check List Of Things To Do.\
	1. Get the precursor vanguard for further protection.\
	2. Set up a false friendly docking bay for further materials.\
	3. Expanded Operating Base Neon southwards,\
	4. Recruit the locals potentially.\
	5. Obtain a Absoulete Zero Mecha. \
	6. See if a phazon and janus combined could phase deeper below.\
	7. Construct a Mountain Killer prototype. Patent that name too\
	8. Get a better source of food."
	value = CATALOGUER_REWARD_HARD

/datum/category_item/catalogue/technology/base_neon_virus
	name = "Note Worthy Ailments"
	desc = "Offical note taking mode. Not sure out higher ups even read this but here we go\
	We discovered traces remains of a virus within the precursor ruins, but seems adapated for beings centuries ago.\
	Although there are some theroies this is a renamant of a dead plague.\
	Either way, we assume all the precursors of tyr are dead, sealed in a tomb of their own making,\
	But that doesn't explain the siginal we've been recevving..\
	Newly activated, and leagues below the earth. \
	Our scans say the ruins should be able to go that deep, but we've yet to find a way to breach.\
	So running theory is rogue Ai, or some small pockect of immune folks.."
	value = CATALOGUER_REWARD_HARD

/datum/category_item/catalogue/technology/base_neon_anomalous
	name = "Anomalous Conditions"
	desc = "The work conditions keep changing! Horrendous!\
	Southern ruins are horrendous, some wires burst into lavas and crystals!.\
	Then others burst with water and sparky smoke!\
	Scientists blabber about heated crystals, and steam power but nothing beats,\
	good old fashioned alien flora!\
	The weather is also strange, weather fireworks being wrong for here. \
	Proabaly something to do with this valley being a pockect of cool in the heat."
	value = CATALOGUER_REWARD_HARD

/datum/category_item/catalogue/technology/base_neon_planetary_report
	name = "Anomalous Conditions"
	desc = "Planteray Objects Of Importance\
	<br><br>\
	Desgination: ALRE - Tyranical\
	Resources: Precursor Tech, Potential Biofuels and Weapons\
	<br><br>\
	Desgination:CHRL - Sivian\
	Resources: Precursor tech, rifts within space, the void acess\
	<br><br>\
	Desgination:AMRL - Wasteland\
	Resources: Abnormal amounts of radiations, crystaline fuel, crystaline beasts\
	<br><br>\
	Desgination: CMRE - Citadel. \
	Resources: Recruitment"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/neonjanus
	name = "data disc"
	desc = "A disc for storing data."
	catalogue_data = list(/datum/category_item/catalogue/technology/base_neon_janus)
	icon_state = "disc_janus"

/datum/category_item/catalogue/technology/base_neon_janus
	name = "Shielding Tech"
	desc = "Our patent, and very stable shielding technongly was one of\
	our first pieces of precursor equipment reversed engineered. We are able\
	to manifacture barriers for ballastic, and energy based weaponry. Doing both\
	however is rather expirmental. Many of our expirments have turned out failures\
	although they may be turned into success as we deploy them to other sectors. The\
	two most stable versions are the shields upon our mining and janus mecha. The first\
	having a limited time, whilst the janus swaps between polarities. Some of our\
	people have reported side effects from prolonged exposure. Investigation back to\
	AMRL is highly recomended."
	value = CATALOGUER_REWARD_HARD


/obj/item/prop/tyrlore/truegoal
	name = "data disc"
	desc = "A disc for storing data."
	catalogue_data = list(/datum/category_item/catalogue/technology/truegoal)
	icon_state = "disc_eclipse"

/datum/category_item/catalogue/technology/truegoal
	name = "Success For All"
	desc = "The branches for achieving our goal, we shall strive to succeed\
	at any and all costs\
	<br><br>\
	The Freezing Branch\
	We shall strive to break the natural order, a state of true nothingness, in\
	order to gain full control of our fates. Nature shall bend to our will\
	<br><br>\
	The Precursor Branch\
	The precursor beings scattered across the galaxies were eons ahead of us. Yet\
	they fell. We can learn from them, pick up their scraps, and avoid their pitfalls.\
	This shall further our other two branches further then we could do alone\
	<br><br>\
	The Anomalous Branch\
	Within this world, there are things that do not make sense with our current brand\
	of science. This beings are able to bend the fabric of the world in ways that our\
	current metheod of thinking deems impossible. If we are to learn from them, and\
	update our science to match their's, then the world will further be lead down the\
	best path."
	value = CATALOGUER_REWARD_HARD


/obj/item/prop/tyrlore/stolenbreacher
	name = "data disc"
	desc = "A disc for storing data."
	catalogue_data = list(/datum/category_item/catalogue/technology/stolen_breacher)
	icon_state = "disc_eclipse"

/datum/category_item/catalogue/technology/stolen_breacher
	name = "Reverse Breacher Suit"
	desc = "One of our expeditions has been quite fruitful, a crashed\
	unathi vessel. The source of the crash we have not yet discovered, nor the\
	cause of mass casualities. However they did have a few of their fabled breacher\
	suits. Attempts to reverse enginer the alloy the suits are made of have been to\
	little success. Our prototype copies swiftly falling apart under pressure. Further\
	scavanging is to be done at that site."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/fossiltank
	name = "final desgination"
	icon_state = "old_disc_eclipse"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/fossil_tank)

/datum/category_item/catalogue/anomalous/fossil_tank
	name = "Rolling Crematorium"
	desc = "Station Point - Lost\
	Attackers - The Terrain\
	Leader - Nonfunctional\
	Objective - Eliminate all hostiles\
	Awaiting further instruction."
	value = CATALOGUER_REWARD_HARD


/obj/item/material/barbedwire/plastic/active
	anchored = 1
	icon_state = "barbedwire-out"


/obj/item/material/barbedwire/vopal
	name = "crystal shards"
	default_material = MAT_VOPAL

/obj/item/material/barbedwire/vopal/active
	anchored = 1
	icon_state = "barbedwire-out"

/obj/item/prop/tyrlore/disc_one
	name = "tyrian data disc one"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/disc_one)

/datum/category_item/catalogue/anomalous/disc_one
	name = "Tyr Expirment Data - Corrupted Data One"
	desc = "Authorization for 24olle24tion has 22een approve26. 24itizens of Rank 24 an26 lower may 22e 28athere26 for operations.<BR>\
	Rank 24s are only authorize26 for operations of 26 24lass an26 lower. 24reate26 in26ivi26uals, operatives, an26 24urate26 24itizens are <BR>\
	to 22e use26 on operations 24lasses 24, an26 22. Approval is pen26in28 for Operations of 24lass A. 26ue to the pen26in28 war, outlook is likely for approval."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/disc_two
	name = "tyrian data disc two"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/disc_two)

/datum/category_item/catalogue/anomalous/disc_two
	name = "Tyr Expirment Data - Corrupted Data Two"
	desc = "Mass production operations 42ave begun. Advancements wit42in energy and meta48 gat42ering 42ave roc46eted due to t42e metant program. <BR>\
	Aut42orization for weaponizing t42e program 42as been approved. Modifications t42us far 42ave been successfu48. Casua48ties 42ave been 48ow. <BR>\
	Supp48y of dar46 stringers is running 48ow. Suggestion of creation of specia48ized dar46 stringers 42as been put forward."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/disc_three
	name = "tyrian data disc three"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/disc_three)

/datum/category_item/catalogue/anomalous/disc_three
	name = "Tyr Expirment Data - Corrupted Data Three"
	desc = "The sta68s a68e goi62g out. Eve68yday mo68e a62d mo68e a68e va62ishi62g. The highe68 u64s a68e t68yi62g to kee64 thi62gs hush hush, <BR>\
	but somethi62g is62’t 68ight. We’ve lost co62tact with scouts, ex64lo68e68s, a62d f68o62tie68 bases. Somethi62g is comi62g fo68 us, I feel the <BR>\
	e62d is comi62g. I am leavi62g this message fo68 a62yo62e who may su68vive what’s out the68e. If we a68e62’t he68e, the62 it’s still out the68e. <BR>\
	68etu6862 home, a62d u68ge you68 society to 68emai62 small. It may 62ot 62otice you if you do. O68 maybe it does, the62 this was 64oi62tless a62yway.."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/disc_four
	name = "tyrian data disc four"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/disc_four)

/datum/category_item/catalogue/anomalous/disc_four
	name = "Tyr Expirment Data - Corrupted Data Four"
	desc = "86e ha84e repor82s of 82hose upon Fros82shelf u82ilizing a ga82e86ay 82o access 82he As82ral Sea, or a82 leas82 a8282emp82s 82o. <BR>\
	Repor82s ha84e been coun82er produc82i84e, 86i82h se84eral conflic82ing 82ales. 82he main 82hing 86e kno86 is 82hey ha84e made ad84ancemen82s <BR>\
	86i82hin ga82e86ay 82echnology, and are accessing differing planes a82 a degree unseen before. Ho86e84er some repor82 82his plane being 82ha82 of <BR>\
	shado86s and darkness, 86hils82 o82hers repor82 horrific 84isions of flames, and flesh. Fur82her in84es82iga82ion is required.  "
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/disc_five
	name = "tyrian data disc five"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/disc_five)

/datum/category_item/catalogue/anomalous/disc_five
	name = "Tyr Expirment Data - Corrupted Data Five"
	desc = "Fr18st Sleep: M12lfuncti18ning<BR>\
	Defense 18per12ti18n: 18nline<BR>\
	12g12te Pr18ducti18n: 18nline<BR>\
	Res18urce Pr18ducti18n: 18nline<BR>\
	Sign12ler: D12m12ged<BR>\
	C18re: B12dly d12m12ged<BR>\
	Fr18st Time: Neg12tive Nine Th18us12nd Three Hundred Seventy Six 12ges.<BR>\
	Sending distress sign12ls.<BR>\
	Sc12nning f18r sign12ls.<BR>\
	Err18r. F18reign sign12ls detected. Enter siege m18de."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/disc_six
	name = "tyrian data disc six"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/disc_six)

/datum/category_item/catalogue/anomalous/disc_six
	name = "Tyr Expirment Data - Corrupted Data Six"
	desc = "The 40etant pr18gra40 has been accelerated. With war 18n 18ur d1818rstep, we will need further res18urces. <BR>\
	H18wever, 18ur harvesting 18f the star fl18aters t18 sustain ta40ed 40etants is lacking. Their repr18ducti18n cycles and <BR>\
	40eth18ds are t1818 sl18w. Peaceful harvesting 18f 40etants is being tested, regenerative hides being helpful but is running <BR>\
	int18 issues 18f keeping the 40etants fed en18ugh. Experi40ents are beginning with synthetic star fl18aters, results are currently 40ixed."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/disc_seven
	name = "tyrian data disc seven"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/disc_seven)

/datum/category_item/catalogue/anomalous/disc_seven
	name = "Tyr Expirment Data - Corrupted Data Seven"
	desc = "Th14 warfront 16s qu16t14 compl14x. S14v14ral attack16ng from th14 abyss, oth14rs 14m14rg16ng from th14 r16ft.<BR>\
	16s th14 oncom16ng armag14ddon b14caus14 of th16s? Ar14 our s16ns com16ng back to drag us to th14 d14pths? W16ll any of us<BR>\
	b14 spar14d, or ar14 w14 all bound tog14th14r? D14ar 14d14n, pl14as14 sp14ak to us 16n th14s14 try16ng t16m14s.."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/disc_eight
	name = "tyrian data disc eight"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/disc_eight)

/datum/category_item/catalogue/anomalous/disc_eight
	name = "Tyr Expirment Data - Corrupted Data Eight"
	desc = "Our wartime 22ea60t60 are nearly prepared. We have 60u22jected much of our collection to differing program60.<BR>\
	The one60 with the mo60t 60u2260tantial re60ult60 are the 60pacial, cry60talline and 60lime program. The fir60t allow60 u60<BR>\
	to 60end attack60 into the a60tral 60ea, the cry60talline a22le to deflect many ranged weapon60 and the 60lime program i60<BR>\
	60omewhat a22le to convert raw material into antling60.."
	value = CATALOGUER_REWARD_HARD

/obj/item/paper/tyr_notes/astral_a
	name = "The Bright Future"
	info = "We have come back from the brink of defeat! By some act of divinity, fate, or pure will we discovered devices far past the brink of civilization and begun to harvest secrets. <BR>\
	We have begun to pave the road for the bright future, but our road ahead is a long and rocky one. We shall prevail like we always have.  <BR>\
	Those harness resources for their own comfort and gains shall be cut down, and those that remain shall flourish."

/obj/item/paper/tyr_notes/astral_b
	name = "Natural Resources of Tyr"
	info = "So this is draft 12 of this report, and I am giving up with being professional. This is just orange phoron. Discrediting it a bit, but it's a weird thing used for fuel, energy, and maybe other things. <BR>\
	They made bioweapons that act as a farm. This has to be important for this fallen society. The building has also shifted and keeps on slowly shifting. Which is concerning but I am here for the natural bits. <BR>\
	Which is nothing. There is some ore, but most of it seems manufactured. The ants are man made too. Super advanced slimes perhaps? Did NT make a time machine and go back to make orange phoron but blow themselves up?<BR>\
	Anyway rambling aside, the energized agate as the crew has been calling it seems useful to make batteries. Scanned some guns from the nearby structures and was easy enough to make. Exporting it enmass"

/obj/item/paper/tyr_notes/astral_c
	name = "Encoded Siginals"
	info = "Signals have been constantly emitting from the tyrian superstructure. Our scanners have a guestimate of at least 5000 meters deep but uncertain if signals from deeper within are not reaching. <BR>\
	The base itself is falling apart slowly but surely. Unsure how wise it is to enter it, with how hostile the repair drones are it has a high lethality rate thus far. To the signals themselves, it seems to be composed of data.  <BR>\
	I belive the base recognizes it's collapsing and trying to send out the information it has. We have seen mentions of an Astral Sea, Eon War, and End Times. The data is quite corrupted but from what we've scavanged, they <BR>\
	seem to be aware of the rift, or bluespace. There are high doubts that the Astral Sea is anything new. We've seen countless wars, but the End Times is quite concerning. Speaking of a mass disappearance of stars. needs further study."

/obj/item/paper/tyr_notes/astral_d
	name = "Requesting Backup"
	info = "We need serious back up if we are to stay here long term. Random folks keep stumbling upon the sivian side and blasting, unsure if they are bounty hunters, or maniacs but no SOL attention yet.<BR>\
	The other day we had reports of masked and hooded men hovering over lava, although that may be disregarded. We found mold and mushrooms in some of our rations, and there was no physical sign of them.<BR>\
	Although Rift Watchers may be stalking this location. The ants are also adapting to us and our gear. We need something, a simple mecha will do."

/obj/item/paper/tyr_notes/astral_d
	name = "Requesting Backup"
	info = "We need serious back up if we are to stay here long term. Random folks keep stumbling upon the sivian side and blasting, unsure if they are bounty hunters, or maniacs but no SOL attention yet.<BR>\
	The other day we had reports of masked and hooded men hovering over lava, although that may be disregarded. We found mold and mushrooms in some of our rations, and there was no physical sign of them.<BR>\
	Although Rift Watchers may be stalking this location. The ants are also adapting to us and our gear. We need something, a simple mecha will do."
