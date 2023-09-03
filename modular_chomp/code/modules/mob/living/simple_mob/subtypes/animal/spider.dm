//Unfiying spider health, into two catagories. Disrupters and tanks.
/mob/living/simple_mob/animal/giant_spider/carrier //Disrupter, old 100
	maxHealth = 30
	health = 30

/mob/living/simple_mob/animal/giant_spider/electric //disrupter, old 210
	maxHealth = 30
	health = 30
	projectiletype = /obj/item/projectile/energy/mob/electric_spider

/mob/living/simple_mob/animal/giant_spider/frost //tank, old 175
	maxHealth = 60
	health = 60

/mob/living/simple_mob/animal/giant_spider //tank, old 200
	maxHealth = 60
	health = 60
	melee_damage_lower = 8
	melee_damage_upper = 15

/mob/living/simple_mob/animal/giant_spider/ion //disrupter, old 90
	maxHealth = 30
	health = 30

/mob/living/simple_mob/animal/giant_spider/hunter //disrupter, old 120
	maxHealth = 30
	health = 30

/mob/living/simple_mob/animal/giant_spider/lurker //disrupter, old 100
	maxHealth = 30
	health = 30

/mob/living/simple_mob/animal/giant_spider/pepper //tank, old 210
	maxHealth = 60
	health = 60

/mob/living/simple_mob/animal/giant_spider/phorogenic //tank, old 225
	maxHealth = 60
	health = 60

/mob/living/simple_mob/animal/giant_spider/thermic //tank, old 175
	maxHealth = 60
	health = 60

/mob/living/simple_mob/animal/giant_spider/tunneler_spider //disrupter, old 120
	maxHealth = 30
	health = 30

/mob/living/simple_mob/animal/giant_spider/webslinger //disrupter, old 90
	maxHealth = 30
	health = 30

/obj/effect/spider/eggcluster
	spider_type = /obj/effect/spider/spiderling/varied

/mob/living/simple_mob/animal/giant_spider/broodmother
	maxHealth = 400
	health = 400
	melee_damage_lower = 12
	melee_damage_upper = 20

/mob/living/simple_mob/animal/giant_spider/frost/broodling
	maxHealth = 20
	health = 20

	melee_damage_lower = 5
	melee_damage_upper = 7

/mob/living/simple_mob/animal/giant_spider/electric/broodling
	maxHealth = 15
	health = 15

/mob/living/simple_mob/animal/giant_spider/hunter/broodling
	maxHealth = 20
	health = 20

/mob/living/simple_mob/animal/giant_spider/lurker/broodling
	maxHealth = 20
	health = 20

/mob/living/simple_mob/animal/giant_spider/nurse/broodling
	maxHealth = 30
	health = 30

/mob/living/simple_mob/animal/giant_spider/pepper/broodling
	maxHealth = 20
	health = 20

/mob/living/simple_mob/animal/giant_spider/thermic/broodling
	maxHealth = 20
	health = 20

	melee_damage_lower = 5
	melee_damage_upper = 7

/mob/living/simple_mob/animal/giant_spider/tunneler/broodling
	maxHealth = 20
	health = 20

/mob/living/simple_mob/animal/giant_spider/webslinger/broodling
	maxHealth = 15
	health = 15

/mob/living/simple_mob/animal/giant_spider/broodling
	maxHealth = 30
	health = 30

	melee_damage_lower = 5
	melee_damage_upper = 10