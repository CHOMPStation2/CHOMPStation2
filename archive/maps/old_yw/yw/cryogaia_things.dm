//PORTERD OVER FROM TETHER.
//Note: Clear out all the things we won't ever be using from this file at some point.

/obj/structure/window/reinforced/polarized/full
	dir = SOUTHWEST
	icon_state = "fwindow"
	maxhealth = 80

//Special map objects
/obj/effect/landmark/map_data/borealis2
	height = 3 //Height marker. Provides the map with knowledge of how many z levels connecting below.


/datum/turbolift
	music = list('sound/music/elevator.ogg')  // Woo elevator music!

/obj/machinery/atmospherics/unary/vent_pump/positive
	use_power = 1
	icon_state = "map_vent_out"
	external_pressure_bound = ONE_ATMOSPHERE * 1.1

/obj/item/blueprints
	SPACE_OUTSIDE_TYPES = list(
		/area/borealis2/outdoors/exterior,
		/area/borealis2/outdoors/grounds
	)



/obj/effect/step_trigger/teleporter/planetary_fall/borealis2/find_planet()
	planet = planet_borealis2
	. = ..()

/obj/effect/step_trigger/lost_in_space
	var/deathmessage = "You drift off into space, floating alone in the void until your life support runs out."

/obj/effect/step_trigger/lost_in_space/Trigger(var/atom/movable/A) //replacement for shuttle dump zones because there's no empty space levels to dump to
	if(ismob(A))
		to_chat(A, span_danger("[deathmessage]"))
	qdel(A)

/obj/effect/step_trigger/lost_in_space/bluespace
	deathmessage = "Everything goes blue as your component particles are scattered throughout the known and unknown universe."
	var/last_sound = 0

/obj/effect/step_trigger/lost_in_space/bluespace/Trigger(A)
	if(world.time - last_sound > 5 SECONDS)
		last_sound = world.time
		playsound(get_turf(src), 'sound/effects/supermatter.ogg', 75, 1)
	if(ismob(A) && prob(5))//lucky day
		var/destturf = locate(rand(5,world.maxx-5),rand(5,world.maxy-5),pick(using_map.station_levels))
		new /datum/teleport/instant(A, destturf, 0, 1, null, null, null, 'sound/effects/phasein.ogg')
	else
		return ..()


// Invisible object that blocks z transfer to/from its turf and the turf above.
/obj/effect/ceiling
	invisibility = 101 // nope cant see this
	anchored = 1

/obj/effect/ceiling/CheckExit(atom/movable/O as mob|obj, turf/target as turf)
	if(target && target.z > src.z)
		return FALSE // Block exit from our turf to above
	return TRUE

/obj/effect/ceiling/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(mover && mover.z > src.z)
		return FALSE // Block entry from above to our turf
	return TRUE

//
// TRAM STATION
//
//Not in use but...Might be useful in an away mission at some point. -RadiantFlash
// The tram's electrified maglev tracks
/turf/simulated/floor/maglev
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'icons/turf/flooring/maglevs.dmi'
	icon_state = "maglevup"

	var/area/shock_area = /area/cryogaia/tram

/turf/simulated/floor/maglev/Initialize(mapload)
	. = ..()
	shock_area = locate(shock_area)

// Walking on maglev tracks will shock you! Horray!
/turf/simulated/floor/maglev/Entered(var/atom/movable/AM, var/atom/old_loc)
	if(isliving(AM) && prob(50))
		track_zap(AM)
/turf/simulated/floor/maglev/attack_hand(var/mob/user)
	if(prob(75))
		track_zap(user)
/turf/simulated/floor/maglev/proc/track_zap(var/mob/living/user)
	if (!istype(user)) return
	if (electrocute_mob(user, shock_area, src))
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(5, 1, src)
		s.start()

// Tram air scrubbers for keeping arrivals clean - they work even with no area power
/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/tram
	name = "\improper Tram Air Scrubber"
	icon_state = "scrubber:1"
	on = TRUE

/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/tram/powered()
	return TRUE // Always be powered

//Chemistry 'chemavator'
/obj/machinery/smartfridge/chemistry/chemvator
	name = "\improper Smart Chemavator - Upper"
	desc = "A refrigerated storage unit for medicine and chemical storage. Now sporting a fancy system of pulleys to lift bottles up and down."
	var/obj/machinery/smartfridge/chemistry/chemvator/attached

