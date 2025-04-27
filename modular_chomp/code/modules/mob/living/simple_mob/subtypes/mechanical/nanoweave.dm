/mob/living/simple_mob/mechanical/mecha/eclipse/nanoweavedrake //A creature that is very, very evasive
	name = "combat silicon"
	desc = "A combat module silicon. Something seems off."
	old_x = -48
	old_y = 0
	icon = 'modular_chomp/icons/mob/nanoweave.dmi'
	icon_state = "derg"
	icon_living = "derg"
	faction = FACTION_HIVEBOT
	wreckage = /obj/structure/loot_pile/surface/alien/security
	maxHealth = 600
	health = 600
	deflect_chance = 20
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/three_phases/zoomy
	armor = list(melee = 50, bullet = 40, laser = 40, energy = 40, bomb = 80, bio = 100, rad = 100)
	projectiletype = /obj/item/projectile/energy/wallbreaker/boss
	specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni
	var/obj/item/shield_projector/shields = null

/mob/living/simple_mob/mechanical/mecha/eclipse/nanoweavedrake/Initialize(mapload)
	shields = new /obj/item/shield_projector/rectangle/automatic/hivebot_drone(src)
	return ..()

/datum/ai_holder/simple_mob/intentional/three_phases/zoomy

/datum/ai_holder/simple_mob/intentional/three_phases/zoomy/on_engagement(atom/movable/AM)
	step_rand(holder)
	holder.face_atom(AM)

/mob/living/simple_mob/mechanical/mecha/eclipse/nanoweavedrake/do_special_attack(atom/A)
	. = TRUE
	switch(a_intent)
		if(I_DISARM) // Phase 3
			if(attackcycle == 1)
				attackcycle = 0
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni/nearmax
				if(prob(50))
					say("PROTOCOL: SWEEP. FIGURATION: A.")
					addtimer(CALLBACK(src, PROC_REF(dualsweep_one), A, 2), 3 SECONDS, TIMER_DELETE_ME)
				else
					say("PROTOCOL: SWEEP. FIGURATION: B.")
					addtimer(CALLBACK(src, PROC_REF(dualsweep_one_r), A, 3), 3 SECONDS, TIMER_DELETE_ME)
			else if(attackcycle == 2)
				say("PROTOCOL: ALPHA. SWEEP.")
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni/frequentspawn
				attackcycle = 0
				addtimer(CALLBACK(src, PROC_REF(alpha_slash), A, 4), 1 SECONDS, TIMER_DELETE_ME)
			else if(attackcycle == 3)
				say("PROTOCOL: OMEGA. SWEEP.")
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni/frequentspawn
				attackcycle = 0
				addtimer(CALLBACK(src, PROC_REF(omega), A, 4), 1 SECOND, TIMER_DELETE_ME)
			else if(attackcycle == 4)
				say("PROTOCOL: BARRIER WIPE")
				attackcycle = 0
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni
				addtimer(CALLBACK(src, PROC_REF(spin_to_win), A, 4), 1 SECOND, TIMER_DELETE_ME)
		if(I_HURT) //phase 1
			if(attackcycle == 1)
				say("PROTOCOL: MAELSTORM.")
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 4, 1, 0.5 SECONDS), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: SWEEP. FIGURATION: A.")
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni/frequentspawn
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one), A, 3), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: SWEEP. FIGURATION: B.")
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni/frequentspawn
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one_r), A, 1), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) //phase 2
			if(attackcycle == 1)
				say("PROTOCOL: SWEEP. FIGURATION: A.")
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni/frequentspawn
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one), A, 1), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: BARRIER WIPE")
				attackcycle = 0
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni
				addtimer(CALLBACK(src, PROC_REF(spin_to_win), A, 2), 1 SECOND, TIMER_DELETE_ME)
			else if(attackcycle == 3)
				say("PROTOCOL: SWEEP. FIGURATION: B.")
				specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni/frequentspawn
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one_r), A, 3), 3 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0


