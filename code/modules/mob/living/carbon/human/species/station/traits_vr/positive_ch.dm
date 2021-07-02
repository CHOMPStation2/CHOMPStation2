/datum/trait/positive/linguist
	name = "Master Linguist"
	desc = "You are a master of languages! For whatever reason you might have, you are able to learn many more languages than others."
	cost = 2
	var_changes = list("num_alternate_languages" = 12)

/datum/trait/positive/densebones
	name = "Dense bones"
	desc = "Your bones (or robotic limbs) are more dense or stronger then what is considered normal. It is much harder to fracture your bones, yet pain from fractures is much more intense."
	cost = 3
	excludes = list(/datum/trait/negative/hollow)

/datum/trait/positive/densebones/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	for(var/obj/item/organ/external/organ in H.organs)
		if(istype(organ))
			organ.min_broken_damage *= 1.5
			organ.brokenpain *= 2

/datum/trait/positive/lowpressureres
	name = "Low Pressure Resistance"
	desc = "Your body is more resistant to low pressures. Pretty simple."
	cost = 3
	var_changes = list("hazard_low_pressure" = HAZARD_LOW_PRESSURE*0.66, "warning_low_pressure" = WARNING_LOW_PRESSURE*0.66, "minimum_breath_pressure" = 16*0.66)

/datum/trait/positive/highpressureres
	name = "High Pressure Resistance"
	desc = "Your body is more resistant to high pressures. Pretty simple."
	cost = 3
	var_changes = list("hazard_high_pressure" = HAZARD_HIGH_PRESSURE*1.5, "warning_high_pressure" = WARNING_HIGH_PRESSURE*1.5)

/datum/trait/positive/photosynth
	name = "Photosynthesis"
	desc = "Your body is able to produce nutrition from being in light."
	cost = 3
	var_changes = list("photosynthesizing" = TRUE)
	can_take = ORGANICS|SYNTHETICS //Synths actually use nutrition, just with a fancy covering.

/datum/trait/positive/rad_resistance
	name = "Radiation Resistance"
	desc = "You are generally more resistant to radiation, and it dissipates faster from your body."
	cost = 2
	var_changes = list("radiation_mod" = 0.65, "rad_removal_mod" = 3.5, "rad_levels" = list("safe" = 20, "danger_1" = 75, "danger_2" = 100, "danger_3" = 200))

/datum/trait/positive/rad_resistance_extreme
	name = "Extreme Radiation Resistance"
	desc = "You are much more resistant to radiation, and it dissipates much faster from your body."
	cost = 4
	var_changes = list("radiation_mod" = 0.5, "rad_removal_mod" = 5, "rad_levels" = list("safe" = 40, "danger_1" = 100, "danger_2" = 150, "danger_3" = 250))

/datum/trait/positive/more_blood
	name = "High blood volume"
	desc = "You have much 50% more blood than most other people"
	cost = 3
	var_changes = list("blood_volume" = 840)
	excludes = list(/datum/trait/positive/more_blood_extreme,/datum/trait/negative/less_blood,/datum/trait/negative/less_blood_extreme)
	can_take = ORGANICS

/datum/trait/positive/more_blood_extreme
	name = "Very high blood volume"
	desc = "You have much 150% more blood than most other people"
	cost = 6
	var_changes = list("blood_volume" = 1400)
	excludes = list(/datum/trait/positive/more_blood,/datum/trait/negative/less_blood,/datum/trait/negative/less_blood_extreme)
	can_take = ORGANICS

/datum/trait/positive/heavyweight
	name = "Heavyweight"
	desc = "You are more heavyweight or otherwise more sturdy than most species, and as such, it's much more difficult to move you."
	cost = 2

/datum/trait/positive/heavyweight/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.mob_bump_flag = HEAVY

/datum/trait/positive/table_passer
	name = "Table passer"
	desc = "You move over or under tables with ease of a Teshari."
	cost = 2

/datum/trait/positive/table_passer/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.pass_flags = PASSTABLE


