/obj/mecha/combat/hades
	name = "The Hades Prototype"
	desc = "An exosuit which you aren't sure you understand despite building"
	icon = 'modular_chomp/icons/mecha/mechas.dmi'
	icon_state = "hades" //to change
	initial_icon = "hades_broken"
	step_in = 1
	dir_in = 1 //Facing North.
	step_energy_drain = 15
	health = 400
	maxhealth = 400
	deflect_chance = 30
	max_temperature = 20000 //A ship meant to travel the void
	infra_luminosity = 3
	wreckage = /obj/effect/decal/mecha_wreckage/hades
	internal_damage_threshold = 40
	force = 10
	max_hull_equip = 4
	max_weapon_equip = 1
	max_utility_equip = 4
	max_universal_equip = 5
	max_special_equip = 4
	cloak_possible = TRUE
	//to add, the breaching abilitiy


/obj/effect/decal/mecha_wreckage/hades
	name = "Hades Wreckage"
	icon = 'modular_chomp/icons/mecha/mechas.dmi'
	icon_state = "hades_broken" //to change
