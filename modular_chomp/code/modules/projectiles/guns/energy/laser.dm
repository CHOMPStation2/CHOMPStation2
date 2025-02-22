/obj/item/gun/energy/floragun
	charge_cost = 80

/*
//Combat refactor walk-back
/obj/item/gun/energy
	charge_cost = 80

/obj/item/gun/energy/laser
	firemodes = list(
		list(mode_name="normal", fire_delay=8, projectile_type=/obj/item/projectile/beam/midlaser, charge_cost = 80),
		list(mode_name="suppressive", fire_delay=5, projectile_type=/obj/item/projectile/beam/weaklaser, charge_cost = 20),
		)

/obj/item/gun/energy/lasercannon //This is me trying to make ammo worth while but the cannon...is a cannon.
	charge_cost = 300

/obj/item/gun/energy/lasercannon/mounted
	charge_cost = 300

/obj/item/gun/energy/xray
	charge_cost = 65

/obj/item/gun/energy/sniperrifle
	charge_cost = 120

/obj/item/gun/energy/mininglaser
	firemodes = list(
		list(mode_name="mining", fire_delay=8, projectile_type=/obj/item/projectile/beam/mininglaser, charge_cost = 65),
		list(mode_name="deter", fire_delay=5, projectile_type=/obj/item/projectile/beam/weaklaser, charge_cost = 25),
		)

/obj/item/gun/energy/laser/vepr
	firemodes = list(
		list(mode_name="normal", fire_delay=8, projectile_type=/obj/item/projectile/beam/midlaser, charge_cost = 80),
		list(mode_name="suppressive", fire_delay=5, projectile_type=/obj/item/projectile/beam/weaklaser, charge_cost = 20),
		list(mode_name="burst", burst=3, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.5), projectile_type=/obj/item/projectile/beam/burstlaser, charge_cost = 65),
		)

/obj/item/gun/energy/gun
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun/med, modifystate="egunstun", fire_sound='sound/weapons/Taser.ogg', charge_cost = 80),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam, modifystate="egunkill", fire_sound='sound/weapons/Laser.ogg', charge_cost = 160),
		)

/obj/item/gun/energy/gun/rifle
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="riflestun", fire_sound='sound/weapons/Taser.ogg', wielded_item_state="riflestun-wielded", charge_cost = 40),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam, modifystate="riflekill", fire_sound='sound/weapons/Laser.ogg', wielded_item_state="riflekill-wielded", charge_cost = 80),
		)

/obj/item/gun/energy/gun/burst //Halving since by 3 seems too much
	firemodes = list(
		list(mode_name="stun", burst=1, projectile_type=/obj/item/projectile/beam/stun/weak, modifystate="energystun", charge_cost = 50),
		list(mode_name="stun burst", burst=3, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.5), projectile_type=/obj/item/projectile/beam/stun/weak, modifystate="energystun"),
		list(mode_name="lethal", burst=1, projectile_type=/obj/item/projectile/beam/burstlaser, modifystate="energykill", charge_cost = 100),
		list(mode_name="lethal burst", burst=3, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.5), projectile_type=/obj/item/projectile/beam/burstlaser, modifystate="energykill"),
		)

/obj/item/gun/energy/gun/etommy //Halving this one
	firemodes = list(
		list(mode_name="lethal", burst=1, projectile_type=/obj/item/projectile/beam/burstlaser, charge_cost = 100),
		list(mode_name="lethal burst", burst=4, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.5), projectile_type=/obj/item/projectile/beam/burstlaser),
		)

/obj/item/gun/energy/gun/compact
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun/med, modifystate="PDWstun", fire_sound='sound/weapons/Taser.ogg', charge_cost = 80),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam, modifystate="PDWkill", fire_sound='sound/weapons/Laser.ogg', charge_cost = 160),
		)

/obj/item/gun/energy/gun/eluger
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="ep08stun", fire_sound='sound/weapons/Taser.ogg', charge_cost = 40),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam/eluger, modifystate="ep08kill", fire_sound='sound/weapons/Laser.ogg', charge_cost = 80),
		)

/obj/item/gun/energy/sf2000
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun/weak, modifystate="lasgunstun", fire_sound='sound/weapons/Taser.ogg', charge_cost = 80),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam, modifystate="lasgunkill", fire_sound='sound/weapons/Laser.ogg', charge_cost = 160),
		)


/obj/item/gun/energy/gun/burst/mg42 //I am unsure what this weapon is, and it seems cheap on paper but just putting it at 80 for unity
	firemodes = list(
		list(mode_name="single fire", burst=1, projectile_type=/obj/item/projectile/beam/burstlaser, modifystate="mg42-e", fire_sound='sound/weapons/Laser.ogg', charge_cost = 80),
		list(mode_name="burst fire", burst=3, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.5), projectile_type=/obj/item/projectile/beam/burstlaser, modifystate="mg42-e", fire_sound='sound/weapons/Laser.ogg'),
		list(mode_name="5 laser burst", burst=5, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0,0,0), dispersion=list(0.0, 0.2, 0.5, 0.5, 0.5), projectile_type=/obj/item/projectile/beam/burstlaser, modifystate="mg42-e", fire_sound='sound/weapons/Laser.ogg'),
		list(mode_name="15 laser burst, ye boi.", burst=15, fire_delay=null, move_delay=4, burst_accuracy=list(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), dispersion=list(0.0, 0.2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5), projectile_type=/obj/item/projectile/beam/burstlaser, modifystate="mg42-e", fire_sound='sound/weapons/Laser.ogg'),
		)

/obj/item/gun/energy/x01
	firemodes = list(
		list(mode_name="stun", fire_delay = 8, projectile_type= /obj/item/projectile/beam/stun, modifystate="x01stun", fire_sound='sound/weapons/Taser.ogg', charge_cost = 80),
		list(mode_name="laser", fire_delay = 8, projectile_type=/obj/item/projectile/beam, modifystate="x01laser", fire_sound='sound/weapons/Laser.ogg', charge_cost = 160),
		list(mode_name="gauss", fire_delay=15, projectile_type=/obj/item/projectile/energy/gauss, modifystate="x01gauss", fire_sound='sound/weapons/gauss_shoot.ogg', charge_cost = 120)
		)
*/
