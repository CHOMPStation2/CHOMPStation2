///////////////////////////////
//		Eclipse Mobs Go Here
///////////////////////////////

// Basic Version, the knife merc, or blood ininiate. Don't use them, or the eclipsesolar, lunar base versions either.
/mob/living/simple_mob/humanoid/eclipse
	name = "Eclipse Initiate"
	tt_desc = "E Homo sapiens"
	desc = "A silver cladded, dangerous looking indivual."
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	icon_state = "syndicate"
	icon_living = "syndicate"
	icon_dead = "statisgem"
	icon_gib = "syndicate_gib"

	faction = "eclipse"
	movement_cooldown = 0

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	health = 100
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
	ranged_cooldown = 4

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

	// Grenade special attack vars
	var/grenade_type = /obj/item/weapon/grenade/shooter/rubber
	var/grenade_timer = 50	//CHOMPEdit
	special_attack_cooldown = 45 SECONDS
	special_attack_min_range = 2
	special_attack_max_range = 7


////////////////////////////////
//		Grenade Attack
////////////////////////////////

// Any merc can use this, just set special_attack_charges to a positive value

// Check if we should bother with the grenade
/mob/living/simple_mob/humanoid/eclipse/should_special_attack(atom/A)
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
/mob/living/simple_mob/humanoid/eclipse/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	var/obj/item/weapon/grenade/G = new grenade_type(get_turf(src))
	if(istype(G))
		G.throw_at(A, G.throw_range, G.throw_speed, src)
		G.det_time = grenade_timer	//CHOMPEdit
		G.activate(src)	//CHOMPEdit
		special_attack_charges = max(special_attack_charges-1, 0)

	set_AI_busy(FALSE)

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
	desc = "A dangerous indivual, a gleaming orange shield surronding them, seeming protected from energy and burns."

	armor = list(melee = -10, bullet = -10, laser = 75, energy = 75, bomb = 50, bio = 100, rad = 100) //Solar members are nigh immune to burns.
	armor_soak = list(melee = 0, bullet = 0, laser = 15, energy = 15, bomb = 0, bio = 0, rad = 0)

/mob/living/simple_mob/humanoid/eclipse/solar/teslanoodle
	name = "Solar Eclipse Tesla Serpent"
	desc = "A naga cladded in strange orange armor, seemingly guarded from lasers and energy based weaponry."
	health = 100
	maxHealth = 100
	icon_state = "eclipse_tesla"
	icon_living = "eclipse_tesla"
	reload_max = 5
	movement_cooldown = 1

	special_attack_cooldown = 15 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7

	projectiletype = /obj/item/projectile/energy/electrode/eclipse

/mob/living/simple_mob/humanoid/eclipse/solar/teslanoodle/do_special_attack(atom/A)
	var/obj/item/projectile/P = new /obj/item/projectile/energy/electrode/eclipse(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)

/mob/living/simple_mob/humanoid/eclipse/solar/firemoff
	name = "Solar Eclipse Inferno Moth"
	desc = "A moth like creature cladded in armor, wisps of flames swirling around it. Protected from lasers and energy."
	health = 75
	maxHealth = 75
	icon_state = "eclipse_moth"
	icon_living = "eclipse_moth"
	reload_max = 10

	special_attack_cooldown = 15 SECONDS
	special_attack_min_range = 1
	special_attack_max_range = 7

	projectiletype = /obj/item/projectile/energy/blob/moth

/mob/living/simple_mob/humanoid/eclipse/solar/firemoff/do_special_attack(atom/A)
	var/obj/item/projectile/P = new /obj/item/projectile/arc/fragmentation/moth(get_turf(src))
	P.launch_projectile(A, BP_TORSO, src)


/mob/living/simple_mob/humanoid/eclipse/solar/snipertesh
	name = "Solar Eclipse Sniper"
	desc = "An armrored teshari with a sniper, protected from laser and energy based attacks"
	health = 50
	maxHealth = 50
	movement_cooldown = -1

	icon_state = "eclipse_snipertesh"
	icon_living = "eclipse_snipertesh"

	projectiletype = /obj/item/projectile/beam/sniper/eclipse

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
	health = 150
	maxHealth = 150
	glow_toggle = TRUE
	reload_max = 3

	icon_state = "eclipse_rad"
	icon_living = "eclipse_rad"

	projectiletype = /obj/item/projectile/energy/declone/burn
	var/rads = 25

/mob/living/simple_mob/humanoid/eclipse/solar/radiation/handle_special()
	if(stat != DEAD)
		irradiate()
	..()

/mob/living/simple_mob/humanoid/eclipse/solar/radiation/proc/irradiate()
	SSradiation.radiate(src, rads)


//The lunar mobs, highly resistant to brute based damage.
/mob/living/simple_mob/humanoid/eclipse/lunar
	name = "Lunar Eclipse Initiate"
	desc = "A hungry looking naga, their strange armor protecting them from ballistics and physical weaponry."

	armor = list(melee = 75, bullet = 75, laser = -10, energy = -10, bomb = 50, bio = 100, rad = 100) //Lunar members are nigh immune to burns.
	armor_soak = list(melee = 15, bullet = 15, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0) //15 because every melee weapon has dumb amount of AP

