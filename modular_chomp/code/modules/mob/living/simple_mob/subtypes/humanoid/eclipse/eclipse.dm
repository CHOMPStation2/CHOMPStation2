///////////////////////////////
//		Eclipse Mobs Go Here
///////////////////////////////

// Basic Version, the knife merc, or blood ininiate. Don't use them, or the eclipsesolar, lunar base versions either.
/mob/living/simple_mob/humanoid/eclipse
	name = "Eclipse Initiate"
	tt_desc = "E Homo sapiens"
	desc = "You shouldn't be seeing this."
	icon = 'modular_chomp/icons/mob/eclipse.dmi'
	icon_state = "sun"
	icon_living = "sun"
	icon_dead = "statisgem"
	icon_gib = "syndicate_gib"
	taser_kill = 0

	faction = "eclipse"
	movement_cooldown = 0

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	health = 100 //old 40
	maxHealth = 100
	harm_intent_damage = 5
	melee_damage_lower = 15		//Tac Knife damage
	melee_damage_upper = 15
	attack_sharp = 1	//CHOMPEdit
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	projectile_dispersion = 8
	projectile_accuracy = -20
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 100, rad = 100)	// Simple mob immunuties plus base Eclipse foe stuff
	ranged_cooldown = 5

	can_be_drop_prey = FALSE //CHOMP Add
	pass_flags = PASSTABLE //mostly for the melee mobs.
	softfall = TRUE //highly advanced spacesuit stuff

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	heat_damage_per_tick = 0

	projectiletype = /obj/item/projectile/bullet/pistol/medium.
	projectilesound = 'sound/weapons/Gunshot_light.ogg'

	needs_reload = TRUE
	reload_max = 7		// Not the best default, but it fits the pistol
	ai_holder_type = /datum/ai_holder/simple_mob/merc/eclipse/ranged

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull = 100
			)

	special_attack_cooldown = 15 SECONDS
	special_attack_min_range = 2
	special_attack_max_range = 7
	var/has_heal_droid = FALSE

//Want a self heal for a spefic dude, and to increase diffculty of some POIs
/mob/living/simple_mob/humanoid/eclipse/handle_special()
	if(has_heal_droid)
		adjustBruteLoss(-1.0)
		adjustFireLoss(-1.0)
		adjustToxLoss(-1.0)
		adjustOxyLoss(-1.0)
		adjustCloneLoss(-1.0)
	..()

/mob/living/simple_mob/humanoid/eclipse/update_icon()
	..() // Cuts everything else, so do that first.
	if(has_heal_droid)
		add_overlay(image(icon = 'modular_chomp/icons/mob/eclipse.dmi', icon_state = "heal_droid"))

////////////////////////////////
//		Stealing Merc AI Types
////////////////////////////////
/datum/ai_holder/simple_mob/merc/eclipse
	threaten = FALSE
	vision_range = 7

/datum/ai_holder/simple_mob/merc/eclipse/hunter
	vision_range = 7

/datum/ai_holder/simple_mob/merc/eclipse/ranged
	pointblank = TRUE		// They get close? Just shoot 'em!
	firing_lanes = TRUE		// But not your buddies!

/datum/ai_holder/simple_mob/merc/eclipse/ranged/sniper
	vision_range = 12	// We're a person with a long-ranged gun.

/datum/ai_holder/simple_mob/merc/eclipse/ranged/sniper/max_range(atom/movable/AM)
	return holder.ICheckRangedAttack(AM) ? 16 : 1

////////////////////////////////
//The solar part of the faction, highly resistant to burns and stuff
/mob/living/simple_mob/humanoid/eclipse/solar
	name = "Solar Eclipse Initiate"
	desc = "You shouldn't be seeing this. But don't use lasers or energy weapons"

	armor = list(melee = -50, bullet = -50, laser = 0, energy = 0, bomb = 50, bio = 100, rad = 100) //Solar members are nigh immune to burns.
	armor_soak = list(melee = 0, bullet = 0, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)

/mob/living/simple_mob/humanoid/eclipse/solar/bullet_act(obj/item/projectile/P)
	if(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam))
		visible_message(span_orange("<B>[P] seems ineffective!.</B>"))
		..()
	else
		..()

