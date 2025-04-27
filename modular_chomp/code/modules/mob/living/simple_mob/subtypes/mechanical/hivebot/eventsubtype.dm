/mob/living/simple_mob/mechanical/hivebot/nanoevent
	name = "strange hivebot"
	maxHealth = 0.5 LASERS_TO_KILL // 20 hp
	health = 0.5 LASERS_TO_KILL
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	desc = "A familiar looking robot, trading out it's defense for offense."
	icon_state = "precursorhive"
	icon_living = "precursorhive"
	movement_cooldown = 0
	melee_damage_lower = 13
	melee_damage_upper = 13
	attack_armor_pen = 40
	water_resist = 1
	melee_miss_chance = 0

/mob/living/simple_mob/mechanical/hivebot/nanoevent/bright_green //swarm melee creature
	name = "nanoweave infantry hivebot"
	icon_state = "bright_green"
	icon_living = "bright_green"
	pass_flags = PASSTABLE
	movement_cooldown = -1

/mob/living/simple_mob/mechanical/hivebot/nanoevent/cyan //cracks the shell
	name = "nanoweave cracker hivebot"
	icon_state = "cyan"
	icon_living = "cyan"
	projectiletype = /obj/item/projectile/energy/wallbreaker

/mob/living/simple_mob/mechanical/hivebot/nanoevent/pink //firing squad
	name = "nanoweave blasters hivebot"
	icon_state = "pink"
	icon_living = "pink"
	projectiletype = /obj/item/projectile/bullet/alterhivebot

/mob/living/simple_mob/mechanical/hivebot/nanoevent/yellow //tanky, wait they have 20 hp
	name = "nanoweave barrier hivebot"
	icon_state = "yellow"
	icon_living = "yellow"
	armor = list(melee = 80, bullet = 80, laser = 80, energy = 80, bomb = 0, bio = 100, rad = 100)


/mob/living/simple_mob/mechanical/hivebot/nanoevent/orange //missiles!
	name = "nanoweave artillery hivebot"
	icon_state = "orange"
	icon_living = "orange"
	projectiletype = /obj/item/projectile/energy/burninglaser
	movement_cooldown = 1


/obj/item/projectile/energy/wallbreaker
	name = "energy bolt"
	icon_state = "bluelaser"
	damage = 12
	armor_penetration = 40
	range = 16
	penetrating = 7

/obj/item/projectile/energy/wallbreaker/boss
	damage = 25
	armor_penetration = 60
	speed = 10

/obj/item/projectile/bullet/alterhivebot
	damage = 25
	armor_penetration = 40
	icon_state = "bullet_alt"
	speed = 2

/obj/item/projectile/bullet/alterhivebot/boss
	damage = 35
	speed = 10

/obj/item/projectile/beam/midlaser/shortrange
	range = 3

/obj/item/projectile/beam/midlaser/veryshortrange
	range = 2

/obj/item/projectile/energy/burninglaser
	name = "energy bolt"
	icon_state = "heavylaser"
	damage = 25
	armor_penetration = 20
	penetrating = 5
	speed = 3

/obj/item/projectile/energy/burninglaser/Move()
	. = ..()
	new /obj/fire(src.loc)

/obj/item/projectile/energy/burninglaser/boss
	armor_penetration = 50
	speed = 10

/obj/item/projectile/knockback
	name = "sonic blast"
	icon_state = "sound"
	damage = 0 //No
	damage_type = BRUTE
	check_armour = "melee"
	embed_chance = 0
	range = 12

/obj/item/projectile/knockback/on_hit(var/atom/movable/target, var/blocked = 0)
	if(isliving(target))
		var/mob/living/L = target
		var/throwdir = get_dir(firer,L)
		L.throw_at(get_edge_target_turf(L, throwdir), rand(3,6), 10)


/obj/item/projectile/metalball
	name = "ball of metal"
	icon_state = "bolter"
	speed = 0.5 //we need this to hit for the follow up, the sooner the better
	damage = 0 //but hey no real harm
	embed_chance = 0
	damage_type = BRUTE
	muzzle_type = null
	combustion = FALSE

