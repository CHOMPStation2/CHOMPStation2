/mob/living/simple_mob/mechanical/mecha/eclipse/battle_top
	name = "astral collective cryo top"
	icon_state = "mecha_top"
	icon_living = "mecha_top"
	health = 3000
	maxHealth = 3000
	wreckage = /obj/item/melee/energy/sword/top_shield
	desc = "It appears to be spinning at rapid speeds; enough to deflect projectiles. The air around it feels frigid."
	specialattackprojectile = /obj/item/projectile/energy/eclipse_boss/chillingwind
	projectiletype = /obj/item/projectile/energy/eclipse_boss/chillingwind
	pilot_type = /mob/living/simple_mob/humanoid/astral_collective/purity

/mob/living/simple_mob/mechanical/mecha/eclipse/battle_top/do_special_attack(atom/A)
	rng_cycle = rand(1,3)
	switch(a_intent)
		if(I_HURT) //phase1
			switch(attackcycle)
				if(1)
					specialattackprojectile = /obj/item/projectile/energy/eclipse_boss/chillingwind
					addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 7), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(2)
					specialattackprojectile = /obj/item/projectile/energy/eclipse_boss/chillingwind
					addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, rng_cycle, 18), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(3)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, rng_cycle, /datum/modifier/mmo_drop/eclipse_iceball), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
		if(I_GRAB) //phase2
			switch(attackcycle)
				if(1)
					specialattackprojectile = /obj/item/projectile/energy/eclipse_boss/chillingwind
					addtimer(CALLBACK(src, PROC_REF(bullet_blossom), A, 3, 8), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(2)
					specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
					addtimer(CALLBACK(src, PROC_REF(chain_burst), A, rng_cycle, 6), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(3)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, rng_cycle, /datum/modifier/mmo_drop/eclipse_iceball), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
		if(I_DISARM) //phase3
			switch(attackcycle)
				if(1)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, rng_cycle, /datum/modifier/mmo_drop/eclipse_iceball), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(2)
					specialattackprojectile = /obj/item/projectile/arc/blue_energy/precusor
					addtimer(CALLBACK(src, PROC_REF(checker_board), A, rng_cycle), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(3)
					projectiletype = /obj/item/projectile/energy/eclipse_boss/chillingwind
					addtimer(CALLBACK(src, PROC_REF(dual_spin), A, rng_cycle, 8), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0


/mob/living/simple_mob/mechanical/mecha/eclipse/battle_top/handle_special()
	if(stat != DEAD)
		frozen_aura()
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/battle_top/proc/frozen_aura()
	for(var/mob/living/L in view(src, 14))
		if(!IIsAlly(L))
			L.add_modifier(/datum/modifier/chilled, 3, src)

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/crystal_boss/ufo
	name = "astral collective deflection saucer"
	icon_state = "UPshield_mecha"
	icon_living = "UPshield_mecha"
	desc = "A metallic flying saucer, a reflective barrier around it."
	faction = FACTION_ECLIPSE
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	health = 1500
	maxHealth = 1500
	specialattackprojectile = /obj/item/projectile/energy/eclipse_boss/metalsphere
	projectiletype = /obj/item/projectile/energy/eclipse_boss/metalsphere
	wreckage = /obj/item/prop/deconstructable/gigacell
	pilot_type = /mob/living/simple_mob/humanoid/astral_collective/purity

/mob/living/simple_mob/mechanical/mecha/eclipse/tankyboss/crystal_boss/ufo/do_special_attack(atom/A)
	switch(a_intent)
		if(I_HURT) //phase1
			switch(attackcycle)
				if(1)
					addtimer(CALLBACK(src, PROC_REF(cross_spin), A, 2, 5), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
					parry_chance = 100
					icon_state = "UPshield_mecha"
				if(2)
					addtimer(CALLBACK(src, PROC_REF(rising_star), A, 3, 7), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
					parry_chance = 100
					icon_state = "UPshield_mecha"
				if(3)
					addtimer(CALLBACK(src, PROC_REF(random_firing), A, 10, 1, 7), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
					icon_state = "shield_mecha"
		if(I_GRAB) //phase2
			switch(attackcycle)
				if(1)
					addtimer(CALLBACK(src, PROC_REF(dual_spin), A, 2, 5), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
					parry_chance = 100
					icon_state = "UPshield_mecha"
				if(2)
					addtimer(CALLBACK(src, PROC_REF(bullet_blossom), A, 3, 8), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
					parry_chance = 100
					icon_state = "UPshield_mecha"
				if(3)
					addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 10, 1, 7), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
					icon_state = "shield_mecha"
		if(I_DISARM) //phase3
			switch(attackcycle)
				if(1)
					addtimer(CALLBACK(src, PROC_REF(dual_spin), A, 2, 4), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
					parry_chance = 100
					icon_state = "UPshield_mecha"
				if(2)
					addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, 3, 15), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
					parry_chance = 100
					icon_state = "UPshield_mecha"
				if(3)
					addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 10, 1, 5), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
					parry_chance = 0
					icon_state = "shield_mecha"

/mob/living/simple_mob/mechanical/mecha/eclipse/janus
	name = "astral collective janus"
	icon_state = "astral_janus"
	icon_living = "astral_janus"
	desc = "A janus made from stolen tech."
	health = 4500
	maxHealth = 4500
	specialattackprojectile = /obj/item/projectile/energy/eclipse_boss/energyjavelin
	projectiletype = /obj/item/projectile/energy/eclipse_boss/energyjavelin
	wreckage = /obj/item/prop/deconstructable/gigacell
	pilot_type = /mob/living/simple_mob/humanoid/astral_collective/purity

/mob/living/simple_mob/mechanical/mecha/eclipse/janus/do_special_attack(atom/A)
	rng_cycle = rand(1,3)
	switch(a_intent)
		if(I_HURT) //phase1
			switch(attackcycle)
				if(1)
					addtimer(CALLBACK(src, PROC_REF(gattlingfire), A, rng_cycle, 4, 7), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(2)
					addtimer(CALLBACK(src, PROC_REF(rising_star), A, rng_cycle, 7), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(3)
					addtimer(CALLBACK(src, PROC_REF(quad_random_firing), A, 4, rng_cycle, 5), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
		if(I_GRAB) //phase2
			switch(attackcycle)
				if(1)
					addtimer(CALLBACK(src, PROC_REF(death_wall), A, rng_cycle, 9), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(2)
					addtimer(CALLBACK(src, PROC_REF(bomb_chaos), A, rng_cycle), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(3)
					addtimer(CALLBACK(src, PROC_REF(bullet_blossom), A, rng_cycle, 7), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
		if(I_DISARM) //phase3
			switch(attackcycle)
				if(1)
					addtimer(CALLBACK(src, PROC_REF(summon_puddles), A, rng_cycle, /datum/modifier/mmo_drop/blade_boss_short), 2.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(2)
					addtimer(CALLBACK(src, PROC_REF(hole_in_wall), A, 3, 12), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
				if(3)
					addtimer(CALLBACK(src, PROC_REF(cross_spin), A, rng_cycle, 3), 0.5 SECONDS, TIMER_DELETE_ME)
					attackcycle = 0