/mob/living/simple_mob/humanoid/eclipse/solar/teslanoodle
	name = "Solar Eclipse Tesla Serpent"
	desc = "A naga cladded in strange orange armor, seemingly guarded from lasers and energy based weaponry."
	health = 40
	maxHealth = 40
	icon_state = "eclipse_tesla"
	icon_living = "eclipse_tesla"
	reload_max = 5
	movement_cooldown = 1

	special_attack_cooldown = 20 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7
	var/grenade_type = /obj/item/grenade/chem_grenade/incendiary
	var/grenade_timer = 20	//CHOMPEdit

	projectiletype = /obj/item/projectile/energy/electrode/eclipse

/mob/living/simple_mob/humanoid/eclipse/solar/teslanoodle/should_special_attack(atom/A)
	var/mob_count = 0				// Are there enough mobs to consider grenading?
	var/turf/T = get_turf(A)
	for(var/mob/M in range(T, 2))
		if(M.faction == faction) 	// Don't grenade our friends
			return FALSE
		if(M in oview(src, special_attack_max_range))	// And lets check if we can actually see at least two people before we throw a grenade
			if(!M.stat)			// Dead things don't warrant a grenade
				mob_count ++
	if(mob_count < 2)
		return FALSE
	else
		return TRUE

// Yes? Throw the grenade
/mob/living/simple_mob/humanoid/eclipse/solar/teslanoodle/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	var/obj/item/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(A, G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer	//CHOMPEdit
		G.activate(src)	//CHOMPEdit
		special_attack_charges = max(special_attack_charges-1, 0)

	set_AI_busy(FALSE)

/mob/living/simple_mob/humanoid/eclipse/solar/firemoff
	name = "Solar Eclipse Inferno Moth"
	desc = "A moth like creature cladded in armor, wisps of flames swirling around it. Protected from lasers and energy."
	health = 75 //old 40
	maxHealth = 75
	icon_state = "eclipse_moth"
	icon_living = "eclipse_moth"
	reload_max = 10

	special_attack_cooldown = 8 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7

	projectiletype = /obj/item/projectile/energy/blob/moth

/mob/living/simple_mob/humanoid/eclipse/solar/firemoff/do_special_attack(atom/A)
	var/obj/item/projectile/P = new /obj/item/projectile/arc/spore(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)


/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh
	name = "Solar Eclipse Sniper"
	desc = "An armored teshari with a sniper, protected from laser and energy based attacks"
	health = 50 //old 20
	maxHealth = 50
	movement_cooldown = -1

	icon_state = "eclipse_snipertesh"
	icon_living = "eclipse_snipertesh"

	projectiletype = /obj/item/projectile/energy/mob/heavysniper

	projectile_accuracy = 100

	reload_max = 1
	reload_time = 1.5 SECONDS

	ai_holder_type = /datum/ai_holder/simple_mob/merc/eclipse/ranged/sniper

	ranged_attack_delay = 1.5 SECONDS

/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 1 SECONDS, maxdistance = 15)
	. = ..()

/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh/shoot_target(atom/A)
	set waitfor = FALSE

	if(!istype(A) || QDELETED(A))
		return

	setClickCooldown(get_attack_speed())

	face_atom(A)

	var/atom/orig_targ = A

	if(ranged_attack_delay)
		A = get_turf(orig_targ)
		ranged_pre_animation(A)
		handle_attack_delay(A, ranged_attack_delay) // This will sleep this proc for a bit, which is why waitfor is false.

	if(needs_reload)
		if(reload_count >= reload_max)
			try_reload()
			return FALSE

	visible_message("<span class='danger'><b>\The [src]</b> fires at \the [orig_targ]!</span>")
	shoot(A)
	if(casingtype)
		new casingtype(loc)

	if(ranged_attack_delay)
		ranged_post_animation(A)

	return TRUE


/mob/living/simple_mob/humanoid/eclipse/solar/radiation
	name = "Solar Eclipse Irradiator"
	desc = "A lizard emitting radiation, whilst protected from it, alongside energy and laser based weapons"
	health = 150 //old 75
	maxHealth = 150
	glow_toggle = TRUE
	reload_max = 3

	icon_state = "eclipse_rad"
	icon_living = "eclipse_rad"

	glow_color = "#14ff20"
	light_color = "#14ff20"
	glow_range = 5
	glow_intensity = 3

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/bone/skull/unathi = 100
			)

	projectiletype = /obj/item/projectile/energy/declone/burn
	var/rads = 5

/mob/living/simple_mob/humanoid/eclipse/solar/radiation/handle_special()
	if(stat != DEAD)
		irradiate()
	..()

