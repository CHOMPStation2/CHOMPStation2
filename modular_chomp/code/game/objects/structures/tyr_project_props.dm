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

/obj/item/prop/tyrlore/acid_boss
	name = "tyrian expirment data disc one"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/acid_boss)

/datum/category_item/catalogue/anomalous/acid_boss
	name = "Tyr Expirment Data - Corrupted Data One"
	desc = "18106832146282688032166282183282421432861268324012244216621432241 \
	8406414821682161862321660328242143228184848188616622034321232606414241612 \
	4848803226146016206214263264481262823282421282328616484832206818863286421 \
	4623216628268182610241426328218324214128252324812601468603218683212628082 \
	4216622032824212823222106862605232861648483214622010482832824214321462146 \
	8208032286818403216823212622632206818863212603212326814601048823632861432 \
	1268143260821648483286186846166220321862321682523222108232168232148864126 \
	2266032681264162648803216623260106248162042825232401662186832481260146860 \
	3226186254823242106882321682523212622632163212403260106814328616824232801 \
	8106832281062261662203212622632601064641868823286143224181048263226183260 \
	1832401024423240186814363216401220166214523218106832261664481840122480321 \
	2201462826032266818646416622032601840143260141426603218282832128232181068 \
	3212484816146032421840146034328242143284166214603286181048263214628212622 \
	0481432824214166832166228681260826810248210681452321262263216283282421480 \
	3212828214406482142632824214324018608232142828142482168414324014824218266 \
	0321828326814401884124852328242148032441060823240122614321682328618686014 \
	3632221482821468328014825232861432241262324012461432824214322848186812326 \
	4681826102414321224162652322612401220166220321262808242166220321268181062 \
	2632824214326448126282363216326814206814823232261280328618623432261240403 \
	2241862821460823432601832241848263432601832144064828034328616484832201862 \
	14343260826816622032821020343240106082321822148034"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/sonic_boss
	name = "tyrian expirment data disc two"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/sonic_boss)

/datum/category_item/catalogue/anomalous/sonic_boss
	name = "Tyr Expirment Data - Corrupted Data Two"
	desc = "1842322614126832204818681618106032481412261468\
	42188632824214326082126860322048188632226816204282146832122218841432801810683242141226\
	42188632824214322816144826603222481818403216623280181068326082141226\
	42188632801810683212684060326814122442321810823212622632206812606432124848\
	18106832124848161460321262263228681614622660\
	2468106042142632106226146832801810683242141448\
	401280321632824268188632408032601810483212861280\
	281868328242143226128032801810324812803210622614683282421860143280181032601064646814606032"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/shield_boss
	name = "tyrian expirment data disc three"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/shield_boss)

/datum/category_item/catalogue/anomalous/shield_boss
	name = "Tyr Expirment Data - Corrupted Data Three"
	desc = "24106868146282326042161448261662203216603212623214886414681640146282128216186\
	2328616824232824214321260826812483260141234328614321268143212224814328218326014622632\
	6018401432646818441424821648146032821832824214321222806060523242188614841468328242146\
	8143216603212324816401682322818683242188632401024423286143224126232601462263432261014\
	3282183248164016821282161862603212622632241862826818486052321822441424826032182832481\
	2682014321462181020423260160214322412626218823222143260146282343240126280328242141868\
	1602143282421660328616484832124848188632401448141432241840221282126282603282183212248\
	2321260321232241810628214683282183282421660326214863210621682343286143224186224106832\
	8616824232601024423260821282144014628260523242188614841468328614324212841432188242146\
	8321062168260321064321862321828281468166220328218322410484832824214326414608260328242\
	128232128282144064823282183224481216403218106832821682481434"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/crystal_boss
	name = "tyrian expirment data disc four"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/crystal_boss)

/datum/category_item/catalogue/anomalous/crystal_boss
	name = "Tyr Expirment Data - Corrupted Data Four"
	desc = "181068328618684614686032126814322014828216622032681886268052328242681886166220\
	32604012484832646818821460826032122012166260823218106832204818681618106032401862126824\
	42343264141864481432126046166220326610146082161862603212221810823282421860143286421832\
	42128414322214146232244218601462343282421480’68143214841462322218824214681662203240145\
	23212622632163212403244106082324214681432821832681062328242143248126226602412641468321\
	262263214622016621460363216’8414322214146232401884166220324080322610821614603282183262\
	16204282821640145232221082321484146232824214623260184014321626161882603224184014321262\
	26324212681260603240143432163286181048263248164614328218326814661014608232601228148280\
	32681216481662206032281868328242143228101448326082186812201452322214241210601432824214\
	60143264141260126282603240162042823282688032821832641060423240143216623218824214688616601436"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/gravity_boss
	name = "tyrian expirment data disc four"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/gravity_boss)

