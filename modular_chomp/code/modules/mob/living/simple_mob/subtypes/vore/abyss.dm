/mob/living/simple_mob/vore/abyssal
	name = "strange fish"
	desc = "A floating fish."
	faction = FACTION_CULT
	maxHealth = 30
	health = 30
	icon = 'modular_chomp/icons/mob/abyss.dmi'
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = null
	attack_armor_pen = 20
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax


/mob/living/simple_mob/vore/abyssal/bass
	icon_state = "bass"
	icon_living = "bass"
	icon_dead = "bass-dead"
	maxHealth = 10
	health = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	grab_resist = 100

	meat_type = /obj/item/reagent_containers/food/snacks/meat
	meat_amount = 5
	can_be_drop_prey = TRUE

/mob/living/simple_mob/vore/abyssal/trout
	icon_state = "trout"
	icon_living = "trout"
	icon_dead = "trout-dead"
	maxHealth = 10
	health = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	grab_resist = 100

	meat_type = /obj/item/reagent_containers/food/snacks/meat
	meat_amount = 5
	can_be_drop_prey = TRUE

/mob/living/simple_mob/vore/abyssal/salmon
	icon_state = "salmon"
	icon_living = "salmon"
	icon_dead = "salmon-dead"
	maxHealth = 10
	health = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	grab_resist = 100

	meat_type = /obj/item/reagent_containers/food/snacks/meat
	meat_amount = 5
	can_be_drop_prey = TRUE

/mob/living/simple_mob/vore/abyssal/perch
	icon_state = "perch"
	icon_living = "perch"
	icon_dead = "perch-dead"
	maxHealth = 10
	health = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	grab_resist = 100

	meat_type = /obj/item/reagent_containers/food/snacks/meat
	meat_amount = 5
	can_be_drop_prey = TRUE

/mob/living/simple_mob/vore/abyssal/pike
	icon_state = "pike"
	icon_living = "pike"
	icon_dead = "pike-dead"
	maxHealth = 10
	health = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	grab_resist = 100

	meat_type = /obj/item/reagent_containers/food/snacks/meat
	meat_amount = 5
	can_be_drop_prey = TRUE

/mob/living/simple_mob/vore/abyssal/koi
	icon_state = "koi"
	icon_living = "koi"
	icon_dead = "koi-dead"
	maxHealth = 10
	health = 10
	melee_damage_lower = 8
	melee_damage_upper = 8
	grab_resist = 100

/mob/living/simple_mob/vore/abyssal/koi/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/poisoned, 120 SECONDS)

/mob/living/simple_mob/vore/abyssal/koi/handle_special()
	if(stat != DEAD)
		acid_aura()
	..()

/mob/living/simple_mob/vore/abyssal/koi/proc/acid_aura()
	for(var/mob/living/L in view(src, 4))
		if(!IIsAlly(L))
			L.add_modifier(/datum/modifier/poisoned, 10, src)

/mob/living/simple_mob/vore/abyssal/solarfish
	icon_state = "solarfish"
	icon_living = "solarfish"
	icon_dead = "solarfish-dead"
	maxHealth = 10
	health = 10
	melee_damage_lower = 8
	melee_damage_upper = 8
	grab_resist = 100
	var/emp_heavy = 2
	var/emp_med = 3
	var/emp_light = 4
	var/emp_long = 6

/mob/living/simple_mob/vore/abyssal/solarfish/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/fire, 10 SECONDS)

/mob/living/simple_mob/vore/abyssal/solarfish/proc/explode()
	src.anchored = 0
	set_light(0)
	moth_amount = clamp(moth_amount - 1, 0, 1)
	if(empulse(src, emp_heavy, emp_med, emp_light, emp_long))
		qdel(src)
	return

/mob/living/simple_mob/vore/abyssal/solarfish/death()
	explode()
	..()

/mob/living/simple_mob/vore/abyssal/solarfish/gib()
	explode()
	..()


/mob/living/simple_mob/vore/abyssal/rockfish
	icon_state = "rockfish"
	icon_living = "rockfish"
	icon_dead = "rockfish-dead"
	maxHealth = 50
	health = 50
	melee_attack_delay = 4 SECONDS
	melee_damage_lower = 40
	melee_damage_upper = 40
	attack_armor_pen = 60
	grab_resist = 100

/mob/living/simple_mob/vore/abyssal/gun_pirate
	icon_state = "pirateG"
	icon_living = "pirateG"
	icon_dead = "pirateG-dead"
	maxHealth = 150
	health = 150
	vore_pounce_chance = 40.
	vore_icons = SA_ICON_LIVING
	ai_holder_type = /datum/ai_holder/hostile/ranged/robust
	projectiletype = /obj/item/projectile/energy/homing_bolt/speed
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 60
	needs_reload = TRUE
	reload_max = 6
	reload_time = 2 SECONDS

/mob/living/simple_mob/vore/abyssal/gun_pirate/do_special_attack(atom/A)
	var/rng_cycle = rand(1,3)
	if(rng_cycle == 1)
		projectiletype = /obj/item/projectile/energy/homing_bolt/speed
	else if(rng_cycle == 2)
		projectiletype = /obj/item/projectile/scatter/death
	else if(rng_cycle == 3)
		projectiletype = /obj/item/projectile/bullet/magnetic/fuelrod/slow

/obj/item/projectile/energy/homing_bolt/speed
	speed = 0.3

/obj/item/projectile/bullet/magnetic/fuelrod/slow
	speed = 12

/obj/item/projectile/energy/lightingspark/slow
	speed = 8
	power = 10

/obj/item/projectile/scatter/death
	spread_submunition_damage = FALSE
	submunition_spread_max = 400
	submunition_spread_min = 10

	submunitions = list(
		/obj/item/projectile/energy/lightingspark/slow = 6
		)

/mob/living/simple_mob/vore/abyssal/sword_pirate
	icon_state = "pirateB"
	icon_living = "pirateB"
	icon_dead = "pirateB-dead"
	maxHealth = 150
	health = 150
	vore_pounce_chance = 40.
	vore_icons = SA_ICON_LIVING
	melee_attack_delay = 2 SECONDS
	melee_damage_lower = 30
	melee_damage_upper = 30
	attack_armor_pen = 30



