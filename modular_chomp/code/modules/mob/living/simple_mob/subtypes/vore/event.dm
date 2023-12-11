/mob/living/simple_mob/vore/solarray //solar moth lite, dies to water
	name = "solar ray"
	desc = "A sting ray of fire, drifting around"
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	icon_state = "solarray"
	icon_living = "solarray"
	icon_dead = "solarray-dead"
	health = 30
	maxHealth = 30

	movement_cooldown = 3			// Lower is faster.
	aquatic_movement = 0			// If set, the mob will move through fluids with no hinderance.

	minbodytemp = 0			// Minimum "okay" temperature in kelvin
	maxbodytemp = 10000			// Maximum of above
	heat_damage_per_tick = 3	// Amount of damage applied if animal's body temperature is higher than maxbodytemp
	cold_damage_per_tick = 2	// Same as heat_damage_per_tick, only if the bodytemperature it's lower than minbodytemp

	min_oxy = 0					// Oxygen in moles, minimum, 0 is 'no minimum'
	max_oxy = 0					// Oxygen in moles, maximum, 0 is 'no maximum'
	min_tox = 0					// Phoron min
	max_tox = 0					// Phoron max
	min_co2 = 0					// CO2 min
	max_co2 = 0					// CO2 max
	min_n2 = 0					// N2 min
	max_n2 = 0					// N2 max
	unsuitable_atoms_damage = 2	// This damage is taken when atmos doesn't fit all the requirements above

	melee_damage_lower = 12		// Lower bound of randomized melee damage
	melee_damage_upper = 12		// Upper bound of randomized melee damage
	attacktext = list("incinerate") // "You are [attacktext] by the mob!"
	melee_miss_chance = 0			// percent chance to miss a melee attack.
	attack_armor_type = "energy"		// What armor does this check?
	attack_armor_pen = 30			// How much armor pen this attack has.
	attack_sharp = FALSE			// Is the attack sharp?
	attack_edge = FALSE				// Does the attack have an edge?

	melee_attack_delay = 1.5			// If set, the mob will do a windup animation and can miss if the target moves out of the way.
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
	hovering = TRUE

	//Damage resistances
	grab_resist = 0				// Chance for a grab attempt to fail. Note that this is not a true resist and is just a prob() of failure.
	resistance = 0				// Damage reduction for all types
	armor = list(			// Values for normal getarmor() checks
				"melee" = 90,
				"bullet" = 95,
				"laser" = 100,
				"energy" = 100,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)
	armor_soak = list(		// Values for getsoak() checks.
				"melee" = 7,
				"bullet" = 7,
				"laser" = 7,
				"energy" = 7,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 0
				)

	heat_resist = 1.0
	cold_resist = 1.0
	shock_resist = 0.0
	water_resist = 0.0
	taser_kill = 0

	var/mycolour = COLOR_RED //Variable Lighting colours
	var/original_temp = null //Value to remember temp
	var/set_temperature = T0C + 5000	//Sets the target point of 10k degrees celsius
	var/heating_power = 50000

/mob/living/simple_mob/vore/solarray/Life()
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

/mob/living/simple_mob/vore/livingice //frost solar moth or blue slime on crack. Dies to lasers or slighly toasty rooms
	name = "living icicle"
	desc = "A strange creature, a floating shard of ice"
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	icon_state = "hermitcrab"
	icon_living = "hermitcrab"
	icon_dead = "hermitcrab-dead"
	health = 30
	maxHealth = 30

	movement_cooldown = 3			//VOREStation Edit - 1 is slower than normal human speed // Lower is faster.
	aquatic_movement = 0			// If set, the mob will move through fluids with no hinderance.

	minbodytemp = 0			// Minimum "okay" temperature in kelvin
	maxbodytemp = 300			// Maximum of above
	heat_damage_per_tick = 15	// Amount of damage applied if animal's body temperature is higher than maxbodytemp
	cold_damage_per_tick = 15	// Same as heat_damage_per_tick, only if the bodytemperature it's lower than minbodytemp

	min_oxy = 0					// Oxygen in moles, minimum, 0 is 'no minimum'
	max_oxy = 0					// Oxygen in moles, maximum, 0 is 'no maximum'
	min_tox = 0					// Phoron min
	max_tox = 6					// Phoron max
	min_co2 = 0					// CO2 min
	max_co2 = 0					// CO2 max
	min_n2 = 0					// N2 min
	max_n2 = 0					// N2 max
	unsuitable_atoms_damage = 2	// This damage is taken when atmos doesn't fit all the requirements above

	melee_damage_lower = 30		// Lower bound of randomized melee damage
	melee_damage_upper = 30		// Upper bound of randomized melee damage
	attacktext = list("attacked") // "You are [attacktext] by the mob!"
	melee_miss_chance = 0			// percent chance to miss a melee attack.
	attack_armor_type = "melee"		// What armor does this check?
	attack_armor_pen = 0			// How much armor pen this attack has.
	attack_sharp = FALSE			// Is the attack sharp?
	attack_edge = FALSE				// Does the attack have an edge?

	melee_attack_delay = 3			// If set, the mob will do a windup animation and can miss if the target moves out of the way..

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
	hovering = TRUE

	//Damage resistances
	grab_resist = 0				// Chance for a grab attempt to fail. Note that this is not a true resist and is just a prob() of failure.
	resistance = 0				// Damage reduction for all types
	armor = list(			// Values for normal getarmor() checks
				"melee" = 100,
				"bullet" = 100,
				"laser" = 0,
				"energy" = 0,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)
	armor_soak = list(		// Values for getsoak() checks.
				"melee" = 7,
				"bullet" = 7,
				"laser" = 0,
				"energy" = 0,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 0
				)

	heat_resist = 0.0
	cold_resist = 0.0
	shock_resist = 0.0
	water_resist = 1.0