/mob/living/simple_mob/humanoid/eclipse/solar/radiation/proc/irradiate()
	SSradiation.radiate(src, rads)


//The lunar mobs, highly resistant to brute based damage.
/mob/living/simple_mob/humanoid/eclipse/lunar
	name = "Lunar Eclipse Initiate"
	desc = "You shouldn't be seeing this, but don't use melee weapons or bullets."

	armor = list(melee = 0, bullet = 0, laser = -50, energy = -50, bomb = 50, bio = 100, rad = 100) //Lunar members are nigh immune to burns.
	armor_soak = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0) //15 because every melee weapon has dumb amount of AP

/mob/living/simple_mob/humanoid/eclipse/lunar/bullet_act(obj/item/projectile/P)
	if(istype(P, /obj/item/projectile/bullet))
		visible_message(span_orange("<B>[P] seems ineffective!.</B>"))
		..()
	else
		..()

/mob/living/simple_mob/humanoid/eclipse/lunar/attackby(var/obj/item/O as obj, var/mob/user as mob)
	to_chat(user, "<span class='warning'>This weapon is ineffective, it does no damage.</span>")
	.=..()

/mob/living/simple_mob/humanoid/eclipse/lunar/silvernoodle //Bouncing bullet extreme
	name = "Lunar Eclipse Silver Serpent"
	desc = "A hungry looking naga, their strange armor protecting them from ballistics and physical weaponry."
	health = 100 //Old 40
	maxHealth = 100
	reload_max = 6
	movement_cooldown = 1

	icon_state = "eclipse_silver"
	icon_living = "eclipse_silver"

	projectiletype = /obj/item/projectile/bullet/pistol/medium/ap/eclipse

	var/grenade_type = /obj/item/grenade/chem_grenade/teargas
	var/grenade_timer = 20

/mob/living/simple_mob/humanoid/eclipse/lunar/silvernoodle/should_special_attack(atom/A)
	var/mob_count = 0				// Are there enough mobs to consider grenading?
	var/turf/T = get_turf(A)
	for(var/mob/M in range(T, 2))
		if(M.faction == faction) 	// Don't grenade our friends
			return FALSE
		if(M in oview(src, special_attack_max_range))	// And lets check if we can actually see at least two people before we throw a grenade
			if(!M.stat)			// Dead things don't warrant a grenade
				mob_count ++
	if(mob_count < 2)
		return FALSE
	else
		return TRUE

// Yes? Throw the grenade
/mob/living/simple_mob/humanoid/eclipse/lunar/silvernoodle/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	var/obj/item/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(A, G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer	//CHOMPEdit
		G.activate(src)	//CHOMPEdit
		special_attack_charges = max(special_attack_charges-1, 0)

	set_AI_busy(FALSE)

/mob/living/simple_mob/humanoid/eclipse/lunar/shotgunner //wuff with shotgun
	name = "Lunar Eclipse Shotgunner"
	desc = "A Vulpkanin or the like in a red-purple flashing rigsuit, it defending them from physical damage of close and long ranges."
	health = 75 //old 40
	maxHealth = 75
	reload_max = 1

	icon_state = "eclipse_shotwuff"
	icon_living = "eclipse_shotwuff"

	projectiletype = /obj/item/projectile/bullet/shotgun

	ranged_attack_delay = 0.5 SECONDS

/mob/living/simple_mob/humanoid/eclipse/lunar/shotgunner/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 0.5 SECONDS, maxdistance = 5)
	. = ..()

/mob/living/simple_mob/humanoid/eclipse/lunar/shotgunner/shoot_target(atom/A)
	set waitfor = FALSE

	if(!istype(A) || QDELETED(A))
		return

	setClickCooldown(get_attack_speed())

	face_atom(A)

	var/atom/orig_targ = A

	if(ranged_attack_delay)
		A = get_turf(orig_targ)
		ranged_pre_animation(A)
		handle_attack_delay(A, ranged_attack_delay) // This will sleep this proc for a bit, which is why waitfor is false.

	if(needs_reload)
		if(reload_count >= reload_max)
			try_reload()
			return FALSE

	visible_message("<span class='danger'><b>\The [src]</b> fires at \the [orig_targ]!</span>")
	shoot(A)
	if(casingtype)
		new casingtype(loc)

	if(ranged_attack_delay)
		ranged_post_animation(A)

	return TRUE

