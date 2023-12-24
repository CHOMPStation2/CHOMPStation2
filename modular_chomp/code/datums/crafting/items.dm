//Soo, this might be jank code and debatable if I should just make this a material but new item subtype thing. Pretty much more mob drops for makeshift
//crafting without spamming the material defines.

/obj/item/craftingmaterial
	name = "Null"
	desc = "Null."
	icon = 'modular_chomp/icons/obj/crafting.dmi'
	icon_state = "locator"
	w_class = ITEMSIZE_SMALL
	throw_speed = 4
	throw_range = 20
	origin_tech = list(TECH_MAGNET = 1)
	matter = list(MAT_STEEL = 400)

/obj/item/craftingmaterial/lifewisp
	name = "Firey Wisp"
	desc = "A strange wisp of ever burning harmless flame."
	icon_state = "wisp"

/obj/item/craftingmaterial/icescale
	name = "Frost Scale"
	desc = "A strange scale, at first glance appearing to be made of ice, but isn't melting."
	icon_state = "scale"
	color = "#0000CC"

/obj/item/craftingmaterial/crystalscale
	name = "Crystal Scale"
	desc = "A strange scale brimming with energy."
	icon_state = "scale"
	color = "#006633"

/obj/item/craftingmaterial/dreamscale
	name = "Dream Scale"
	desc = "A strange scale from a strange creature. Feels oddly soft."
	icon_state = "scale"

/obj/item/craftingmaterial/heftyshellchitin
	name = "Hefty Shell Chitin"
	desc = "The material of a shell"
	icon_state = "shell"

//Putting this here for now because in intial PRs, I enjoy making/altering as few files as possible.
//Solar ray stuff
/obj/item/clothing/suit/armor/firecloak
	name = "solar cloak"
	desc = "A strange cloak made from remnants of solar rays."
	icon = 'icons/inventory/accessory/item.dmi'
	icon_state = "seccloak"
	color = "#F13C00"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 40, bullet = 30, laser = 30, energy = 10, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/firecloak/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(istype(damage_source, /obj/item/projectile))
		return FALSE
	if(attacker && attacker != user)
		shoot_fire(attacker)
	else
		return FALSE

/obj/item/clothing/suit/armor/firecloak/proc/shoot_fire(mob/target)
	var/obj/item/projectile/P = new /obj/item/projectile/fire(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/obj/item/weapon/material/sword/rapier/solar
	name = "solar rapier"
	desc = "A slender, fancy and sharply pointed sword, wisps of fire swirling around it."
	icon_state = "rapier"
	item_state = "rapier"
	slot_flags = SLOT_BELT
	applies_material_colour = 0
	force_divisor = 0.55
	color = "#F13C00"

/obj/item/weapon/material/sword/rapier/solar/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	. = ..()
	target.add_modifier(/datum/modifier/fire/weak, 12 SECONDS) //should be 12 damage?

//Icicle
/obj/item/weapon/gun/energy/icelauncher
	name = "Strange Pistol"
	desc = "A homemade and somehow functional icicle launcher."
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "ziplas"
	item_state = "ziplas"
	color = "#0000CC"
	w_class = ITEMSIZE_SMALL
	slot_flags = SLOT_BELT|SLOT_BACK
	charge_cost = 300 //You got 5 shot
	battery_lock = 1
	projectile_type = /obj/item/projectile/icicle //But it hurts a lot
	cell_type = /obj/item/weapon/cell/device/weapon

/obj/item/clothing/shoes/boots/frost
	name = "frost boots"
	desc = "Handmade boots of scavanged bits."
	icon_state = "winterboots"
	color = "#0000CC"
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE
	snow_speed = -1
	rock_climbing = TRUE
	item_flags = NOSLIP

//Turtle
/obj/item/weapon/material/twohanded/sledgehammer/gravity
	name = "Gravity Sledgehammer"
	desc = "A sledgehammer in bits of a gravity turtle's shell."
	force = 20
	unwielded_force_divisor = 0.25
	force_divisor = 0.7 //
	dulled_divisor = 0.80	//Still metal on a stick
	w_class = ITEMSIZE_LARGE
	slot_flags = SLOT_BACK
	force_wielded = 25
	applies_material_colour = 1

/obj/item/weapon/material/twohanded/sledgehammer/gravity/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	. = ..()
	var/atom/target_zone = get_edge_target_turf(user,get_dir(user, target))
	if(!target.anchored)
		target.throw_at(target_zone, 6, 2, user, FALSE)
	user.visible_message("<span class='warning'>\The [src] discharges with a thunderous boom!</span>")
	playsound(src, 'sound/weapons/resonator_blast.ogg', 100, 1, -1)

//Eel stuff
/obj/item/weapon/material/twohanded/fireaxe/scythe/harvester
	name = "Scaled Scythe"
	desc = "A scythe cladded in dream eel scales, allowing for better defense at the cost of offense."
	force_wielded = 15
	unwielded_force_divisor = 0.10
	var/defend_chance = 50
	var/projectile_parry_chance = 50

/obj/item/clothing/suit/armor/alien/dreamercloak
	name = "Dreamer Cloak"
	desc = "A strange cloak, something about it feels off."
	icon = 'icons/inventory/accessory/item.dmi'
	icon_state = "seccloak" //custom sprite for this for sure.
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	block_chance = 35
	slowdown = -0.5

//uggg, why isnt this apart of the base material melee weapons
/obj/item/weapon/material/twohanded/fireaxe/scythe/harvester/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(.)
		return .
	if(default_parry_check(user, attacker, damage_source) && prob(defend_chance))
		user.visible_message("<span class='danger'>\The [user] parries [attack_text] with \the [src]!</span>")
		return 1
	if(unique_parry_check(user, attacker, damage_source) && prob(projectile_parry_chance))
		user.visible_message("<span class='danger'>\The [user] deflects [attack_text] with \the [src]!</span>")
		return 1

	return 0

/obj/item/clothing/gloves/toxinregen
	name = "purging gloves"
	desc = "A pair of gloves with a small storage of green liquid on the outside.  On the inside, a a hypodermic needle can be seen \
	on each glove."
	icon_state = "regen"
	item_state = "graygloves"
	siemens_coefficient = 0
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/toxinregen/equipped(var/mob/living/carbon/human/H)
	if(H && H.gloves == src)
		wearer = H
		if(wearer.can_feel_pain())
			to_chat(H, "<span class='danger'>You feel a stabbing sensation in your hands as you slide \the [src] on!</span>")
			wearer.custom_pain("You feel a sharp pain in your hands!",1)
	..()

/obj/item/clothing/gloves/toxinregen/dropped(var/mob/living/carbon/human/H)
	..()
	if(wearer)
		if(wearer.can_feel_pain())
			to_chat(wearer, "<span class='danger'>You feel the hypodermic needles as you slide \the [src] off!</span>")
			wearer.custom_pain("Your hands hurt like hell!",1)
		wearer = null

/obj/item/clothing/gloves/toxinregen/New()
	START_PROCESSING(SSobj, src)
	..()

/obj/item/clothing/gloves/toxinregen/Destroy()
	wearer = null
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/gloves/toxinregen/process()
	if(!wearer || wearer.isSynthetic() || wearer.stat == DEAD || wearer.nutrition <= 10)
		return
	if(wearer.getToxLoss())
		wearer.adjustToxLoss(-0.5)