/obj/machinery/smartfridge/chemistry/chemvator/down/Destroy()
	attached = null
	return ..()

/obj/machinery/smartfridge/chemistry/chemvator/down
	name = "\improper Smart Chemavator - Lower"

/obj/machinery/smartfridge/chemistry/chemvator/down/Initialize(mapload)
	. = ..()
	var/obj/machinery/smartfridge/chemistry/chemvator/above = locate(/obj/machinery/smartfridge/chemistry/chemvator,get_zstep(src,UP))
	if(istype(above))
		above.attached = src
		attached = above
		item_records = attached.item_records
	else
		to_chat(world,span_danger("[src] at [x],[y],[z] cannot find the unit above it!"))


/obj/machinery/smartfridge/plantvator
	name = "\improper Smart plantavator - Upper"
	desc = "A refrigerated storage unit for Food and plant storage. Now sporting a fancy system of pulleys to lift bottles up and down."
	var/obj/machinery/smartfridge/plantvator/attached

/obj/machinery/smartfridge/plantvator/down/Destroy()
	attached = null
	return ..()

/obj/machinery/smartfridge/plantvator/down
	name = "\improper Smart Plantavator - Lower"

/obj/machinery/smartfridge/plantvator/down/Initialize(mapload)
	. = ..()
	var/obj/machinery/smartfridge/plantvator/above = locate(/obj/machinery/smartfridge/plantvator,get_zstep(src,UP))
	if(istype(above))
		above.attached = src
		attached = above
		item_records = attached.item_records
	else
		to_chat(world,span_danger("[src] at [x],[y],[z] cannot find the unit above it!"))

// Tram departure cryo doors that turn into ordinary airlock doors at round end
/obj/machinery/cryopod/robot/door/tram
	name = "\improper Tram Station"
	icon = 'icons/obj/doors/Doorextglass.dmi'
	icon_state = "door_closed"
	can_atmos_pass = ATMOS_PASS_NO
	base_icon_state = "door_closed"
	occupied_icon_state = "door_locked"
	desc = "The tram station you might've came in from.  You could leave the base easily using this."
	on_store_message = "has departed on the tram."
	on_store_name = "Travel Oversight"
	on_enter_occupant_message = "The tram arrives at the platform; you step inside and take a seat."
	on_store_visible_message_1 = "'s speakers chime, anouncing a tram has arrived to take"
	on_store_visible_message_2 = "to the colony"
	time_till_despawn = 10 SECONDS
	spawnpoint_type = /datum/spawnpoint/tram

/obj/machinery/cryopod/robot/door/tram/process()
	if(emergency_shuttle.online() || emergency_shuttle.returned())
		// Transform into a door!  But first despawn anyone inside
		time_till_despawn = 0
		..()
		var/turf/T = get_turf(src)
		var/obj/machinery/door/airlock/glass_external/door = new(T)
		door.req_access = null
		door.req_one_access = null
		qdel(src)
	// Otherwise just operate normally
	return ..()

/obj/machinery/cryopod/robot/door/tram/Bumped(var/atom/movable/AM)
	if(!ishuman(AM))
		return

	var/mob/living/carbon/human/user = AM

	var/choice = tgui_alert(user, "Do you want to depart via the tram? Your character will leave the round.","Departure",list("Yes","No"))
	if(user && Adjacent(user) && choice == "Yes")
		var/mob/observer/dead/newghost = user.ghostize()
		newghost.timeofdeath = world.time
		despawn_occupant(user)

// Tram arrival point landmarks and datum
var/global/list/latejoin_tram   = list()

/obj/effect/landmark/tram
	name = "JoinLateTram"
	delete_me = 1

/obj/effect/landmark/tram/New()
	latejoin_tram += loc // Register this turf as tram latejoin.
	latejoin += loc // Also register this turf as fallback latejoin, since we won't have any arrivals shuttle landmarks.
	..()

/datum/spawnpoint/tram
	display_name = "Tram Station"
	msg = "has arrived on the tram"

/datum/spawnpoint/tram/New()
	..()
	turfs = latejoin_tram

