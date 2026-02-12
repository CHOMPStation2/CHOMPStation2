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



/obj/effect/step_trigger/teleporter/planetary_fall/borealis2/find_planet()
	planet = planet_borealis2


// Invisible object that blocks z transfer to/from its turf and the turf above.
/obj/effect/ceiling
	invisibility = 101 // nope cant see this
	anchored = 1
	can_atmos_pass = ATMOS_PASS_PROC

/obj/effect/ceiling/CanZASPass(turf/T, is_zone)
	if(T == GetAbove(src))
		return FALSE // Keep your air up there, buddy
	return TRUE

/obj/effect/ceiling/CanPass(atom/movable/mover, turf/target)
	if(target == GetAbove(src))
		return FALSE
	return TRUE

/obj/effect/ceiling/Uncross(atom/movable/mover, turf/target)
	if(target == GetAbove(src))
		return FALSE
	return TRUE



/obj/machinery/smartfridge/produce/plantvator
	name = "\improper Smart plantavator - Upper"
	desc = "A refrigerated storage unit for Food and plant storage. Now sporting a fancy system of pulleys to lift bottles up and down."
	var/obj/machinery/smartfridge/produce/plantvator/attached

/obj/machinery/smartfridge/produce/plantvator/down/Destroy()
	attached = null
	return ..()

/obj/machinery/smartfridge/produce/plantvator/down
	name = "\improper Smart Plantavator - Lower"