/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm //tesh got a gun
	name = "Lunar Eclipse Judge"
	desc = "A teshari wildly wielding a pistol, wearing bullet and sword protective gear."
	health = 50 //old 20
	maxHealth = 50
	icon_state = "eclipse_shottesh"
	icon_living = "eclipse_shottesh"
	movement_cooldown = -1


	projectiletype = /obj/item/projectile/bullet/shotgun
	reload_max = 6

	projectile_dispersion = 100
	projectile_accuracy = -100
	base_attack_cooldown = 0.01 // Division by zero error if 0

/mob/living/simple_mob/humanoid/eclipse/lunar/ravanger //Tanky boi. Very deadly melee
	name = "Lunar Eclipse Ravanger"
	desc = "An individual wearing strange armor that seems to be living, and breathing while providing protection from bullets and swords."
	health = 125 //Old 40
	maxHealth = 125
	icon_state = "eclipse_ravanger"
	icon_living = "eclipse_ravanger"

	attack_armor_pen = 15

	melee_damage_lower = 20
	melee_damage_upper = 20

	melee_attack_delay = 4

	projectiletype = null
	ai_holder_type = /datum/ai_holder/simple_mob/merc/eclipse

	var/poison_chance = 50
	var/poison_per_bite = 20
	var/poison_type = "hyperzine"


//////////////////////////////////////////////
//Boss mob time. Or somewhat bosses anyway.
/////////////////////////////////////////////

/mob/living/simple_mob/humanoid/eclipse/solar/hellhound
	name = "Solar Eclipse Hound"
	desc = "A heavily armored creature, flames dancing around it's burn and energy proof armor."
	health = 150 //Old 70
	maxHealth = 150
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	projectiletype = null //Flashing was to much for this mob.
	movement_cooldown = -1
	melee_damage_lower = 20
	melee_damage_upper = 20
	icon_state = "eclipse_hound"
	icon_living = "eclipse_hound"
	size_multiplier = 1.25
	var/poison_chance = 100
	var/poison_per_bite = 4
	var/poison_type = "stoxin"

	melee_attack_delay = 3

/mob/living/simple_mob/humanoid/eclipse/solar/hellhound/do_special_attack(atom/A)
	var/datum/effect/effect/system/spark_spread/s1 = new /datum/effect/effect/system/smoke_spread
	s1.set_up(5, 1, A)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/fireball(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)


/mob/living/simple_mob/humanoid/eclipse/lunar/wheel
	name = "Lunar Eclipse Armadillo"
	desc = "A silver armadillo coiled up, and spinning at you, all bullets and close quarters attacks bouncing off."
	health = 150 //old 70
	maxHealth = 150
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_armor_pen = 50
	icon_state = "eclipse_wheel"
	icon_living = "eclipse_wheel"
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	projectiletype = null //the net idea was fun but seemed to painful.
	movement_cooldown = -0.5

	var/cloaked_alpha = 60			// Lower = Harder to see.
	var/cloak_cooldown = 5 SECONDS	// Amount of time needed to re-cloak after losing it.
	var/last_uncloak = 0			// world.time

/mob/living/simple_mob/humanoid/eclipse/lunar/wheel/cloak()
	if(cloaked)
		return
	animate(src, alpha = cloaked_alpha, time = 1 SECOND)
	cloaked = TRUE


/mob/living/simple_mob/humanoid/eclipse/lunar/wheel/uncloak()
	last_uncloak = world.time // This is assigned even if it isn't cloaked already, to 'reset' the timer if the spider is continously getting attacked.
	if(!cloaked)
		return
	animate(src, alpha = initial(alpha), time = 1 SECOND)
	cloaked = FALSE

// Check if cloaking if possible.
/mob/living/simple_mob/humanoid/eclipse/lunar/wheel/proc/can_cloak()
	if(stat)
		return FALSE
	if(last_uncloak + cloak_cooldown > world.time)
		return FALSE

	return TRUE

// Called by things that break cloaks, like Technomancer wards.
/mob/living/simple_mob/humanoid/eclipse/lunar/wheel/break_cloak()
	uncloak()


/mob/living/simple_mob/humanoid/eclipse/lunar/wheel/is_cloaked()
	return cloaked


// Cloaks the spider automatically, if possible.
/mob/living/simple_mob/humanoid/eclipse/lunar/wheel/handle_special()
	if(!cloaked && can_cloak())
		cloak()

