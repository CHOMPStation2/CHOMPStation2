/decl/hierarchy/outfit/pirate
	hierarchy_type = /decl/hierarchy/outfit/pirate
	name = "Pirate"
	uniform = /obj/item/clothing/under/pirate
	shoes = /obj/item/clothing/shoes/brown
	head = /obj/item/clothing/head/bandana
	glasses = /obj/item/clothing/glasses/eyepatch
	l_hand = /obj/item/melee/energy/sword/pirate // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/pirate/norm

/decl/hierarchy/outfit/pirate/space
	name = "Pirate - Space"
	head = /obj/item/clothing/head/helmet/space
	suit = /obj/item/clothing/suit/pirate
	back = /obj/item/tank/jetpack/oxygen // CHOMPEdit - Removal of obj/item/weapon
	flags = OUTFIT_HAS_JETPACK

//CHOMPAdd
/decl/hierarchy/outfit/pirate/vox
	name = "Vox Raider"
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/armor/vox_scrap
	shoes = /obj/item/clothing/shoes/magboots/vox
	gloves = /obj/item/clothing/gloves/light_brown
	mask = /obj/item/clothing/mask/breath
	back = /obj/item/tank/vox // CHOMPEdit - Removal of obj/item/weapon
	l_hand = /obj/item/melee/energy/sword/pirate // CHOMPEdit - Removal of obj/item/weapon
	r_hand = /obj/item/gun/projectile/shotgun/pump/rifle/vox_hunting // CHOMPEdit - Removal of obj/item/weapon
	l_pocket = /obj/item/ammo_magazine/clip/c762
	r_pocket = /obj/item/ammo_magazine/clip/c762

	var/faction = "voxpirate"