/obj/item/gun/projectile/revolvershotgun
	name = "Jackhammer"
	desc = "Uses 12g rounds."
	icon = 'icons/obj/gun_yw.dmi'
	icon_state = "revolvshot"
	item_state = null
	w_class = ITEMSIZE_HUGE //CHOMP Edit.
	force = 10
	caliber = "12g"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 4, TECH_ILLEGAL = 2)
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER
	handle_casings = EJECT_CASINGS
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m12gdrumjack/beanbag
	allowed_magazines = list(/obj/item/ammo_magazine/m12gdrumjack)
	projectile_type = /obj/item/projectile/bullet/shotgun

/obj/item/gun/projectile/revolvershotgun/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "revolvshot"
	else
		icon_state = "revolvshot-empty"
	return


/obj/item/ammo_magazine/m12gdrumjack
	name = "drum magazine (12 gauge slug)"
	desc = "A magazine for a revolver shotgun."
	icon = 'icons/obj/ammo_yw.dmi'
	icon_state = "c12g"
	mag_type = MAGAZINE
	caliber = "12g"
	matter = list(DEFAULT_WALL_MATERIAL = 1300) //did the math. now fixed the exploityness of this thing. Have fun!
	ammo_type = /obj/item/ammo_casing/a12g
	max_ammo = 4
	multiple_sprites = 1

/obj/item/ammo_magazine/m12gdrumjack/beanbag
	name = "drum magazine (12 gauge beanbag)"
	ammo_type = /obj/item/ammo_casing/a12g/beanbag

/obj/item/ammo_magazine/m12gdrumjack/pellet
	name = "drum magazine (12 gauge pellet)"
	ammo_type = /obj/item/ammo_casing/a12g/pellet

/obj/item/ammo_magazine/m12gdrumjack/flash
	name = "drum magazine (12 gauge flash)"
	ammo_type = /obj/item/ammo_casing/a12g/flash

/obj/item/ammo_magazine/m12gdrumjack/empty
	name = "drum magazine (12 gauge)"
	initial_ammo = 0
	matter = list(DEFAULT_WALL_MATERIAL = 1625) //Why these cost so much ? the normal ones have 13000 matter so i just multiplied by 1.25(default) don't know why it costs so much

//scattering shots, old buckshot
/obj/item/ammo_casing/a12g/scatter
	name = "scatter shotgun shell"
	desc = "A 12 gauge scattering shell"
	icon = 'icons/obj/ammo_yw.dmi'
	icon_state = "scattershell"
	projectile_type = /obj/item/projectile/scatter/shotgun
	matter = list(DEFAULT_WALL_MATERIAL = 450)

/obj/item/projectile/scatter/shotgun
	name = "shotgun scatter projectile"
	spread_submunition_damage = FALSE
	submunition_spread_max = 100
	submunition_spread_min = 90
	submunitions = list(
		/obj/item/projectile/bullet/shotgun/scatterprojectile = 6
		)

/obj/item/projectile/bullet/shotgun/scatterprojectile
	name = "pellet"
	icon_state = "bullet"
	fire_sound = 'sound/weapons/Gunshot_shotgun.ogg'
	damage = 13

/obj/item/storage/box/scattershot
	name = "box of shotgun scatter shells"
	desc = "It has a picture of a shell and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death. High spread factor, just shoot and pray."
	icon = 'icons/obj/ammo_yw.dmi'
	icon_state = "scattershot_box"
	item_state_slots = list(slot_r_hand_str = "syringe_kit", slot_l_hand_str = "syringe_kit")
	starts_with = list(/obj/item/ammo_casing/a12g/scatter = 8)

/obj/item/storage/box/scattershot/large
	starts_with = list(/obj/item/ammo_casing/a12g/scatter = 16)