/mob/living/simple_mob/humanoid/eclipse/lunar/wheel/bullet_act(obj/item/projectile/P)
	. = ..()
	break_cloak()

/mob/living/simple_mob/humanoid/eclipse/lunar/wheel/hit_with_weapon(obj/item/O, mob/living/user, effective_force, hit_zone)
	. = ..()
	break_cloak()



/mob/living/simple_mob/humanoid/eclipse/solar/hellhound/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.reagents)
			var/target_zone = pick(BP_TORSO,BP_TORSO,BP_TORSO,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
			if(L.can_inject(src, null, target_zone))
				inject_poison(L, target_zone)

// Does actual poison injection, after all checks passed.
/mob/living/simple_mob/humanoid/eclipse/solar/hellhound/proc/inject_poison(mob/living/L, target_zone)
	if(prob(poison_chance))
		to_chat(L, "<span class='warning'>You feel a tiny prick.</span>")
		L.reagents.add_reagent(poison_type, poison_per_bite)

/mob/living/simple_mob/humanoid/eclipse/lunar/ravanger/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.reagents)
			var/target_zone = pick(BP_TORSO,BP_TORSO,BP_TORSO,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
			if(L.can_inject(src, null, target_zone))
				inject_poison(L, target_zone)

// Does actual poison injection, after all checks passed.
/mob/living/simple_mob/humanoid/eclipse/lunar/ravanger/proc/inject_poison(mob/living/L, target_zone)
	if(prob(poison_chance))
		to_chat(L, "<span class='warning'>You feel a tiny prick.</span>")
		L.reagents.add_reagent(poison_type, poison_per_bite)


/////////////////
//Mecha Killers//
/////////////////
/mob/living/simple_mob/humanoid/eclipse/solar/guardian
	name = "Solar Eclipse Guardian"
	desc = "A squishy bouncy individual, it seeming to harmlessly absorb lasers and energy in general."
	projectiletype = /obj/item/projectile/energy/mob/ionbeam
	icon_state = "eclipse_guardian"
	icon_living = "eclipse_guardian"
	reload_max = 10

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/slime_extract/grey = 100
			)

/mob/living/simple_mob/humanoid/eclipse/solar/guardian/handle_special()
	if(stat != DEAD)
		heal_aura()
	..()

/mob/living/simple_mob/humanoid/eclipse/solar/guardian/proc/heal_aura()
	for(var/mob/living/L in view(src, 4))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/slime_heal, null, src)


/mob/living/simple_mob/humanoid/eclipse/lunar/pummler
	name = "Lunar Eclipse Pummeler"
	desc = "A strange creature moving at quick speed, bullets and melee sliding off it's hide."
	projectiletype = /obj/item/projectile/mobbola
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_armor_pen = 30
	movement_cooldown = 0
	icon_state = "eclipse_pummler"
	icon_living = "eclipse_pummler"
	reload_max = 5
	size_multiplier = 1.5
	melee_attack_delay = 3 SECOND
	var/shock_chance = 25
	base_attack_cooldown = 6
	hovering = TRUE
	ranged_cooldown_time = 1.5

/mob/living/simple_mob/humanoid/eclipse/lunar/pummler/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(prob(shock_chance))
			A.emp_act(4) //The weakest strength of EMP
			playsound(src, 'sound/weapons/Egloves.ogg', 75, 1)
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(5, 1, L)
			s.start()
			visible_message("<span class='danger'>The pummler releases a powerful shock!</span>")
		else
			return

//Freezing winds update

/mob/living/simple_mob/humanoid/eclipse/lunar/aeroblaster //Air sniper
	name = "Lunar Eclipse Demodrone"
	desc = "A strange somewhat see through floating jellyfish."
	health = 30
	maxHealth = 30
	ai_holder_type = /datum/ai_holder/simple_mob/merc/eclipse/ranged
	projectiletype = /obj/item/projectile/bullet/srmrocket

	icon_state = "aeroblaster"
	icon_living = "aeroblaster"

	reload_max = 1
	reload_time = 5.0 SECONDS

	ranged_attack_delay = 1.5 SECONDS
	hovering = TRUE

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/slime_extract/grey = 100
			)

	var/exploded = FALSE
	var/explosion_dev_range		= 0
	var/explosion_heavy_range	= 1
	var/explosion_light_range	= 2
	var/explosion_flash_range	= 3 // This doesn't do anything iirc.

	var/explosion_delay_lower	= 5 SECOND	// Lower bound for explosion delay.
	var/explosion_delay_upper	= 10 SECONDS	// Upper bound.


