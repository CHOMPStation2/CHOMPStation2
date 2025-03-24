/*
Concept: Mind controlling parasite. Hostile to all mobs.
On attack if our target is a simple mob, and has no mind.
We simply engulf them, evicerating their body and stealing their form as well as some of their stats.
However we dont gain special attacks and verbs, for example, if we evicerate a dragon we dont get a breath attack suddnely.
Only physical attributes are copied.
*/
/mob/living/simple_mob/fleshtaker
	faction = "Fleshtaker"
	name = "Fleshtaker"
	desc = "A strange creature"
	icon = 'icons/mob/synxmanyvoices.dmi'
	icon_living = "939_living"
	icon_dead = "939_dead"
	pixel_x = -15
	//Lets write down our base stats so we can revert easily
	var/list/base_values = list()

	ai_holder_type = /datum/ai_holder/simple_mob/melee/pack_mob //A pack of these would be absolutely terrifying.
	var/flesh_mimic = FALSE //are we currently posing as something else?

/mob/living/simple_mob/fleshtaker/Initialize(mapload)
	. = ..()
	base_values["name"] = name
	base_values["desc"] = desc
	base_values["icon"] = icon
	base_values["icon_living"] = icon_living
	base_values["icon_dead"] = icon_dead
	base_values["pixel_x"] = pixel_x
	base_values["pixel_y"] = pixel_y //record our default y pixel offset for later reversion
	base_values["melee_damage_lower"] = melee_damage_lower
	base_values["melee_damage_upper"] = melee_damage_upper
	base_values["maxHealth"] = maxHealth
	base_values["armor"] = armor
	icon_state = icon_living


	//copy stats from our engulfed target
/mob/living/simple_mob/fleshtaker/proc/flesh_mimic(var/mob/living/simple_mob/target)
	flesh_mimic = TRUE
	name = target.name
	desc = target.desc
	icon = target.icon
	icon_living = target.icon_living
	icon_dead = target.icon_dead
	pixel_x = target.pixel_x
	pixel_x = target.pixel_y
	melee_damage_lower = target.melee_damage_lower
	melee_damage_upper = target.melee_damage_upper
	maxHealth = target.maxHealth
	health = maxHealth
	icon_state = target.icon_state
	armor = target.armor
	//steal base stats
	//possibly steal vorgans
	update_icon()

//reset to original values
/mob/living/simple_mob/fleshtaker/proc/revert_mimic()
	flesh_mimic = FALSE
	name = base_values["name"]
	desc = base_values["desc"]
	icon = base_values["icon"]
	icon_living = base_values["icon_living"]
	icon_dead = base_values["icon_dead"]
	pixel_x = base_values["pixel_x"]
	pixel_y = base_values["pixel_y"]
	melee_damage_lower = base_values["melee_damage_lower"]
	melee_damage_upper = base_values["melee_damage_upper"]
	maxHealth = base_values["maxHealth"]
	health = maxHealth
	icon_state = icon_living
	armor = base_values["armor"]
	update_icon()

/mob/living/simple_mob/fleshtaker/apply_melee_effects(var/atom/A)
	if(istype(A,/mob/living/simple_mob) && !flesh_mimic)
		var/mob/living/simple_mob/M = A
		if(!M.mind)
			flesh_mimic(M)
			M.gib()
	..()
