/obj/structure/redgate
	name = "redgate"
	desc = "It leads to someplace else!"
	icon = 'icons/obj/redgate.dmi'
	icon_state = "off"
	density = FALSE
	unacidable = TRUE
	anchored = TRUE
	pixel_x = -16

	var/obj/structure/redgate/target
	var/secret = FALSE	//If either end of the redgate has this enabled, ghosts will not be able to click to teleport
	var/list/exceptions = list(
		/obj/structure/ore_box
		)	//made it a var so that GMs or map makers can selectively allow things to pass through
	var/list/restrictions = list(
		/mob/living/simple_mob/vore/overmap/stardog,
		/mob/living/simple_mob/vore/bigdragon
		)	//There are some things we don't want to come through no matter what.

/obj/structure/redgate/Destroy()
	if(target)
		target.target = null
		target.toggle_portal()
		target = null
		set_light(0)

	return ..()

/obj/structure/redgate/proc/teleport(var/mob/M as mob)
	var/keycheck = TRUE
	if (!istype(M,/mob/living))		//We only want mob/living, no bullets or mechs or AI eyes or items
		if(M.type in exceptions)
			keycheck = FALSE		//we'll allow it
		else
			return

	if(M.type in restrictions)	//Some stuff we don't want to bring EVEN IF it has a key.
		return

	if(keycheck)		//exceptions probably won't have a ckey
		if(!M.ckey)		//We only want players, no bringing the weird stuff on the other side back
			return

	if(!target)
		toggle_portal()

	var/turf/ourturf = find_our_turf(M)		//Find the turf on the opposite side of the target
	if(!ourturf.check_density(TRUE,TRUE))	//Make sure there isn't a wall there
		M.unbuckle_all_mobs(TRUE)
		M.stop_pulling()
		playsound(src,'sound/effects/ominous-hum-2.ogg', 100,1)
		M.forceMove(ourturf)		//Let's just do forcemove, I don't really want people teleporting to weird places if they have bluespace stuff
	else
		to_chat(M, "<span class='notice'>Something blocks your way.</span>")

/obj/structure/redgate/proc/find_our_turf(var/atom/movable/AM)	//This finds the turf on the opposite side of the target gate from where you are
	var/offset_x = x - AM.x										//used for more smooth teleporting
	var/offset_y = y - AM.y

	var/turf/temptarg = locate((target.x + offset_x),(target.y + offset_y),target.z)

	return temptarg

/obj/structure/redgate/proc/toggle_portal()
	if(target)
		icon_state = "on"
		density = TRUE
		plane = ABOVE_MOB_PLANE
		set_light(5, 0.75, "#da5656")
	else
		icon_state = "off"
		density = FALSE
		plane = OBJ_PLANE
		set_light(0)

/obj/structure/redgate/Bumped(mob/M as mob)
	src.teleport(M)
	return

/obj/structure/redgate/Crossed(mob/M as mob)
	src.teleport(M)
	return

/obj/structure/redgate/attack_hand(mob/M as mob)
	if(density)
		src.teleport(M)
	else
		if(!find_partner())
			to_chat(M, "<span class='warning'>The [src] remains off... seems like it doesn't have a destination.</span>")


/obj/structure/redgate/attack_ghost(var/mob/observer/dead/user)

	if(target)
		if(!(secret || target.secret) || user?.client?.holder)
			user.forceMove(get_turf(target))
	else
		return ..()

/obj/structure/redgate/away/Initialize()
	. = ..()
	if(!find_partner())
		log_and_message_admins("An away redgate spawned but wasn't able to find a gateway to link to. If this appeared at roundstart, something has gone wrong, otherwise if you spawn another gate they should connect.")

/obj/structure/redgate/proc/find_partner()
	for(var/obj/structure/redgate/g in world)
		if(istype(g, /obj/structure/redgate))
			if(g.target)
				continue
			else if(g == src)
				continue
			else if(g.z in using_map.station_levels)
				target = g
				g.target = src
				toggle_portal()
				target.toggle_portal()
				break
			else if(g != src)
				target = g
				g.target = src
				toggle_portal()
				target.toggle_portal()
				break
	if(!target)
		return FALSE
	else
		return TRUE

/area/redgate
	name = "redgate"
	icon = 'icons/turf/areas_vr.dmi'
	icon_state = "redblacir"
	base_turf = /turf/simulated/mineral/floor/cave

/area/redgate/wilds
	name = "wilderness"

/area/redgate/structure
	name = "structure"
	icon_state = "redwhisqu"

/area/redgate/structure/powered
	requires_power = 0

/area/redgate/lit
	dynamic_lighting = 0

