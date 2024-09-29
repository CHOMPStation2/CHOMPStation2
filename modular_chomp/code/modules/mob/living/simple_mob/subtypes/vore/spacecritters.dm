/mob/living/simple_mob/vore/spacecritter
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	health = 30
	maxHealth = 30
	movement_cooldown = 3
	aquatic_movement = 0

	minbodytemp = 0
	maxbodytemp = 10000			// Maximum of above
	heat_damage_per_tick = 3
	cold_damage_per_tick = 2

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0

	unsuitable_atoms_damage = 0
	heat_damage_per_tick = 0

	melee_damage_lower = 12
	melee_damage_upper = 12
	melee_miss_chance = 0
	melee_attack_delay = 1.5
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
	hovering = TRUE

	heat_resist = 1.0
	cold_resist = 1.0
	shock_resist = 0.0
	water_resist = 1.0
	taser_kill = 0
	var/evolve = "/mob/living/simple_mob/vore/solarray/galaxyray"
	var/feed = "/obj/item/ore/phoron"
	var/evolvekey = "/obj/item/stack/material/tritium"
	var/copy = "/mob/living/simple_mob/vore/solarray"


/mob/living/simple_mob/vore/spacecritter/attackby(var/obj/item/O, var/mob/user)
	if(istype(O, evolvekey))
		user.drop_from_inventory(O)
		qdel(O)
		evolve()
	else if(istype(O, feed))
		user.drop_from_inventory(O)
		qdel(O)
		duplicate()
	else
		.=..()

/mob/living/simple_mob/vore/spacecritter/proc/evolve()
	var/mob/living/L
	L = new evolve(get_turf(src))
	if(mind)
		src.mind.transfer_to(L)
	visible_message("<span class='warning'>\The [src] suddenly evolves!</span>")
	qdel(src)

/mob/living/simple_mob/vore/spacecritter/proc/duplicate()
	visible_message("<span class='warning'>\The [src] splits into two!</span>")
	new copy (src.loc)


/mob/living/simple_mob/vore/spacecritter/solarray //solar moth lite, dies to water
	name = "solar ray"
	desc = "A sting ray of fire, drifting around"
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	icon_state = "solarray"
	icon_living = "solarray"
	icon_dead = "solarray-dead"
	attacktext = list("incinerate")
	attack_armor_type = "energy"
	attack_armor_pen = 30
	water_resist = 0

	var/mycolour = COLOR_RED //Variable Lighting colours
	var/original_temp = null //Value to remember temp
	var/set_temperature = T0C + 5000	//Sets the target point of 10k degrees celsius
	var/heating_power = 50000

	evolve = "/mob/living/simple_mob/vore/solarray/galaxyray"
	feed = "/obj/item/ore/phoron"
	evolvekey = "/obj/item/stack/material/tritium"
	copy = "/mob/living/simple_mob/vore/spacecritter/solarray"


/mob/living/simple_mob/vore/spacecritter/solarray/Life()
	. = ..()
	if(icon_state != icon_dead) //I mean on death() Life() should disable but i guess doesnt hurt to make sure -shark
		var/turf/moth_loc = get_turf(src)
		if(isturf(moth_loc) && moth_loc.air)
			var/datum/gas_mixture/env = moth_loc.return_air() //Gets all the information on the local air.
			var/transfer_moles = 0.25 * env.total_moles //The bigger the room, the harder it is to heat the room.
			var/datum/gas_mixture/removed = env.remove(transfer_moles)
			var/heat_transfer = removed.get_thermal_energy_change(set_temperature)
			if(heat_transfer > 0 && env.temperature < T0C + 200)	//This should start heating the room at a moderate pace up to 200 degrees celsius.
				heat_transfer = min(heat_transfer , heating_power) //limit by the power rating of the heater
				removed.add_thermal_energy(heat_transfer)

			else if(heat_transfer > 0 && env.temperature < set_temperature) //Set temperature is 10,000 degrees celsius. So this thing will start cooking crazy hot between the temperatures of 200C and 10,000C.
				heating_power = original_temp*100 //Changed to work variable -shark //FLAME ON! This will make the moth heat up the room at an incredible rate.
				heat_transfer = min(heat_transfer , heating_power) //limit by the power rating of the heater. Except it's hot, so yeah.
				removed.add_thermal_energy(heat_transfer)

			else
				return

			env.merge(removed)



	//Since I'm changing hyper mode to be variable we need to store old power
	original_temp = heating_power

/mob/living/simple_mob/vore/spacecritter/solarray/galaxyray
	name = "galaxy ray"
	icon_state = "galaxyray"
	icon_living = "galaxyray"
	health = 75
	maxHealth = 75
	set_temperature = T0C + 15000
	heating_power = 150000
	size_multiplier = 1.5

