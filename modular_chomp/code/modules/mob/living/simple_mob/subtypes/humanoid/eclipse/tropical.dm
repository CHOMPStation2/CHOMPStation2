/mob/living/simple_mob/humanoid/eclipse/tropical
	name = "Eclipse Mining Unit"
	desc = "A strange figure surronded in a glowing bubble."
	icon_state = "sun"
	icon_living = "sun"

	health = 50
	maxHealth = 50
	projectile_dispersion = 0
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 80, bio = 100, rad = 100)

/mob/living/simple_mob/humanoid/eclipse/tropical/Initialize()
	if(prob(50))
		add_modifier(/datum/modifier/eclipse_fireshield, null, src)
		name = "Solar [src]"
	else
		add_modifier(/datum/modifier/eclipse_bruteshield, null, src)
		name = "Lunar [src]"


/datum/modifier/eclipse_fireshield
	//icon = 'modular_chomp/icons/mob/eclipse.dmi' Oh fun, modifier code is funky and needs to be altered at the ground level or something
	mob_overlay_state = "fireshield"
	incoming_brute_damage_percent = 2
	incoming_fire_damage_percent = 0.5

/datum/modifier/eclipse_bruteshield
	//icon = 'modular_chomp/icons/mob/eclipse.dmi'
	mob_overlay_state = "bruteshield"
	incoming_brute_damage_percent = 0.5
	incoming_fire_damage_percent = 2

//Note to self, try to make better sprites

/mob/living/simple_mob/humanoid/eclipse/tropical/tiderhunter
	name = "Eclipse Tidehunter"
	icon_state = "tidehunter"
	projectiletype = /obj/item/projectile/energy/mob/energy_net

/mob/living/simple_mob/humanoid/eclipse/tropical/diver
	name = "Eclipse Diver"
	icon_state = "eclipse_shottesh"
	color = "#02028D"
	projectiletype = /obj/item/projectile/energy/plasma/vepr

/mob/living/simple_mob/humanoid/eclipse/tropical/diver/bullet_act(var/obj/item/projectile/Proj)
	add_modifier(/datum/modifier/underwater_stealth, 10, src)
	..()

/mob/living/simple_mob/humanoid/eclipse/tropical/anomalist
	name = "Eclipse Anomalist"
	icon_state = "anomalist"
	projectiletype = /obj/item/projectile/temp

/mob/living/simple_mob/humanoid/eclipse/tropical/anomalist/do_special_attack(atom/A)
	var/obj/item/projectile/P = new /obj/item/projectile/temp/hot(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)

/mob/living/simple_mob/humanoid/eclipse/tropical/assasian
	alpha = 200
	name = "Eclipse Assasian"
	icon_state = "assasian"
	projectiletype = /obj/item/projectile/energy/bolt

/mob/living/simple_mob/humanoid/eclipse/tropical/driller
	name = "Eclipse Driller"
	icon_state = "driller"
	projectiletype = null


/obj/item/projectile/energy/mob/energy_net
	name = "energy net projection"
	icon_state = "xray_impact"
	nodamage = 1
	agony = 5
	damage_type = HALLOSS
	light_color = "#00CC33"
	hud_state = "flame_green"
	hud_state_empty = "flame_empty"

/obj/item/projectile/energy/mob/energy_net/on_hit(var/atom/netted)
	do_net(netted)
	..()

/obj/item/projectile/energy/mob/energy_net/proc/do_net(var/mob/M)
	var/obj/item/weapon/energy_net/net = new (get_turf(M))
	net.throw_impact(M)