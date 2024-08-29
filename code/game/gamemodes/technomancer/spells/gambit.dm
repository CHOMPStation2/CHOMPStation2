/datum/technomancer/spell/gambit
	name = "Gambit"
	desc = "This function causes you to receive a random function, including those which you haven't purchased."
//	enhancement_desc = "Makes results less random and more biased towards what the function thinks you need in your current situation."
	enhancement_desc = "Instead of a purely random spell, it will give you a \"random\" spell."
	spell_power_desc = "Makes certain rare functions possible to acquire via Gambit which cannot be obtained otherwise, if above 100%."
	ability_icon_state = "tech_gambit"
	cost = 50
	obj_path = /obj/item/spell/gambit // CHOMPEdit - Removal of obj/item/weapon
	category = UTILITY_SPELLS

/var/global/list/all_technomancer_gambit_spells = typesof(/obj/item/spell) - list( // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/spell, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/spell/gambit, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/spell/projectile, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/spell/aura, // CHOMPEdit - Removal of obj/item/weapon
//	/obj/item/spell/insert, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/spell/spawner, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/spell/summon, // CHOMPEdit - Removal of obj/item/weapon
	/obj/item/spell/modifier) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/spell/gambit // CHOMPEdit - Removal of obj/item/weapon
	name = "gambit"
	desc = "Do you feel lucky?"
	icon_state = "gambit"
	cast_methods = CAST_USE
	aspect = ASPECT_UNSTABLE
	var/list/rare_spells = list(
		/obj/item/spell/modifier/mend_all // CHOMPEdit - Removal of obj/item/weapon
	)


/obj/item/spell/gambit/on_use_cast(mob/living/carbon/human/user) // CHOMPEdit - Removal of obj/item/weapon
	if(pay_energy(200))
		adjust_instability(3)
		if(check_for_scepter())
			give_new_spell(biased_random_spell())
		else
			give_new_spell(random_spell())
		qdel(src)

/obj/item/spell/gambit/proc/give_new_spell(var/spell_type) // CHOMPEdit - Removal of obj/item/weapon
	owner.drop_from_inventory(src, null)
	owner.place_spell_in_hand(spell_type)

// Gives a random spell.
/obj/item/spell/gambit/proc/random_spell() // CHOMPEdit - Removal of obj/item/weapon
	var/list/potential_spells = all_technomancer_gambit_spells.Copy()
	var/rare_spell_chance = between(0, calculate_spell_power(100) - 100, 100) // Having 120% spellpower means a 20% chance to get to roll for rare spells.
	if(prob(rare_spell_chance))
		potential_spells += rare_spells.Copy()
		to_chat(owner, "<span class='notice'>You feel a bit luckier...</span>")
	return pick(potential_spells)

// Gives a "random" spell.
/obj/item/spell/gambit/proc/biased_random_spell() // CHOMPEdit - Removal of obj/item/weapon
	var/list/potential_spells = list()
	var/rare_spell_chance = between(0, calculate_spell_power(100) - 100, 100)
	var/give_rare_spells = FALSE
	if(prob(rare_spell_chance))
		give_rare_spells = TRUE
		to_chat(owner, "<span class='notice'>You feel a bit luckier...</span>")

	// First the spell will concern itself with the health of the technomancer.
	if(prob(owner.getBruteLoss() + owner.getBruteLoss() * 2)) // Having 20 brute means a 40% chance of being added to the pool.
		if(!owner.isSynthetic())
			potential_spells |= /obj/item/spell/modifier/mend_life // CHOMPEdit - Removal of obj/item/weapon
		else
			potential_spells |= /obj/item/spell/modifier/mend_synthetic // CHOMPEdit - Removal of obj/item/weapon
		if(give_rare_spells)
			potential_spells |= /obj/item/spell/modifier/mend_all // CHOMPEdit - Removal of obj/item/weapon

	// Second, the spell will try to prepare the technomancer for threats.
	var/hostile_mobs = 0 // Counts how many hostile mobs.  Higher numbers make it more likely for AoE spells to be chosen.

	for(var/mob/living/L in view(owner))
		// Spiders, carp... bears.
		if(istype(L, /mob/living/simple_mob))
			var/mob/living/simple_mob/SM = L
			if(!is_ally(SM) && SM.has_AI() && SM.ai_holder.hostile)
				hostile_mobs++
				if(SM.summoned || SM.supernatural) // Our creations might be trying to kill us.
					potential_spells |= /obj/item/spell/abjuration // CHOMPEdit - Removal of obj/item/weapon

		// Always assume borgs are hostile.
		if(istype(L, /mob/living/silicon/robot))
			if(!istype(L, /mob/living/silicon/robot/drone)) // Drones are okay, however.
				hostile_mobs++
				potential_spells |= /obj/item/spell/projectile/ionic_bolt // CHOMPEdit - Removal of obj/item/weapon

		// Finally we get to humanoids.
		if(istype(L, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = L
			if(is_ally(H)) // Don't get scared by our apprentice.
				continue

			for(var/obj/item/I in list(H.l_hand, H.r_hand))
				// Guns are scary.
				if(istype(I, /obj/item/gun)) // Toy guns will count as well but oh well. // CHOMPEdit - Removal of obj/item/weapon
					hostile_mobs++
					continue
				// Strong melee weapons are scary as well.
				else if(I.force >= 15)
					hostile_mobs++
					continue

	if(hostile_mobs)
		potential_spells |= /obj/item/spell/shield // CHOMPEdit - Removal of obj/item/weapon
		potential_spells |= /obj/item/spell/reflect // CHOMPEdit - Removal of obj/item/weapon
		potential_spells |= /obj/item/spell/targeting_matrix // CHOMPEdit - Removal of obj/item/weapon
		potential_spells |= /obj/item/spell/warp_strike // CHOMPEdit - Removal of obj/item/weapon

		if(hostile_mobs >= 3) // Lots of baddies, give them AoE.
			potential_spells |= /obj/item/spell/projectile/chain_lightning // CHOMPEdit - Removal of obj/item/weapon
			potential_spells |= /obj/item/spell/projectile/chain_lightning/lesser // CHOMPEdit - Removal of obj/item/weapon
			potential_spells |= /obj/item/spell/spawner/fire_blast // CHOMPEdit - Removal of obj/item/weapon
			potential_spells |= /obj/item/spell/condensation // CHOMPEdit - Removal of obj/item/weapon
			potential_spells |= /obj/item/spell/aura/frost // CHOMPEdit - Removal of obj/item/weapon
		else
			potential_spells |= /obj/item/spell/projectile/beam // CHOMPEdit - Removal of obj/item/weapon
			potential_spells |= /obj/item/spell/projectile/overload // CHOMPEdit - Removal of obj/item/weapon
			potential_spells |= /obj/item/spell/projectile/force_missile // CHOMPEdit - Removal of obj/item/weapon
			potential_spells |= /obj/item/spell/projectile/lightning // CHOMPEdit - Removal of obj/item/weapon

	// Third priority is recharging the core.
	if(core.energy / core.max_energy <= 0.5)
		potential_spells |= /obj/item/spell/energy_siphon // CHOMPEdit - Removal of obj/item/weapon
		potential_spells |= /obj/item/spell/instability_tap // CHOMPEdit - Removal of obj/item/weapon

	// Fallback method in case nothing gets added.
	if(!potential_spells.len)
		potential_spells = all_technomancer_gambit_spells.Copy()

	return pick(potential_spells)