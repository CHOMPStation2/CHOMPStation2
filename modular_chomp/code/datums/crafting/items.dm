#define MAT_WISP			"strange wisp"
#define MAT_FROSCALE			"frost scale"
#define MAT_CRYSCALE			"crystal scale"
#define MAT_DREAMSCALE			"furred scale"
#define MAT_SHELLCHITIN			"shell chitin"

/datum/material/wisp
	name = MAT_WISP
	icon_colour = "#F13C00"
	stack_type = /obj/item/stack/material/wisp
	stack_origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4)
	icon_base = "solid"
	icon_reinf = "reinf_mesh"
	integrity = 30
	weight = 10
	ignition_point = T0C+600
	melting_point = T0C+800
	protectiveness = 5
	conductive = 0
	opacity = 0.5
	reflectivity = 30
	supply_conversion_value = 6

/obj/item/stack/material/wisp
	name = "Strange Wisp"
	desc = "The by-product of mob grinding."
	icon = 'modular_chomp/icons/obj/crafting.dmi'
	icon_state = "wisp"
	default_type = MAT_WISP
	no_variants = FALSE
	pass_color = TRUE
	strict_color_stacking = TRUE


/datum/material/frostscale
	name = MAT_FROSCALE
	icon_colour = "#0000CC"
	stack_type = /obj/item/stack/material/frostscale
	stack_origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4)
	icon_base = "solid"
	icon_reinf = "reinf_mesh"
	integrity = 250
	weight = 50
	ignition_point = T0C+20
	melting_point = T0C+40
	protectiveness = 30
	conductive = 0
	opacity = 0.5
	reflectivity = 0
	supply_conversion_value = 8

/obj/item/stack/material/frostscale
	name = "Frost Scale"
	desc = "The by-product of mob grinding."
	icon = 'modular_chomp/icons/obj/crafting.dmi'
	icon_state = "scale"
	color = "#0000CC"
	default_type = MAT_FROSCALE
	no_variants = FALSE
	pass_color = TRUE
	strict_color_stacking = TRUE

/datum/material/crystalscale
	name = MAT_CRYSCALE
	icon_colour = "#006633"
	stack_type = /obj/item/stack/material/crystalscale
	stack_origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4)
	icon_base = "solid"
	icon_reinf = "reinf_mesh"
	integrity = 250
	weight = 10
	radiation_resistance = 25 //less then lead because it's lighter then lead.
	protectiveness = 30
	conductive = 0
	opacity = 0.25
	reflectivity = 0.6
	supply_conversion_value = 4

/obj/item/stack/material/crystalscale
	name = "Crystak Scale"
	desc = "The by-product of mob grinding."
	icon = 'modular_chomp/icons/obj/crafting.dmi'
	icon_state = "scale"
	color = "#006633"
	default_type = MAT_CRYSCALE
	no_variants = FALSE
	pass_color = TRUE
	strict_color_stacking = TRUE

/datum/material/dreamscale
	name = MAT_DREAMSCALE
	icon_colour = "#006633"
	stack_type = /obj/item/stack/material/dreamscale
	stack_origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4)
	icon_base = "solid"
	icon_reinf = "reinf_mesh"
	integrity = 200
	weight = 30
	ignition_point = T0C+200
	melting_point = T0C+400
	protectiveness = 60
	reflectivity = 0.3
	supply_conversion_value = 1

/obj/item/stack/material/dreamscale
	name = "Dream Scale"
	desc = "The by-product of mob grinding."
	icon = 'modular_chomp/icons/obj/crafting.dmi'
	icon_state = "scale"
	default_type = MAT_DREAMSCALE
	no_variants = FALSE
	pass_color = TRUE
	strict_color_stacking = TRUE

/datum/material/shellchitin
	name = MAT_SHELLCHITIN
	icon_colour = "#006633"
	stack_type = /obj/item/stack/material/dreamscale
	stack_origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4)
	icon_base = "solid"
	icon_reinf = "reinf_mesh"
	integrity = 250
	weight = 70
	ignition_point = T0C+300
	melting_point = T0C+600
	protectiveness = 50
	reflectivity = 0
	supply_conversion_value = 1

/obj/item/stack/material/shellchitin
	name = "Shell Chitin"
	desc = "The by-product of mob grinding."
	icon = 'modular_chomp/icons/obj/crafting.dmi'
	icon_state = "shell"
	default_type = MAT_SHELLCHITIN
	no_variants = FALSE
	pass_color = TRUE
	strict_color_stacking = TRUE

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

/obj/item/material/sword/rapier/solar
	name = "solar rapier"
	desc = "A slender, fancy and sharply pointed sword, wisps of fire swirling around it."
	icon_state = "rapier"
	item_state = "rapier"
	slot_flags = SLOT_BELT
	applies_material_colour = 0
	force_divisor = 0.50
	color = "#F13C00"

/obj/item/material/sword/rapier/solar/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	. = ..()
	target.add_modifier(/datum/modifier/fire/weak, 12 SECONDS) //should be 12 damage?

//Icicle
/obj/item/gun/energy/icelauncher
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
	cell_type = /obj/item/cell/device/weapon

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
/obj/item/material/twohanded/sledgehammer/gravity
	name = "Gravity Sledgehammer"
	desc = "A sledgehammer in bits of a gravity turtle's shell."
	unwielded_force_divisor = 0.25
	force_divisor = 0.40 //
	dulled_divisor = 0.80	//Still metal on a stick
	w_class = ITEMSIZE_LARGE
	slot_flags = SLOT_BACK
	force_wielded = 25
	applies_material_colour = 1

/obj/item/material/twohanded/sledgehammer/gravity/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	. = ..()
	var/atom/target_zone = get_edge_target_turf(user,get_dir(user, target))
	if(!target.anchored)
		target.throw_at(target_zone, 6, 2, user, FALSE)
	user.visible_message("<span class='warning'>\The [src] discharges with a thunderous boom!</span>")
	playsound(src, 'sound/weapons/resonator_blast.ogg', 100, 1, -1)

//Eel stuff
/obj/item/material/twohanded/fireaxe/scythe/harvester
	name = "Scaled Scythe"
	desc = "A scythe cladded in dream eel scales, allowing for better defense at the cost of offense."
	force_wielded = 18
	force_divisor = 0.3 // 18 with hardness 60 (steel)
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
/obj/item/material/twohanded/fireaxe/scythe/harvester/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
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
