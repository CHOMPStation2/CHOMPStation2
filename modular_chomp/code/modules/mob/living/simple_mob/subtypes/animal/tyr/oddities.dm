/mob/living/simple_mob/animal/tyr/rainbow_fly
	name = "chromatic fly"
	desc = "A strange insect."
	icon_state = "firefly"
	icon_dead = "firefly_dead"
	maxHealth = 10 //Not sure why you're fighting this, but any agate weapon one shots it. Except bow.
	health = 10
	pass_flags = PASSTABLE
	movement_cooldown = 1

	ai_holder_type = /datum/ai_holder/simple_mob/passive

	glow_color = "#FF3300"
	light_color = "#FF3300"
	glow_range = 4
	glow_intensity = 4

	melee_damage_lower = 5 //I guess it could theortically kill you dirrectly
	melee_damage_upper = 5

	hovering = TRUE

/mob/living/simple_mob/animal/tyr/rainbow_fly/handle_special()
	if(stat != DEAD)
		painbow_aura()
	..()

/mob/living/simple_mob/animal/tyr/rainbow_fly/proc/painbow_aura()
	for(var/mob/living/L in view(src, 4))
		L.druggy = max(L.druggy, 10)

/mob/living/simple_mob/animal/tyr/groundpitcher
	name = "underground pitcher"
	desc = "A large insect."
	icon_state = "groundpitcher"
	icon_dead = "groundpitcher"
	maxHealth = 20 //two hits with sword and spear..
	health = 20
	pass_flags = PASSTABLE //This was from me copy and pasting but...it's an unmoving plant. Kind of want to keep it here.
	movement_cooldown = 1

	ai_holder_type = /datum/ai_holder/simple_mob/passive/pitcher

	melee_damage_lower = 0 //This cannot kill you unless you fall into it
	melee_damage_upper = 0

	meat_type = /obj/item/stack/material/fiber

	butchery_loot = list(\
		/obj/item/stack/material/cloth = 1\
		)

	vore_bump_chance = 100
	vore_bump_emote = "slurps up" //Not really a good way to make the grammar work with a passive vore plant.
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0 //Plants only eat people who stumble into them.
	swallowTime = 3 //3 deciseconds. This is intended to be nearly instant, e.g. victim trips and falls in.
	vore_ignores_undigestable = 0
	vore_default_mode = DM_DIGEST

//This is legit pitcher plant bellies with slightly altered bits.
/mob/living/simple_mob/animal/tyr/groundpitcher/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.desc	= "You leaned a little too close to the pitcher plant, stumbling over the lip and splashing into a puddle of liquid filling the bottom of the cramped pitcher. You squirm madly, righting yourself and scrabbling at the walls in vain as the slick surface offers no purchase. The dim light grows dark as the pitcher's cap lowers, silently sealing the exit. With a sinking feeling you realize you won't be able to push the exit open even if you could somehow climb that high, leaving you helplessly trapped in the slick, tingling fluid."
	B.digest_burn = 0.5
	B.digest_brute = 0
	B.vore_verb = "trip"
	B.name = "pitcher"
	B.mode_flags = DM_FLAG_THICKBELLY
	B.wet_loop = 0 //As nice as the fancy internal sounds are this is a plant.
	B.digestchance = 20
	B.escapechance = 20
	B.fancy_vore = 1
	B.vore_sound = "Squish2"
	B.release_sound = "Pred Escape"
	B.contamination_color = "purple"
	B.contamination_flavor = "Wet"
//Why is it we have all these customizeable belly options which nobody ever alters for mobs?

	B.emote_lists[DM_HOLD] = list(
		"Slick fluid trickles over you, carrying threads of sweetness.",
		"Everything is still, dark, and quiet. Your breaths echo quietly.",
		"The surrounding air feels thick and humid.")

	B.emote_lists[DM_DIGEST] = list(
		"The slimy puddle stings faintly. It seems the plant has no need to quickly break down victims.",
		"The humid air settles in your lungs, keeping each breath more labored than the last.",
		"Fluid drips onto you, burning faintly as your body heat warms it."
		)

	B.emote_lists[DM_DRAIN] = list(
		"Each bead of slick fluid running down your body leaves you feeling weaker.",
		"It's cramped and dark, the air thick and heavy. Your limbs feel like lead.",
		"Strength drains from your frame. The cramped chamber feels easier to settle into with each passing moment.")

//Preadtory Things
/obj/structure/mob_spawner/beetle_hill
	name = "beetle tunnel"
	desc = "An entrance to the nest of metallic ants."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "hole"
	anchored = TRUE

	spawn_delay = 10 MINUTES

	spawn_types = list(
	/mob/living/simple_mob/animal/tyr/electronic_beetle = 1,
	/mob/living/simple_mob/animal/tyr/explode_beetle = 1,
	)

	simultaneous_spawns = 2

	destructible = 1
	health = 50

/mob/living/simple_mob/animal/tyr/electronic_beetle
	name = "charged beetle"
	desc = "A large insect."
	icon_state = "lighting_beetle"
	icon_dead = "beetle_dead"
	maxHealth = 40
	health = 40
	pass_flags = PASSTABLE //flying bug
	movement_cooldown = 1

	meat_type = /obj/item/reagent_containers/food/snacks/meat/grubmeat
	meat_amount = 2

	butchery_loot = list(\
		/obj/item/stack/material/chitin = 1\
		)

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive

	see_in_dark = 3
	melee_damage_lower = 12 //Kills you 8ish if unarmored, or 10ish if wearing the tribal armor
	melee_damage_upper = 12 //Rng numbers are wierd

/mob/living/simple_mob/animal/tyr/electronic_beetle/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		A.emp_act(4) //The weakest strength of EMP
		playsound(src, 'sound/weapons/Egloves.ogg', 75, 1)
		L.Weaken(4)
		L.Stun(4)
		L.stuttering = max(L.stuttering, 4)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(5, 1, L)
		s.start()


/mob/living/simple_mob/animal/tyr/explode_beetle
	name = "fiery beetle"
	desc = "A large insect."
	icon_state = "fire_beetle"
	icon_dead = "beetle_dead"
	maxHealth = 40
	health = 40
	pass_flags = PASSTABLE //flying bug
	movement_cooldown = 1

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive

	meat_type = /obj/item/reagent_containers/food/snacks/carpmeat
	meat_amount = 2

	butchery_loot = list(\
		/obj/item/stack/material/chitin = 1\
		)

	see_in_dark = 3
	melee_damage_lower = 6 //Kills you 8ish if unarmored, or 10ish if wearing the tribal armor
	melee_damage_upper = 6 //Rng numbers are wierd

/mob/living/simple_mob/animal/tyr/explode_beetle/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/fire, 3 SECONDS)