/mob/living/simple_mob/mechanical/mecha/eclipse/jellyfish //A bullet hell lite creature who causes vision issues.
	name = "nanoweave project BWA"
	desc = "A floating robotic jellyfish."
	old_x = -48
	old_y = 0
	icon = 'modular_chomp/icons/mob/nanoweave.dmi'
	icon_state = "jellyfish"
	icon_living = "jellyfish"
	faction = FACTION_HIVEBOT
	deflect_chance = 0
	maxHealth = 1000
	health = 1000
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 40, bio = 100, rad = 100)
	specialattackprojectile = /obj/item/projectile/energy/wallbreaker/boss
	wreckage = /obj/structure/loot_pile/surface/alien/security

/mob/living/simple_mob/mechanical/mecha/eclipse/jellyfish/do_special_attack(atom/A)
	switch(a_intent)
		if(I_DISARM) // Phase 3, it's moments of visibility are lesser
			if(attackcycle == 1)
				say("PROTOCOL: OMEGA. SWEEP. PROTOCOL: TELEPORT. PROTOCOL: ALPHA. SWEEP. PROTOCOL: TELEPORT")
				alpha = 10
				attackcycle = 0
				addtimer(CALLBACK(src, PROC_REF(omega), A, 2), 1.5 SECONDS, TIMER_DELETE_ME)
			else if(attackcycle == 2)
				alpha = 10
				attackcycle = 0
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 3), 0.5 SECONDS, TIMER_DELETE_ME)
			else if(attackcycle == 3)
				alpha = 10
				attackcycle = 0
				addtimer(CALLBACK(src, PROC_REF(alpha_slash), A, 4), 1 SECOND, TIMER_DELETE_ME)
			else if(attackcycle == 4)
				alpha = 255
				attackcycle = 0
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 0.5 SECONDS, TIMER_DELETE_ME)

		if(I_HURT) //phase 1
			if(attackcycle == 1)
				say("PROTOCOL: MAELSTORM.")
				alpha = 255
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 4, 2, 0.5 SECONDS), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				say("PROTOCOL: INFANTRY WIPE")
				alpha = 255
				addtimer(CALLBACK(src, PROC_REF(spin_to_win), A, 3), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: TELEPORT.")
				alpha = 10
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) //phase 2, the trickery emboldens
			if(attackcycle == 1)
				say("PROTOCOL: MAELSTORM.PROTOCOL:TELEPORT.")
				alpha = 255
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 4, 2, 0.5 SECONDS), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				alpha = 10
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 3), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				say("PROTOCOL: OMEGA. SWEEP.PROTOCOL: TELEPORT.")
				attackcycle = 0
				alpha = 255
				addtimer(CALLBACK(src, PROC_REF(omega), A, 4), 1.5 SECONDS, TIMER_DELETE_ME)
			else if(attackcycle == 4)
				alpha = 10
				attackcycle = 0
				addtimer(CALLBACK(src, PROC_REF(teleport_attack), A, 1), 1 SECOND, TIMER_DELETE_ME)