/obj/machinery/smartfridge/produce/plantvator/down/Initialize()
	. = ..()
	var/obj/machinery/smartfridge/produce/plantvator/above = locate(/obj/machinery/smartfridge/produce/plantvator,get_zstep(src,UP))
	if(istype(above))
		above.attached = src
		attached = above
		item_records = attached.item_records
	else
		to_chat(world,"<span class='danger'>[src] at [x],[y],[z] cannot find the unit above it!</span>")

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
														'modular_chomp/sound/effects/weather/wind/wind_2_1.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_2_2.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_3_1.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_4_1.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_4_2.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_5_1.ogg'
												 		)
		 											),
	"Snowfield" 		= new/datum/holodeck_program(/area/houseboat/holodeck/snow,
													list(
														'modular_chomp/sound/effects/weather/wind/wind_2_1.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_2_2.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_3_1.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_4_1.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_4_2.ogg',
											 			'modular_chomp/sound/effects/weather/wind/wind_5_1.ogg'
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
	req_one_access = list(ACCESS_HEADS)

/obj/machinery/door/airlock/highsecurity/red/allowed(mob/user)
	if(get_security_level() in list("green","blue"))
		return FALSE

	return ..(user)

//Ice pick, mountain axe, or ice axe.YW Creation.
/obj/item/ice_pick
	name = "ice axe"
	desc = "A sharp tool for climbers and hikers to break up ice and keep themselves from slipping on a steep slope."
	icon = 'modular_chomp/icons/obj/items_yw.dmi'
	icon_state = "icepick"
	item_state = "icepick"
	matter = list(MAT_STEEL = 12000) //Same as a knife
	force = 15 //increasing force for icepick/axe, cause it's a freaking iceaxe.
	throwforce = 0

//Freezable Airlock Door
/obj/machinery/door/airlock/glass_external/freezable
	maxhealth = 600
	var/frozen = FALSE
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
				to_chat(user, "<span class='notice'>You start to melt the ice off \the [src]</span>")
				playsound(src, welder.usesound, 50, 1)
				if(do_after(user, welderTime SECONDS))
					to_chat(user, "<span class='notice'>You finish melting the ice off \the [src]</span>")
					unFreeze()
					return

		if(istype(I, /obj/item/pen/crayon))
			to_chat(user, "<span class='notice'>You try to use \the [I] to clear the ice, but it crumbles away!</span>")
			qdel(I)
			return

		//Most items will be checked in this for loop using the list in New().
		//Code for objects with specific checks (Like the welder) should be inserted above.
		for(var/IT in deiceTools)
			if(istype(I, IT))
				handleRemoveIce(I, user, deiceTools[IT])
				return

		//if we can't de-ice the door tell them what's wrong.
		to_chat(user, "<span class='notice'>\the [src] is frozen shut!</span>")
		return
	..()

/obj/machinery/door/airlock/glass_external/freezable/proc/handleRemoveIce(obj/item/W as obj, mob/user as mob, var/time = 15 as num)
	to_chat(user, "<span class='notice'>You start to chip at the ice covering \the [src]</span>")
	if(do_after(user, text2num(time SECONDS)))
		unFreeze()
		to_chat(user, "<span class='notice'>You finish chipping the ice off \the [src]</span>")

/obj/machinery/door/airlock/glass_external/freezable/proc/unFreeze()
	frozen = FALSE
	update_icon()
	return

/obj/machinery/door/airlock/glass_external/freezable/proc/freeze()
	frozen = TRUE
	update_icon()
	return

/obj/machinery/door/airlock/glass_external/freezable/update_icon()
	..()
	if(frozen)
		add_overlay(image(icon = 'icons/turf/overlays.dmi', icon_state = "snowairlock"), priority = TRUE,)
	if(!frozen)
		cut_overlays(priority = TRUE)

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

/obj/machinery/trailblazer/Initialize()
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

/////////////////////////////
/obj/cryogaia_away_spawner
	name = "RENAME ME, JERK"
	desc = "Spawns the mobs!"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	invisibility = 101
	mouse_opacity = 0
	density = 0
	anchored = 1

	//Weighted with values (not %chance, but relative weight)
	//Can be left value-less for all equally likely
	var/list/mobs_to_pick_from

	//When the below chance fails, the spawner is marked as depleted and stops spawning
	var/prob_spawn = 100	//Chance of spawning a mob whenever they don't have one
	var/prob_fall = 5		//Above decreases by this much each time one spawns

	//Settings to help mappers/coders have their mobs do what they want in this case
	var/faction				//To prevent infighting if it spawns various mobs, set a faction
	var/atmos_comp			//TRUE will set all their survivability to be within 20% of the current air
	//var/guard				//# will set the mobs to remain nearby their spawn point within this dist

	//Internal use only
	var/mob/living/simple_mob/my_mob
	var/depleted = FALSE

/obj/cryogaia_away_spawner/Initialize()
	. = ..()

	if(!LAZYLEN(mobs_to_pick_from))
		CRASH("Mob spawner at [x],[y],[z] ([get_area(src)]) had no mobs_to_pick_from set on it!")

	START_PROCESSING(SSobj, src)

/obj/cryogaia_away_spawner/process()
	if(my_mob && my_mob.stat != DEAD)
		return //No need

	if(LAZYLEN(loc.human_mobs(world.view)))
		return //I'll wait.

	if(prob(prob_spawn))
		prob_spawn -= prob_fall
		var/picked_type = pickweight(mobs_to_pick_from)
		my_mob = new picked_type(get_turf(src))
		my_mob.low_priority = TRUE

		if(faction)
			my_mob.faction = faction

		if(atmos_comp)
			var/turf/T = get_turf(src)
			var/datum/gas_mixture/env = T.return_air()
			if(env)
				my_mob.minbodytemp = env.temperature * 0.8
				my_mob.maxbodytemp = env.temperature * 1.2

				var/list/gaslist = env.gas
				my_mob.min_oxy = gaslist["oxygen"] * 0.8
				my_mob.min_tox = gaslist["phoron"] * 0.8
				my_mob.min_n2 = gaslist["nitrogen"] * 0.8
				my_mob.min_co2 = gaslist["carbon_dioxide"] * 0.8
				my_mob.max_oxy = gaslist["oxygen"] * 1.2
				my_mob.max_tox = gaslist["phoron"] * 1.2
				my_mob.max_n2 = gaslist["nitrogen"] * 1.2
				my_mob.max_co2 = gaslist["carbon_dioxide"] * 1.2
		return
	else
		STOP_PROCESSING(SSobj, src)
		depleted = TRUE
		return

//Shadekin spawner. Could have them show up on any mission, so it's here.
//Make sure to put them away from others, so they don't get demolished by rude mobs.
/obj/cryogaia_away_spawner/shadekin
	name = "Shadekin Spawner"
	icon = 'icons/mob/vore_shadekin.dmi'
	icon_state = "spawner"

	faction = "shadekin"
	prob_spawn = 1
	prob_fall = 1
	//guard = 10 //Don't wander too far, to stay alive.
	mobs_to_pick_from = list(
		/mob/living/simple_mob/shadekin
	)

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
		/mob/living/simple_mob/animal/sif/frostfly = 1,
		/mob/living/simple_mob/animal/passive/snowbull = 2
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

/obj/tether_away_spawner/cryogaia_spiders
	name = "Aggressive spider mobs"
	faction = "spiders"
	prob_spawn = 100
	prob_fall = 0
	atmos_comp = 1
	mobs_to_pick_from = list(
		/mob/living/simple_mob/animal/giant_spider/frost = 1
	)

/obj/structure/prop/spiderhole
	name = "spider hole"
	desc = "Frost spiders often come out of those"
	icon = 'icons/obj/structures_yw32x32.dmi'
	icon_state = "spiderhole"
	density = FALSE
	anchored = TRUE
