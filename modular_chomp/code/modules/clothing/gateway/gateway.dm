//vr section
/obj/item/clothing/head/vrwizard
	name = "wizard hat"
	desc = "A pointy pixelated-looking hat, 0s and 1s dancing off the fabric"
	icon_state = "redwizard"
	armor = list(melee = 20, bullet = 20, laser = 60, energy = 60, bomb = 70, bio = 50, rad = 50)
	siemens_coefficient = 0.1
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	min_pressure_protection = 0 * ONE_ATMOSPHERE
	max_pressure_protection = 3 * ONE_ATMOSPHERE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE


/obj/item/clothing/suit/vrwizard
	name = "wizard robes"
	desc = "A silky robe with 0s and 1s flying off the seams."
	icon_state = "redwizard"
	armor = list(melee = 20, bullet = 20, laser = 60, energy = 60, bomb = 70, bio = 50, rad = 50)
	siemens_coefficient = 0.1
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	min_pressure_protection = 0 * ONE_ATMOSPHERE
	max_pressure_protection = 3 * ONE_ATMOSPHERE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	allowed = list(/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/melee/energy/sword,/obj/item/handcuffs,/obj/item/tank/emergency/oxygen)

/obj/item/clothing/head/darkvrwizard
	name = "wizard hat"
	desc = "The hat holding the most attack and defense"
	icon_state = "redwizard"
	color = "#660066"
	armor = list(melee = 70, bullet = 70, laser = 40, energy = 40, bomb = 90, bio = 70, rad = 70)
	siemens_coefficient = 0.1
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	min_pressure_protection = 0 * ONE_ATMOSPHERE
	max_pressure_protection = 3 * ONE_ATMOSPHERE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE


/obj/item/clothing/suit/darkvrwizard
	name = "wizard robes"
	desc = "Robes holding the most attack and defense."
	icon_state = "psyamp"
	armor = list(melee = 70, bullet = 70, laser = 40, energy = 40, bomb = 90, bio = 70, rad = 70)
	siemens_coefficient = 0.1
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	min_pressure_protection = 0 * ONE_ATMOSPHERE
	max_pressure_protection = 3 * ONE_ATMOSPHERE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	allowed = list(/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/melee/energy/sword,/obj/item/handcuffs,/obj/item/tank/emergency/oxygen)