/mob/living/simple_mob/mechanical/mecha/eclipse/proc/omega(atom/target, var/next_cycle)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(omega_one), target, next_cycle), 1.5 SECONDS, TIMER_DELETE_ME)
	upfour(target)
	downfour(target)
	upfour_leftfour(target)
	downfour_rightfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/omega_one(atom/target, var/next_cycle)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(omega_two), target, next_cycle), 0.5 SECONDS, TIMER_DELETE_ME)
	leftfour(target)
	rightfour(target)
	upfour_rightfour(target)
	downfour_leftfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/omega_two(atom/target, var/next_cycle)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(omega_three), target, next_cycle), 1.5 SECONDS, TIMER_DELETE_ME)
	upone_leftfour(target)
	downone_leftfour(target)
	upone_rightfour(target)
	downone_rightfour(target)
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_rightfour(target)
	upfour_rightfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/omega_three(atom/target, var/next_cycle)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(omega_four), target, next_cycle), 1.5 SECONDS, TIMER_DELETE_ME)
	uptwo_leftfour(target)
	downtwo_leftfour(target)
	uptwo_rightfour(target)
	downtwo_rightfour(target)
	upfour(target)
	downfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/omega_four(atom/target, var/next_cycle)
	if(!target)
		return
	attackcycle = next_cycle
	upthree_leftfour(target)
	downthree_leftfour(target)
	upthree_rightfour(target)
	downthree_rightfour(target)
	leftfour(target)
	rightfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/alpha_slash(atom/target, var/next_cycle) //upright
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(alpha_one), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)
	upfour_rightfour(target)
	upfour_rightthree(target)
	upthree_rightfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/alpha_one(atom/target, var/next_cycle) //right
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(alpha_two), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)
	rightfour(target)
	upone_rightfour(target)
	downone_rightfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/alpha_two(atom/target, var/next_cycle) //downleft
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(alpha_three), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)
	downfour_leftfour(target)
	downthree_leftfour(target)
	downfour_leftthree(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/alpha_three(atom/target, var/next_cycle) //left
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(alpha_four), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)
	leftfour(target)
	upone_leftfour(target)
	downone_leftfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/alpha_four(atom/target, var/next_cycle) //upleft
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(alpha_five), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)
	leftfour(target)
	upone_leftfour(target)
	downone_leftfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/alpha_five(atom/target, var/next_cycle) //down
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(alpha_six), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)
	downfour(target)
	downfour_leftone(target)
	downfour_rightone(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/alpha_six(atom/target, var/next_cycle) //up
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(alpha_seven), target, next_cycle), 1 SECOND, TIMER_DELETE_ME)
	upfour(target)
	upfour_leftone(target)
	upfour_rightone(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/proc/alpha_seven(atom/target, var/next_cycle) //downright
	if(!target)
		return
	downfour_leftfour(target)
	downthree_leftfour(target)
	downfour_leftthree(target)
	attackcycle = next_cycle


/obj/effect/callstrike_nanoweave
	anchored = TRUE
	density = FALSE
	mouse_opacity = 0
	icon ='modular_chomp/icons/mob/hivebot.dmi'
	icon_state = "arti"

/obj/effect/callstrike_nanoweave/end_fall(var/crushing = FALSE)
	for(var/mob/living/L in loc)
		var/target_zone = ran_zone()
		var/blocked = L.run_armor_check(target_zone, "laser")
		var/soaked = L.get_armor_soak(target_zone, "laser")

		if(!L.apply_damage(40, BURN, target_zone, blocked, soaked))
			break
	playsound(src, 'sound/effects/teleport.ogg', 50, 1)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src), 0.25 SECONDS, TIMER_DELETE_ME)

/obj/item/projectile/energy/hazardmover
	var/spawnhazard = /obj/fire
	var/spawnchance = 20

/obj/item/projectile/energy/hazardmover/Move()
	. = ..()
	if(prob(spawnchance))
		new spawnhazard(src.loc)

/obj/item/projectile/energy/hazardmover/omni
	name = "expirmental laser"
	icon_state = "omnilaser"
	damage = 10
	armor_penetration = 90
	penetrating = 10
	speed = 10
	spawnhazard = /obj/effect/callstrike_nanoweave

/obj/item/projectile/energy/hazardmover/omni/frequentspawn
	spawnchance = 50

/obj/item/projectile/energy/hazardmover/omni/nearmax
	spawnchance = 90

/obj/item/projectile/bullet/nanodyson
	use_submunitions = 1
	only_submunitions = 1 	//lmao this var doesn't even do anything
	range = 0				//so instead we circumvent it with this :^)
	embed_chance = 0
	submunition_spread_max = 900
	submunition_spread_min = 150
	spread_submunition_damage = FALSE
	submunitions = list(/obj/item/projectile/energy/hazardmover/omni = 1, /obj/item/projectile/energy/wallbreaker/boss = 1, /obj/item/projectile/energy/burninglaser/boss = 1)

