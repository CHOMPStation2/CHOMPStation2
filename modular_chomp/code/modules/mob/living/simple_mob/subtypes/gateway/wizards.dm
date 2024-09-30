/datum/category_item/catalogue/fauna/vrerror
	name = "VR Creations"
	desc = "Upon investigation of the strange creatures, they appear \
	to be constructed of hardlight technology, with connections to common \
	VR equipment. It is unknown what their purpose is at this time."
	value = CATALOGUER_REWARD_MEDIUM

/mob/living/simple_mob/vr
	name = "vr creation"
	desc = "A digital creature"
	icon = 'icons/mob/animal_vg.dmi'
	icon_state = "bookbat_purple"
	icon_living = "bookbat_purple"
	icon_dead = "bookbat_purple_dead"
	catalogue_data = list(/datum/category_item/catalogue/fauna/vrerror)

	mob_class = MOB_CLASS_ABERRATION

	faction = "vr"

	maxHealth = 100 //Old 50
	health = 100
	movement_cooldown = 1
	unsuitable_atoms_damage = 0
	projectiletype = /obj/item/projectile/energy/homing_bolt/wizard
	melee_attack_delay = 4 SECOND
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting

	melee_damage_lower = 15
	melee_damage_upper = 25
	size_multiplier = 1.50

	loot_list = list(/obj/item/clothing/head/vrwizard = 10,
			/obj/item/clothing/suit/vrwizard = 10,
			/obj/item/gun/magic/firestaff/vrwizard/fire = 10,
			/obj/item/gun/magic/firestaff/vrwizard/frost = 10,
			/obj/item/gun/magic/firestaff/vrwizard/poison = 10,
			/obj/item/gun/magic/firestaff/vrwizard/lighting = 10
			)

/mob/living/simple_mob/vr/firewiz
	name = "hardlight creation fire"
	icon_state = "bookbat_red"
	icon_living = "bookbat_red"
	icon_dead = "bookbat_red_dead"
	projectiletype = /obj/item/projectile/energy/homing_bolt/wizard/fire

/mob/living/simple_mob/vr/poisonwiz
	name = "hardlight creation poison"
	icon_state = "bookbat_green"
	icon_living = "bookbat_green"
	icon_dead = "bookbat_green_dead"
	projectiletype = /obj/item/projectile/energy/homing_bolt/wizard/poison

/mob/living/simple_mob/vr/lightingwiz
	name = "hardlight creation lighting"
	icon_state = "bookbat_woody"
	icon_living = "bookbat_woody"
	icon_dead = "bookbat_woody_dead"
	projectiletype = /obj/item/projectile/energy/homing_bolt/wizard/lighting

/mob/living/simple_mob/vr/frostwiz
	name = "hardlight creation frost"
	icon_state = "bookbat_blue"
	icon_living = "bookbat_blue"
	icon_dead = "bookbat_blue_dead"
	projectiletype = /obj/item/projectile/energy/homing_bolt/wizard/frost

/mob/living/simple_mob/vr/glitch
	name = "glitch"
	desc = "You shouldn't be seeing this, run"
	icon =  'icons/mob/fish.dmi'
	icon_state = ""
	icon_living = ""
	icon_dead = ""
	projectiletype = null

	maxHealth = 20
	health = 20
	movement_cooldown = -3
	unsuitable_atoms_damage = 0
	projectiletype = null
	melee_attack_delay = 0 SECOND

	melee_damage_lower = 8
	melee_damage_upper = 8

/mob/living/simple_mob/vr/glitch/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/digitizing, 60 SECONDS)

/mob/living/simple_mob/vr/doomknight
	name = "hardlight creation doomknight"
	projectiletype = null

	maxHealth = 70
	health = 70
	movement_cooldown = 4
	unsuitable_atoms_damage = 0
	projectiletype = null
	melee_attack_delay = 8 SECOND

	melee_damage_lower = 30
	melee_damage_upper = 30

/mob/living/simple_mob/vr/doomknight/apply_melee_effects(var/atom/A) //If you get hit by this slow thing, you have 5 minuites to live.
	if(isliving(A))
		var/mob/living/L = A
		L.add_modifier(/datum/modifier/doomed, 300 SECONDS)


