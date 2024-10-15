// Projectile.
/obj/item/projectile/simple_bullet
	name = "Simple bullet!"
	desc = "You shouldn't be able to read this!"
	var/ammo_flags = 0

/obj/item/projectile/simple_bullet/launch_from_gun(atom/target, target_zone, mob/user, params, angle_override, forced_spread, obj/item/gun/launcher)
	//We aren't actually going to launch! We're just a convenient placeholder. Spawn whatever projectile type the gun uses!
	var/obj/item/projectile/projectile_type_real = launcher.projectile_type
	var/damage = projectile_type_real::damage
	if(ammo_flags & AMMO_FLAG_FLASH)
		projectile_type_real = /obj/item/projectile/energy/flash
		if(damage >= /obj/item/projectile/bullet/a357::damage) //Dynamic for if damage values change around. A .357 or anything stronger would produce a strong flash.
			projectile_type_real = /obj/item/projectile/energy/flash/strong
		var/obj/item/projectile/P = new projectile_type_real(src.loc)
		qdel(src)
		return P.launch_from_gun(target, target_zone, user, params, angle_override, forced_spread, launcher)
	if(ammo_flags & AMMO_FLAG_AP)
		var/obj/item/projectile/P = new projectile_type_real(src.loc)
		P.damage = round(P.damage * AMMO_AP_DAMAGE_MULT) //damage reduction so AP isn't flat out better than normal

		var/new_armor_piercing = AMMO_ARMORPEN_SMALL
		if(ammo_flags & AMMO_FLAG_MEDIUM)
			new_armor_piercing = AMMO_ARMORPEN_MEDIUM
		if(ammo_flags & AMMO_FLAG_LARGE)
			new_armor_piercing = AMMO_ARMORPEN_LARGE

		P.armor_penetration = new_armor_piercing
		qdel(src)
		return P.launch_from_gun(target, target_zone, user, params, angle_override, forced_spread, launcher)
	if(ammo_flags & AMMO_FLAG_HP)
		var/obj/item/projectile/P = new projectile_type_real(src.loc)
		P.damage = round(P.damage * AMMO_HP_DAMAGE_MULT) //damage increase for HP
		P.armor_penetration = AMMO_HP_ARMORPEN
		qdel(src)
		return P.launch_from_gun(target, target_zone, user, params, angle_override, forced_spread, launcher)
	if(ammo_flags & AMMO_FLAG_RUBBER)
		var/obj/item/projectile/P = new projectile_type_real(src.loc)
		P.agony = round(P.damage * AMMO_RUBBER_AGONY_MULT) //In exchange for agony proportional to damage
		P.damage = round(P.damage * AMMO_RUBBER_DAMAGE_MULT) //Severely reduced damage
		P.sharp = FALSE //Rubber shot shouldnt bleed you
		qdel(src)
		return P.launch_from_gun(target, target_zone, user, params, angle_override, forced_spread, launcher)
	if(ammo_flags & AMMO_FLAG_HUNTER)
		var/obj/item/projectile/P = new projectile_type_real(src.loc)
		P.SA_bonus_damage = round(P.damage * AMMO_HUNTER_SA_DAMAGE_MULT) //In exchange for SA damage
		P.damage = round(P.damage * AMMO_HUNTER_DAMAGE_MULT) //Severely reduced damage
		qdel(src)
		return P.launch_from_gun(target, target_zone, user, params, angle_override, forced_spread, launcher)
	if(ammo_flags & AMMO_FLAG_EMP) //Apparently EMP pistol rounds are a fucking thing. Cool.
		projectile_type_real = /obj/item/projectile/ion/small
		var/obj/item/projectile/P = new projectile_type_real(src.loc)
		qdel(src)
		return P.launch_from_gun(target, target_zone, user, params, angle_override, forced_spread, launcher)
	//If we're still going, there's no special flags to apply, so just launch the correct projectile and qdel us
	var/obj/item/projectile/P = new projectile_type_real(src.loc)
	qdel(src)
	return P.launch_from_gun(target, target_zone, user, params, angle_override, forced_spread, launcher)

//Casings
/obj/item/ammo_casing/simple
	projectile_type = /obj/item/projectile/simple_bullet
	var/ammo_flags = 0

/obj/item/ammo_casing/simple/New()
	..()
	var/obj/item/projectile/simple_bullet/P = BB
	if(istype(P))
		P.ammo_flags = ammo_flags

/obj/item/ammo_casing/simple/small
	desc = "A small bullet casing, probably fit for a pistol or SMG"
	caliber = "small"
	matter = list(MAT_STEEL = 75)

/obj/item/ammo_casing/simple/medium
	desc = "A medium bullet casing, probably fit for a rifle"
	caliber = "medium"
	icon_state = "rifle-casing"
	matter = list(MAT_STEEL = 180)
	ammo_flags = AMMO_FLAG_MEDIUM

/obj/item/ammo_casing/simple/large
	desc = "A large bullet casing, probably fit for a sniper."
	icon_state = "lcasing"
	caliber = "large"
	matter = list(MAT_STEEL = 800)
	ammo_flags = AMMO_FLAG_LARGE

//Casings with modifiers
/obj/item/ammo_casing/simple/small/flash
	ammo_flags = AMMO_FLAG_FLASH

/obj/item/ammo_casing/simple/small/rubber
	ammo_flags = AMMO_FLAG_RUBBER

/obj/item/ammo_casing/simple/small/ap
	ammo_flags = AMMO_FLAG_AP

/obj/item/ammo_casing/simple/small/hp
	ammo_flags = AMMO_FLAG_HP

/obj/item/ammo_casing/simple/small/practice
	ammo_flags = AMMO_FLAG_PRACTICE

/obj/item/ammo_casing/simple/small/emp
	ammo_flags = AMMO_FLAG_EMP

/obj/item/ammo_casing/simple/medium/rubber
	ammo_flags = AMMO_FLAG_RUBBER | AMMO_FLAG_MEDIUM

/obj/item/ammo_casing/simple/medium/ap
	ammo_flags = AMMO_FLAG_AP | AMMO_FLAG_MEDIUM

/obj/item/ammo_casing/simple/medium/hp
	ammo_flags = AMMO_FLAG_HP | AMMO_FLAG_MEDIUM

/obj/item/ammo_casing/simple/medium/practice
	ammo_flags = AMMO_FLAG_PRACTICE | AMMO_FLAG_MEDIUM

/obj/item/ammo_casing/simple/medium/hunter
	ammo_flags = AMMO_FLAG_HUNTER | AMMO_FLAG_MEDIUM

/obj/item/ammo_casing/simple/large/ap
	ammo_flags = AMMO_FLAG_AP | AMMO_FLAG_LARGE

/obj/item/ammo_casing/simple/large/hp
	ammo_flags = AMMO_FLAG_HP | AMMO_FLAG_LARGE

/obj/item/ammo_casing/simple/large/practice
	ammo_flags = AMMO_FLAG_PRACTICE | AMMO_FLAG_LARGE
