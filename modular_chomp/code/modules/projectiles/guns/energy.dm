//I think most of the energy weapons are security but I regonize a few of this from the aliens and drones.
//Combat refactor walkback, damage values will be reverted but bonuses and AP will stay, idk if this will affect balance
/obj/item/projectile/energy/excavate
	//damage = 20
	armor_penetration = 60

/obj/item/projectile/energy/excavate/weak
	//damage = 10
	excavation_amount = 100

/obj/item/projectile/energy/acid
	//damage = 15

/obj/item/projectile/energy/neurotoxin/toxic
	damage = 10
//
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
	//damage = 30
	armor_penetration = 15

/obj/item/projectile/energy/phase
	//damage = 5
	SA_bonus_damage = 15
	armor_penetration = 0
	SA_vulnerability = list(SA_ANIMAL, MOB_CLASS_SYNTHETIC, MOB_CLASS_ABERRATION)

/obj/item/projectile/energy/phase/light
	SA_bonus_damage = 5
	armor_penetration = 0

/obj/item/projectile/energy/phase/heavy
	//damage = 5
	SA_bonus_damage = 20
	armor_penetration = 0

/obj/item/projectile/energy/phase/heavy/cannon
	//damage = 5
	SA_bonus_damage = 35
	armor_penetration = 0