//
// Holodorms
//
/obj/machinery/computer/HolodeckControl/holodorm
	name = "Don't use this one!!!"
	powerdown_program = "Off"
	default_program = "Off"

	//Smollodeck
	active_power_usage = 500
	item_power_usage = 100

	supported_programs = list(
	"Off"			= new/datum/holodeck_program(/area/holodeck/holodorm/source_off),
	"Basic Dorm"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_basic),
	"Table Seating"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_seating),
	"Beach Sim"		= new/datum/holodeck_program(/area/holodeck/holodorm/source_beach),
	"Desert Area"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_desert),
	"Snow Field"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_snow),
	"Flower Garden"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_garden),
	"Space Sim"		= new/datum/holodeck_program(/area/holodeck/holodorm/source_space),
	"Boxing Ring"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_boxing)
	)

/obj/machinery/computer/HolodeckControl/holodorm/one
	name = "dorm one holodeck control"
	projection_area = /area/crew_quarters/sleep/Dorm_1/holo

/obj/machinery/computer/HolodeckControl/holodorm/three
	name = "dorm three holodeck control"
	projection_area = /area/crew_quarters/sleep/Dorm_3/holo

/obj/machinery/computer/HolodeckControl/holodorm/five
	name = "dorm five holodeck control"
	projection_area = /area/crew_quarters/sleep/Dorm_5/holo

/obj/machinery/computer/HolodeckControl/holodorm/seven
	name = "dorm seven holodeck control"
	projection_area = /area/crew_quarters/sleep/Dorm_7/holo

// Small Ship Holodeck
/obj/machinery/computer/HolodeckControl/houseboat
	projection_area = /area/houseboat/holodeck_area
	powerdown_program = "Turn Off"
	default_program = "Empty Court"

	supported_programs = list(
	"Basketball" 		= new/datum/holodeck_program(/area/houseboat/holodeck/basketball, list('sound/music/THUNDERDOME.ogg')),
	"Thunderdome"		= new/datum/holodeck_program(/area/houseboat/holodeck/thunderdome, list('sound/music/THUNDERDOME.ogg')),
	"Beach" 			= new/datum/holodeck_program(/area/houseboat/holodeck/beach),
	"Desert" 			= new/datum/holodeck_program(/area/houseboat/holodeck/desert,
													list(
														'sound/effects/weather/wind/wind_2_1.ogg',
														'sound/effects/weather/wind/wind_2_2.ogg',
														'sound/effects/weather/wind/wind_3_1.ogg',
														'sound/effects/weather/wind/wind_4_1.ogg',
														'sound/effects/weather/wind/wind_4_2.ogg',
														'sound/effects/weather/wind/wind_5_1.ogg'
														)
													),
	"Snowfield" 		= new/datum/holodeck_program(/area/houseboat/holodeck/snow,
													list(
														'sound/effects/weather/wind/wind_2_1.ogg',
														'sound/effects/weather/wind/wind_2_2.ogg',
														'sound/effects/weather/wind/wind_3_1.ogg',
														'sound/effects/weather/wind/wind_4_1.ogg',
														'sound/effects/weather/wind/wind_4_2.ogg',
														'sound/effects/weather/wind/wind_5_1.ogg'
														)
													),
	"Space" 			= new/datum/holodeck_program(/area/houseboat/holodeck/space,
													list(
														'sound/ambience/ambispace.ogg',
														'sound/music/main.ogg',
														'sound/music/space.ogg',
														'sound/music/traitor.ogg',
														)
													),
	"Picnic Area" 		= new/datum/holodeck_program(/area/houseboat/holodeck/picnic, list('sound/music/title2.ogg')),
	"Gaming" 			= new/datum/holodeck_program(/area/houseboat/holodeck/gaming, list('sound/music/traitor.ogg')),
	"Bunking"			= new/datum/holodeck_program(/area/houseboat/holodeck/bunking, list()),
	"Turn Off" 			= new/datum/holodeck_program(/area/houseboat/holodeck/off, list())
	)

// Our map is small, if the supermatter is ejected lets not have it just blow up somewhere else
/obj/machinery/power/supermatter/touch_map_edge()
	qdel(src)

//Airlock antitox vendor
/obj/machinery/vending/wallmed_airlock
	name = "Airlock NanoMed"
	desc = "Wall-mounted Medical Equipment dispenser. This limited-use version dispenses antitoxins with mild painkillers for surface EVAs."
	icon_state = "wallmed"
	density = 0 //It is wall-mounted, and thus, not dense. --Superxpdude
	products = list(/obj/item/reagent_containers/pill/airlock = 10,/obj/item/healthanalyzer = 1)
	contraband = list(/obj/item/reagent_containers/pill/tox = 2)
	req_log_access = access_cmo
	has_logs = 1