/datum/category_item/catalogue/anomalous/gravity_boss
	name = "Tyr Expirment Data - Corrupted Data Five"
	desc = "206812841682805232123228186824143218283262128210681432824212823216603212488612\
	06032821020201662203218623210603432801482326018324012628032126814328218183286141246328\
	21832206812606432824214322810484832148882146282321828321682603264188614683432124848321\
	828321810683264681484161810603264128216146282’6052321248483224681040224814321062261468\
	62141282423216826032206812606434328242141668328616484860321268143286141246523222182616\
	14603228184848188616622032824214166832401662263432821832646818841432824216605232163242\
	12841432261424162614263282183210622614682018321232606414241612481602142632826814128240\
	14628234321632861648483248141226321060328218321232621486321468125232241862826818484816\
	62203282421432281868241460321828326212821068143228186832181068322048186816181060324018621268244236"
	value = CATALOGUER_REWARD_HARD

//hivebot discs
/obj/item/prop/tyrlore/gatekeeper
	name = "tyrian data disc one"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/gatekeeper)

/datum/category_item/catalogue/anomalous/gatekeeper
	name = "Tyr Data - Corrupted Data One"
	desc = "28681860823260481414643832401248281062248216186216622032\
	26142814626014321864146812821618623832186248166214\
	122012821432646818261024821618623832186248166214\
	681460181068241432646818261024821618623832186248166214\
	6016206212481468383226124012201426\
	24186814383222122648803226124012201426\
	286818608232821640143832621420128216841432621662143282421810601262263282426814143242106226681426326014841462828032601688321220146034\
	60146226166220322616608268146060326016206212486034\
	602412626216622032281868326016206212486034\
	1468681868343228186814162062326016206212486032261482142482142634321462821468326016142014324018261434"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/gatekeeper
	name = "tyrian data disc one"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/gatekeeper)

/datum/category_item/catalogue/anomalous/gatekeeper
	name = "Tyr Data - Corrupted Data One"
	desc = "28681860823260481414643832401248281062248216186216622032\
	26142814626014321864146812821618623832186248166214\
	122012821432646818261024821618623832186248166214\
	681460181068241432646818261024821618623832186248166214\
	6016206212481468383226124012201426\
	24186814383222122648803226124012201426\
	286818608232821640143832621420128216841432621662143282421810601262263282426814143242106226681426326014841462828032601688321220146034\
	60146226166220322616608268146060326016206212486034\
	602412626216622032281868326016206212486034\
	1468681868343228186814162062326016206212486032261482142482142634321462821468326016142014324018261434"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/shotgun
	name = "tyrian data disc two"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/shotgun)

/datum/category_item/catalogue/anomalous/shotgun
	name = "Tyr Data - Corrupted Data Two"
	desc = "461414643228122416481682803260142410681426\
1448164016621282143212484832166282681026146860\
60184014186214\
10642612821662203264128268184832641282821468626032\
6468164016622032126082681248326014123244121062826034\
42144864\
601462261662203218108232261660826814606032284812681460\
602412626216622032281868322814484818862818484634\
4210688260\
28122416481682803266101248168280321222806040124832\
681466101460821662203214841224\
126280186214\
26148214248216622032106246621886623260162062128210681460\
646814641268143228186832221282824814\
481660821462166220"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/engi_boss
	name = "tyrian data disc three"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/engi_boss)

/datum/category_item/catalogue/anomalous/engi_boss
	name = "Tyr Data - Corrupted Data Three"
	desc = "181068326814601412682442326414681618263242126\
	03224186224481026142634328616824232168252328614326218\
	86324662188632824214322818484818861662203432861432401\
	28032481666101626160214328242143212201282143228186832\
	28106882421468322418622610248216841682803432126464488\
	01662203228106882421468324214128252321868326010224414\
	24821662203282183212608268124832601412328214406414681\
	66220523286164848322810688242146832166224681412601432\
	16826032241264122416828034324218861484146832824216603\
	28616484832401246143212628032604616623224186282122482\
	32861682423282421432481666101626321232206814128214683\
	24212021268263432168254603260102020146082142632821832\
	12488612806032221432861412681662203212326010168232864\
	21648608232861682421662328242143284162416621682803218\
	28321462146820160214263212201282143432824214324818622\
	03282146840321428281424826032421284143280148232821832\
	22143260821026161426322210823260421868823282146840321\
	66032123284126816148280321828322210686260523282421432\
	86186860823224126014328242106032281268322214166220321\
	23284162482164032241884146814263216623268126246328322\
	210686260343282421480324212841432801482328218-4214803\
	28642128232126814328018103226181662203216623240803218\
	28281624143632163212403268142418682616622032126232146\
	28268803228186832824214321662821468626036328642128252\
	32163226162662548232261832126280\
	641886146832601064644880383260102828162416146282\
	861668166220383226124012201426\
	28122416481682803832186248166214"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/meteor_boss
	name = "tyrian data disc four"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/meteor_boss)

