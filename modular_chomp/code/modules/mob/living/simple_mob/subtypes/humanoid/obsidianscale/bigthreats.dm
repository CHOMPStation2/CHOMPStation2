/mob/living/simple_mob/humanoid/obsidianscale/foreman
	name = "Obsidianscale Foreman"
	health = 125
	maxHealth = 125
	armor = list(melee = 85, bullet = 80, laser = 80, energy = 40, bomb = 80, bio = 100, rad = 100) //Breacher suit stats.
	projectiletype = /obj/item/projectile/energy/mob/midlaser
	icon_state = "foreman"
	icon_living = "foreman"
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	needs_reload = FALSE
	loot_list = list(/obj/item/weapon/gun/energy/pulse_rifle/damaged  = 100,
			/obj/item/weapon/bone/skull = 100
			)


/mob/living/simple_mob/humanoid/obsidianscale/foreman/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Side gun
			electric_defense(A)
		if(I_HURT) // Rockets
			launch_rockets(A)
		if(I_GRAB) // Micro-singulo
			launch_microsingularity(A)

/mob/living/simple_mob/humanoid/obsidianscale/foreman/proc/launch_microsingularity(atom/target)
	visible_message(span("notice", "\The [src]'s shoulder begins to charge!"))
	sleep(1.5)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/mob/pulse(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/mob/living/simple_mob/humanoid/obsidianscale/foreman/proc/electric_defense(atom/target)
	visible_message(span("notice", "\The [src]'s suit deploys drones!"))
	new /mob/living/simple_mob/mechanical/viscerator/obsidian (src.loc)
	new /mob/living/simple_mob/mechanical/viscerator/obsidian (src.loc)
	new /mob/living/simple_mob/mechanical/viscerator/obsidian (src.loc)
	new /mob/living/simple_mob/mechanical/viscerator/obsidian (src.loc)
	new /mob/living/simple_mob/mechanical/viscerator/obsidian (src.loc)
	new /mob/living/simple_mob/mechanical/viscerator/obsidian (src.loc)
	new /mob/living/simple_mob/mechanical/viscerator/obsidian (src.loc)
	new /mob/living/simple_mob/mechanical/viscerator/obsidian (src.loc)

/mob/living/simple_mob/humanoid/obsidianscale/foreman/proc/launch_rockets(atom/target)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/homing_bolt(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)
	sleep(0.5)
	P.launch_projectile(target, BP_TORSO, src)
	sleep(0.5)
	P.launch_projectile(target, BP_TORSO, src)


/obj/item/projectile/energy/mob/pulse
	name = "pulse"
	damage = 30
	armor_penetration = 30
	icon_state = "impact_u_laser"
	fire_sound='sound/weapons/gauss_shoot.ogg'
	hud_state = "pulse"

/obj/item/weapon/gun/energy/pulse_rifle/damaged
	name = "\improper Damaged Pulse Rifle"
	desc = "A pulse rifle that has been damaged but is still useable"
	projectile_type = /obj/item/projectile/energy/mob/midlaser
	charge_cost = 120
	fire_delay = 3
	sel_mode = 2
	w_class = ITEMSIZE_HUGE //CHOMP Edit.

	firemodes = list(
		list(mode_name="lethal", /obj/item/projectile/energy/mob/midlaser, fire_delay=null, charge_cost = 120),
		list(mode_name="DESTROY", projectile_type=/obj/item/projectile/energy/mob/pulse, fire_delay=null, charge_cost = 240),
		)

/mob/living/simple_mob/mechanical/viscerator/obsidian
	faction = "obisdianscale"