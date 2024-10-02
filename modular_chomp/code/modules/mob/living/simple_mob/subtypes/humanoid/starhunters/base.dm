/mob/living/simple_mob/humanoid/starhunter
	name = "Starhunter Initiate"
	desc = "A strange critter cladded in strange armor."
	icon = 'modular_chomp/icons/mob/starhunters.dmi'
	icon_state = "sun"
	icon_living = "sun"
	icon_dead = "statisgem"
	icon_gib = "syndicate_gib"
	taser_kill = 0

	faction = "starhunter"
	movement_cooldown = 0

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	health = 120 //This may be high, but intend for the combative ones to be on their own.
	maxHealth = 120
	harm_intent_damage = 5
	melee_damage_lower = 17 //machette
	melee_damage_upper = 17 //beg knife go brrr
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	projectile_dispersion = 8
	projectile_accuracy = -20
	armor = list(melee = 40, bullet = 70, laser = 10, energy = 0, bomb = 50, bio = 100, rad = 100)	// Critters are more ortiented torwards melee and bullet
	ranged_cooldown = 5

	ai_holder_type = /datum/ai_holder/simple_mob/starhunter

	can_be_drop_prey = FALSE
	pass_flags = PASSTABLE
	softfall = TRUE

	//spaceproofing things
	minbodytemp = 0			// Minimum "okay" temperature in kelvin
	maxbodytemp = 600			// Maximum of above

	min_oxy = 0					// Oxygen in moles, minimum, 0 is 'no minimum'
	max_oxy = 0					// Oxygen in moles, maximum, 0 is 'no maximum'
	min_tox = 0					// Phoron min
	max_tox = 0					// Phoron max
	min_co2 = 0					// CO2 min
	max_co2 = 0					// CO2 max
	min_n2 = 0					// N2 min
	max_n2 = 0

/datum/ai_holder/simple_mob/starhunter
	returns_home = TRUE		// Stay close to the base...
	wander = TRUE			// ... but "patrol" a little.
	intelligence_level = AI_SMART // Also knows not to walk while confused if it risks death.
	can_flee = TRUE					// If they're even allowed to flee.
	flee_when_dying = TRUE			// If they should flee when low on health.
	dying_threshold = 0.2			// How low on health the holder needs to be before fleeing. Defaults to 30% or lower health.
	mauling = TRUE
	call_distance = 0 //Trying to disable this for the mobs
	vision_range = 10
	retaliate = TRUE
	hostile = FALSE
	violent_breakthrough = TRUE
	respect_alpha = FALSE
	pointblank = TRUE

/datum/ai_holder/simple_mob/starhunter/aggro
	hostile = TRUE

//basic aggro stahunters
/mob/living/simple_mob/humanoid/starhunter/hunter
	ai_holder_type = /datum/ai_holder/simple_mob/starhunter/aggro
	special_attack_cooldown = 30 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7

/mob/living/simple_mob/humanoid/starhunter/hunter/harvester
	icon_state = "snekdruid"
	icon_state = "snekdruid"
	melee_damage_lower = 25
	melee_damage_upper = 25
	melee_attack_delay = 2.5 SECOND

/mob/living/simple_mob/humanoid/starhunter/hunter/harvester/handle_special() //wierd movement
	if(prob(20))
		step(src, pick(cardinal))
	..()

/mob/living/simple_mob/humanoid/starhunter/hunter/ninja
	icon_state = "suneswift"
	icon_living = "suneswift"
	movement_cooldown = -3
	melee_damage_lower = 15
	melee_damage_upper = 15
	melee_attack_delay = 1.5 SECOND

/mob/living/simple_mob/humanoid/starhunter/hunter/ninja/do_special_attack(atom/target)
	if(prob(50))
		teleportnompf(target)
	else
		smokebomb(target)
//Special attack procs
/mob/living/simple_mob/humanoid/starhunter/hunter/proc/teleportnompf(atom/target)
	var/list/nearby_things = range(1, target)
	var/list/valid_turfs = list()

	for(var/turf/potential_turf in nearby_things)
		var/valid_turf = TRUE
		if(potential_turf.density)
			continue
		for(var/atom/movable/AM in potential_turf)
			if(AM.density)
				valid_turf = FALSE
		if(valid_turf)
			valid_turfs.Add(potential_turf)

	if(!(valid_turfs.len))
		to_chat(src, span_warning("There wasn't an unoccupied spot to teleport to."))
		return FALSE

	var/turf/target_turf = pick(valid_turfs)

	forceMove(target_turf)

	var/mob/living/L = target
	var/obj/belly/belly_dest

	if(L.can_be_drop_prey && L.devourable)
		L.forceMove(belly_dest)
		to_chat(target, "<span class='danger'>[src] materializes around you, as you end up in their [belly_dest]!</span>")


/mob/living/simple_mob/humanoid/starhunter/hunter/proc/smokebomb(atom/target)
	var/list/nearby_things = range(1, target)
	var/list/valid_turfs = list()

	// All this work to just go to a non-dense tile.
	for(var/turf/potential_turf in nearby_things)
		var/valid_turf = TRUE
		if(potential_turf.density)
			continue
		for(var/atom/movable/AM in potential_turf)
			if(AM.density)
				valid_turf = FALSE
		if(valid_turf)
			valid_turfs.Add(potential_turf)

	if(!(valid_turfs.len))
		to_chat(src, span_warning("There wasn't an unoccupied spot to teleport to."))
		return FALSE

	var/turf/target_turf = pick(valid_turfs)

	var/datum/effect/effect/system/spark_spread/s2 = new /datum/effect/effect/system/smoke_spread
	s2.set_up(5, 1, target_turf)