/datum/category_item/catalogue/anomalous/meteor_boss
	name = "Tyr Data - Corrupted Data Four"
	desc = "16324212821432824216603228122416481682803432601832221868166220321662601626145232621882421\
	6622032221082326812166232186832601262263218108260162614343280181032861810482632824216624632861682\
	4232181068326448126214826042126416622032861432861810482632421284143212322214828214683264481262148\
	2322280326218863632608210641626326414122414328268141282803260821064162616828034328614484832163212\
	4032221416622032826812626028146868142632286818403244126216821868161248322610821614603282183212623\
	2148864146816401462821248326468184414248252324218641662203216823220181460328614484834\
	8614128242146832281868241260823832601062628032861682423212322268106042321828326012622660821868406034"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/swarm_boss
	name = "tyrian data disc five"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/swarm_boss)

/datum/category_item/catalogue/anomalous/swarm_boss
	name = "Tyr Data - Corrupted Data Five"
	desc = "4016606016186232681464186882343286143242128414326010242414606028104848803226188662\
	481812261426328242143260244214401282162460321828321810683212484816146032261068166220328242\
	143224186228146814622414343282421432126060126060166212821618623212828214406482322616263268\
	121660143282421432124812684060523228186882106212821448803262183218621432824218102042823282\
	183224421424463216622818322668168414603432181068328214124032421260326082126882142632821832\
	246814128214321810683218866232841468601618623218283282421416683268182218826052321248824218\
	102042321862143242126032601020201460821426321232641424104816126832261460162062343212322668\
	186214328242128232226814124660321828283216628218326040124848146832266818621460321064186232\
	221416622032261240122014263432163286181048263260102020146082322810622616622032166282183282\
	421660321864146812821618623212622632122626328242143228106224821618623282183226148418106832\
	401282146816124832601832168232241810482632681464481624128214321682601448283222148018622632\
	281068824214683240126060343244106082321640122016621452328614322668186432123228148632182832\
	824216603218282832128232181068321248481614603222126014605232824214803286181048263222143218\
	841468681062322280324816204282326816601434321262808612805232261664481840122480321220146282\
	32601620621662203218282834\
	2218268052324016622632126226326018104834322818683280181034322048186816181060324018621268244234"
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/medical_boss
	name = "tyrian data disc five"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/medical_boss)

/datum/category_item/catalogue/anomalous/medical_boss
	name = "Tyr Data - Corrupted Data Six"
	desc = "8242146814321660326218326010244232824216622032126032123260641268465232168254603244106082328612244632608210282832401226143210643222803224421068244232281848466034\
	22108232864212823216283282421480328614681432186232821832601840148242166220?322616266254823280181032601414328642128232824212823214886414681640146282322616263282421432188242146832261280?\
	82421282546032441060823282421432681440621262826032182832824214322218268032861432106014263432824214324016622632861432608216822442328218328242141668603432168232121662548232681412485232441060823228681220401462826032182832864212823286126032646818206812404014263216628218328242141668324016622632284814604234\
	1632466218865232163246621886523222108232601840148242166220322814144860328668186220321222181082343260184014824216622032121662548232681620428234\
	184232241082328242128232181082523268144014402214683286421282324212646414621426328218328242143248126082326414686018623282421432188414686014146832241210204282328212484616622032481646143282421282?\
	8014124252328242148032401226143228186832123220181826322010126826324218106226343216324218641432861432601414328242144032122012166234\
	8018103218282832801810683240142660?328018103226181662203282421282322848166432284818646416622032824216622032122012166234\
	16328218482632801810523216321216625482328212461662203282421440343214841468326016622414328614321662244810261426321220128214523216322412623228141448326018401482421662203286162020481662203216626016261432401436\
	1842328018105468143216406418606016224814343216825460321248483216623280181068324214122634"
	value = CATALOGUER_REWARD_HARD

/obj/item/paper/tyr_hint
	name = "Data Decoding"
	info = "Signals from outside the building is sparse, but we need to deal with whatever scraps we can get. Every two numbers seems to correlate with a symbol, or letter. 32 is space. 12 is A? Theorizing all 1X are vowels. L is 48."
