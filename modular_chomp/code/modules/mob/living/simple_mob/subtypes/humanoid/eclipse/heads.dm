/mob/living/simple_mob/humanoid/eclipse/head
	name = "Eclipse Head"
	desc = "You shouldn't be seeing this. This is going to be rough"
	health = 315
	maxHealth = 315 //A 20 damae shot will need to land 35 times
	projectile_dispersion = 8
	projectile_accuracy = 0
	ranged_cooldown = 5

	damage_fatigue_mult = 0

	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 100, bio = 100, rad = 100)
	armor_soak = list(melee = 7, bullet = 7, laser = 7, energy = 7, bomb = 0, bio = 0, rad = 0)

/mob/living/simple_mob/humanoid/eclipse/head/security
	name = "Eclipse Head Of Security"
	icon_state = "fleetsec"
	projectiletype = /obj/item/projectile/energy/flamecrystal
	special_attack_cooldown = 10 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 8
	loot_list = list(/obj/item/gun/energy/flamegun = 100,
		/obj/item/bone/skull = 100
			)


/mob/living/simple_mob/humanoid/eclipse/head/security/updatehealth()
	. = ..()

	if(vore_fullness == 1)
		ranged_cooldown = 8
		projectiletype = /obj/item/projectile/energy/flamecrystal
	else if(vore_fullness == 2)
		ranged_cooldown = 12
		projectiletype = /obj/item/projectile/energy/fireball
	else if (vore_fullness > 2)
		ranged_cooldown = 16
		projectiletype = /obj/item/projectile/energy/fireball
	else
		ranged_cooldown = 5

/mob/living/simple_mob/humanoid/eclipse/head/security/do_special_attack(atom/A)
	if(vore_fullness < 2)
		if(prob(50))
			rapidfire(A)
		else
			tornado_maw(A)
	else if(vore_fullness == 2)
		tornado_maw(A)
	else if(vore_fullness > 2)
		if(prob(50))
			deathtoll(A)
		else
			tornado_maw(A)

/mob/living/simple_mob/humanoid/eclipse/head/security/proc/rapidfire(atom/A)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/flamecrystal(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)
	sleep(1)
	P.launch_projectile(A, BP_TORSO, src)
	sleep(1)
	P.launch_projectile(A, BP_TORSO, src)
	sleep(1)
	P.launch_projectile(A, BP_TORSO, src)
	sleep(1)
	P.launch_projectile(A, BP_TORSO, src)

/mob/living/simple_mob/humanoid/eclipse/head/security/proc/tornado_maw(atom/A)
	var/turf/T = get_turf(src)

	var/datum/effect/effect/system/grav_pull/s1 = new /datum/effect/effect/system/grav_pull
	s1.set_up(5, 1, T)
	s1.start()

/mob/living/simple_mob/humanoid/eclipse/head/security/proc/deathtoll(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/eclipse))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			deathtollfollow(target)

/mob/living/simple_mob/humanoid/eclipse/head/security/proc/deathtollfollow(atom/target)
	var/list/bomb_range = block(locate(target.x-6, target.y-6, target.z), locate(target.x+6, target.y+6, target.z))
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/flamegun(get_turf(src))
	bomb_range -= get_turf(target)
	for(var/i = 0, i < 4, i++)
		var/turf/T = pick(bomb_range)
		P.launch_projectile(target, BP_TORSO, src)
		bomb_range -= T

/obj/item/projectile/energy/flamecrystal
	name = "Flame Crystal"
	icon = 'modular_chomp/icons/mob/eclipse.dmi' //commiting sin
	icon_state = "firecrystal"
	damage = 15
	armor_penetration = 40 //Large pointy crystal
	damage_type = BRUTE
	check_armour = "bullet"
	modifier_type_to_apply = /datum/modifier/fire/weak
	modifier_duration = 0.05 MINUTE
	range = 12
	hud_state = "laser_sniper"

/obj/item/projectile/bullet/flamegun
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 800
	submunition_spread_min = 200
	submunitions = list(/obj/item/projectile/energy/flamecrystal = 3)
	hud_state = "laser_heat"

/obj/item/projectile/bullet/flamegun/on_range()
	qdel(src)

/mob/living/simple_mob/humanoid/eclipse/head/scientist
	name = "Eclipse Lead Researcher"
	icon_state = "fleetsci"
	health = 30
	special_attack_cooldown = 5 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 10
	projectiletype = /obj/item/projectile/bullet/pistol/ap

	loot_list = list(/obj/item/circuitboard/mecha/hades/targeting = 100,
		/obj/item/circuitboard/mecha/hades/peripherals = 100,
		/obj/item/circuitboard/mecha/hades/main = 100,
		/obj/item/bone/skull = 100
			)

	var/obj/item/shield_projector/shield1 = null
	var/obj/item/shield_projector/shield2 = null
	var/obj/item/shield_projector/shield3 = null