/mob/living/simple_mob/vore/spacecritter/livingice //dark blue slime but more chilly. Dies to lasers or slighly toasty rooms
	name = "living icicle"
	desc = "A strange creature, a crab like creature seemingly made of ice"
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	icon_state = "livingice"
	icon_living = "livingice"
	icon_dead = "livingice-dead"
	minbodytemp = 0			// Minimum "okay" temperature in kelvin
	maxbodytemp = 300			// Maximum of above
	hovering = FALSE
	heat_resist = 0.2
	cold_resist = 1.0

	evolve = "/mob/living/simple_mob/vore/spacecritter/livingice/iceberg"
	feed = "/obj/item/stack/material/snow"
	evolvekey = "/obj/item/reagent_containers/food/snacks/coldchili"
	copy = "/mob/living/simple_mob/vore/spacecritter/livingice"

	var/chilltemp = -20

/mob/living/simple_mob/vore/spacecritter/livingice/handle_special()
	if(stat != DEAD)
		cold_aura()
	..()

/mob/living/simple_mob/vore/spacecritter/livingice/proc/cold_aura()
	var/turf/T = get_turf(src)
	var/datum/gas_mixture/env = T.return_air()
	if(env)
		env.add_thermal_energy(chilltemp * 1000)

/mob/living/simple_mob/vore/spacecritter/livingice/iceberg
	name = "living iceberg"
	desc = "A giant strange creature, a crab like creature seemingly made of ice"
	size_multiplier = 3.0
	health = 75
	maxHealth = 75
	chilltemp = -50

/mob/living/simple_mob/vore/spacecritter/radcrab //bullets, melee, and cold all crack the poor thing's shell
	name = "crystaline crab"
	desc = "A largeish hermit crab glowing green, irradting the nearby area"
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	icon_state = "hermitcrab"
	icon_living = "hermitcrab"
	icon_dead = "hermitcrab-dead"
	aquatic_movement = 1			// If set, the mob will move through fluids with no hinderance.

	minbodytemp = 260			// Minimum "okay" temperature in kelvin
	maxbodytemp = 10000			// Maximum of above
	melee_damage_lower = 2		// Lower bound of randomized melee damage
	melee_damage_upper = 2		// Upper bound of randomized melee damage
	attacktext = list("pinches") // "You are [attacktext] by the mob!"
	attack_armor_type = "melee"		// What armor does this check?
	attack_armor_pen = 100			// How much armor pen this attack has.
	var/rads = 50
	evolve = "/mob/living/simple_mob/vore/spacecritter/radcrab/supermattercrab"
	feed = "/obj/item/ore/uranium"
	evolvekey = "/obj/item/stack/material/uranium"
	copy = "/mob/living/simple_mob/vore/spacecritter/radcrab"

/mob/living/simple_mob/vore/spacecritter/radcrab/handle_special()
	if(stat != DEAD)
		irradiate()
	..()

/mob/living/simple_mob/vore/spacecritter/radcrab/proc/irradiate()
	SSradiation.radiate(src, rads)

/mob/living/simple_mob/vore/spacecritter/radcrab/supermattercrab
	size_multiplier = 1.5
	health = 75
	maxHealth = 75
	rads = 150
	name = "energized crystaline crab"
	icon_state = "superhermitcrab"
	icon_living = "superhermitcrab"
	icon_dead = "hermitcrab-dead"

/mob/living/simple_mob/vore/spacecritter/dreameel
	name = "dream eel"
	desc = "A eel floating through it's own thick cloud"
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	icon_state = "dreameel"
	icon_living = "dreameel"
	icon_dead = "dreameel-dead"
	movement_cooldown = -1			// Lower is faster.
	attacktext = list("bitten") // "You are [attacktext] by the mob!"
	var/artifact_master = /datum/component/artifact_master/dreameel
	evolve = "/mob/living/simple_mob/vore/spacecritter/dreameel/nightmare"
	feed = "/obj/item/reagent_containers/food/snacks/carpmeat"
	evolvekey = "/obj/item/stack/material/phoron"
	copy = "/mob/living/simple_mob/vore/spacecritter/dreameel"

/datum/component/artifact_master/dreameel
	make_effects = list(
		/datum/artifact_effect/gassleeping
	)

/mob/living/simple_mob/vore/spacecritter/dreameel/nightmare
	name = "dream eel"
	desc = "A eel floating through it's own thick cloud"
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	icon_state = "dreameel"
	icon_living = "dreameel"
	movement_cooldown = -5
	color = "#9933FF"

	artifact_master = /datum/component/artifact_master/nightmare

/datum/component/artifact_master/nightmare
	make_effects = list(
		/datum/artifact_effect/gasphoron
	)

/mob/living/simple_mob/vore/spacecritter/gravityshell
	name = "Gravity Shell"
	desc = "A metallic turtle"
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	icon_state = "gravityshell"
	icon_living = "gravityshell"
	icon_dead = "gravityshell-dead"
	movement_cooldown = 5			// Lower is faster.
	armor_soak = list(		// Values for getsoak() checks.
				"melee" = 7,
				"bullet" = 7,
				"laser" = 7,
				"energy" = 7,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 0
				)
	var/artifact_master = /datum/component/artifact_master/gravity

	evolve = "/mob/living/simple_mob/vore/spacecritter/gravityshell/cleanse"
	feed = "/obj/item/stack/material/concrete"
	evolvekey = "/obj/item/stack/material/tritium"
	copy = "/mob/living/simple_mob/vore/spacecritter/gravityshell"

