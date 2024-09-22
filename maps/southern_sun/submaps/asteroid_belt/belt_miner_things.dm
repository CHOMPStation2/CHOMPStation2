/mob/living/simple_mob/animal/giant_spider/frost/space
	desc = "Icy and blue, it makes you shudder to look at it. This one has brilliant blue eyes, and looks adapted to space survival."
	catalogue_data = list(/datum/category_item/catalogue/fauna/giant_spider/frost_spider)

	icon_state = "frost"
	icon_living = "frost"
	icon_dead = "frost_dead"

	maxHealth = 225
	health = 225

	poison_per_bite = 10
	poison_type = "cryotoxin"
	heat_resist = -0.50
	cold_resist = 0.75
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

/mob/living/simple_mob/animal/giant_spider/frost/space/Process_Spacemove(var/check_drift = 0)
	return TRUE

// Belt mob spawners
/obj/sc_away_spawner/belt_normal
	name = "Belt Normal Spawner"
	faction = "belter"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 30
	//guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/animal/space/bats = 2,
		/mob/living/simple_mob/animal/space/bear = 1,
		/mob/living/simple_mob/animal/giant_spider/frost/space = 5,
	)

/obj/sc_away_spawner/belt_hard
	name = "Belt Hard Spawner"
	faction = "belter"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 50
	//guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/aggressive/corrupthound = 3,
		/mob/living/simple_mob/vore/aggressive/rat/phoron = 1
	)

/obj/sc_away_spawner/asteroid_drone_swarm
	name = "Belt Drone Swarm Spawner"
	faction = "belter"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 10
	//guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/mechanical/corrupt_maint_drone = 3,
	)

/obj/random/asteroid_belt
	name = "random asteroid belt loot"
	desc = "Random loot for Belt Miners."
	icon = 'icons/obj/items.dmi'
	icon_state = "spickaxe"

/obj/effect/step_trigger/teleporter/debrisfield_loop/north/New()
	..()
	teleport_x = x
	teleport_y = 2
	teleport_z = z

/obj/effect/step_trigger/teleporter/debrisfield_loop/south/New()
	..()
	teleport_x = x
	teleport_y = world.maxy - 1
	teleport_z = z

/obj/effect/step_trigger/teleporter/debrisfield_loop/west/New()
	..()
	teleport_x = world.maxx - 1
	teleport_y = y
	teleport_z = z

/obj/effect/step_trigger/teleporter/debrisfield_loop/east/New()
	..()
	teleport_x = 2
	teleport_y = y
	teleport_z = z