/obj/item/projectile/bullet/nanodyson/on_range()
	qdel(src)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson //the finale
	name = "nanoweave neo prototype"
	desc = "A strange floating combat sphere."
	old_x = -48
	old_y = 0
	icon = 'modular_chomp/icons/mob/nanoweave.dmi'
	icon_state = "dyson"
	icon_living = "dyson"
	faction = FACTION_HIVEBOT
	deflect_chance = 0
	maxHealth = 9000 //Has several moments of sitting and talking
	health = 9000 //only for event so absurdly large HP
	damage_threshold = 10
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 20, bio = 100, rad = 100)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/do_special_attack(atom/A)
	. = TRUE
	switch(a_intent)
		if(I_DISARM) // Phase 3
			if(attackcycle > 0)
				addtimer(CALLBACK(src, PROC_REF(grandfinale), A), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_HURT) //phase 1
			if(attackcycle == 1)
				say("INTIATE. SPEECH. DOCTOR. YEVAL.")
				projectiletype = /obj/item/projectile/beam/energy_net
				addtimer(CALLBACK(src, PROC_REF(opener), A), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 2)
				projectiletype = /obj/item/projectile/energy/wallbreaker/boss
				addtimer(CALLBACK(src, PROC_REF(omega), A, 3), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				projectiletype = /obj/item/projectile/energy/burninglaser/boss
				addtimer(CALLBACK(src, PROC_REF(alpha_slash), A, 4), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				projectiletype = /obj/item/projectile/energy/hazardmover/omni/frequentspawn
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 7, 2, 0.5 SECONDS), 2 SECONDS, TIMER_DELETE_ME)
				attackcycle = 0
		if(I_GRAB) //phase 2
			if(attackcycle == 2)
				specialattackprojectile = /obj/item/projectile/bullet/nanodyson
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one), A, 2), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 3)
				specialattackprojectile = /obj/item/projectile/bullet/alterhivebot/boss
				addtimer(CALLBACK(src, PROC_REF(omega), A, 4), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 4)
				specialattackprojectile = /obj/item/projectile/bullet/nanodyson
				addtimer(CALLBACK(src, PROC_REF(dualsweep_one_r), A, 5), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 5)
				specialattackprojectile = /obj/item/projectile/energy/wallbreaker/boss
				addtimer(CALLBACK(src, PROC_REF(alpha_slash), A, 6), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0
			else if(attackcycle == 6)
				specialattackprojectile = /obj/item/projectile/bullet/nanodyson
				addtimer(CALLBACK(src, PROC_REF(random_firing), A, 7, 2, 0.5 SECONDS), 1 SECOND, TIMER_DELETE_ME)
				attackcycle = 0



/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_one), target), 2 SECONDS, TIMER_DELETE_ME)
	upfour(target)
	upfour_rightone(target)
	upfour_righttwo(target)
	upfour_rightthree(target)
	upfour_rightfour(target)
	upthree_rightfour(target)
	uptwo_rightfour(target)
	upone_rightfour(target)
	rightfour(target)
	downone_rightfour(target)
	downtwo_rightfour(target)
	downthree_rightfour(target)
	downfour_rightfour(target)
	downfour_rightthree(target)
	downfour_righttwo(target)
	downfour_rightone(target)
	downfour(target)
	downfour_leftone(target)
	downfour_lefttwo(target)
	downfour_leftthree(target)
	downfour_leftfour(target)
	downthree_leftfour(target)
	downtwo_leftfour(target)
	downone_leftfour(target)
	leftfour(target)
	upone_leftfour(target)
	uptwo_leftfour(target)
	upthree_leftfour(target)
	upfour_leftfour(target)
	upfour_leftthree(target)
	upfour_lefttwo(target)
	upfour_leftone(target)
	say("Why must you struggle?")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_one(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_two), target), 2 SECONDS, TIMER_DELETE_ME)
	say("We have stood for eons. Weathering the storm")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_two(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_three), target), 2 SECONDS, TIMER_DELETE_ME)
	say("We survived the great calamity. We surpassed all the other")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_three(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_four), target), 2 SECONDS, TIMER_DELETE_ME)
	say("Voidwalkers became one with the void. Beastcallers calling upon themselves.")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_four(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_five), target), 2 SECONDS, TIMER_DELETE_ME)
	say("Abyss divers never surfacing. Terraformers burried")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_five(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_six), target), 2 SECONDS, TIMER_DELETE_ME)
	say("What are you, compared to them? A sandcastle with the tide coming in.")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_six(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_seven), target), 2 SECONDS, TIMER_DELETE_ME)
	say("A meer fragment of us require all of you to stand a chance.")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_seven(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_eight), target), 2 SECONDS, TIMER_DELETE_ME)
	say("Still, you aren't to be trifled with.")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_eight(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_nine), target), 2 SECONDS, TIMER_DELETE_ME)
	say("We were once in your spot, tearing our way out from the bottom.")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_nine(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_ten), target), 2 SECONDS, TIMER_DELETE_ME)
	say("Current personality core is quite familir with this.")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_ten(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_eleven), target), 2 SECONDS, TIMER_DELETE_ME)
	say("So, with the utmost honor. Disengaing normal protocol.")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_eleven(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(opener_twelve), target), 10 SECONDS, TIMER_DELETE_ME)
	say("Engaging full power.")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/opener_twelve(atom/target)
	if(!target)
		return
	say("Goodbye. You shall be honoured in Edera.")
	attackcycle = 2

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_one), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Despite breaking protocol, pressing this shell's to it's limits, you still stand.")
	specialattackprojectile = /obj/item/projectile/energy/wallbreaker/boss
	upfour_rightone(target)
	upfour_righttwo(target)
	upfour_rightthree(target)
	upfour_rightfour(target)
	upthree_rightfour(target)
	uptwo_rightfour(target)
	upone_rightfour(target)
	downfour_leftone(target)
	downfour_lefttwo(target)
	downfour_leftthree(target)
	downfour_leftfour(target)
	downthree_leftfour(target)
	downtwo_leftfour(target)
	downone_leftfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_one(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_two), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("A stalemate, or a slow victory. Not in our favour.")
	downone_rightfour(target)
	downtwo_rightfour(target)
	downthree_rightfour(target)
	downfour_rightfour(target)
	downfour_rightthree(target)
	downfour_righttwo(target)
	downfour_rightone(target)
	upone_leftfour(target)
	uptwo_leftfour(target)
	upthree_leftfour(target)
	upfour_leftfour(target)
	upfour_leftthree(target)
	upfour_lefttwo(target)
	upfour_leftone(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_two(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_three), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Tell me, if you overcome us, what is next?")
	specialattackprojectile = /obj/item/projectile/bullet/nanodyson
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	upfour_leftfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_three(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_four), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("We are just a fragment of what was.")
	leftfour(target)
	downfour(target)
	rightfour(target)
	upfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_four(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_five), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Can you slay them all? And what if the others are to return?")
	specialattackprojectile = /obj/item/projectile/arc/microsingulo
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	upfour_leftfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_five(atom/target) //one of three
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_six), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Can you battle those merge with the shadows?")
	specialattackprojectile = /obj/item/projectile/energy/hazardmover/omni/nearmax
	leftfour(target)
	downfour(target)
	rightfour(target)
	upfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_six(atom/target) //two of three
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_seven), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Topple titans bathed in blood?")
	upone_leftfour(target)
	downone_leftfour(target)
	downfour_rightone(target)
	downfour_leftone(target)
	upone_rightfour(target)
	downone_rightfour(target)
	upfour_leftone(target)
	upfour_rightone(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_seven(atom/target) //three of three
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_eight), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Fell those who drown reality in sorrow?")
	uptwo_leftfour(target)
	downtwo_leftfour(target)
	downfour_righttwo(target)
	downfour_lefttwo(target)
	uptwo_rightfour(target)
	downtwo_rightfour(target)
	upfour_lefttwo(target)
	upfour_righttwo(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_eight(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_nine), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Break those who mold the land like putty?")
	specialattackprojectile = /obj/item/projectile/arc/explosive_rocket
	upfour_rightfour(target)
	downfour_rightfour(target)
	downfour_leftfour(target)
	upfour_leftfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_nine(atom/target) //short lasers indicate what is about to get laser blasted
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_ten), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("And even then, do you think you can overcome the calamity we could not?")
	specialattackprojectile = /obj/item/projectile/beam/midlaser/veryshortrange
	leftfour(target)
	downfour(target)
	rightfour(target)
	upfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_ten(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_eleven), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Even with damaged equipment, I can see the divides amongst you all.")
	specialattackprojectile = /obj/item/projectile/beam/midlaser
	leftfour(target)
	downfour(target)
	rightfour(target)
	upfour(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_eleven(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_tweleve), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Even with damaged equipment, I can see the divides amongst you all.")
	specialattackprojectile = /obj/item/projectile/beam/midlaser/veryshortrange
	downtwo_leftfour(target)
	downfour_rightthree(target)
	upthree_rightfour(target)
	upfour_lefttwo(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_tweleve(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_thiriteen), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("When the smoke and dust settles, how much longer will you stand?")
	specialattackprojectile = /obj/item/projectile/beam/midlaser
	downtwo_leftfour(target)
	downfour_rightthree(target)
	upthree_rightfour(target)
	upfour_lefttwo(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_thiriteen(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_fourteen), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Eventually it will come calling, you do not stand a chance.")
	specialattackprojectile = /obj/item/projectile/beam/midlaser/veryshortrange
	upone_leftfour(target)
	downfour_rightone(target)
	upthree_rightfour(target)
	upfour_lefttwo(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_fourteen(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_fifteen), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Determination and free will can only get you so far.")
	specialattackprojectile = /obj/item/projectile/beam/midlaser/veryshortrange
	upone_leftfour(target)
	downfour_rightone(target)
	upthree_rightfour(target)
	upfour_lefttwo(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_fifteen(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_sixteen), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Our caculations. Failing. The only end for us all.")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_sixteen(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_seventeen), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Flames.")
	projectiletype = /obj/item/projectile/beam/energy_net

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_seventeen(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_eightteen), target), 1.5 SECONDS, TIMER_DELETE_ME)
	say("Overloading reactor.")
	upfour(target)
	upfour_rightone(target)
	upfour_righttwo(target)
	upfour_rightthree(target)
	upfour_rightfour(target)
	upthree_rightfour(target)
	uptwo_rightfour(target)
	upone_rightfour(target)
	rightfour(target)
	downone_rightfour(target)
	downtwo_rightfour(target)
	downthree_rightfour(target)
	downfour_rightfour(target)
	downfour_rightthree(target)
	downfour_righttwo(target)
	downfour_rightone(target)
	downfour(target)
	downfour_leftone(target)
	downfour_lefttwo(target)
	downfour_leftthree(target)
	downfour_leftfour(target)
	downthree_leftfour(target)
	downtwo_leftfour(target)
	downone_leftfour(target)
	leftfour(target)
	upone_leftfour(target)
	uptwo_leftfour(target)
	upthree_leftfour(target)
	upfour_leftfour(target)
	upfour_leftthree(target)
	upfour_lefttwo(target)
	upfour_leftone(target)

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_eightteen(atom/target)
	if(!target)
		return
	addtimer(CALLBACK(src, PROC_REF(grandfinale_nineteen), target), 30 SECONDS, TIMER_DELETE_ME)
	say("We shall all go into the flames togther..")

/mob/living/simple_mob/mechanical/mecha/eclipse/dyson/proc/grandfinale_nineteen(atom/target)
	if(!target)
		return
	explosion(src.loc, 30, 16, 8, 4)

