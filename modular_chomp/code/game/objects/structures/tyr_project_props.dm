//oooh, shiny
/obj/structure/prop/tyr_elevator //This won't function for a while, if ever
	name = "odd elevator"
	desc = "A strange metal cylandir, a partially functioning elevator it seems."
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


/obj/item/material/barbedwire/plastic/active
	anchored = 1
	icon_state = "barbedwire-out"


/obj/item/material/barbedwire/vopal
	name = "crystal shards"
	default_material = MAT_VOPAL

/obj/item/material/barbedwire/vopal/active
	anchored = 1
	icon_state = "barbedwire-out"

/obj/item/prop/tyrlore/reddisc
	name = "red tyrian data disc"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyr_red)
	color = "#FFFFFF"

/datum/category_item/catalogue/anomalous/tyr_red
	name = "Precursor Object - Tyr Data Disc Red"
	desc = "The following data has been corrupted. \
	<br><br>\
	oslra yclce hietg hotfsaun ifev undhdre htiytr veesn.\
	No huftrer ritrdecisev cevredive. \
	notencnidoc tihw fof pantel posd lsot wot tuhanosd cslcey..\
	leif sgisn lbeow tslo gilans reorsr.\
	ireaneregnot dops wolakrbe.. \
	rsoescure gaklicn. \
	cenictomon To lawdorr.\
	tatepmt treeh hudnedr senevty tow."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/purpledisc
	name = "purple tyrian data disc"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyr_purple)
	color = "#530E31"

/datum/category_item/catalogue/anomalous/tyr_purple
	name = "Precursor Object - Tyr Data Disc Purple"
	desc = "The following data has been corrupted. \
	<br><br>\
	tapa'cnsi lgo, 1 ohur rebofe rcoy elpa.\
	I ma ont yerlal rues wtah yeht tawn ee to ptu ni tihs. \
	ts'i tjsu gipretena tginsh e'vi yarelad sida.\
	amirpexnlet irwnig is gongi yirwahe.\
	varesel crew memebers are filling ill. \
	But the elevators are holding strong. \
	And stable power is, well, stable.\
	I hope for a good dream."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/greendisc
	name = "green tyrian data disc"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyr_green)
	color = "#530E31"

/datum/category_item/catalogue/anomalous/tyr_green
	name = "Precursor Object - Tyr Data Disc Green"
	desc = "Final mortality count before cryo leap.\
	29,895 illness\
	113,615 workplace injuries\
	20,105 off planet\
	300 to be determined."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/basicflora
	name = "tyrian flora data disc"
	color = "#FF66CC"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyre_basicflora)

/datum/category_item/catalogue/anomalous/tyre_basicflora
	name = "Tyr Data - Flora Expirments"
	desc = "Energy Siphon Unit Attempt\
	Damage is retained until enough energy is accured\
	Subject grows with the acculmated energy\
	Transfering flora program from offense division to sabatoge\
	Utility to be determined."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/basicshield
	name = "tyrian shield data disc"
	color = "#530E31"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyre_basicshield)

/datum/category_item/catalogue/anomalous/tyre_basicshield
	name = "Tyr Data - Barrier Expirments"
	desc = "Barrier Unit Attempt\
	Barrier is capable of limiting damage\
	However the barrier will break under repeated stress\
	Rebuilding the barrier is swift but costly\
	Attempts to be made to incoperate Astral Sea warping."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/advanceshield
	name = "tyrian shield 2 data disc"
	color = "#FF0000"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyre_advanceshield)

/datum/category_item/catalogue/anomalous/tyre_advanceshield
	name = "Tyr Data - Astral Barrier Expirments"
	desc = "barrier Unit Attempt\
	Low class damage is vanished\
	Higher speed and energized projectiles bypass the barrier\
	Unbonded Astral Sea projects slightly damaged due to this expirment\
	Swapping Astral Sea useage from defensive to offensive\
	Gravity to be utlized for further defensive expirments."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/basicsonic
	name = "tyrian sonic data disc"
	color = "#CCCCFF"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyre_basicsonic)

/datum/category_item/catalogue/anomalous/tyre_basicsonic
	name = "Tyr Data - Shockwave Expirments"
	desc = "Enforcer Unit Attempt\
	Success upon creating a shockwave capable of throwing indivuals\
	Damage is limited\
	Force spreads out, launching subjects\
	Further energy to be added before hand held weaponery expirments."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/basicpower
	name = "tyrian power data disc"
	color = "#530E31"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyre_basicpower)

/datum/category_item/catalogue/anomalous/tyre_basicpower
	name = "Tyr Data - Liquid Flame Generators"
	desc = "Utilization of underground liquid flames is succesful\
	Power is stable\
	Capable of further growth\
	Further expansion recomended\
	Awaiting approval."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/ants
	name = "tyrian ants data disc"
	color = "#993300"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyre_ants)

/datum/category_item/catalogue/anomalous/tyre_ants
	name = "Tyr Data - Living Mines Expirments"
	desc = "Success Living Mines\
	Minerants\
	Insect like creatures capable of reproducing metallic and gemstone structures\
	Highly useful for gemstone production\
	Altering for wartime useage approved."
	value = CATALOGUER_REWARD_HARD

/obj/item/prop/tyrlore/drones
	name = "tyrian drone data disc"
	catalogue_data = list(/datum/category_item/catalogue/anomalous/tyre_drones)

/datum/category_item/catalogue/anomalous/tyre_drones
	name = "Tyr Data - Drones"
	desc = "Success\
	Drone Data Aquired\
	Allies none the wise\
	Further data siphoning to contunie\
	Remodel based off their blueprints."
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