/datum/component/artifact_master/gravity
	make_effects = list(
		/datum/artifact_effect/extreme/gravity_wave
	)

/mob/living/simple_mob/vore/spacecritter/gravityshell/cleanse
	size_multiplier = 0.5
	health = 75
	maxHealth = 75
	artifact_master = /datum/component/artifact_master/gasoxy
	icon_state = "cleanseshell"
	icon_living = "cleanseshell"
	icon_dead = "cleanseshell-dead"

/datum/component/artifact_master/gasoxy
	make_effects = list(
		/datum/artifact_effect/gasoxy
	)


/mob/living/simple_mob/vore/spacecritter/solarray
	vore_bump_chance = 80
	vore_bump_emote = "devours"
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0
	vore_default_mode = DM_DIGEST

/mob/living/simple_mob/vore/spacecritter/livingice
	vore_bump_chance = 0
	vore_bump_emote = "devours"
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0
	vore_default_mode = DM_DIGEST

/mob/living/simple_mob/vore/spacecritter/radcrab
	vore_bump_chance = 40
	vore_bump_emote = "devours"
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0
	vore_default_mode = DM_DIGEST

/mob/living/simple_mob/vore/spacecritter/dreameel
	vore_bump_chance = 40
	vore_bump_emote = "devours"
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0
	vore_default_mode = DM_DIGEST

/mob/living/simple_mob/vore/spacecritter/gravityshell
	vore_bump_chance = 40
	vore_bump_emote = "devours"
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0
	vore_default_mode = DM_DIGEST


/mob/living/simple_mob/vore/spacecritter/solarray
	meat_type = /obj/item/reagent_containers/food/snacks/meat/raymeat
	meat_amount = 8

	tame_items = list(
	/obj/item/stack/tile/grass = 50
	)

	butchery_loot = list(\
		/obj/item/stack/material/wisp = 3\
		)

	harvest_tool = /obj/item/weldingtool
	harvest_cooldown = 10 MINUTES
	harvest_delay = 30 SECONDS
	harvest_recent = 0
	harvest_per_hit = 1
	harvest_verb = "harvested"
	harvest_results = list(
		/obj/item/stack/material/wisp = 1
		)

/mob/living/simple_mob/vore/spacecritter/livingice
	meat_type = /obj/item/stack/material/snow
	meat_amount = 18

	tame_items = list(
	/obj/item/stack/material/snow = 10
	)

	butchery_loot = list(\
		/obj/item/stack/material/frostscale = 3\
		)

	harvest_tool = /obj/item/tool/wirecutters
	harvest_cooldown = 10 MINUTES
	harvest_delay = 30 SECONDS
	harvest_recent = 0
	harvest_per_hit = 1
	harvest_verb = "harvested"
	harvest_results = list(
		/obj/item/stack/material/frostscale = 1
		)

/mob/living/simple_mob/vore/spacecritter/radcrab
	meat_type = /obj/item/reagent_containers/food/snacks/crabmeat
	meat_amount = 8

	tame_items = list(
	/obj/item/ore/uranium = 50
	)

	butchery_loot = list(\
		/obj/item/stack/material/crystalscale = 3\
		)

	harvest_tool = /obj/item/tool/crowbar
	harvest_cooldown = 10 MINUTES
	harvest_delay = 30 SECONDS
	harvest_recent = 0
	harvest_per_hit = 1
	harvest_verb = "harvested"
	harvest_results = list(
		/obj/item/stack/material/crystalscale = 1
		)

/mob/living/simple_mob/vore/spacecritter/dreameel
	meat_type = /obj/item/reagent_containers/food/snacks/meat/eelmeat
	meat_amount = 2

	tame_items = list(
		/obj/item/reagent_containers/food/snacks/meat/gravityshell = 40
	)

	butchery_loot = list(\
		/obj/item/stack/material/dreamscale = 3\
		)

	harvest_tool = /obj/item/tool/wirecutters
	harvest_cooldown = 10 MINUTES
	harvest_delay = 30 SECONDS
	harvest_recent = 0
	harvest_per_hit = 1
	harvest_verb = "harvested"
	harvest_results = list(
		/obj/item/stack/material/dreamscale = 1
		)

/mob/living/simple_mob/vore/spacecritter/gravityshell
	meat_type = /obj/item/reagent_containers/food/snacks/meat/gravityshell
	meat_amount = 8

	tame_items = list(
	/obj/item/reagent_containers/food/snacks/crabmeat = 50
	)

	butchery_loot = list(\
		/obj/item/stack/material/shellchitin = 3\
		)

	harvest_tool = /obj/item/tool/crowbar
	harvest_cooldown = 10 MINUTES
	harvest_delay = 30 SECONDS
	harvest_recent = 0
	harvest_per_hit = 1
	harvest_verb = "harvested"
	harvest_results = list(
		/obj/item/stack/material/shellchitin = 1
		)
