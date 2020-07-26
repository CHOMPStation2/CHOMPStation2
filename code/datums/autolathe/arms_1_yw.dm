/datum/design/item/autolathe/arms/shotgun_scatter
	name = "ammunition (12g, scatter)"
	id = "shotgun_scatter"
	build_path = /obj/item/ammo_casing/a12g/scatter
	materials = list(DEFAULT_WALL_MATERIAL = 450)
	hidden = 1

/datum/design/item/autolathe/arms/shotgun_clip_scatter
	name = "2-round 12g speedloader (scatter)"
	id = "shotgun_speedloader_scatter"
	build_path = /obj/item/ammo_magazine/clip/c12g/scatter
	materials = list(DEFAULT_WALL_MATERIAL = 1337)
	hidden = 1

/datum/design/item/autolathe/arms/shotgun_drum_empty
	name = "shotgun 12g drum magazine (Empty)"
	id = "shotgun_empty_drum_magazine"
	build_path = /obj/item/ammo_magazine/m12gdrumjack/empty
	materials = list(DEFAULT_WALL_MATERIAL = 1625) //Why these cost so much ? the normal ones have 13000 matter so i just multiplied by 1.25(default) don't know why it costs so much

//printable boxes of shotgun ammo, by KK
//the prices are rounded up to the cost of nine shells, but compared to printing a bunch of speedloaders you get a small discount. honestly the speedloaders are overpriced (the metal frame is somehow more expensive than a third shell!) but take it up with polaris.
/datum/design/item/autolathe/arms/ammobox/shotgun_box_beanbag
	name = "8-round 12g ammo box (beanbag)"
	id = "shotgun_ammobox_beanbag"
	build_path = /obj/item/weapon/storage/box/beanbags
	materials = list(DEFAULT_WALL_MATERIAL = 2025)
	hidden = 1

/datum/design/item/autolathe/arms/ammobox/shotgun_box_slugs
	name = "8-round 12g ammo box (slug)"
	id = "shotgun_ammobox_slug"
	build_path = /obj/item/weapon/storage/box/shotgunammo
	materials = list(DEFAULT_WALL_MATERIAL = 4050)
	hidden = 1

/datum/design/item/autolathe/arms/ammobox/shotgun_box_pellet
	name = "8-round 12g ammo box (pellet)"
	id = "shotgun_ammobox_pellet"
	build_path = /obj/item/weapon/storage/box/shotgunshells
	materials = list(DEFAULT_WALL_MATERIAL = 4050)
	hidden = 1

/datum/design/item/autolathe/arms/ammobox/shotgun_box_scatter
	name = "8-round 12g ammo box (scatter)"
	id = "shotgun_ammobox_scatter"
	build_path = /obj/item/weapon/storage/box/scattershot
	materials = list(DEFAULT_WALL_MATERIAL = 4050)
	hidden = 1

//commented out, pending review, maybe 16rnd boxes should be cargo only?
/*
/datum/design/item/autolathe/arms/ammobox/shotgun_box_beanbag_large
	name = "16-round 12g ammo box (beanbag)"
	id = "shotgun_ammobox_beanbag_large"
	build_path = /obj/item/weapon/storage/box/beanbags/large
	materials = list(DEFAULT_WALL_MATERIAL = 4050)
	hidden = 1

/datum/design/item/autolathe/arms/ammobox/shotgun_box_slugs_large
	name = "16-round 12g ammo box (slug)"
	id = "shotgun_ammobox_slug_large"
	build_path = /obj/item/weapon/storage/box/shotgunammo/large
	materials = list(DEFAULT_WALL_MATERIAL = 8100)
	hidden = 1

/datum/design/item/autolathe/arms/ammobox/shotgun_box_pellet_large
	name = "16-round 12g ammo box (pellet)"
	id = "shotgun_ammobox_pellet_large"
	build_path = /obj/item/weapon/storage/box/shotgunshells/large
	materials = list(DEFAULT_WALL_MATERIAL = 8100)
	hidden = 1

/datum/design/item/autolathe/arms/ammobox/shotgun_box_scatter_large
	name = "16-round 12g ammo box (scatter)"
	id = "shotgun_ammobox_scatter_large"
	build_path = /obj/item/weapon/storage/box/scattershot/large
	materials = list(DEFAULT_WALL_MATERIAL = 8100)
	hidden = 1
*/