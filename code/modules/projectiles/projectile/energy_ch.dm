/obj/item/projectile/energy/phase/bolt
	range = 4
	SA_bonus_damage = 15	// 30 total on animals
	icon_state = "cbbolt"
	hud_state = "taser"

/obj/item/projectile/energy/phase/bolt/heavy
	range = 4
	SA_bonus_damage = 25	// 20 total on animals
	hud_state = "taser"

/obj/item/projectile/energy/plasma/vepr
	name = "plasma bolt"
	icon = 'icons/obj/projectiles_ch.dmi'
	icon_state = "vepr"
	fire_sound = 'sound/weapons/serdy/vepr.ogg'
	damage = 30
	armor_penetration = 10
	damage_type = BURN
	check_armour = "energy"
	muzzle_type = /obj/effect/projectile/muzzle/vepr
	impact_effect_type = /obj/effect/temp_visual/impact_effect
	hitsound_wall = 'sound/weapons/effects/searwall.ogg'
	hitsound = 'sound/weapons/sear.ogg'
	hud_state = "laser_overcharge"

/obj/item/projectile/energy/phase
	name = "phase wave"
	icon_state = "phase"
	fire_sound = 'sound/weapons/phase_new/phasecarbine.ogg' //CHOMPedit - New sounds.
	range = 13
	damage = 5
	SA_bonus_damage = 45
	armor_penetration = -35
	SA_vulnerability = list(SA_ANIMAL, MOB_CLASS_SYNTHETIC, MOB_CLASS_ABERRATION, MOB_CLASS_HUMANOID) //CHOMP Edit expand this list
	hud_state = "laser_heat"

/obj/item/projectile/energy/phase/light
	fire_sound = 'sound/weapons/phase_new/phasepistol.ogg' //CHOMPedit - New sounds.
	range = 11
	SA_bonus_damage = 35
	armor_penetration = -50
	hud_state = "laser_heat"

/obj/item/projectile/energy/phase/heavy
	fire_sound = 'sound/weapons/phase_new/phaserifle.ogg' //CHOMPedit - New sounds.
	range = 16 //Chompedit This range was not great
	damage = 10
	SA_bonus_damage = 50
	armor_penetration = -25
	hud_state = "laser_heat"

/obj/item/projectile/energy/phase/heavy/cannon
	fire_sound = 'sound/weapons/phase_new/phasecannon.ogg' //CHOMPedit - New sounds.
	range = 20 //Chompedit This range was mediocre, but not worth a cannon.
	damage = 15
	SA_bonus_damage = 60
	armor_penetration = -20
	hud_state = "laser_heat"
