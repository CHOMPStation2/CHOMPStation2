/datum/modifier/eletricalsurge //grub
	name = "Eletrical Surge"
	desc = "You are filled with an overwhelming energy."

	on_created_text = span_critical("You feel an overwhelimg energy surge through your body!")
	on_expired_text = span_notice("The surge subsides.")
	stacks = MODIFIER_STACK_EXTEND
	evasion = 20
	attack_speed_percent = 0.75
	siemens_coefficient = 3

/datum/modifier/healingtide //carp
	name = "Healing Tide"
	desc = "Your body is more receptive to chemicals."

	on_created_text = span_critical("Your body is more receptive to chemicals!")
	on_expired_text = span_notice("The healing subsides.")
	stacks = MODIFIER_STACK_EXTEND

	metabolism_percent = 0.5
	incoming_healing_percent = 1.25

/datum/modifier/radiationhide //deathclaw
	name = "Radiation Hide"
	desc = "Your body is adorn with scales."

	on_created_text = span_critical("Your body strangly mutates!")
	on_expired_text = span_notice("Your body returns to normal.")
	stacks = MODIFIER_STACK_EXTEND

	icon_scale_x_percent = 1.2
	icon_scale_y_percent = 1.2
	incoming_clone_damage_percent = 0
	incoming_healing_percent = 0.5
	max_health_percent = 1.5
	incoming_damage_percent = 0.9

/datum/modifier/nervoushigh //meteroid
	name = "Nervous High"
	desc = "Your senses feel everything."

	client_color = "#808080" //Za worldo

	on_created_text = span_critical("The world arounds you slows down!")
	on_expired_text = span_notice("The world returns to normal.")
	stacks = MODIFIER_STACK_EXTEND

	slowdown = -3
	attack_speed_percent = 0.25
	bleeding_rate_percent = 3.0
	metabolism_percent = 3.0
	max_health_percent = 0.25
	disable_duration_percent = 0.1

/datum/modifier/protectivenumbing //spider
	name = "Protective Numbing"
	desc = "Your senses dull."

	on_created_text = span_critical("Your body becomes numb!")
	on_expired_text = span_notice("Sensation returns to your body.")
	stacks = MODIFIER_STACK_EXTEND

	heat_protection = 1
	cold_protection = 1
	attack_speed_percent = 1.25

/datum/modifier/juggernog
	name = "Juggernog"
	desc = "Your body is prepared for conflict."

	on_created_text = span_critical("Your body becomes tougher!")
	on_expired_text = span_notice("Your body returns to normal.")
	stacks = MODIFIER_STACK_EXTEND

	max_health_percent = 1.3
	disable_duration_percent = 0.2

/datum/modifier/life_cloak
	name = "Life Cloak"
	desc = "Your body is protected from death."

	on_created_text = span_critical("You feel protected!")
	on_expired_text = span_notice("Your body returns to normal.")
	stacks = MODIFIER_STACK_EXTEND

/datum/modifier/life_cloak/can_apply(var/mob/living/L, var/suppress_failure = FALSE)
	if(L.has_modifier_of_type(/datum/modifier/life_cloak_exhaustion))
		return FALSE
	return ..()

/datum/modifier/life_cloak/tick()
	if(holder.stat != DEAD)
		holder.add_modifier(/datum/modifier/life_cloak_exhaustion, 360 SECONDS)
		holder.adjustBruteLoss(-150)
		holder.adjustFireLoss(-150)
		holder.adjustOxyLoss(-200)
		GLOB.dead_mob_list.Remove(holder)
		if((holder in GLOB.living_mob_list) || (holder in GLOB.dead_mob_list))
			WARNING("Mob [holder] was defibbed but already in the living or dead list still!")
		GLOB.living_mob_list += holder
		holder.timeofdeath = 0
		holder.set_stat(CONSCIOUS)
		holder.failed_last_breath = 0
		holder.reload_fullscreen()
		holder.updatehealth()
		expire()

/datum/modifier/life_cloak_exhaustion
	name = "Life Cloak Recovery"
	desc = "Your body is recovering."

	on_created_text = span_critical("Something feels wrong!")
	on_expired_text = span_notice("Your body returns to normal.")
	stacks = MODIFIER_STACK_EXTEND

	disable_duration_percent = 2
	incoming_damage_percent = 1.5