/mob/living/simple_mob/humanoid/eclipse/head/scientist/Initialize(mapload)
	shield1 = new /obj/item/shield_projector/rectangle/automatic/eclipse(src)
	shield2 = new /obj/item/shield_projector/rectangle/automatic/eclipse/medium(src)
	shield3 = new /obj/item/shield_projector/rectangle/automatic/eclipse/big(src)
	return ..()

/obj/item/shield_projector/rectangle/automatic/eclipse
	name = "cult shield stone"
	icon = 'icons/obj/device.dmi'
	icon_state = "implant_melted"
	shield_health = 100
	max_shield_health = 100
	shield_regen_delay = 120 SECONDS
	shield_regen_amount = 100
	size_x = 1
	size_y = 1
	color = "#FF6600"
	high_color = "#0099CC"
	low_color = "#660066"

/obj/item/shield_projector/rectangle/automatic/eclipse/medium
	size_x = 2
	size_y = 2

/obj/item/shield_projector/rectangle/automatic/eclipse/big
	size_x = 3
	size_y = 3

/mob/living/simple_mob/humanoid/eclipse/head/scientist/updatehealth()
	. = ..()

	if(vore_fullness == 1)
		special_attack_cooldown = 10 SECONDS
	else if(vore_fullness > 1)
		special_attack_cooldown = 20 SECONDS
	else
		special_attack_cooldown = 5 SECONDS

/mob/living/simple_mob/humanoid/eclipse/head/scientist/do_special_attack(atom/A)
	visible_message(span("warning", "\The [src] begins to fabricate drones!"))
	sleep(3)
	if(vore_fullness == 1)
		new /mob/living/simple_mob/mechanical/mining_drone/scavenger/eclipse (src.loc)
	else if(vore_fullness > 1)
		new /mob/living/simple_mob/mechanical/mining_drone/scavenger/eclipse (src.loc)
		new /mob/living/simple_mob/mechanical/mining_drone/scavenger/eclipse (src.loc)
		new /mob/living/simple_mob/mechanical/hivebot/swarm/eclipse (src.loc)
		new /mob/living/simple_mob/mechanical/hivebot/swarm/eclipse (src.loc)
	else
		new /mob/living/simple_mob/mechanical/hivebot/swarm/eclipse (src.loc)
		new /mob/living/simple_mob/mechanical/hivebot/swarm/eclipse (src.loc)


/mob/living/simple_mob/mechanical/hivebot/swarm/eclipse
	faction = "eclipse"


/mob/living/simple_mob/humanoid/eclipse/head/captain
	name = "Eclipse Expedition Leader"
	icon_state = "captain"

	loot_list = list(/obj/item/slime_extract/dark = 20,
			/obj/item/prop/alien/junk = 60,
			/obj/random/tool/alien = 60,
			/obj/random/tool/alien = 60,
			/obj/item/cell/device/weapon/recharge/alien = 60,
			/obj/random/tool/alien = 60,
			/obj/item/cell/device/weapon/recharge/alien = 60,
			/obj/item/bluespace_harpoon = 60,
			/obj/item/flame/lighter/supermatter/syndismzippo = 60,
			/obj/item/gun/energy/medigun = 60,
			/obj/item/bone/skull = 100
			)

	var/obj/item/shield_projector/shield1 = null

/mob/living/simple_mob/humanoid/eclipse/head/captain/Initialize(mapload)
	shield1 = new /obj/item/shield_projector/rectangle/automatic/eclipse/big(src)

/mob/living/simple_mob/humanoid/eclipse/head/captain/updatehealth() //This is a mistake
	. = ..()

	if(vore_fullness == 1)
		ranged_cooldown = 4
		projectiletype = /obj/item/projectile/energy/frostsphere
		movement_cooldown = 1
		melee_attack_delay = 1.3
		melee_damage_lower = 20
		melee_damage_upper = 35
		armor = list(melee = 35, bullet = 35, laser = 35, energy = 35, bomb = 100, bio = 100, rad = 100)
		armor_soak = list(melee = 7, bullet = 7, laser = 7, energy = 7, bomb = 0, bio = 0, rad = 0)
		special_attack_cooldown = 15
	else if(vore_fullness == 2)
		ranged_cooldown = 0.5
		projectiletype = /obj/item/projectile/energy/muckblob
		movement_cooldown = 2
		melee_attack_delay = 1.8
		melee_damage_lower = 20
		melee_damage_upper = 40
		armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 100, bio = 100, rad = 100)
		armor_soak = list(melee = 6, bullet = 6, laser = 6, energy = 6, bomb = 0, bio = 0, rad = 0)
		special_attack_cooldown = 20
	else if (vore_fullness > 2)
		ranged_cooldown = 16
		projectiletype = /obj/item/projectile/energy/mob/ionbeam
		movement_cooldown = 3
		melee_attack_delay = 2
		melee_damage_lower = 30
		melee_damage_upper = 40
		armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 100, bio = 100, rad = 100)
		armor_soak = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
		special_attack_cooldown = 30
	else
		ranged_cooldown = 8
		projectiletype = /obj/item/projectile/bullet/flamegun
		movement_cooldown = 0
		melee_attack_delay = 1.1
		melee_damage_lower = 20
		melee_damage_upper = 25
		armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 100, bio = 100, rad = 100)
		armor_soak = list(melee = 7, bullet = 7, laser = 7, energy = 7, bomb = 0, bio = 0, rad = 0)
		special_attack_cooldown = 10


