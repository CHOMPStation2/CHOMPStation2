/mob/living/simple_mob/slime/feral
	cores = 3 // Xenobio will love getting their hands on these.
	maxHealth = 150 //Old 75
	movement_cooldown = 0
	melee_damage_lower = 15
	melee_damage_upper = 15
	unity = 1

/mob/living/simple_mob/slime/feral/apply_melee_effects(mob/living/L)
	if(istype(L) && a_intent == I_HURT)
		// Pump them full of toxins, if able.
		if(L.reagents && L.can_inject() && reagent_injected)
			L.reagents.add_reagent(reagent_injected, injection_amount)


/mob/living/simple_mob/slime/feral/purple
	desc = "This slime is rather toxic to handle, as it is poisonous."
	color = "#CC23FF"
	slime_color = "purple"
	coretype = /obj/item/slime_extract/purple
	reagent_injected = REAGENT_ID_TOXIN

/mob/living/simple_mob/slime/feral/orange
	desc = "This slime is known to be flammable and can ignite enemies."
	color = "#FFA723"
	slime_color = "orange"
	coretype = /obj/item/slime_extract/orange
	melee_damage_lower = 5
	melee_damage_upper = 5
	heat_resist = 1

/mob/living/simple_mob/slime/feral/orange/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/fire, 5 SECONDS)


/mob/living/simple_mob/slime/feral/blue
	desc = "This slime produces 'cryotoxin' and uses it against their foes.  Very deadly to other slimes."
	color = "#19FFFF"
	slime_color = "blue"
	coretype = /obj/item/slime_extract/blue
	reagent_injected = REAGENT_ID_CRYOTOXIN
	cold_resist = 0.50

/mob/living/simple_mob/slime/feral/metal
	desc = "This slime is a lot more resilient than the others, due to having a metamorphic metallic and sloped surface."
	color = "#5F5F5F"
	slime_color = "metal"
	shiny = TRUE
	coretype = /obj/item/slime_extract/metal
	maxHealth = 250
	armor = list(
				"melee" = 25,
				"bullet" = 25,
				"laser" = 25,
				"energy" = 50,
				"bomb" = 80,
				"bio" = 100,
				"rad" = 100
				)

	armor_soak = list(
				"melee" = 5,
				"bullet" = 5,
				"laser" = 5,
				"energy" = 0,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 0
				)


/mob/living/simple_mob/slime/feral/yellow
	desc = "This slime is very conductive, and is known to use electricity as a means of defense moreso than usual for slimes."
	color = "#FFF423"
	slime_color = "yellow"
	coretype = /obj/item/slime_extract/yellow
	melee_damage_lower = 5
	melee_damage_upper = 5
	shock_resist = 1

	projectiletype = /obj/item/projectile/energy/mob/electric_spider

/mob/living/simple_mob/slime/feral/yellow/apply_melee_effects(atom/A)
	..()
	if(isliving(A))
		var/mob/living/L = A
		L.inflict_shock_damage(10)
		to_chat(src, span_warning("You shock \the [L]."))
		to_chat(L, span_danger("You've been shocked by \the [src]!"))

/mob/living/simple_mob/slime/feral/dark_purple
	desc = "This slime produces ever-coveted phoron.  Risky to handle but very much worth it."
	color = "#660088"
	slime_color = "dark purple"
	coretype = /obj/item/slime_extract/dark_purple
	reagent_injected = REAGENT_ID_PHORON

/mob/living/simple_mob/slime/feral/dark_purple/proc/ignite()
	visible_message(span_critical("\The [src] erupts in an inferno!"))
	for(var/turf/simulated/target_turf in view(2, src))
		target_turf.assume_gas(GAS_PHORON, 30, 1500+T0C)
		spawn(0)
			target_turf.hotspot_expose(1500+T0C, 400)
	qdel(src)

/mob/living/simple_mob/slime/feral/dark_purple/ex_act(severity)
	log_and_message_admins("[src] ignited due to a chain reaction with an explosion.")
	ignite()

/mob/living/simple_mob/slime/feral/dark_purple/fire_act(datum/gas_mixture/air, temperature, volume)
	log_and_message_admins("[src] ignited due to exposure to fire.")
	ignite()

/mob/living/simple_mob/slime/feral/dark_purple/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(P.damage_type && P.damage_type == BURN && P.damage) // Most bullets won't trigger the explosion, as a mercy towards Security.
		log_and_message_admins("[src] ignited due to bring hit by a burning projectile[P.firer ? " by [key_name(P.firer)]" : ""].")
		ignite()
	else
		..()

/mob/living/simple_mob/slime/feral/dark_purple/attackby(var/obj/item/W, var/mob/user)
	if(istype(W) && W.force && W.damtype == BURN)
		log_and_message_admins("[src] ignited due to being hit with a burning weapon ([W]) by [key_name(user)].")
		ignite()
	else
		..()

/mob/living/simple_mob/slime/feral/silver
	desc = "This slime is shiny, and can deflect lasers or other energy weapons directed at it."
	color = "#AAAAAA"
	slime_color = "silver"
	coretype = /obj/item/slime_extract/silver
	shiny = TRUE