/obj/item/projectile/metalball/on_hit(var/atom/target, var/blocked = 0)
	if(isturf(target.loc))
		var/obj/structure/foamedmetal/W = locate() in get_turf(target)
		if(!W)
			visible_message(span_danger("\The [src] splatters a lump of metal on \the [target]!"))
			new /obj/structure/foamedmetal(target.loc)
	..()

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 100, rad = 100)
	size_multiplier = 2
	faction = FACTION_HIVEBOT

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/boss
	name = "central command hivebot"
	desc = "A large, very important looking robot."
	icon_state = "king"
	movement_cooldown = 7
	size_multiplier = 2.5
	maxHealth = 1000
	health = 1000
	wreckage = /obj/item/prop/nanoweave/orange

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/boss/event //super buffed HP for event
	maxHealth = 5000
	health = 5000

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/boss/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Phase 3
			if(attackcycle == 1)
				say("PROTOCOL: RESTRAIN.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/metalball
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 2), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: DESTORY.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/beam/midlaser
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 3), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: BARRIER WIPE")
				specialattackprojectile = /obj/item/projectile/energy/wallbreaker/boss
				addtimer(CALLBACK(src, PROC_REF(spin_to_win), A, 4), 1 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				say("PROTOCOL: SPRAY FIRE")
				specialattackprojectile = /obj/item/projectile/bullet/alterhivebot/boss
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 12, 5, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 5)
				say("PROTOCOL: SHOCKWAVE.")
				specialattackprojectile = /obj/item/projectile/knockback
				addtimer(CALLBACK(src, PROC_REF(burst), A, 6), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 6)
				say("PROTOCOL: MICROWAVE.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/temp/hot
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 7), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 7)
				say("PROTOCOL: MACROWAVE.")
				specialattackprojectile = /obj/item/projectile/temp/hot
				addtimer(CALLBACK(src, PROC_REF(beglaser), A, 8), 2 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 8)
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 9), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 9)
				say("PROTOCOL: WORMHOLE.")
				specialattackprojectile = /obj/item/projectile/arc/microsingulo
				attackcycle = 0
				if(prob(50))
					addtimer(CALLBACK(src, PROC_REF(miniburst_a), A, 10), 2 SECONDS, TIMER_DELETE_ME)
				else
					addtimer(CALLBACK(src, PROC_REF(miniburst_b), A, 10), 2 SECONDS, TIMER_DELETE_ME)
			else if(attackcycle == 10)
				say("PROTOCOL: FIREWALL.")
				specialattackprojectile = /obj/item/projectile/energy/burninglaser/boss
				attackcycle = 0
				if(prob(50))
					addtimer(CALLBACK(src, PROC_REF(miniburst_a), A, 1), 2 SECONDS, TIMER_DELETE_ME)
				else
					addtimer(CALLBACK(src, PROC_REF(miniburst_b), A, 1), 2 SECONDS, TIMER_DELETE_ME)

		if(I_HURT) // Phase 1. Teaching the player the three funny attacks
			if(attackcycle == 1) //metal ball
				say("PROTOCOL: RESTRAIN.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/metalball
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 2), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2) //laser to be blocked by the foam we set up.
				say("PROTOCOL: DESTORY.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/beam/midlaser
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 3), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3) //The knock back AoE.
				say("PROTOCOL: SHOCKWAVE.")
				specialattackprojectile = /obj/item/projectile/knockback
				addtimer(CALLBACK(src, PROC_REF(burst), A, 4), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4) //The Get away from me AoE.
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 1), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				say("PROTOCOL: RESTRAIN.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/metalball
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 2), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: DESTORY.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/beam/midlaser
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 3), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: BARRIER WIPE")
				specialattackprojectile = /obj/item/projectile/energy/wallbreaker/boss
				addtimer(CALLBACK(src, PROC_REF(spin_to_win), A, 4), 1 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				say("PROTOCOL: SHOCKWAVE.")
				specialattackprojectile = /obj/item/projectile/knockback
				addtimer(CALLBACK(src, PROC_REF(burst), A, 5), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 5)
				say("PROTOCOL: MICROWAVE.")
				Beam(A, icon_state = "solar_beam", time = 2.5 SECONDS, maxdistance = INFINITY)
				specialattackprojectile = /obj/item/projectile/temp/hot
				addtimer(CALLBACK(src, PROC_REF(singleproj), A, 6), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 6)
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 7), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 7)
				say("PROTOCOL: FIREWALL.")
				specialattackprojectile = /obj/item/projectile/energy/burninglaser/boss
				attackcycle = 0
				if(prob(50))
					addtimer(CALLBACK(src, PROC_REF(miniburst_a), A, 1), 3 SECONDS, TIMER_DELETE_ME)
				else
					addtimer(CALLBACK(src, PROC_REF(miniburst_b), A, 1), 3 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/cyan
	name = "command hivebot"
	desc = "A large, very important looking robot."
	size_multiplier = 2
	icon_state = "cyan"
	icon_living = "cyan"
	maxHealth = 1000
	health = 1000
	specialattackprojectile = /obj/item/projectile/bullet/alterhivebot/boss
	wreckage = /obj/item/prop/nanoweave/cyan

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/cyan/event
	maxHealth = 3000
	health = 3000

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/cyan/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Phase 3
			if(attackcycle == 1)
				say("PROTOCOL: MAELSTORM.")
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 3, 2, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_HURT) // Phase 1. Teaching the player the three funny attacks
			if(attackcycle == 1)
				say("PROTOCOL: MAELSTORM.")
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 12, 2, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				say("PROTOCOL: MAELSTORM.")
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 6, 2, 0.5 SECONDS), 0.5 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/green
	name = "command hivebot"
	desc = "A large, very important looking robot."
	icon_state = "green"
	icon_living = "green"
	maxHealth = 1000
	health = 1000
	wreckage = /obj/item/prop/nanoweave/lime

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/green/event
	maxHealth = 3000
	health = 3000

