//Modified copy of regula drone folder
/mob/living/silicon/robot/drone/swarm/Initialize()
	. = ..()

	add_language(LANGUAGE_SWARMBOT, 1)

	for(var/spell in spell_setup)
		src.add_spell(new spell, "nano_spell_ready", /obj/screen/movable/spell_master/swarm)

/mob/living/silicon/robot/drone/swarm/init()
	..()
	QDEL_NULL(aiCamera)
	flavor_text = "Some form of ancient machine."