/datum/trait/positive/big_mouth
	name = "Big mouth"
	desc = "It takes half as many bites to finish food as it does for most people."
	cost = 1
	var_changes = list("bite_mod" = 2)

/datum/trait/positive/grappling_expert
	name = "Grappling expert"
	desc = "Your grabs are much harder to escape from, and you are better at escaping from other's grabs!"
	cost = 3
	var_changes = list("grab_resist_divisor_victims" = 3, "grab_resist_divisor_self" = 0.5, "grab_power_victims" = -1, "grab_power_self" = 1)

/datum/trait/positive/big_mouth_extreme
	name = "Giant mouth"
	desc = "It takes a quarter as many bites to finish food as it does for most people."
	cost = 3
	var_changes = list("bite_mod" = 4)

/datum/trait/positive/absorbent
	name = "Absorbent"
	desc = "You are able to clean messes just by walking over them, and gain nutrition from doing so!"
	cost = 2
	special_env = TRUE
	excludes = list(/datum/trait/negative/slipperydirt)

/datum/trait/positive/endurance_high
	cost = 3
	excludes = list(/datum/trait/positive/brute_resist, /datum/trait/positive/minor_brute_resist, /datum/trait/positive/minor_burn_resist, /datum/trait/positive/burn_resist)

/datum/trait/positive/brute_resist
	excludes = list(/datum/trait/positive/minor_brute_resist, /datum/trait/positive/burn_resist, /datum/trait/positive/endurance_high)

/datum/trait/positive/minor_brute_resist
	excludes = list(/datum/trait/positive/brute_resist, /datum/trait/positive/endurance_high)

/datum/trait/positive/burn_resist
	excludes = list(/datum/trait/positive/minor_burn_resist, /datum/trait/positive/brute_resist, /datum/trait/positive/endurance_high)

/datum/trait/positive/minor_burn_resist
	excludes = list(/datum/trait/positive/burn_resist, /datum/trait/positive/endurance_high)

/datum/trait/positive/absorbent/handle_environment_special(var/mob/living/carbon/human/H)
	var/turf/T = get_turf(H)
	if(istype(T))
		if(!(H.shoes || (H.wear_suit && (H.wear_suit.body_parts_covered & FEET))))
			for(var/obj/O in T)
				if(O.clean_blood())
					H.adjust_nutrition(rand(5, 15))
			if (istype(T, /turf/simulated))
				var/turf/simulated/S = T
				if(T.clean_blood())
					H.adjust_nutrition(rand(10, 20))
				if(S.dirt > 50)
					S.dirt = 0
					H.adjust_nutrition(rand(10, 20))
		if(H.clean_blood(1))
			H.adjust_nutrition(rand(5, 15))
		if(H.r_hand)
			if(H.r_hand.clean_blood())
				H.adjust_nutrition(rand(5, 15))
		if(H.l_hand)
			if(H.l_hand.clean_blood())
				H.adjust_nutrition(rand(5, 15))
		if(H.head)
			if(H.head.clean_blood())
				H.update_inv_head(0)
				H.adjust_nutrition(rand(5, 15))
		if(H.wear_suit)
			if(H.wear_suit.clean_blood())
				H.update_inv_wear_suit(0)
				H.adjust_nutrition(rand(5, 15))
		if(H.w_uniform)
			if(H.w_uniform.clean_blood())
				H.update_inv_w_uniform(0)
				H.adjust_nutrition(rand(5, 15))

/datum/trait/positive/adrenaline_rush
	name = "Adrenaline Rush"
	desc = "When you get critically damaged, you'll have an adrenaline rush before going down, giving you another chance to finish the fight, or get to safety."
	cost = 6
	special_env = TRUE
	can_take = ORGANICS
	var/last_adrenaline_rush

/datum/trait/positive/adrenaline_rush/handle_environment_special(var/mob/living/carbon/human/H)
	if(!(H.health<0))
		return
	if(last_adrenaline_rush && last_adrenaline_rush + 18000 > world.time)
		return
	last_adrenaline_rush = world.time
	log_and_message_admins("[H]'s adrenaline rush trait just activated!")
	H.add_modifier(/datum/modifier/adrenaline,300)