/mob/living/simple_mob/humanoid/eclipse/lunar/silvernoodle //Bouncing bullet extreme
	name = "Lunar Eclipse Silver Serpent"
	health = 100
	maxHealth = 100
	reload_max = 6
	movement_cooldown = 1

	icon_state = "eclipse_silver"
	icon_living = "eclipse_silver"

	projectiletype = /obj/item/projectile/bullet/pistol/medium/ap/eclipse

/mob/living/simple_mob/humanoid/eclipse/lunar/silvernoodle/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(O.force)
		if(prob(15))
			visible_message("<span class='danger'>\The [O] is absorbed by the armor!</span>")
			if(user)
				ai_holder.react_to_attack(user)
			return
		else
			..()
	else
		to_chat(user, "<span class='warning'>This weapon is ineffective, it does no damage.</span>")
		visible_message("<span class='warning'>\The [user] gently taps [src] with \the [O].</span>")

/mob/living/simple_mob/humanoid/eclipse/lunar/silvernoodle/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)	return
	if(prob(15))
		visible_message("<font color='red'><B>The [Proj] is absorbed by the armor!</B></font>")
		if(Proj.firer)
			ai_holder.react_to_attack(Proj.firer)
		return
	else
		..()

/mob/living/simple_mob/humanoid/eclipse/lunar/shotgunner //wuff with shotgun
	name = "Lunar Eclipse Shotgunner"
	desc = "A vulpakin or the like in a red-purple flashing rigsuit, it defending them from physical damage of close and long ranges."
	health = 75
	maxHealth = 75
	reload_max = 2

	icon_state = "eclipse_shotwuff"
	icon_living = "eclipse_shotwuff"

	projectiletype = /obj/item/projectile/bullet/shotgun/slow

	ranged_attack_delay = 0.5 SECONDS

/mob/living/simple_mob/humanoid/eclipse/lunar/bulletstorm //tesh got a gun
	name = "Lunar Eclipse Judge"
	desc = "A teshari wildly wiedling a pistol, wearing bullet and sword protective gear."
	health = 50
	maxHealth = 50
	icon_state = "eclipse_shottesh"
	icon_living = "eclipse_shottesh"
	movement_cooldown = -1


	projectiletype = /obj/item/projectile/bullet/shotgun/slow
	reload_max = 6

	projectile_dispersion = 100
	projectile_accuracy = -100
	base_attack_cooldown = 0

/mob/living/simple_mob/humanoid/eclipse/lunar/ravanger //Tanky boi. Very deadly melee
	name = "Lunar Eclipse Ravanger"
	desc = "An individual wearing strange armor that seems to be living, and breathing while providing protection from bullets and swords."
	health = 125
	maxHealth = 125
	icon_state = "eclipse_ravanger"
	icon_living = "eclipse_ravanger"

	attack_armor_pen = 25

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
	desc = "A heavly armored creature, flames dancing around it's burn and energy proof armor."
	health = 150
	maxHealth = 150
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	projectiletype = null //Flashing was to much for this mob.
	movement_cooldown = -1
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_armor_pen = 20
	icon_state = "eclipse_hound"
	icon_living = "eclipse_hound"
	size_multiplier = 1.25
	var/poison_chance = 100
	var/poison_per_bite = 4
	var/poison_type = "stoxin"

	melee_attack_delay = 4


/mob/living/simple_mob/humanoid/eclipse/lunar/wheel
	name = "Lunar Eclipse Armadillo"
	desc = "A silver armadillo coiled up, and spinning at you, all bullets and close quarters attacks bouncing off."
	health = 150
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
	desc = "A squishy bouncy individual, it seeming to harmlessly absorb lasers and energy in general.."
	projectiletype = /obj/item/projectile/ion
	icon_state = "eclipse_guardian"
	icon_living = "eclipse_guardian"
	reload_max = 10

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
	projectiletype = /obj/item/projectile/bullet/shotgun/ion
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_armor_pen = 30
	movement_cooldown = 0
	icon_state = "eclipse_pummler"
	icon_living = "eclipse_pummler"
	reload_max = 5
	size_multiplier = 1.5
	var/poison_per_bite = 5
	var/poison_type = "shredding_nanites"
	var/poison_chance = 10
	var/shock_chance = 60
	base_attack_cooldown = 6

/mob/living/simple_mob/humanoid/eclipse/lunar/pummler/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(prob(shock_chance))
			A.emp_act(4) //The weakest strength of EMP
			playsound(src, 'sound/weapons/Egloves.ogg', 75, 1)
			L.Weaken(4)
			L.Stun(4)
			L.stuttering = max(L.stuttering, 4)
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(5, 1, L)
			s.start()
			visible_message("<span class='danger'>The pummler releases a powerful shock!</span>")
		else
			if(L.reagents)
				var/target_zone = pick(BP_TORSO,BP_TORSO,BP_TORSO,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
				if(L.can_inject(src, null, target_zone))
					inject_poison(L, target_zone)


/mob/living/simple_mob/humanoid/eclipse/lunar/pummler/proc/inject_poison(mob/living/L, target_zone)
	if(prob(poison_chance))
		to_chat(L, "<span class='warning'>You feel a small shock rushing through your veins.</span>")
		L.reagents.add_reagent(poison_type, poison_per_bite)