/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/green/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Phase 3
			if(attackcycle == 1)
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 2), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle > 2)
				attackcycle = 1

		if(I_HURT) //phase 1
			if(attackcycle == 1)
				say("PROTOCOL: SWEEP. FIGURATION: A.")
				specialattackprojectile = /obj/item/projectile/energy/burninglaser/boss
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one), A, 2), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: SWEEP. FIGURATION: B.")
				specialattackprojectile = /obj/item/projectile/energy/burninglaser/boss
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one_r), A, 3), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 1), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0

		if(I_GRAB) // Phase 2
			if(attackcycle == 1)
				say("PROTOCOL: SWEEP. FIGURATION: A.")
				specialattackprojectile = /obj/item/projectile/energy/burninglaser/boss
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one), A, 2), 3 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 3), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: SWEEP. FIGURATION: B.")
				specialattackprojectile = /obj/item/projectile/energy/burninglaser/boss
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one), A, 4), 3 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 5), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 5)
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 6), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 6)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0




//lore things
/obj/item/prop/nanoweave
	name = "alien disc"
	desc = "A disc for storing data."
	icon = 'modular_chomp/icons/mob/hivebot.dmi'
	w_class = ITEMSIZE_SMALL

/obj/item/prop/nanoweave/lime
	catalogue_data = list(/datum/category_item/catalogue/anomalous/limedisc)
	icon_state = "limedisc"

/obj/item/prop/nanoweave/cyan
	catalogue_data = list(/datum/category_item/catalogue/anomalous/cyandisc)
	icon_state = "cyandisc"

/obj/item/prop/nanoweave/orange
	catalogue_data = list(/datum/category_item/catalogue/anomalous/orangedisc)
	icon_state = "orangedisc"

/obj/item/prop/nanoweave/terraformers
	catalogue_data = list(/datum/category_item/catalogue/anomalous/orangedisc)
	icon_state = "orangedisc"