/mob/living/simple_mob/humanoid/eclipse/lunar/aeroblaster/death()
	visible_message(span("critical", "\The [src]'s body begins to rupture!"))
	var/delay = rand(explosion_delay_lower, explosion_delay_upper)
	spawn(0)
		// Flash black and red as a warning.
		for(var/i = 1 to delay)
			if(i % 2 == 0)
				color = "#000000"
			else
				color = "#FF0000"
			sleep(1)

	spawn(delay)
		// The actual boom.
		if(src && !exploded)
			visible_message(span("danger", "\The [src]'s body detonates!"))
			exploded = TRUE
			explosion(src.loc, explosion_dev_range, explosion_heavy_range, explosion_light_range, explosion_flash_range)
	return ..()


/mob/living/simple_mob/humanoid/eclipse/lunar/aeroblaster/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 1.5 SECONDS, maxdistance = 15)
	. = ..()

/mob/living/simple_mob/humanoid/eclipse/lunar/aeroblaster/shoot_target(atom/A)
	set waitfor = FALSE

	if(!istype(A) || QDELETED(A))
		return

	setClickCooldown(get_attack_speed())

	face_atom(A)

	var/atom/orig_targ = A

	if(ranged_attack_delay)
		A = get_turf(orig_targ)
		ranged_pre_animation(A)
		handle_attack_delay(A, ranged_attack_delay) // This will sleep this proc for a bit, which is why waitfor is false.

	if(needs_reload)
		if(reload_count >= reload_max)
			try_reload()
			return FALSE

	visible_message("<span class='danger'><b>\The [src]</b> fires at \the [orig_targ]!</span>")
	shoot(A)
	if(casingtype)
		new casingtype(loc)

	if(ranged_attack_delay)
		ranged_post_animation(A)

	return TRUE


/mob/living/simple_mob/humanoid/eclipse/lunar/miner //Confusion?
	name = "Lunar Eclipse Miner"
	desc = "A slime creature in red and blue armor."
	health = 30
	maxHealth = 30
	projectiletype = /obj/item/projectile/energy/excavate/weak
	special_attack_cooldown = 60 SECONDS
	special_attack_min_range = 4
	special_attack_max_range = 7
	icon_state = "miner"
	icon_living = "miner"

	loot_list = list(/obj/item/slime_extract/sepia  = 1,
		/obj/item/slime_extract/grey = 100
			)

/mob/living/simple_mob/humanoid/eclipse/lunar/miner/do_special_attack(atom/A)
	new /mob/living/simple_mob/mechanical/mining_drone/scavenger/eclipse (src.loc)
	..(null,"creates a mining drone.")

/mob/living/simple_mob/mechanical/mining_drone/scavenger/eclipse
	health = 1
	maxHealth = 1
	faction = "eclipse"

/mob/living/simple_mob/humanoid/eclipse/solar/froststalker //teleporting stalker
	name = "Solar Eclipse Froststalker"
	health = 30
	maxHealth = 30
	desc = "A somewhat see through being wearing a burn resistaint coat."
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_armor_pen = 30
	special_attack_cooldown = 25 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7
	projectiletype = null
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	icon_state = "froststalker"
	icon_living = "froststalker"
	cold_resist = 1.0
	melee_attack_delay = 2.5

/mob/living/simple_mob/humanoid/eclipse/solar/froststalker/do_special_attack(atom/A)
	// Teleport attack.
	if(!A)
		to_chat(src, span("warning", "There's nothing to teleport to."))
		return FALSE

	var/list/nearby_things = range(1, A)
	var/list/valid_turfs = list()

	// All this work to just go to a non-dense tile.
	for(var/turf/potential_turf in nearby_things)
		var/valid_turf = TRUE
		if(potential_turf.density)
			continue
		for(var/atom/movable/AM in potential_turf)
			if(AM.density)
				valid_turf = FALSE
		if(valid_turf)
			valid_turfs.Add(potential_turf)

	if(!(valid_turfs.len))
		to_chat(src, span("warning", "There wasn't an unoccupied spot to teleport to."))
		return FALSE

	var/turf/target_turf = pick(valid_turfs)
	var/turf/T = get_turf(src)

	var/datum/effect/effect/system/spark_spread/s1 = new /datum/effect/effect/system/smoke_spread/frost
	s1.set_up(5, 1, T)
	var/datum/effect/effect/system/spark_spread/s2 = new /datum/effect/effect/system/smoke_spread
	s2.set_up(5, 1, target_turf)


	T.visible_message(span("notice", "\The [src] vanishes!"))
	s1.start()

	forceMove(target_turf)
	playsound(target_turf, 'sound/effects/phasein.ogg', 50, 1)
	to_chat(src, span("notice", "You teleport to \the [target_turf]."))

	target_turf.visible_message(span("warning", "\The [src] appears!"))
	s2.start()

