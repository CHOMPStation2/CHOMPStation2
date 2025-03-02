// The sprites in this file were completely missing for all the actual clothes. They are NOT in the icon file they should be.
// The only sprite is the actual rig module in rig_modules_ch.dmi. The others don't have any boots/chest/hands/helm sprites.
// If the sprites are properly found somewhere, please add them to their appropraite files and reenable this file.
/obj/item/rig/ch/tyrprecursor
	name = "alien hardsuit control module"
	desc = "A orange hardsuit gleaming with energy and alien metals."
	suit_type = "tyrprecursor hardsuit"
	icon = 'modular_chomp/icons/obj/rig_modules_ch.dmi'
	icon_state = "tyrprecursor_rig"
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 90, bio = 100, rad = 10)
	slowdown = 0

	chest_type = /obj/item/clothing/suit/space/rig/ch/tyrprecursor
	helm_type = /obj/item/clothing/head/helmet/space/rig/ch/precursor
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/ch/precursor
	boot_type = /obj/item/clothing/shoes/magboots/rig/ch/precursor

	req_access = list()
	req_one_access = list()

/obj/item/clothing/suit/space/rig/ch/tyrprecursor
	name = "protective vest"
	icon = 'icons/obj/clothing/spacesuits_ch.dmi'
	icon_state = "tyrprecursor_rig"
	desc = "Light weight but oddly protective plating."
	var/shieldhealth = 75
	var/cooldown = null // world.time of when this was last triggered.
	var/cooldown_duration = 2 MINUTES

/obj/item/clothing/suit/space/rig/ch/tyrprecursor/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(shieldhealth < 75)
		user.visible_message(span_danger("\The [src] completely absorbs [attack_text]!"))
		shieldhealth -= damage
		cooldown = world.time + cooldown_duration
		return TRUE
	return FALSE

/obj/item/clothing/suit/space/rig/ch/tyrprecursor/proc/activate_ability(var/mob/living/wearer)
	cooldown = world.time + cooldown_duration
	shieldhealth = 75

/obj/item/clothing/suit/space/rig/ch/tyrprecursor/equipped(var/mob/living/carbon/human/H)
	..()
	if(istype(H) && H.head == src && H.is_sentient())
		START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/space/rig/ch/tyrprecursor/dropped(var/mob/living/carbon/human/H)
	..()
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/suit/space/rig/ch/tyrprecursor/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/space/rig/ch/tyrprecursor/process()
	if(isliving(loc))
		var/mob/living/L = loc
		if(world.time >= cooldown && L.is_sentient() && shieldhealth < 1)
			activate_ability(L)

/obj/item/clothing/head/helmet/space/rig/ch/tyrprecursor
	name = "helmet"
	icon = 'icons/obj/clothing/hats_ch.dmi'
	icon_state = "tyrprecursor_rig"
	desc = "A protective dome for your head."

	var/shieldhealth = 75
	var/cooldown = null // world.time of when this was last triggered.
	var/cooldown_duration = 2 MINUTES

/obj/item/clothing/head/helmet/space/rig/ch/tyrprecursor/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(shieldhealth < 75)
		user.visible_message(span_danger("\The [src] completely absorbs [attack_text]!"))
		shieldhealth -= damage
		cooldown = world.time + cooldown_duration
		return TRUE
	return FALSE

/obj/item/clothing/head/helmet/space/rig/ch/tyrprecursor/proc/activate_ability(var/mob/living/wearer)
	cooldown = world.time + cooldown_duration
	shieldhealth = 75

/obj/item/clothing/head/helmet/space/rig/ch/tyrprecursor/equipped(var/mob/living/carbon/human/H)
	..()
	if(istype(H) && H.head == src && H.is_sentient())
		START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/space/rig/ch/tyrprecursor/dropped(var/mob/living/carbon/human/H)
	..()
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/space/rig/ch/tyrprecursor/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/head/helmet/space/rig/ch/tyrprecursor/process()
	if(isliving(loc))
		var/mob/living/L = loc
		if(world.time >= cooldown && L.is_sentient() && shieldhealth < 1)
			activate_ability(L)

/obj/item/clothing/gloves/gauntlets/rig/ch/tyrprecursor
	name = "gloves"
	icon = 'icons/obj/clothing/gloves_ch.dmi'
	icon_state = "tyrprecursor_rig"
	desc = "Gloves created with alien tech"
	var/shieldhealth = 75
	var/cooldown = null // world.time of when this was last triggered.
	var/cooldown_duration = 2 MINUTES

/obj/item/clothing/gloves/gauntlets/rig/ch/tyrprecursor/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(shieldhealth < 75)
		user.visible_message(span_danger("\The [src] completely absorbs [attack_text]!"))
		shieldhealth -= damage
		cooldown = world.time + cooldown_duration
		return TRUE
	return FALSE

/obj/item/clothing/gloves/gauntlets/rig/ch/tyrprecursor/proc/activate_ability(var/mob/living/wearer)
	cooldown = world.time + cooldown_duration
	shieldhealth = 75

/obj/item/clothing/gloves/gauntlets/rig/ch/tyrprecursor/equipped(var/mob/living/carbon/human/H)
	..()
	if(istype(H) && H.head == src && H.is_sentient())
		START_PROCESSING(SSobj, src)

/obj/item/clothing/gloves/gauntlets/rig/ch/tyrprecursor/dropped(var/mob/living/carbon/human/H)
	..()
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/gloves/gauntlets/rig/ch/tyrprecursor/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/gloves/gauntlets/rig/ch/tyrprecursor/process()
	if(isliving(loc))
		var/mob/living/L = loc
		if(world.time >= cooldown && L.is_sentient() && shieldhealth < 1)
			activate_ability(L)

/obj/item/clothing/shoes/magboots/rig/ch/tyrprecursor
	name = "boots"
	icon = 'icons/obj/clothing/shoes_ch.dmi'
	icon_state = "tyrprecursor_rig"
	desc = "A pair of grabby boots"
	var/shieldhealth = 75
	var/cooldown = null // world.time of when this was last triggered.
	var/cooldown_duration = 2 MINUTES

/obj/item/clothing/shoes/magboots/rig/ch/tyrprecursor/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(shieldhealth < 75)
		user.visible_message(span_danger("\The [src] completely absorbs [attack_text]!"))
		shieldhealth -= damage
		cooldown = world.time + cooldown_duration
		return TRUE
	return FALSE

/obj/item/clothing/shoes/magboots/rig/ch/tyrprecursor/proc/activate_ability(var/mob/living/wearer)
	cooldown = world.time + cooldown_duration
	shieldhealth = 75

/obj/item/clothing/shoes/magboots/rig/ch/tyrprecursor/equipped(var/mob/living/carbon/human/H)
	..()
	if(istype(H) && H.head == src && H.is_sentient())
		START_PROCESSING(SSobj, src)

/obj/item/clothing/shoes/magboots/rig/ch/tyrprecursor/dropped(var/mob/living/carbon/human/H)
	..()
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/shoes/magboots/rig/ch/tyrprecursor/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/shoes/magboots/rig/ch/tyrprecursor/process()
	if(isliving(loc))
		var/mob/living/L = loc
		if(world.time >= cooldown && L.is_sentient() && shieldhealth < 1)
			activate_ability(L)