/datum/category_item/catalogue/anomalous/cyandisc
	name = "Precursor Object - Data Disc Cyan"
	desc = "End of time measures are now to be taken. Aimming several survial pods. \
	amongst our lands, and allies. \
	They shall burrow deep beneath the earth and overseen by the Overlord program. \
	Survival outlook likly.\
	<br><br>\
	Error file corruption.\
	<br><br>\
	T3e cr7at1re dv8s n07 4pp5ar to f000o5 3ur 1u228nt 3n0w1e1ge of 3c4e2ce. \
	6v3n 15e 01h5rs e5pe12m3nta1 t02h501ogy d0es n0t m1m73 1t's c8rr3n1 m0vem3nt.. \
	1t's 94th 6s u7pr3di21abl3."
	value = CATALOGUER_REWARD_HARD

/datum/category_item/catalogue/anomalous/orangedisc
	name = "Precursor Object - Data Disc Orange"
	desc = "The voidwalkers are launching themselves into the void. \
	The beast callers venture into the unknown. \
	The abyss divers never plan to surface. \
	The terraformers are following a similiar plan to us, burrowing beneath the surface.\
	<br><br>\
	Error file corruption.\
	<br><br>\
	Ew ahev rna teh acclsuaotiln. Uor rpooptytse rae sceduer... \
	Spyretonlia csroe vaeh ebne eplemmidnet fi we rae ot lalf... \
	Oru ofmsr erbrno in a enw dtiiag; oybd if oru eral nose dei.."
	value = CATALOGUER_REWARD_HARD

/datum/category_item/catalogue/anomalous/limedisc
	name = "Precursor Object - Data Disc Lime"
	desc = "We have secured our technoly within the vaults. Settled upon the core. \
	of the planet. It should be safe from tampering..\
	Our pods should land a few hundred meters above them. \
	Survival outlook likly.\
	<br><br>\
	Error file corruption.\
	<br><br>\
	W3 h4v3 s3t 07r c0mp7t3rs t0 b71lt c07nt3r m34sur3s 1n c4s3 th3 0th3rs s7rv1v3 th3 p7rg3.. \
	B7t the 0th3rs s7rv1val s33ms 7nl1k3ly... \
	Th3 t3rr4f0rm3rs ar3 4lr3ady 4ffl1ct3d by 4 pl4g73.."
	value = CATALOGUER_REWARD_HARD

/datum/category_item/catalogue/anomalous/terraformers
	name = "Precursor Object - Data Disc Styx"
	desc = "We have secured our technoly within the vaults. Settled upon the core. \
	of the planet. It should be safe from tampering..\
	Our pods should land a few hundred meters above them. \
	Survival outlook likly.\
	<br><br>\
	Error file corruption.\
	<br><br>\
	W3 h4v3 s3t 07r c0mp7t3rs t0 b71lt c07nt3r m34sur3s 1n c4s3 th3 0th3rs s7rv1v3 th3 p7rg3.. \
	B7t the 0th3rs s7rv1val s33ms 7nl1k3ly... \
	Th3 t3rr4f0rm3rs ar3 4lr3ady 4ffl1ct3d by 4 pl4g73.."
	value = CATALOGUER_REWARD_HARD



/*
/mob/living/simple_mob/mechanical/mecha/eclipse/hivebot/green/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM) // Phase 3 1 safe zone
			if(attackcycle == 1)
				say("PROTOCOL: LASERBLADE.")
				specialattackprojectile = /obj/item/projectile/beam/midlaser/shortrange
				addtimer(CALLBACK(src, PROC_REF(burst), A, 2), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: TELEPORT.")
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0

		if(I_HURT) //phase 1 3 safe zones
			if(attackcycle == 1)
				say("PROTOCOL: SWEEP. FIGURATION: A.")

				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: SWEEP. FIGURATION: B.")

				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: LASERBLADE.")

				attackcycle = 0

		if(I_GRAB) // Phase 2 2 safe zones
			if(attackcycle == 1)
				say("PROTOCOL: SWEEP. FIGURATION: A.")

				attackcycle = 0
			else if(attackcycle == 2)

*/

