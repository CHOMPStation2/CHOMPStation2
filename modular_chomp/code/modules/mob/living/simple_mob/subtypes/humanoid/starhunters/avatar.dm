/mob/living/simple_mob/humanoid/starhunter/hunter/clone
	name = "Avatar Of The Serpent"
	icon_state = "avatar"
	health = 15
	maxHealth = 15
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/aggressive/starhunter
	projectiletype = /obj/item/projectile/energy/ninjastar

/mob/living/simple_mob/humanoid/starhunter/hunter/avatar
	name = "Avatar Of The Serpent"
	icon_state = "avatar"
	health = 1000 //50 hits from 20 damage
	maxHealth = 1000 //50 hits from 20 damage
	damage_fatigue_mult = 0
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/aggressive/starhunter
	special_attack_cooldown = 20 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7
	projectiletype = /obj/item/projectile/energy/ninjastar
	digestable = 0
	devourable = 0
	//note to self, expand the loot list later
	loot_list = list(/obj/item/storage/belt/holding = 60,
			/obj/item/clothing/glasses/omni = 60,
			/obj/item/kinetic_crusher/glaive = 60,
			/obj/item/slime_extract/sepia = 60,
			/obj/item/circuitboard/defenseonelisk = 60,
			/obj/item/circuitboard/paradoxrift = 60,
			/obj/item/capture_crystal = 60
			)


/mob/living/simple_mob/humanoid/starhunter/hunter/avatar/updatehealth()
	. = ..()

	if(health < maxHealth*0.25)
		special_attack_cooldown = 5 SECONDS
		projectiletype = /obj/item/projectile/bullet/ninjaburst
	else if(health < maxHealth*0.5)
		special_attack_cooldown = 10 SECONDS
		projectiletype = /obj/item/projectile/energy/kunai
	else if (health < maxHealth*0.75)
		special_attack_cooldown = 15 SECONDS
		projectiletype = /obj/item/projectile/energy/chakaram

/mob/living/simple_mob/humanoid/starhunter/hunter/avatar/do_special_attack(atom/A)
	if(health < maxHealth*0.4)
		if(prob(20))
			lightingstorm(A)
		if(prob(20))
			lightingline(A)
		if(prob(20))
			lightpillar(A)
		if(prob(20))
			clones(A)
		else
			rapidfire_windup(A)
	else if(health < maxHealth*0.7)
		if(prob(25))
			lightingstorm(A)
		if(prob(25))
			lightingline(A)
		if(prob(25))
			lightpillar(A)
		else
			rapidfire_windup(A)
	else
		if(prob(50))
			lightingstrike(A)
		else
			lightpillar(A)

/obj/item/projectile/energy/kunai //chip damage
	name = "Energy Kunai"
	icon = 'modular_chomp/icons/mob/starhunters.dmi' //commiting sin
	icon_state = "kunai"
	damage = 5
	armor_penetration = 65 //Gets into the gaps
	speed = 2
	damage_type = BURN
	check_armour = "laser"

/obj/item/projectile/energy/chakaram //slower but hits harder
	name = "Energy Chakaram"
	icon = 'modular_chomp/icons/mob/starhunters.dmi' //commiting sin
	icon_state = "chakaram"
	damage = 25
	armor_penetration = 25 //Gets into the gaps
	speed = 5
	damage_type = BURN
	check_armour = "laser"

/obj/item/projectile/bullet/ninjaburst
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 2600
	submunition_spread_min = 150
	submunitions = list(/obj/item/projectile/energy/kunai = 3, /obj/item/projectile/energy/chakaram = 1, /obj/item/projectile/energy/ninjastar = 3)

/datum/ai_holder/simple_mob/ranged/aggressive/starhunter
	vision_range = 14
	closest_distance = 5
	returns_home = TRUE		// Stay close to the base...
	wander = TRUE			// ... but "patrol" a little.
	intelligence_level = AI_SMART // Also knows not to walk while confused if it risks death.
	mauling = TRUE
	call_distance = 0 //Trying to disable this for the mobs
	retaliate = TRUE
	hostile = FALSE
	violent_breakthrough = TRUE
	respect_alpha = FALSE
	pointblank = TRUE

/obj/effect/calldown_attack_lighting
	anchored = TRUE
	density = FALSE
	unacidable = TRUE
	mouse_opacity = 0
	icon = 'icons/effects/effects.dmi'
	icon_state = "drop_marker"

/obj/effect/calldown_attack_lighting/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/calldown_attack_fire/LateInitialize()
	var/delay = rand(25, 30)
	spawn(delay-7)
		lightning_strike(src.loc)
	spawn(delay)
		qdel(src)


/mob/living/simple_mob/humanoid/starhunter/hunter/avatar/proc/lightingstorm(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/starhunter/hunter))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			lightingstormfollow(target)

/mob/living/simple_mob/humanoid/starhunter/hunter/avatar/proc/lightingstormfollow(atom/target)
	var/list/bomb_range = block(locate(target.x-6, target.y-6, target.z), locate(target.x+6, target.y+6, target.z))
	new /obj/effect/calldown_attack(get_turf(target))
	bomb_range -= get_turf(target)
	for(var/i = 0, i < 4, i++)
		var/turf/T = pick(bomb_range)
		new /obj/effect/calldown_attack_lighting(T)
		bomb_range -= T

/mob/living/simple_mob/humanoid/starhunter/hunter/avatar/proc/lightingline(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/starhunter/hunter))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			lightinglinefollow(target)

/mob/living/simple_mob/humanoid/starhunter/hunter/avatar/proc/lightinglinefollow(atom/target)
	var/alignment = rand(1,2)	// 1 for vertical, 2 for horizontal
	var/list/line_range = list()
	var/turf/T = get_turf(target)
	line_range += T
	for(var/i = 1, i <= 7, i++)
		switch(alignment)
			if(1)
				if(T.x-i > 0)
					line_range += locate(T.x-i, T.y, T.z)
				if(T.x+i <= world.maxx)
					line_range += locate(T.x+i, T.y, T.z)
			if(2)
				if(T.y-i > 0)
					line_range += locate(T.x, T.y-i, T.z)
				if(T.y+i <= world.maxy)
					line_range += locate(T.x, T.y+i, T.z)
	for(var/turf/dropspot in line_range)
		new /obj/effect/calldown_attack_lighting(dropspot)

/mob/living/simple_mob/humanoid/starhunter/hunter/avatar/proc/clones(atom/A)
	new /mob/living/simple_mob/humanoid/starhunter/hunter/clone (src.loc)
	new /mob/living/simple_mob/humanoid/starhunter/hunter/clone (src.loc)
	new /mob/living/simple_mob/humanoid/starhunter/hunter/clone (src.loc)

/mob/living/simple_mob/humanoid/starhunter/hunter/avatar/proc/lightingstrike(atom/A)
	var/list/nearby_things = range(1, A)
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
		to_chat(src, span("warning", "There wasn't an unoccupied spot to teleport to."))
		return FALSE

	var/turf/target_turf = pick(valid_turfs)

	new/obj/effect/calldown_attack_lighting(target_turf)