/obj/item/reagent_containers/pill/airlock
	name = "\'Airlock\' Pill"
	desc = "Neutralizes toxins and provides a mild analgesic effect."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/airlock/New()
	..()
	reagents.add_reagent(REAGENT_ID_ANTITOXIN, 15)
	reagents.add_reagent(REAGENT_ID_PARACETAMOL, 5)

//"Red" Armory Door
/obj/machinery/door/airlock/multi_tile/metal/red
	name = "Red Armory"
	//color = ""

/obj/machinery/door/airlock/multi_tile/metal/red/allowed(mob/user)
	if(get_security_level() in list("green","blue","yellow","violet","orange"))
		return FALSE

	return ..(user)

/obj/machinery/door/airlock/highsecurity/red
	name = "Bridge Holdout Armory"
	desc =  "Only to be opened on Code red or greater."
	req_one_access = list(access_heads)

/obj/machinery/door/airlock/highsecurity/red/allowed(mob/user)
	if(get_security_level() in list("green","blue"))
		return FALSE

	return ..(user)

//Freezable Airlock Door
/obj/machinery/door/airlock/glass_external/freezable
	maxhealth = 600
	var/frozen = 0
	var/freezing = 0 //see process().
	var/deiceTools[0]
	var/nextWeatherCheck

/obj/machinery/door/airlock/glass_external/freezable/New()
	//Associate objects with the number of seconds it would take to de-ice a door.
	//Most items are either more or less effecient at it.
	//For items with very specific cases (like welders using fuel, or needing to be on) see attackby().
	deiceTools[/obj/item/ice_pick] = 3 //Ice Pick
	deiceTools[/obj/item/tool/crowbar] = 5 //Crowbar
	deiceTools[/obj/item/pen] = 30 //Pen
	deiceTools[/obj/item/card] = 35 //Cards. (Mostly ID cards)

	//Generic weapon items. Tools are better then weapons.
	//This is for preventing "Sierra" syndrome that could result from needing very specific objects.
	deiceTools[/obj/item/tool] = 10
	deiceTools[/obj/item] = 12
	..()

/obj/machinery/door/airlock/glass_external/freezable/attackby(obj/item/I, mob/user as mob)
	//Special cases for tools that need more then just a type check.
	var/welderTime = 5 //Welder

	//debug
	//message_admins("[user] has used \the [I] of type [I.type] on [src]", R_DEBUG)

	if(frozen)

		//the welding tool is a special snowflake.
		if(istype(I, /obj/item/weldingtool))
			var/obj/item/weldingtool/welder = I
			if(welder.remove_fuel(0,user) && welder && welder.isOn())
				to_chat(user, span_notice("You start to melt the ice off \the [src]"))
				playsound(src, welder.usesound, 50, 1)
				if(do_after(user, welderTime SECONDS))
					to_chat(user, span_notice("You finish melting the ice off \the [src]"))
					unFreeze()
					return

		if(istype(I, /obj/item/pen/crayon))
			to_chat(user, span_notice("You try to use \the [I] to clear the ice, but it crumbles away!"))
			qdel(I)
			return

		//Most items will be checked in this for loop using the list in New().
		//Code for objects with specific checks (Like the welder) should be inserted above.
		for(var/IT in deiceTools)
			if(istype(I, IT))
				handleRemoveIce(I, user, deiceTools[IT])
				return

		//if we can't de-ice the door tell them what's wrong.
		to_chat(user, span_notice("\the [src] is frozen shut!"))
		return
	..()

/obj/machinery/door/airlock/glass_external/freezable/proc/handleRemoveIce(obj/item/W as obj, mob/user as mob, var/time = 15 as num)
	to_chat(user, span_notice("You start to chip at the ice covering \the [src]"))
	if(do_after(user, text2num(time SECONDS)))
		unFreeze()
		to_chat(user, span_notice("You finish chipping the ice off \the [src]"))

/obj/machinery/door/airlock/glass_external/freezable/proc/unFreeze()
	frozen = 0
	update_icon()
	return

/obj/machinery/door/airlock/glass_external/freezable/proc/freeze()
	frozen = 1
	update_icon()
	return

/obj/machinery/door/airlock/glass_external/freezable/update_icon()
	..()
	if(frozen)
		overlays += image(icon = 'icons/turf/overlays.dmi', icon_state = "snowairlock")
	return