//Spells
/obj/item/projectile/energy/homing_bolt/wizard
	damage = 15
	speed = 1.0

/obj/item/projectile/energy/homing_bolt/wizard/fire
	modifier_type_to_apply = /datum/modifier/wizfire
	modifier_duration = 6 SECONDS
	icon_state = "fireball2"

/obj/item/projectile/energy/homing_bolt/wizard/lighting
	modifier_type_to_apply = /datum/modifier/wizfire/lighting
	modifier_duration = 6 SECONDS

/obj/item/projectile/energy/homing_bolt/wizard/poison
	modifier_type_to_apply = /datum/modifier/wizpoison
	modifier_duration = 6 SECONDS
	icon_state = "green_pellet"

/obj/item/projectile/energy/homing_bolt/wizard/frost
	modifier_type_to_apply = /datum/modifier/wizpoison/frost
	modifier_duration = 6 SECONDS
	icon_state = "ice_2"

/datum/modifier/wizfire
	name = "wizfire"
	desc = "Can you even see this in game?"
	mob_overlay_state = "on_fire"

	on_created_text = "<span class='warning'>You are on digital fire.</span>"
	on_expired_text = "<span class='notice'>You feel better.</span>"
	stacks = MODIFIER_STACK_ALLOWED // Multiple instances will hurt a lot.
	var/damage_per_tick = 1.5
	bleeding_rate_percent = 0.7

/datum/modifier/wizfire/tick()
	holder.inflict_heat_damage(damage_per_tick)

/datum/modifier/wizfire/lighting
	name = "wizlighting"
	desc = "Can you even see this in game?."
	mob_overlay_state = "blue_electricity_constant"

	on_created_text = "<span class='warning'>You are filled with digital lighting.</span>"
	on_expired_text = "<span class='notice'>You feel better.</span>"
	stacks = MODIFIER_STACK_ALLOWED // Multiple instances will hurt a lot.
	damage_per_tick = 1.0
	incoming_fire_damage_percent = 1.1

/datum/modifier/wizpoison
	name = "wizpoison"
	desc = "Can you even see this in game?."
	mob_overlay_state = "poisoned"

	on_created_text = "<span class='warning'>You are on digital poisoned.</span>"
	on_expired_text = "<span class='notice'>You feel better.</span>"
	stacks = MODIFIER_STACK_ALLOWED // Multiple instances will hurt a lot.
	var/damage_per_tick = 3

/datum/modifier/wizpoison/tick()
	if(holder.stat == DEAD)
		expire(silent = TRUE)
	holder.inflict_poison_damage(damage_per_tick)

/datum/modifier/wizpoison/frost
	name = "wizfrost"
	desc = "Can you even see this in game?."
	mob_overlay_state = "chilled"

	on_created_text = "<span class='warning'>You are on freezing, digitally.</span>"
	on_expired_text = "<span class='notice'>You feel better.</span>"
	stacks = MODIFIER_STACK_ALLOWED // Multiple instances will hurt a lot.
	damage_per_tick = 1
	slowdown = 0.5

/datum/modifier/digitizing
	name = "digital"
	desc = "Can you even see this in game?."
	mob_overlay_state = "corana"

	on_created_text = "<span class='warning'>You feel less real.</span>"
	on_expired_text = "<span class='notice'>You feel real again.</span>"
	stacks = MODIFIER_STACK_ALLOWED //How does this stack?
	max_health_percent = 0.7

/datum/modifier/aura/crumbling
	name = "crumbling"
	desc = "Can you even see this in game?."
	mob_overlay_state = "cult_aura"

	on_created_text = "<span class='warning'>You feel like the end is nigh.</span>"
	on_expired_text = "<span class='notice'>You feel safe for now.</span>"
	aura_max_distance = 4
	max_health_percent = 0.9
	disable_duration_percent = 1.2
	incoming_damage_percent = 1.2
	incoming_oxy_damage_percent = 2
	incoming_hal_damage_percent = 2
	incoming_healing_percent = 0.8

/datum/modifier/aura/crumbling/superboss
	aura_max_distance = 16
