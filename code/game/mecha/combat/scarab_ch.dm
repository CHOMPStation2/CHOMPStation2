//ChompEdit - Making use of unused assets.
/obj/mecha/combat/scarab
	desc = "A very speedy and cramped quadredped combat mech designed for recon operations."
	name = "Scarab"
	icon_state = "scarab_militia"
	initial_icon = "scarab_militia"
	step_in = 2 // Four legs means FAST AS FUCK BOI
	step_energy_drain = 5 //Half of normal step drain. Faster mech, more movement.
	opacity = 0
	health = 150
	maxhealth = 150
	deflect_chance = 10
	max_temperature = 20000
	infra_luminosity = 6

	wreckage = /obj/effect/decal/mecha_wreckage/scarab

	max_hull_equip = 1
	max_weapon_equip = 1