/area/redgate/structure/powered/teppi_ranch
	name = "ranch"

/area/redgate/structure/powered/teppi_ranch/barn
	name = "barn"

/obj/item/weapon/paper/teppiranch
	name = "elegantly scrawled note"
	info = {"<i>Goeleigh,<BR><BR>

	This isn't how I wanted to give this message to you. They say that the light is coming this way, and we won't even know it's here until it's upon us. There's no way to know when it will arrive, so we can't really afford to wait around. My family has secured us a ride on a ship, and we'll be going to one of the rimward colonies. They say that they are making strides to build some new kind of gate there, something that will take us far from that light, somewhere safe. We can't really bring the animals, but perhaps you can make some arrangements for them.<BR><BR>

	As soon as you read this, get yourself out of here and come find us. We left you enough money to make the trip in the usual spot. We'll be in the registry once we arrive. We're waiting for you.<BR><BR>

	Yours, Medley</i>"}

/area/redgate/hotsprings
	name = "hotsprings"
	requires_power = 0

/area/redgate/hotsprings/outdoors
	name = "snowfields"
	icon_state = "hotsprings_outside"

/area/redgate/hotsprings/redgate
	name = "redgate facility"
	icon_state = "hotsprings_redgate"

/area/redgate/hotsprings/westcave
	name = "hotspring caves"
	icon_state = "hotsprings_westcave"

/area/redgate/hotsprings/eastcave
	name = "icy caverns"
	icon_state = "hotsprings_eastcave"

/area/redgate/hotsprings/house
	name = "snowy cabin"
	icon_state = "hotsprings_house"

/area/redgate/hotsprings/house/dorm1
	name = "hotsprings dorm 1"
	icon_state = "hotsprings_dorm1"

/area/redgate/hotsprings/house/dorm2
	name = "hotsprings dorm 2"
	icon_state = "hotsprings_dorm2"

/area/redgate/hotsprings/house/hotspringhouse
	name = "small cabin"
	icon_state = "hotsprings_hotspringhouse"

/area/redgate/hotsprings/house/lovercave
	name = "cosy cave"
	icon_state = "hotsprings_lovercave"

/area/redgate/hotsprings/house/succcave
	name = "tiny cave"
	icon_state = "hotsprings_succcave"

// City areas, there are soooo many

/area/redgate/city
	name = "rain city"
	icon_state = "red"
	requires_power = 0

/area/redgate/city/streets
	name = "streets"
	icon_state = "red"
	forced_ambience = list('sound/effects/weather/acidrain_mid.ogg')

/area/redgate/city/science
	name = "science facility"
	icon_state = "purple"

/area/redgate/city/hospital
	name = "hospital"
	icon_state = "green"

/area/redgate/city/casino
	name = "casino"
	icon_state = "yellow"

/area/redgate/city/comms
	name = "radio tower"
	icon_state = "yellow"

/area/redgate/city/check1
	name = "checkpoint"
	icon_state = "purple"

/area/redgate/city/check2
	name = "checkpoint"
	icon_state = "purple"

/area/redgate/city/apartments
	name = "apartments"
	icon_state = "bluenew"

/area/redgate/city/warehouse
	name = "warehouse"
	icon_state = "green"

/area/redgate/city/corporation
	name = "corporation"
	icon_state = "yellow"

/area/redgate/city/pool
	name = "pool"
	icon_state = "bluenew"

/area/redgate/city/morgue
	name = "funeral home"
	icon_state = "green"

/area/redgate/city/dealership
	name = "car dealership"
	icon_state = "yellow"

/area/redgate/city/hotel
	name = "hotel"
	icon_state = "purple"

/area/redgate/city/police
	name = "police station"
	icon_state = "green"

/area/redgate/city/church
	name = "church"
	icon_state = "yellow"

/area/redgate/city/bar1
	name = "dance bar"
	icon_state = "green"

/area/redgate/city/bar2
	name = "abandoned bar"
	icon_state = "green"

/area/redgate/city/lasertag
	name = "laser tag"
	icon_state = "purple"

/area/redgate/city/gym
	name = "gym"
	icon_state = "green"

/area/redgate/city/scughouse
	name = "abandoned house"
	icon_state = "bluenew"

/area/redgate/city/parkinglot
	name = "parking lot"
	icon_state = "green"

/area/redgate/city/supermarket
	name = "supermarket"
	icon_state = "green"

/area/redgate/city/nifshop
	name = "NIF store"
	icon_state = "bluenew"

/area/redgate/city/clotheshop
	name = "unclothe"
	icon_state = "yellow"

/area/redgate/city/toys
	name = "toystore"
	icon_state = "green"

/area/redgate/city/offlicense
	name = "off-license"
	icon_state = "green"

/area/redgate/city/cafe
	name = "cafe"
	icon_state = "purple"

/area/redgate/city/restaurant
	name = "restaurant"
	icon_state = "green"

/area/redgate/city/laundry
	name = "laundromat"
	icon_state = "green"

/area/redgate/city/wiz
	name = "wizard store"
	icon_state = "bluenew"

/area/redgate/city/altevian
	name = "altevian imports"
	icon_state = "yellow"

/area/redgate/city/pizza
	name = "pizza place"
	icon_state = "green"

/area/redgate/city/pharmacy
	name = "pharmacy"
	icon_state = "green"

/area/redgate/city/costumes
	name = "costume store"
	icon_state = "purple"

/area/redgate/city/stripclub
	name = "strip club"
	icon_state = "party"

/area/redgate/city/cards
	name = "card game stadium"
	icon_state = "purple"

/area/redgate/city/waterworks
	name = "water treatment plant"
	icon_state = "green"

/area/redgate/city/workshop
	name = "ship hanger"
	icon_state = "purple"

/area/redgate/city/ripper
	name = "prosthetic lab"
	icon_state = "purple"

/area/redgate/city/engine
	name = "singularity power station"
	icon_state = "green"

/area/redgate/city/spa
	name = "spa"
	icon_state = "purple"

/area/redgate/city/library
	name = "library"
	icon_state = "bluenew"

/area/redgate/city/teppi
	name = "farm"
	icon_state = "purple"

/area/redgate/city/gallery
	name = "art gallery"
	icon_state = "green"

/area/redgate/city/theatre
	name = "theatre"
	icon_state = "purple"

/area/redgate/city/doctor
	name = "back alley doctor"
	icon_state = "bluenew"

/area/redgate/city/sims
	name = "weird pool"
	icon_state = "bluenew"

/area/redgate/city/weretiger
	name = "back alley home"
	icon_state = "purple"

/area/redgate/city/dump
	name = "trash pile"
	icon_state = "purple"

/area/redgate/city/succ
	name = "alien home"
	icon_state = "green"

/area/redgate/city/chopshop
	name = "back alley workshop"
	icon_state = "yellow"

/area/redgate/city/crates
	name = "empty building"
	icon_state = "purple"

/area/redgate/city/drugden
	name = "back alley home"
	icon_state = "purple"

/area/redgate/city/gamblingden
	name = "gambling den"
	icon_state = "yellow"

/area/redgate/city/tarot
	name = "tarot card reading"
	icon_state = "green"

/area/redgate/city/fightclub
	name = "empty back-alley house"
	icon_state = "purple"

/area/redgate/city/rats
	name = "rat infested house"
	icon_state = "bluenew"

/area/redgate/city/shooting
	name = "shooting gallery"
	icon_state = "green"

/area/redgate/city/storage
	name = "storage units"
	icon_state = "bluenew"

/area/redgate/city/cardmon
	name = "back-alley home"
	icon_state = "green"

/area/redgate/city/conveyors
	name = "conveyor building"
	icon_state = "bluenew"

/area/redgate/city/dodgypharmacy
	name = "back-alley pharmacy"
	icon_state = "purple"

/area/redgate/city/house1
	name = "house"
	icon_state = "green"

/area/redgate/city/house2
	name = "house"
	icon_state = "green"

/area/redgate/city/house3
	name = "house"
	icon_state = "green"

/area/redgate/city/house4
	name = "house"
	icon_state = "green"

/area/redgate/city/house5
	name = "house"
	icon_state = "green"

/area/redgate/city/house6
	name = "house"
	icon_state = "green"

/area/redgate/city/house7
	name = "house"
	icon_state = "green"

/area/redgate/city/house8
	name = "house"
	icon_state = "green"

/area/redgate/city/house9
	name = "house"
	icon_state = "green"

/area/redgate/city/house10
	name = "house"
	icon_state = "green"

/area/redgate/city/house11
	name = "house"
	icon_state = "green"

/area/redgate/city/house12
	name = "house"
	icon_state = "green"

/area/redgate/city/house13
	name = "house"
	icon_state = "green"

/area/redgate/city/house14
	name = "house"
	icon_state = "green"

/area/redgate/city/house15
	name = "house"
	icon_state = "green"

/area/redgate/city/house16
	name = "house"
	icon_state = "green"

/area/redgate/city/house17
	name = "house"
	icon_state = "green"

/area/redgate/city/house18
	name = "house"
	icon_state = "green"


