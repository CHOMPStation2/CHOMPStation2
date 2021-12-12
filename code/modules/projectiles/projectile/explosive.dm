

/obj/item/projectile/bullet/srmrocket
	name ="SRM-8 Rocket"
	desc = "Boom"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "missile"
	damage = 100
	armor_penetration = 60
	stun = 3 // Explosion effect does not seem to stun the targets. Added, followed by suggestion.
	weaken = 2
	does_spin = 0

/obj/item/projectile/bullet/srmrocket/on_hit(atom/target, blocked=0)
	if(!isliving(target)) //if the target isn't alive, so is a wall or something
		explosion(target, 0, 2, 4)
	else
		explosion(target, 1, 2, 4)

	return 1

/obj/item/projectile/bullet/srmrocket/throw_impact(atom/target, var/speed)
	if(!isliving(target)) //if the target isn't alive, so is a wall or something
		explosion(target, 1, 2, 4)
	else
		explosion(target, 2, 2, 4)
	qdel(src)

/obj/item/projectile/bullet/srmrocket/weak	//Used in the jury rigged one.
	damage = 45
	armor_penetration = 30
	stun = 2 // Explosion effect does not seem to stun the targets. Added, followed by suggestion.
	weaken = 1

/obj/item/projectile/bullet/srmrocket/weak/on_hit(atom/target, blocked=0)
	explosion(target, 2, 4)
	return 1

/obj/item/projectile/bullet/srmrocket/weak/throw_impact(atom/target, var/speed)
	explosion(target, 2, 4)
	qdel(src)

/*Old vars here for reference.
	var/devastation = 0
	var/heavy_blast = 1
	var/light_blast = 2
	var/flash_blast = 4
*/
