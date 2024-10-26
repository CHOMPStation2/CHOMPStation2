/obj/machinery/paradoxrift
	name = "Paradoxical Rift Generator"
	idle_power_usage = 2500000
	use_power = USE_POWER_OFF
	icon = 'modular_chomp/icons/obj/machines/defense.dmi'
	icon_state = "paradox"
	circuit = /obj/item/circuitboard/paradoxrift
	var/build_eff = 1
	var/loot_eff = 1
	var/chaos_eff = 1

/obj/item/circuitboard/paradoxrift
	name = "paradox rift generator circuit"
	build_path = /obj/machinery/paradoxrift
	board_type = new /datum/frame/frame_types/machine
	origin_tech = list(TECH_DATA = 8, TECH_PRECURSOR = 3)
	req_components = list(
							/obj/item/stack/cable_coil = 10,
							/obj/item/stock_parts/capacitor = 4,
							/obj/item/stock_parts/manipulator = 6,
							/obj/item/stock_parts/scanning_module = 10)

/obj/machinery/paradoxrift/RefreshParts()
	..()
	var/man_rating = 0
	var/scan_rating = 0
	var/cap_rating = 0

	for(var/obj/item/stock_parts/P in component_parts)
		if(istype(P, /obj/item/stock_parts/scanning_module))
			scan_rating += P.rating
		if(istype(P, /obj/item/stock_parts/manipulator))
			man_rating += P.rating
		if(istype(P, /obj/item/stock_parts/capacitor))
			cap_rating += P.rating

	build_eff = man_rating
	loot_eff = scan_rating
	chaos_eff = cap_rating


/obj/machinery/paradoxrift/process()
	if(!(stat & NOPOWER))
		return
	else
		if(prob(0.5*build_eff))
			if(prob(3*loot_eff))
				new /obj/random/greaterportalloot (src.loc)
				if(prob(30/chaos_eff))
					new /obj/random/mob/interspace (src.loc)
				else
					return
			else
				new /obj/random/portalloot (src.loc)
				if(prob(15/chaos_eff))
					new /obj/random/mob/interspace (src.loc)
				else
					return
		else
			return


/obj/random/portalloot
	name = "Random Portal Loot"
	desc = "This is a random goodie from the void."
	icon_state = "medicalkit"

/obj/random/portalloot/item_to_spawn()
	return pick(prob(6);/obj/item/stock_parts/capacitor/omni,
				prob(6);/obj/item/stock_parts/manipulator/omni,
				prob(6);/obj/item/stock_parts/scanning_module/omni,
				prob(6);/obj/item/stock_parts/matter_bin/omni,
				prob(6);/obj/item/stock_parts/micro_laser/omni,
				prob(6);/obj/item/stack/material/phoron,
				prob(6);/obj/item/stack/material/deuterium,
				prob(6);/obj/item/stack/material/tritium,
				prob(6);/obj/item/stack/material/uranium
				)

/obj/random/greaterportalloot
	name = "Random Greater Portal Loot"
	desc = "This is a random goodie from the void."
	icon_state = "medicalkit"

/obj/random/greaterportalloot/item_to_spawn()
	return pick(prob(6);/obj/item/stock_parts/capacitor/omni,
				prob(6);/obj/item/stock_parts/manipulator/omni,
				prob(6);/obj/item/stock_parts/scanning_module/omni,
				prob(6);/obj/item/stock_parts/matter_bin/omni,
				prob(6);/obj/item/stock_parts/micro_laser/omni,
				prob(4);/obj/random/smes_coil,
				prob(4);/obj/random/bomb_supply,
				prob(4);/obj/random/powercell,
				prob(4);/obj/random/tool/powermaint,
				prob(1);/obj/item/rcd,
				prob(4);/obj/item/rcd/advanced,
				prob(1);/obj/vehicle/bike/random,
				prob(1);/obj/vehicle/train/engine/quadbike/random,
				prob(4);/obj/random/material,
				prob(4);/obj/random/material/refined,
				prob(4);/obj/random/material/precious,
				prob(1);/obj/random/bluespace,
				prob(4);/obj/random/tool/alien,
				prob(1);/obj/item/circuitboard/paradoxrift,
				prob(4);/obj/item/prop/alien/junk
				)

/obj/random/mob/interspace
	name = "Random Interspace"
	desc = "This is a random mob from space or inbetween space."
	icon_state = "humanoid"

	mob_faction = "demon"
	mob_returns_home = 1
	mob_wander_distance = 7

/obj/random/mob/interspace/item_to_spawn()
	return pick(prob(5);/mob/living/simple_mob/vore/sonadile,
				prob(5);/mob/living/simple_mob/vore/solargrub,
				prob(5);/mob/living/simple_mob/vore/stalker,
				prob(1);/mob/living/simple_mob/vore/bigdragon,
				prob(1);/mob/living/simple_mob/humanoid/cultist/magus/rift,
				prob(1);/mob/living/simple_mob/vore/cryptdrake,
				prob(15);/mob/living/simple_mob/vore/demonAI,
				prob(25);/mob/living/simple_mob/shadekin,
				prob(25);/mob/living/simple_mob/vore/solargrub,
				prob(15);/mob/living/simple_mob/vore/sect_queen,
				prob(25);/mob/living/simple_mob/vore/sect_drone,
				prob(25);/mob/living/simple_mob/vore/aggressive/deathclaw,
				prob(25);/mob/living/simple_mob/vore/aggressive/corrupthound,
				prob(15);/mob/living/simple_mob/metroid/juvenile/super,
				prob(25);/mob/living/simple_mob/animal/space/carp,
				prob(15);/mob/living/simple_mob/animal/space/carp/large,
				prob(15);/mob/living/simple_mob/animal/space/carp/large/huge,
				prob(25);/mob/living/simple_mob/animal/space/carp/puffer,
				prob(25);/mob/living/simple_mob/animal/space/alien,
				prob(15);/mob/living/simple_mob/animal/space/alien/sentinel,
				prob(25);/mob/living/simple_mob/vore/pakkun,
				prob(25);/mob/living/simple_mob/vore/scel,
				prob(5);/mob/living/simple_mob/vore/vore_hostile/abyss_lurker
				)