/mob/living/simple_mob/humanoid/eclipse/solar/cryomancer //Freezing slowdown unit
	name = "Solar Eclipse Cryomancer"
	desc = "A being wearing ice and burn resistaint armor."
	health = 100
	maxHealth = 100
	projectiletype = /obj/item/projectile/bullet/frostshotgun
	has_heal_droid = TRUE
	reload_max = 5
	icon_state = "cryo"
	icon_living = "cryo"
	cold_resist = 1.0
	has_heal_droid = TRUE
	ai_holder_type = /datum/ai_holder/simple_mob/merc/eclipse/ranged/cyro
	var/grenade_type = /obj/item/grenade/chem_grenade/frost
	var/grenade_timer = 20	//CHOMPEdit

	ranged_attack_delay = 1.5 SECONDS

	loot_list = list(/obj/item/gun/energy/freezegun = 100,
			)

/mob/living/simple_mob/humanoid/eclipse/solar/cryomancer/should_special_attack(atom/A)
	var/mob_count = 0				// Are there enough mobs to consider grenading?
	var/turf/T = get_turf(A)
	for(var/mob/M in range(T, 2))
		if(M.faction == faction) 	// Don't grenade our friends
			return FALSE
		if(M in oview(src, special_attack_max_range))	// And lets check if we can actually see at least two people before we throw a grenade
			if(!M.stat)			// Dead things don't warrant a grenade
				mob_count ++
	if(mob_count < 2)
		return FALSE
	else
		return TRUE

// Yes? Throw the grenade
/mob/living/simple_mob/humanoid/eclipse/solar/cryomancer/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	var/obj/item/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(A, G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer	//CHOMPEdit
		G.activate(src)	//CHOMPEdit
		special_attack_charges = max(special_attack_charges-1, 0)

	set_AI_busy(FALSE)

/obj/item/grenade/chem_grenade/frost
	name = "frost grenade"
	desc = "Currently in the testing phase, pratical purposes are unknown."
	icon_state = "foam"
	path = 1
	stage = 2
	sealed = TRUE

/obj/item/grenade/chem_grenade/frost/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/bluespace/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/bluespace/B2 = new(src)

	B1.reagents.add_reagent("cryoslurry", 150)
	B1.reagents.add_reagent("potassium", 150)
	B2.reagents.add_reagent("phosphorous", 150)
	B2.reagents.add_reagent("sugar", 150)

	detonator = new/obj/item/assembly_holder/timer_igniter(src)

	beakers += B1

/obj/item/projectile/bullet/frostshotgun
	use_submunitions = 1
	only_submunitions = 1
	range = 0
	embed_chance = 0
	submunition_spread_max = 1200
	submunition_spread_min = 500
	submunitions = list(/obj/item/projectile/energy/frostsphere = 4)

	hud_state = "plasma_sphere"

/obj/item/projectile/bullet/frostshotgun/on_range()
	qdel(src)

/obj/item/projectile/energy/frostsphere
	name = "frost sphere"
	icon_state = "ice_2"
	fire_sound = 'sound/weapons/pulse3.ogg'
	damage = 20
	modifier_type_to_apply = /datum/modifier/cryogelled
	modifier_duration = 0.25 MINUTE
	speed = 2.5
	range = 12
	hud_state = "water"

/datum/ai_holder/simple_mob/merc/eclipse/ranged/cyro
	can_flee = TRUE					// If they're even allowed to flee.
	flee_when_dying = TRUE			// If they should flee when low on health.
	dying_threshold = 0.3		// How low on health the holder needs to be before fleeing. Defaults to 30% or lower health.
	flee_when_outmatched = TRUE	// If they should flee upon reaching a specific tension threshold.
	outmatched_threshold = 300
