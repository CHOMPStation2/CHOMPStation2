/obj/item/weapon/gun/projectile/pistol/mouse
	name = "Maus pistole"
	desc = "The Squeak Arms Mauser Whisper. A compact, easily concealable gun, though it's only compatible with compact Mausmagazines. Uses 9mm rounds."
	icon_state = "pistol"
	item_state = null
	w_class = ITEMSIZE_SMALL
	caliber = "9mm"
	silenced = 1
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ILLEGAL = 2,TECH_BLUESPACE = 2)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m9mm/compact/mouse
	allowed_magazines = list(/obj/item/ammo_magazine/m9mm/compact/mouse)
	projectile_type = /obj/item/projectile/bullet/pistol/mouse
  
/obj/item/projectile/bullet/pistol/mouse // Yes
	fire_sound = 'sound/effects/mouse_squeak.ogg'
	damage = 1

/obj/item/projectile/bullet/pistol/mouse/on_hit(var/mob/living/carbon/human/target)
	new /obj/random/mob/mouse(target.loc)

/obj/item/ammo_magazine/m9mm/compact
	name = "compact mausgazine (1mouse)"
	icon_state = "9x19p"
	origin_tech = list(TECH_COMBAT = 2,TECH_BLUESPACE = 1)
	mag_type = MAGAZINE
	matter = list(DEFAULT_WALL_MATERIAL = 480)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/a9mm
	max_ammo = 8
	multiple_sprites = 1
