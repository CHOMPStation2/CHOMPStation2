#define GRAINS_PER_KG 15432.4

/obj/item/projectile/bullet
	var/diam = 9	//mm
	var/velocity = 500	//Meters per second
	var/hollow_point = FALSE
	var/grains = 115	//I hope the unit is obvious
	var/energy	//Joules

/obj/item/projectile/bullet/launch_projectile(atom/target, target_zone, mob/user, params, angle_override, forced_spread = 0)
	energy = 0.5 * velocity * velocity * (grains / GRAINS_PER_KG)
	return ..()

/obj/item/projectile/bullet/proc/sub_velocity(var/amount)
	velocity = max(0,velocity - amount)
	energy = 0.5 * velocity * velocity * (grains / GRAINS_PER_KG)

/obj/item/projectile/bullet/proc/sub_energy(var/amount)
	energy = max(0,energy - amount)
	velocity = sqrt(2*energy/(grains / GRAINS_PER_KG))

/obj/item/projectile/bullet/rifle/a762
	diam = 7.62
	velocity = 700
	grains = 123