/obj/machinery/door/airlock/glass_external/freezable/proc/handleFreezeUnfreeze()

	for(var/datum/planet/borealis2/P in SSplanets.planets)
		if(istype(P.weather_holder.current_weather, /datum/weather/borealis2/blizzard))
			if(!frozen && density && prob(25))
				freeze()
		else if(!istype(P.weather_holder.current_weather, /datum/weather/borealis2/blizzard))
			if(frozen && prob(50))
				unFreeze()
	return
/obj/machinery/door/airlock/glass_external/freezable/process()
	if(world.time >= nextWeatherCheck && !freezing)  //don't do the thing if i'm already doing it.
		freezing = 1
		var/random = rand(2,7)
		nextWeatherCheck = (world.time + ((random + 13) SECONDS))
		handleFreezeUnfreeze()
		freezing = 0
	..()

/obj/machinery/door/airlock/glass_external/freezable/examine(mob/user)
	. = ..()
	if(frozen)
		to_chat(user, "it's frozen shut!")

/obj/machinery/door/airlock/glass_external/freezable/open(var/forced = 0)
	//Frozen airlocks can't open.
	if(frozen && !forced)
		return
	else if(frozen && forced)
		unFreeze()
		return ..()
	else
		..()

/obj/machinery/door/airlock/glass_external/freezable/close(var/forced = 0)
	//Frozen airlocks can't shut either. (Though they shouldn't be able to freeze open)
	if(frozen && !forced)
		return
	else if(frozen && forced)
		unFreeze()
		return ..()
	else
		..()
//end of freezable airlock stuff.

/obj/structure/closet/secure_closet/guncabinet/excursion
	name = "expedition weaponry cabinet"
	req_one_access = list(access_explorer,access_brig)

/obj/structure/closet/secure_closet/guncabinet/excursion/New()
	..()
	for(var/i = 1 to 4)
		new /obj/item/gun/energy/locked/frontier(src)
	for(var/i = 1 to 4)
		new /obj/item/gun/energy/locked/frontier/holdout(src)

// Underdark mob spawners
/*
/obj/cryogaia_away_spawner/underdark_normal
	name = "Underdark Normal Spawner"
	faction = "underdark"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 50
	guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/animal/space/jelly = 3,
		/mob/living/simple_mob/animal/giant_spider/hunter = 1,
		/mob/living/simple_mob/animal/giant_spider/phorogenic = 1,
		/mob/living/simple_mob/animal/giant_spider/lurker = 1,
	)

/obj/cryogaia_away_spawner/underdark_hard
	name = "Underdark Hard Spawner"
	faction = "underdark"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 50
	guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/aggressive/corrupthound = 1,
		/mob/living/simple_mob/vore/aggressive/rat = 1
	)

/obj/cryogaia_away_spawner/underdark_boss
	name = "Underdark Boss Spawner"
	faction = "underdark"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 100
	guard = 70
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/aggressive/dragon = 1
	)
*/
// Used at centcomm for the elevator
/obj/machinery/cryopod/robot/door/dorms
	spawnpoint_type = /datum/spawnpoint/tram

//Dance pole
/obj/structure/dancepole
	name = "dance pole"
	desc = "Engineered for your entertainment"
	icon = 'icons/obj/objects_vr.dmi'
	icon_state = "dancepole"
	density = 0
	anchored = 1

/obj/structure/dancepole/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(O.is_wrench())
		anchored = !anchored
		playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		if(anchored)
			to_chat(user, span_blue("You secure \the [src]."))
		else
			to_chat(user, span_blue("You unsecure \the [src]."))
//
// ### Wall Machines On Full Windows ###
// To make sure wall-mounted machines placed on full-tile windows are clickable they must be above the window
//
/obj/item/radio/intercom
	layer = ABOVE_WINDOW_LAYER
/obj/item/storage/secure/safe
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/airlock_sensor
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/alarm
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/button
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/access_button
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/computer/guestpass
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/computer/security/telescreen
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/door_timer
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/embedded_controller
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/firealarm
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/flasher
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/keycard_auth
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/light_switch
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/mineral/processing_unit_console
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/mineral/stacking_unit_console
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/newscaster
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/power/apc
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/requests_console
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/status_display
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/vending/wallmed1
	layer = ABOVE_WINDOW_LAYER
/obj/machinery/vending/wallmed2
	layer = ABOVE_WINDOW_LAYER
/obj/structure/closet/fireaxecabinet
	layer = ABOVE_WINDOW_LAYER
