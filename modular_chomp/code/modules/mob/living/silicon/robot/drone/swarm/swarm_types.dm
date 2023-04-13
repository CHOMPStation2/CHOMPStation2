/mob/living/silicon/robot/drone/swarm/gunner
	name = "swarm gunner"
	real_name = "drone"
	icon = 'icons/mob/swarmbot.dmi'
	icon_state = "swarmer_ranged"
	faction = "swarmer"

	maxHealth = 50
	health = 50

	speed = 4

	law_type = /datum/ai_laws/swarm_drone/soldier
	module_type = /obj/item/weapon/robot_module/drone/swarm/ranged

	spell_setup = list(
		/spell/aoe_turf/conjure/swarmer,
		/spell/aoe_turf/conjure/forcewall/swarm,
		/spell/aoe_turf/blink/swarm
		)

/mob/living/silicon/robot/drone/swarm/melee
	name = "swarm melee"
	real_name = "drone"
	icon = 'icons/mob/swarmbot.dmi'
	icon_state = "swarmer_melee"
	faction = "swarmer"

	maxHealth = 70
	health = 70

	speed = 2

	law_type = /datum/ai_laws/swarm_drone/soldier
	module_type = /obj/item/weapon/robot_module/drone/swarm/melee

	spell_setup = list(
		/spell/aoe_turf/conjure/swarmer,
		/spell/aoe_turf/conjure/forcewall/swarm,
		/spell/aoe_turf/blink/swarm
		)