/datum/modifier/adrenaline
	name = "Adrenaline Rush"
	desc = "A rush of adrenaline, usually caused by near death in situations."
	on_created_text = "<span class='danger'>You suddenly feel adrenaline pumping through your veins as your body refuses to give up! You feel stronger, and faster, and the pain fades away quickly.</span>"
	on_expired_text = "<span class='danger'>You feel your body finally give in once more as the adrenaline subsides. The pain returns in full blast, along with your strength fading once more.</span>"

	disable_duration_percent = 0		//Immune to being disabled.
	pain_immunity = TRUE				//Immune to pain
	max_health_flat = 25				//Temporary health boost.
	incoming_damage_percent = 0.8		//Slight damage immunity
	incoming_oxy_damage_percent = 0.1	//Temporary oxyloss slowdown

	outgoing_melee_damage_percent = 2	//Muscles are in overdrive
	attack_speed_percent = 0.5			//Muscles are in overdrive
	slowdown = -11						//Muscles are in overdrive
	evasion = 20						//Increased focus
	accuracy = 25						//Increased focus
	accuracy_dispersion = -25			//Increased focus
	pulse_modifier = 2					//Heart is in overdrive
	bleeding_rate_percent = 1.25		//Bleed more with higher blood pressure.
	metabolism_percent = 2.5			//Metabolism in overdrive
	
	var/original_length
	var/list/original_values

/datum/modifier/adrenaline/on_applied()
	original_length = expire_at - world.time
	original_values = list("stun" = holder.halloss*1.5, "weaken" = holder.weakened*1.5, "paralyze" = holder.paralysis*1.5, "stutter" = holder.stuttering*1.5, "eye_blur" = holder.eye_blurry*1.5, "drowsy" = holder.drowsyness*1.5, "agony" = holder.halloss*1.5, "confuse" = holder.confused*1.5)

/datum/modifier/adrenaline/tick()
	holder.halloss = 0
	holder.weakened = 0
	holder.paralysis = 0
	holder.stuttering = 0
	holder.eye_blurry = 0
	holder.drowsyness = 0
	holder.halloss = 0
	holder.confused = 0
	holder.stunned = 0

/datum/modifier/adrenaline/on_expire()	//Your time is up, time to suffer the consequences.
	holder.apply_effects(original_values["stun"] + 30,original_values["weaken"] + 20,original_values["paralyze"] + 15,0,original_values["stutter"] + 40,original_values["eye_blur"] + 20,original_values["drowsy"] + 75,original_values["agony"])
	holder.Confuse(original_values["confused"])
	holder.add_modifier(/datum/modifier/adrenaline_recovery,original_length*17.5)

/datum/modifier/adrenaline_recovery
	name = "Adrenaline detox"
	desc = "After an adrenaline rush, one will find themselves suffering from adrenaline detox, which is their body recovering from an intense adrenaline rush."
	on_created_text = "<span class='danger'>Your body aches and groans, forcing you into a period of rest as it recovers from the intense adrenaline rush.</span>"
	on_expired_text = "<span class='notice'>You finally recover from your adrenaline rush, your body returning to it's normal state.</span>"

	disable_duration_percent = 1.35
	outgoing_melee_damage_percent = 0.75
	attack_speed_percent = 2
	slowdown = 2
	evasion = -20
	bleeding_rate_percent = 0.8
	pulse_modifier = 0.5
	metabolism_percent = 0.5
	accuracy = -25
	accuracy_dispersion = 25
	incoming_hal_damage_percent = 1.75
	incoming_oxy_damage_percent = 1.25
	
/datum/trait/positive/insect_sting
	name = "Insect Sting"
	desc = "Allows you to sting your victim with a smalll amount of poison"
	cost = 1

/datum/trait/positive/insect_sting/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/insect_sting
	