/obj/structure/extinguisher_cabinet
	layer = ABOVE_WINDOW_LAYER
/obj/structure/mirror
	layer = ABOVE_WINDOW_LAYER
/obj/structure/noticeboard
	layer = ABOVE_WINDOW_LAYER


// Icy crystals.
/datum/category_item/catalogue/material/trail_blazer
	name = "Ice Colony Equipment - Trailblazer"
	desc = "This is a glowing stick embedded in the ground with a light on top, commonly used in snowy installations \
	and in tundra conditions."
	value = CATALOGUER_REWARD_EASY

/obj/machinery/trailblazer
	name = "trail blazer"
	desc = "A glowing stick- light."
	icon = 'icons/obj/mining_yw.dmi'
	icon_state = "redtrail_light_on"
	density = TRUE
	anchored = TRUE
	catalogue_data = list(/datum/category_item/catalogue/material/trail_blazer)

obj/machinery/trailblazer/Initialize(mapload)
	randomize_color()
	return ..()

/obj/machinery/trailblazer/proc/randomize_color()
	if(prob(30))
		icon_state = "redtrail_light_on"
		set_light(2, 2, "#FF0000")
	else
		set_light(2, 2, "#33CC33")

/obj/machinery/trailblazer/red
	name = "trail blazer"
	desc = "A glowing stick- light.This one is glowing red."
	icon = 'icons/obj/mining_yw.dmi'
	icon_state = "redtrail_light_on"

/obj/machinery/trailblazer/red/randomize_color()
	if(prob(30))
		icon_state = "redtrail_light_on"
	set_light(2, 2, "#FF0000")

/obj/machinery/trailblazer/blue
	name = "trail blazer"
	desc = "A glowing stick- light. This one is glowing blue."
	icon = 'icons/obj/mining_yw.dmi'
	icon_state = "bluetrail_light_on"

/obj/machinery/trailblazer/blue/randomize_color()
	if(prob(30))
		icon_state = "bluetrail_light_on"
	set_light(2, 2, "#C4FFFF")

/obj/machinery/trailblazer/yellow
	name = "trail blazer"
	desc = "A glowing stick- light. This one is glowing yellow."
	icon_state = "yellowtrail_light_on"

/obj/machinery/trailblazer/yellow/randomize_color()
	if(prob(30))
		icon_state = "yellowtrail_light_on"
	set_light(2, 2, "#ffea00")

/obj/machinery/computer/security/exploration
	name = "head mounted camera monitor"
	desc = "Used to access the built-in cameras in helmets."
	icon_state = "syndicam"
	network = list(NETWORK_EXPLORATION)
	circuit = null

//Suit Storage Units

/obj/machinery/suit_cycler/exploration
	name = "Explorer suit cycler"
	model_text = "Exploration"
	req_one_access = list(access_pilot,access_explorer)

/obj/machinery/suit_cycler/pilot
	name = "Pilot suit cycler"
	model_text = "Pilot"
	req_access = null
	req_one_access = list(access_pilot,access_explorer)

/obj/effect/step_trigger/teleporter/from_plains/New()
	..()
	teleport_x = world.maxx - 1
	teleport_y = src.y
	teleport_z = Z_LEVEL_CRYOGAIA_MAIN

/obj/effect/step_trigger/teleporter/to_plains/New()
	..()
	teleport_x = 2
	teleport_y = src.y
	teleport_z = Z_LEVEL_PLAINS

/obj/cryogaia_away_spawner/wilds
	name = "wilds Spawner"
	faction = "shadekin"
	prob_spawn = 100
	prob_fall = 40
	//guard = 10 //Don't wander too far, to stay alive.
	mobs_to_pick_from = list(
		/mob/living/simple_mob/animal/sif/shantak = 3,
		/mob/living/simple_mob/animal/space/goose = 1,
		/mob/living/simple_mob/animal/giant_spider/frost = 5,
		/mob/living/simple_mob/animal/sif/kururak = 3,
		/mob/living/simple_mob/animal/sif/frostfly = 1
	)

/obj/cryogaia_away_spawner/cryogaia
	name = "wilds Spawner"
	faction = "shadekin"
	prob_spawn = 100
	prob_fall = 40
	//guard = 10 //Don't wander too far, to stay alive.
	mobs_to_pick_from = list(
		/mob/living/simple_mob/animal/passive/gaslamp/snow = 3,
		)
