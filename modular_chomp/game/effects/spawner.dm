GLOBAL_LIST_EMPTY(button_mob_spawner_landmark)

/obj/effect/landmark/button_mob_spawner_landmark
	name = "Mob Spawner"
	icon = 'modular_chomp/icons/obj/storage.dmi'
	icon_state = "expirmentalaid"
	var/link = "MOBSPAWN"

/obj/effect/landmark/button_mob_spawner_landmark/Initialize(mapload)
	. = ..()
	GLOB.button_mob_spawner_landmark[link] = src

/obj/effect/landmark/button_mob_spawner_landmark/second
	link = "MOBSPAWNSECOND"