/mob/living/simple_mob/humanoid/eclipse/head/captain/do_special_attack(atom/A) //note to self, try to make fullness alts for this attacks
	if(prob(20))
		invokesec(A)
	else if(prob(20))
		invokesci(A)
	else if(prob(20))
		invokeengi(A)
	else if(prob(20))
		invokemedical(A)
	else
		invokecargo(A)


/mob/living/simple_mob/humanoid/eclipse/head/captain/proc/invokesec(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/eclipse))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			secattack(target)

/mob/living/simple_mob/humanoid/eclipse/head/captain/proc/secattack(atom/target)
	var/list/bomb_range = block(locate(target.x-4, target.y-4, target.z), locate(target.x+4, target.y+4, target.z))
	var/obj/item/projectile/P = new /obj/item/projectile/energy/flamecrystal(get_turf(src))
	bomb_range -= get_turf(target)
	for(var/i = 0, i < 4, i++)
		var/turf/T = pick(bomb_range)
		P.launch_projectile(target, BP_TORSO, src)
		bomb_range -= T

/mob/living/simple_mob/humanoid/eclipse/head/captain/proc/invokecargo(atom/A)
	visible_message(span("warning", "\The [src] calls for their help on radio!"))

/mob/living/simple_mob/humanoid/eclipse/head/captain/proc/invokeengi(atom/A) //place holdery
	var/obj/item/projectile/P = new /obj/item/projectile/temp(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)
	var/obj/item/projectile/P2 = new /obj/item/projectile/temp/hot(get_turf(src))
	P2.launch_projectile(A, BP_TORSO, src)

/mob/living/simple_mob/humanoid/eclipse/head/captain/proc/invokesci(atom/A)
	visible_message(span("warning", "\The [src] begins to fabricate drones!"))
	sleep(3)
	new /mob/living/simple_mob/mechanical/hivebot/swarm/eclipse (src.loc)
	new /mob/living/simple_mob/mechanical/hivebot/swarm/eclipse (src.loc)
	new /mob/living/simple_mob/mechanical/hivebot/swarm/eclipse (src.loc)

/mob/living/simple_mob/humanoid/eclipse/head/captain/proc/invokemedical(atom/A)
	visible_message(span("warning", "\The [src] begins to tend to their wounds!"))
	sleep(3)
	adjustBruteLoss(-12)
	adjustFireLoss(-12)
	adjustToxLoss(-12)
	adjustOxyLoss(-12)
	adjustCloneLoss(-12)


/mob/living/simple_mob/humanoid/eclipse/head/shade
	name = "???"
	icon_state = "shade"
	health = 300
	maxHealth = 300 //18 20 damage shots

	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 100, bio = 100, rad = 100)

	projectiletype = /obj/item/projectile/bullet/lightingburst

	special_attack_cooldown = 10 SECONDS
	special_attack_min_range = 0
	special_attack_max_range = 7

	loot_list = list(/obj/item/gun/energy/pulseglove = 100
			)


/mob/living/simple_mob/humanoid/eclipse/head/shade/do_special_attack(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	for(var/atom/entry in potential_targets)
		if(istype(entry, /mob/living/simple_mob/humanoid/eclipse))
			potential_targets -= entry
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 5)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			bullethell(target)

/mob/living/simple_mob/humanoid/eclipse/head/shade/proc/bullethell(atom/target)
	var/list/bomb_range = block(locate(target.x-6, target.y-6, target.z), locate(target.x+6, target.y+6, target.z))
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/meteorstorm(get_turf(src))
	bomb_range -= get_turf(target)
	for(var/i = 0, i < 4, i++)
		var/turf/T = pick(bomb_range)
		P.launch_projectile(target, BP_TORSO, src)
		bomb_range -= T