/mob/living/simple_mob/vore/livingice/proc/cold_aura()
	for(var/mob/living/L in view(2, src))
	var/turf/T = get_turf(src)
	var/datum/gas_mixture/env = T.return_air()
	if(env)
		env.add_thermal_energy(-5 * 1000)

/mob/living/simple_mob/vore/radcrab //bullets, melee, and cold all crack the poor thing's shell
	name = "crystaline crab"
	desc = "A largeish hermit crab glowing green, irradting the nearby area"
	icon = 'modular_chomp/icons/mob/spaceinvader.dmi'
	icon_state = "hermitcrab"
	icon_living = "hermitcrab"
	icon_dead = "hermitcrab-dead"
	health = 30
	maxHealth = 30

	movement_cooldown = 3			//VOREStation Edit - 1 is slower than normal human speed // Lower is faster.
	aquatic_movement = 1			// If set, the mob will move through fluids with no hinderance.

	minbodytemp = 260			// Minimum "okay" temperature in kelvin
	maxbodytemp = 10000			// Maximum of above
	heat_damage_per_tick = 15	// Amount of damage applied if animal's body temperature is higher than maxbodytemp
	cold_damage_per_tick = 15	// Same as heat_damage_per_tick, only if the bodytemperature it's lower than minbodytemp

	min_oxy = 0					// Oxygen in moles, minimum, 0 is 'no minimum'
	max_oxy = 0					// Oxygen in moles, maximum, 0 is 'no maximum'
	min_tox = 0					// Phoron min
	max_tox = 0					// Phoron max
	min_co2 = 0					// CO2 min
	max_co2 = 5					// CO2 max
	min_n2 = 0					// N2 min
	max_n2 = 0					// N2 max
	unsuitable_atoms_damage = 2	// This damage is taken when atmos doesn't fit all the requirements above

	melee_damage_lower = 2		// Lower bound of randomized melee damage
	melee_damage_upper = 2		// Upper bound of randomized melee damage
	attacktext = list("pinches") // "You are [attacktext] by the mob!"
	melee_miss_chance = 0			// percent chance to miss a melee attack.
	attack_armor_type = "melee"		// What armor does this check?
	attack_armor_pen = 100			// How much armor pen this attack has.
	attack_sharp = TRUE			// Is the attack sharp?
	attack_edge = TRUE				// Does the attack have an edge?

	melee_attack_delay = 0			// If set, the mob will do a windup animation and can miss if the target moves out of the way.
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
	hovering = TRUE

	//Damage resistances
	grab_resist = 0				// Chance for a grab attempt to fail. Note that this is not a true resist and is just a prob() of failure.
	resistance = 0				// Damage reduction for all types
	armor = list(			// Values for normal getarmor() checks
				"melee" = -50,
				"bullet" = 0,
				"laser" = 100,
				"energy" = 100,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)
	armor_soak = list(		// Values for getsoak() checks.
				"melee" = 0,
				"bullet" = 0,
				"laser" = 7,
				"energy" = 7,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 0
				)

	heat_resist = 0.0
	cold_resist = 0.0
	shock_resist = 0.0
	water_resist = 1.0
	taser_kill = 0
	var/rads = 75

/mob/living/simple_mob/vore/radcrab/handle_special()
	if(stat != DEAD)
		irradiate()
	..()

/mob/living/simple_mob/vore/radcrab/proc/irradiate()
	SSradiation.radiate(src, rads)

/mob/living/simple_mob/vore/solarray
	vore_bump_chance = 80
	vore_bump_emote = "devours"
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0
	vore_default_mode = DM_DIGEST

/mob/living/simple_mob/vore/livingice
	vore_bump_chance = 0
	vore_bump_emote = "devours"
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0
	vore_default_mode = DM_DIGEST

/mob/living/simple_mob/vore/radcrab
	vore_bump_chance = 40
	vore_bump_emote = "devours"
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0
	vore_default_mode = DM_DIGEST

/mob/living/simple_mob/vore/aggressive/rat
	maxHealth = 75
	health = 75

/mob/living/simple_mob/vore/aggressive/rat/phoron
	maxHealth = 87
	health = 87

/mob/living/simple_mob/vore/aggressive/rat/event
	maxHealth = 25
	health = 25