//Candy section
/obj/item/clothing/head/psy_crown/candycrown
	name = "candy crown"
	desc = "A crown smelling oddly sweet"
	description_info = "It will occasionally give a momentary buff to offensive capablities."
	icon_state = "wrathcrown"
	cooldown_duration = 1 MINUTES // How long the cooldown should be.
	brainloss_cost = 0
	armor = list(melee = 70, bullet = 60, laser = 50, energy = 50, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/head/psy_crown/candycrown/activate_ability(var/mob/living/wearer)
	..()
	wearer.add_modifier(/datum/modifier/aura/candy_orange, 30 SECONDS)

/obj/item/clothing/gloves/stamina
	name = "gloves of stamina"
	desc = "A strange pair of gloves."
	description_info = "It has a strange property of restoring hunger."
	icon_state = "regen"
	item_state = "graygloves"
	siemens_coefficient = 0
	armor = list(melee = 70, bullet = 60, laser = 50, energy = 50, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/gloves/stamina/equipped(var/mob/living/carbon/human/H)
	if(H && H.gloves == src)
		wearer = H
		if(wearer.can_feel_pain())
			to_chat(H, "<span class='danger'>You feel strange as hunger vanishes!</span>")
			wearer.custom_pain("Your hands feel strange!",1)
	..()

/obj/item/clothing/gloves/stamina/dropped(var/mob/living/carbon/human/H)
	..()
	if(wearer)
		if(wearer.can_feel_pain())
			to_chat(wearer, "<span class='danger'>You feel hungry!</span>")
			wearer.custom_pain("Your hands feel strange",1)
		wearer = null

/obj/item/clothing/gloves/stamina/New()
	START_PROCESSING(SSobj, src)
	..()

/obj/item/clothing/gloves/stamina/Destroy()
	wearer = null
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/gloves/stamina/process()
	if(!wearer || wearer.isSynthetic() || wearer.stat == DEAD)
		return // Robots and dead people don't have a metabolism.
	wearer.nutrition = max(wearer.nutrition + 8, 0)

/obj/item/clothing/suit/armor/buffvest
	name = "candy armor"
	desc = "A really strange armor made of a similar substance as the creatures near it."
	icon_state = "armor"
	blood_overlay_type = "armor"
	armor = list(melee = 70, bullet = 60, laser = 50, energy = 50, bomb = 0, bio = 0, rad = 0)
	var/tension_threshold = 125
	var/cooldown = null // world.time of when this was last triggered.
	var/cooldown_duration = 3 MINUTES // How long the cooldown should be.
	var/flavor_equip = null // Message displayed to someone who puts this on their head. Drones don't get a message.
	var/flavor_unequip = null // Ditto, but for taking it off.
	var/flavor_drop = null // Ditto, but for dropping it.
	var/flavor_activate = null // Ditto, for but activating.
	var/brainloss_cost = 0

/obj/item/clothing/suit/armor/buffvest/proc/activate_ability(var/mob/living/wearer)
	cooldown = world.time + cooldown_duration
	to_chat(wearer, flavor_activate)
	to_chat(wearer, "<span class='danger'>The inside of your head hurts...</span>")
	wearer.adjustBrainLoss(brainloss_cost)
	wearer.add_modifier(/datum/modifier/aura/candy_blue, 30 SECONDS)

/obj/item/clothing/suit/armor/buffvest/equipped(var/mob/living/carbon/human/H)
	..()
	if(istype(H) && H.head == src && H.is_sentient())
		START_PROCESSING(SSobj, src)
		to_chat(H, flavor_equip)

/obj/item/clothing/suit/armor/buffvest/dropped(var/mob/living/carbon/human/H)
	..()
	STOP_PROCESSING(SSobj, src)
	if(H.is_sentient())
		if(loc == H) // Still inhand.
			to_chat(H, flavor_unequip)
		else
			to_chat(H, flavor_drop)

/obj/item/clothing/suit/armor/buffvest/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/armor/buffvest/process()
	if(isliving(loc))
		var/mob/living/L = loc
		if(world.time >= cooldown && L.is_sentient() && L.get_tension() >= tension_threshold)
			activate_ability(L)

//vistor section
/obj/item/clothing/suit/armor/alien/vistor
	name = "rocky suit"
	desc = "A strange set of armor made of rocky plates"
	description_info = "It always reduces all damage by the same amount, with a 12% chance to block."
	icon_state = "alien_tank"
	slowdown = 0
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	armorsoak = list( melee = 12, bullet = 12,laser = 12, energy = 12 , bomb = 0, bio = 0, rad = 0)
	block_chance = 12

/obj/item/clothing/suit/armor/tesla/vistor
	name = "zapping suit"
	desc = "A strange set of armor crackling with lighting"
	slowdown = 0
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/reactive/vistor
	name = "vibrating suit"
	desc = "A strange set of armor that crackles with energy"
	icon_state = "reactiveoff"
	slowdown = 0
	armor = list(melee = 35, bullet = 35, laser = 35, energy = 35, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/protectionbubble
	name = "protective bubble"
	desc = "A strange set of armor that seems to coat your entire body in a thing protective bubble"
	icon_state = "armor"
	blood_overlay_type = "armor"
	armor = list(melee = 25, bullet = 25, laser = 25, energy = 25, bomb = 50, bio = 100, rad = 75)
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS | HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	min_pressure_protection = 0 * ONE_ATMOSPHERE
	max_pressure_protection = 15 * ONE_ATMOSPHERE
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE

//scrap section which is on hold till I get foes