/mob/living/simple_mob/slime/feral/silver/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(istype(P,/obj/item/projectile/beam) || istype(P, /obj/item/projectile/energy))
		visible_message(span_danger("\The [src] reflects \the [P]!"))

		// Find a turf near or on the original location to bounce to
		var/new_x = P.starting.x + pick(0, 0, 0, -1, 1, -2, 2)
		var/new_y = P.starting.y + pick(0, 0, 0, -1, 1, -2, 2)
		var/turf/curloc = get_turf(src)

		// redirect the projectile
		P.redirect(new_x, new_y, curloc, src)
		P.reflected = TRUE
		return PROJECTILE_CONTINUE // complete projectile permutation
	else
		..()

/mob/living/simple_mob/slime/feral/bluespace
	desc = "Trapping this slime in a cell is generally futile, as it can teleport at will."
	color = null
	slime_color = "bluespace"
	icon_state_override = "bluespace"
	coretype = /obj/item/slime_extract/bluespace

	special_attack_min_range = 3
	special_attack_max_range = 7
	special_attack_cooldown = 5 SECONDS

/mob/living/simple_mob/slime/feral/bluespace/do_special_attack(atom/A)
	// Teleport attack.
	if(!A)
		to_chat(src, span_warning("There's nothing to teleport to."))
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
		to_chat(src, span_warning("There wasn't an unoccupied spot to teleport to."))
		return FALSE

	var/turf/target_turf = pick(valid_turfs)
	var/turf/T = get_turf(src)

	var/datum/effect/effect/system/spark_spread/s1 = new /datum/effect/effect/system/spark_spread
	s1.set_up(5, 1, T)
	var/datum/effect/effect/system/spark_spread/s2 = new /datum/effect/effect/system/spark_spread
	s2.set_up(5, 1, target_turf)


	T.visible_message(span_notice("\The [src] vanishes!"))
	s1.start()

	forceMove(target_turf)
	playsound(target_turf, 'sound/effects/phasein.ogg', 50, 1)
	to_chat(src, span_notice("You teleport to \the [target_turf]."))

	target_turf.visible_message(span_warning("\The [src] appears!"))
	s2.start()

	if(Adjacent(A))
		attack_target(A)


/mob/living/simple_mob/slime/feral/ruby
	desc = "This slime has great physical strength."
	color = "#FF3333"
	slime_color = "ruby"
	shiny = TRUE
	glow_toggle = TRUE
	coretype = /obj/item/slime_extract/ruby
	melee_attack_delay = 1 SECOND

/mob/living/simple_mob/slime/feral/ruby/Initialize(mapload)
	add_modifier(/datum/modifier/slime_strength, null, src) // Slime is always swole.
	return ..()

/mob/living/simple_mob/slime/feral/ruby/apply_melee_effects(atom/A)
	..()

	if(isliving(A) && a_intent == I_HURT)
		var/mob/living/L = A
		if(L.mob_size <= MOB_MEDIUM)
			visible_message(span_danger("\The [src] sends \the [L] flying with the impact!"))
			playsound(src, "punch", 50, 1)
			L.Weaken(1)
			var/throwdir = get_dir(src, L)
			L.throw_at(get_edge_target_turf(L, throwdir), 3, 1, src)
		else
			to_chat(L, span_warning("\The [src] hits you with incredible force, but you remain in place."))
			visible_message(span_danger("\The [src] hits \the [L] with incredible force, to no visible effect!")) // CHOMPEdit: Visible/audible feedback for *resisting* the slam.
			playsound(src, "punch", 50, 1) // CHOMPEdit: Visible/audible feedback for *resisting* the slam.

/mob/living/simple_mob/slime/feral/red
	desc = "This slime is full of energy, and very aggressive.  'The red ones go faster.' seems to apply here."
	color = "#FF3333"
	slime_color = "red"
	coretype = /obj/item/slime_extract/red
	movement_cooldown = -1 // See above.

/mob/living/simple_mob/slime/feral/green
	desc = "This slime is radioactive."
	color = "#14FF20"
	slime_color = "green"
	coretype = /obj/item/slime_extract/green
	glow_toggle = TRUE
	reagent_injected = REAGENT_ID_RADIUM
	var/rads = 25

/mob/living/simple_mob/slime/feral/green/handle_special()
	if(stat != DEAD)
		irradiate()
	..()

/mob/living/simple_mob/slime/feral/green/proc/irradiate()
	SSradiation.radiate(src, rads)

/mob/living/simple_mob/slime/feral/pink
	desc = "This slime has regenerative properties."
	color = "#FF0080"
	slime_color = "pink"
	coretype = /obj/item/slime_extract/pink
	glow_toggle = TRUE

/mob/living/simple_mob/slime/feral/pink/handle_special()
	if(stat != DEAD)
		heal_aura()
	..()

/mob/living/simple_mob/slime/feral/pink/proc/heal_aura()
	for(var/mob/living/L in view(src, 2))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/slime_heal, null, src)

/mob/living/simple_mob/slime/feral/emerald
	desc = "This slime is faster than usual, even more so than the red slimes."
	color = "#22FF22"
	shiny = TRUE
	glow_toggle = TRUE
	slime_color = "emerald"
	coretype = /obj/item/slime_extract/emerald

/mob/living/simple_mob/slime/feral/emerald/handle_special()
	if(stat != DEAD)
		zoom_aura()
	..()

/mob/living/simple_mob/slime/feral/emerald/proc/zoom_aura()
	for(var/mob/living/L in view(src, 2))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/technomancer/haste, 5 SECONDS, src)
