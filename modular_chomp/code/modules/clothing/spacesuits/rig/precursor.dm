/obj/item/rig/ch/precursor
	name = "xenotech hardsuit control module"
	desc = "A purple hardsuit gleaming with energy and alien metals."
	suit_type = "precursor hardsuit"
	icon = 'modular_chomp/icons/obj/rig_modules_ch.dmi'
	icon_state = "precursor_rig"
	armor = list(melee = 50, bullet = 50, laser = 70, energy = 70, bomb = 60, bio = 100, rad = 80)
	matter = list(MAT_PLASTEEL = 1200, MAT_GOLD = 500, MAT_GRAPHITE = 800, MAT_OSMIUM = 300, MAT_PLASTIC = 600, MAT_VERDANTIUM = 750, MAT_MORPHIUM = 2000)
	var/block_chance = 15
	slowdown = 0

	chest_type = /obj/item/clothing/suit/space/rig/ch/precursor
	helm_type = /obj/item/clothing/head/helmet/space/rig/ch/precursor
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/ch/precursor
	boot_type = /obj/item/clothing/shoes/magboots/rig/ch/precursor

	req_access = list()
	req_one_access = list()

/obj/item/clothing/suit/space/rig/ch/precursor
	name = "protective vest"
	icon = 'icons/obj/clothing/spacesuits_ch.dmi'
	icon_state = "precursor_rig"
	desc = "Light weight but oddly protective plating."
	var/block_chance = 15

/obj/item/clothing/head/helmet/space/rig/ch/precursor
	name = "helmet"
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_state = "precursor_rig"
	desc = "A protective dome for your head."
	var/block_chance = 15

/obj/item/clothing/gloves/gauntlets/rig/ch/precursor
	name = "gloves"
	icon = 'icons/obj/clothing/gloves_ch.dmi'
	icon_state = "precursor_rig"
	desc = "Gloves created with alien tech"
	var/block_chance = 15

/obj/item/clothing/shoes/magboots/rig/ch/precursor
	name = "boots"
	icon = 'icons/obj/clothing/shoes_ch.dmi'
	icon_state = "precursor_rig"
	desc = "A pair of grabby boots"
	var/block_chance = 15

/obj/item/rig/ch/precursor/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(prob(block_chance))
		user.visible_message(span_danger("\The [src] completely absorbs [attack_text]!"))
		return TRUE
	return FALSE

/obj/item/clothing/suit/space/rig/ch/precursor/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(prob(block_chance))
		user.visible_message(span_danger("\The [src] completely absorbs [attack_text]!"))
		return TRUE
	return FALSE

/obj/item/clothing/head/helmet/space/rig/ch/precursor/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(prob(block_chance))
		user.visible_message(span_danger("\The [src] completely absorbs [attack_text]!"))
		return TRUE
	return FALSE

/obj/item/clothing/gloves/gauntlets/rig/ch/precursor/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(prob(block_chance))
		user.visible_message(span_danger("\The [src] completely absorbs [attack_text]!"))
		return TRUE
	return FALSE

/obj/item/clothing/shoes/magboots/rig/ch/precursor/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(prob(block_chance))
		user.visible_message(span_danger("\The [src] completely absorbs [attack_text]!"))
		return TRUE
	return FALSE
