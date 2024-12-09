/datum/trait/positive/linguist
	name = "Master Linguist"
	desc = "You are a master of languages! For whatever reason you might have, you are able to learn many more languages than others. Your language cap is 12 slots."
	cost = 2
	var_changes = list("num_alternate_languages" = 15)
	var_changes_pref = list("extra_languages" = 12)

/datum/trait/positive/darksight
	name = "Darksight"
	desc = "Allows you to see a short distance in the dark. (Half the screen)."
	cost = 1
	var_changes = list("darksight" = 4)  //CHOMP Edit
	custom_only = FALSE
	banned_species = list(SPECIES_TAJARAN, SPECIES_SHADEKIN_CREW, SPECIES_SHADEKIN, SPECIES_XENOHYBRID, SPECIES_VULPKANIN, SPECIES_XENO, SPECIES_XENOCHIMERA, SPECIES_VASILISSAN, SPECIES_WEREBEAST) //These species already have strong darksight by default.

/datum/trait/positive/darksight_plus
	name = "Darksight, Major"
	desc = "Allows you to see in the dark for the whole screen."
	cost = 2
	var_changes = list("darksight" = 8)
	custom_only = FALSE
	banned_species = list(SPECIES_TAJARAN, SPECIES_SHADEKIN_CREW, SPECIES_SHADEKIN, SPECIES_XENOHYBRID, SPECIES_VULPKANIN, SPECIES_XENO, SPECIES_XENOCHIMERA, SPECIES_VASILISSAN, SPECIES_WEREBEAST) //These species already have strong darksight by default.

/datum/trait/positive/densebones
	name = "Dense Bones"
	desc = "Your bones (or robotic limbs) are more dense or stronger then what is considered normal. It is much harder to fracture your bones, yet pain from fractures is much more intense. Bones require 50% more damage to break, and deal 2x pain on break."
	cost = 3
	excludes = list(/datum/trait/negative/hollow)

/datum/trait/positive/densebones/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	for(var/obj/item/organ/external/organ in H.organs)
		if(istype(organ))
			organ.min_broken_damage *= 1.5
			organ.brokenpain *= 2

/datum/trait/positive/lowpressureresminor // Same as original trait with cost reduced, much more useful as filler.
	name = "Low Pressure Resistance, Minor"
	desc = "Your body is more resistant to low pressures and you can breathe better in those conditions. Pretty simple."
	cost = 1
	var_changes = list("hazard_low_pressure" = HAZARD_LOW_PRESSURE*0.66, "warning_low_pressure" = WARNING_LOW_PRESSURE*0.66, "minimum_breath_pressure" = 16*0.66)
	excludes = list(/datum/trait/positive/lowpressureresmajor,/datum/trait/positive/pressureres,/datum/trait/positive/pressureresmajor)

/datum/trait/positive/lowpressureresmajor // Still need an oxygen tank, otherwise you'll suffocate.
	name = "Low Pressure Resistance, Major"
	desc = "Your body is immune to low pressures and you can breathe significantly better in low-pressure conditions, though you'll still need an oxygen supply."
	cost = 2
	var_changes = list("hazard_low_pressure" = HAZARD_LOW_PRESSURE*0, "warning_low_pressure" = WARNING_LOW_PRESSURE*0, "minimum_breath_pressure" = 16*0.33)
	excludes = list(/datum/trait/positive/lowpressureresminor,/datum/trait/positive/pressureres,/datum/trait/positive/pressureresmajor)

/datum/trait/positive/highpressureresminor // Increased high pressure cap as previous amount was neglible.
	name = "High Pressure Resistance, Minor"
	desc = "Your body is more resistant to high pressures. Pretty simple."
	cost = 1
	var_changes = list("hazard_high_pressure" = HAZARD_HIGH_PRESSURE*2, "warning_high_pressure" = WARNING_HIGH_PRESSURE*2)
	excludes = list(/datum/trait/positive/highpressureresmajor,/datum/trait/positive/pressureres,/datum/trait/positive/pressureresmajor)

/datum/trait/positive/highpressureresmajor
	name = "High Pressure Resistance, Major"
	desc = "Your body is significantly more resistant to high pressures. Pretty simple."
	cost = 2
	var_changes = list("hazard_high_pressure" = HAZARD_HIGH_PRESSURE*4, "warning_high_pressure" = WARNING_HIGH_PRESSURE*4)
	excludes = list(/datum/trait/positive/highpressureresminor,/datum/trait/positive/pressureres,/datum/trait/positive/pressureresmajor)

/datum/trait/positive/pressureres
	name = "General Pressure Resistance"
	desc = "Your body is much more resistant to both high and low pressures. Pretty simple."
	cost = 3
	var_changes = list("hazard_high_pressure" = HAZARD_HIGH_PRESSURE*3,
					   "warning_high_pressure" = WARNING_HIGH_PRESSURE*3,
					   "hazard_low_pressure" = HAZARD_LOW_PRESSURE*0.33,
					   "warning_low_pressure" = WARNING_LOW_PRESSURE*0.33,
					   "minimum_breath_pressure" = 16*0.33
					   )
	excludes = list(/datum/trait/positive/lowpressureresminor,/datum/trait/positive/lowpressureresmajor,/datum/trait/positive/highpressureresminor,/datum/trait/positive/highpressureresmajor,/datum/trait/positive/pressureresmajor)

/datum/trait/positive/pressureresmajor // If they have the points and want more freedom with atmos, let them.
	name = "General Pressure Resistance, Major"
	desc = "Your body is significantly more resistant to high pressures and immune to low pressures, though you'll still need an oxygen supply."
	cost = 4
	var_changes = list("hazard_high_pressure" = HAZARD_HIGH_PRESSURE*4,
					   "warning_high_pressure" = WARNING_HIGH_PRESSURE*4,
					   "hazard_low_pressure" = HAZARD_LOW_PRESSURE*0,
					   "warning_low_pressure" = WARNING_LOW_PRESSURE*0,
					   "minimum_breath_pressure" = 16*0.33
					   )
	excludes = list(/datum/trait/positive/lowpressureresminor,/datum/trait/positive/lowpressureresmajor,/datum/trait/positive/highpressureresminor,/datum/trait/positive/highpressureresmajor,/datum/trait/positive/pressureres)

/datum/trait/positive/photosynth
	name = "Photosynthesis"
	desc = "Your body is able to produce nutrition from being in light."
	cost = 3
	var_changes = list("photosynthesizing" = TRUE)
	can_take = ORGANICS|SYNTHETICS //Synths actually use nutrition, just with a fancy covering.

/datum/trait/positive/rad_resistance
	name = "Radiation Resistance"
	desc = "You are generally more resistant to radiation, and it dissipates faster from your body."
	cost = 1
	var_changes = list("radiation_mod" = 0.65, "rad_removal_mod" = 3.5, "rad_levels" = list("safe" = 20, "danger_1" = 75, "danger_2" = 100, "danger_3" = 200))

/datum/trait/positive/rad_resistance_extreme
	name = "Radiation Resistance, Major"
	desc = "You are much more resistant to radiation, and it dissipates much faster from your body."
	cost = 2
	var_changes = list("radiation_mod" = 0.5, "rad_removal_mod" = 5, "rad_levels" = list("safe" = 40, "danger_1" = 100, "danger_2" = 150, "danger_3" = 250))

/datum/trait/positive/rad_immune
	name = "Radiation Immunity"
	desc = "For whatever reason, be it a more dense build or some quirk of your genetic code, your body is completely immune to radiation."
	cost = 3
	var_changes = list("radiation_mod" = 0.0, "rad_removal_mod" = 10, "rad_levels" = list("safe" = 300, "danger_1" = 300, "danger_2" = 300, "danger_3" = 300))

/datum/trait/positive/more_blood
	name = "Blood Volume, High"
	desc = "You have 50% more blood."
	cost = 2
	var_changes = list("blood_volume" = 840)
	excludes = list(/datum/trait/positive/more_blood_extreme,/datum/trait/negative/less_blood,/datum/trait/negative/less_blood_extreme)
	can_take = ORGANICS

/datum/trait/positive/more_blood_extreme
	name = "Blood Volume, Very High"
	desc = "You have 150% more blood."
	cost = 4
	var_changes = list("blood_volume" = 1400)
	excludes = list(/datum/trait/positive/more_blood,/datum/trait/negative/less_blood,/datum/trait/negative/less_blood_extreme)
	can_take = ORGANICS

/datum/trait/positive/heavyweight
	name = "Heavyweight"
	desc = "You are more heavyweight or otherwise more sturdy than most species, and as such, more resistant to knockdown effects and stuns. Stuns are only half as effective on you, and neither players nor mobs can trade places with you or bump you out of the way."
	cost = 2
	var_changes = list("stun_mod" = 0.5, "weaken_mod" = 0.5) // Stuns are 50% as effective - a stun of 3 seconds will be 2 seconds due to rounding up. Set to 0.5 to be in-line with the trait's description. (Weaken is used alongside stun to prevent aiming.)

/datum/trait/positive/heavyweight/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.mob_size = MOB_LARGE
	H.mob_bump_flag = HEAVY

/datum/trait/positive/table_passer
	name = "Table Passer"
	desc = "You move over or under tables with ease of a Teshari."
	cost = 2
	has_preferences = list("pass_table" = list(TRAIT_PREF_TYPE_BOOLEAN, "On spawn", TRAIT_NO_VAREDIT_TARGET, TRUE))

/datum/trait/positive/table_passer/apply(var/datum/species/S,var/mob/living/carbon/human/H, var/list/trait_prefs)
	..()
	if (trait_prefs?["pass_table"] || !trait_prefs)
		H.pass_flags |= PASSTABLE
	add_verb(H,/mob/living/proc/toggle_pass_table) //CHOMPEdit TGPanel

/datum/trait/positive/grappling_expert
	name = "Grappling Expert"
	desc = "Your grabs are much harder to escape from, and you are better at escaping from other's grabs!"
	cost = 3
	var_changes = list("grab_resist_divisor_victims" = 1.5, "grab_resist_divisor_self" = 0.5, "grab_power_victims" = -1, "grab_power_self" = 1)

/datum/trait/positive/absorbent
	name = "Absorbent"
	desc = "You are able to clean messes just by walking over them, and gain nutrition from doing so!"
	cost = 1
	special_env = TRUE
	excludes = list(/datum/trait/negative/slipperydirt)

/datum/trait/positive/endurance_high
	cost = 3
	excludes = list(/datum/trait/positive/endurance_very_high, /datum/trait/positive/endurance_extremely_high) // CHOMPEdit: Increased Endurance.
	// excludes = list(/datum/trait/positive/brute_resist, /datum/trait/positive/minor_brute_resist, /datum/trait/positive/minor_burn_resist, /datum/trait/positive/burn_resist)
	// Tankiness at the cost of severe downsides should be allowed - we have a large number of negatives that hurt hard, but you can't take many positives.

/datum/trait/positive/brute_resist
	excludes = list(/datum/trait/positive/minor_brute_resist, /datum/trait/positive/brute_resist_plus) // Tankiness at the cost of severe downsides should be allowed - we have a large number of negatives that hurt hard, but you can't take many positives.

/datum/trait/positive/minor_brute_resist
	excludes = list(/datum/trait/positive/brute_resist, /datum/trait/positive/brute_resist_plus) // Tankiness at the cost of severe downsides should be allowed - we have a large number of negatives that hurt hard, but you can't take many positives.

/datum/trait/positive/burn_resist
	excludes = list(/datum/trait/positive/minor_burn_resist, /datum/trait/positive/burn_resist_plus) // Tankiness at the cost of severe downsides should be allowed - we have a large number of negatives that hurt hard, but you can't take many positives.

/datum/trait/positive/minor_burn_resist
	excludes = list(/datum/trait/positive/burn_resist, /datum/trait/positive/burn_resist_plus) // Tankiness at the cost of severe downsides should be allowed - we have a large number of negatives that hurt hard, but you can't take many positives.

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
	on_created_text = span_danger("You suddenly feel adrenaline pumping through your veins as your body refuses to give up! You feel stronger, and faster, and the pain fades away quickly.")
	on_expired_text = span_danger("You feel your body finally give in once more as the adrenaline subsides. The pain returns in full blast, along with your strength fading once more.")

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
	on_created_text = span_danger("Your body aches and groans, forcing you into a period of rest as it recovers from the intense adrenaline rush.")
	on_expired_text = span_notice("You finally recover from your adrenaline rush, your body returning to its normal state.")

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
	..()
	add_verb(H,/mob/living/proc/insect_sting) //CHOMPEdit TGPanel

// TANKINESS LETS GOOOOOOOOO
/datum/trait/positive/burn_resist_plus // Equivalent to Burn Weakness Major, cannot be taken at the same time.
	name = "Burn Resist, Major"
	desc = "Adds 40% resistance to burn damage sources."
	cost = 3 // Exact Opposite of Burn Weakness Major, except Weakness Major is 50% incoming, this is -40% incoming.
	var_changes = list("burn_mod" = 0.6)
	excludes = list(/datum/trait/positive/burn_resist, /datum/trait/positive/minor_burn_resist)

/datum/trait/positive/brute_resist_plus // Equivalent to Brute Weakness Major, cannot be taken at the same time.
	name = "Brute Resist, Major"
	desc = "Adds 40% resistance to brute damage sources."
	cost = 3 // Exact Opposite of Brute Weakness Major, except Weakness Major is 50% incoming, this is -40% incoming.
	var_changes = list("brute_mod" = 0.6)
	excludes = list(/datum/trait/positive/brute_resist, /datum/trait/positive/minor_brute_resist)

/datum/trait/positive/endurance_very_high
	name = "High Endurance, Major"
	desc = "Increases your maximum total hitpoints to 150. You require 300 damage in total to die, compared to 200 normally. You will still go into crit after losing 150 HP, compared to crit at 100 HP."
	cost = 6 // This should cost a LOT, because your total health becomes 300 to be fully dead, rather than 200 normally, or 250 for High Endurance. HE costs 3, double it here.
	var_changes = list("total_health" = 150)
	excludes = list(/datum/trait/positive/endurance_high, /datum/trait/positive/endurance_extremely_high)

/datum/trait/positive/endurance_very_high/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.setMaxHealth(S.total_health)


/datum/trait/positive/endurance_extremely_high
	name = "High Endurance, Extreme"
	desc = "Increases your maximum total hitpoints to 175. You require 350 damage in total to die, compared to 200 normally. You will still go into crit after losing 175 HP, compared to crit at 100 HP."
	cost = 9 // This should cost a LOT, because your total health becomes 350 to be fully dead, rather than 200 normally, or 250 for High Endurance. HE costs 3, this costs 3x it.
	var_changes = list("total_health" = 175)
	excludes = list(/datum/trait/positive/endurance_high, /datum/trait/positive/endurance_very_high)

/datum/trait/positive/endurance_extremely_high/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.setMaxHealth(S.total_health)

// CHOMPNote: Reshuffling traits to match our current upstream, VORE.
/datum/trait/positive/pain_tolerance_minor // Minor Pain Tolerance, 10% reduced pain
	name = "Pain Tolerance, Minor"
	desc = "You are slightly more resistant to pain than most, and experience 10% less pain from all sources."
	cost = 1
	var_changes = list("pain_mod" = 0.9)

/datum/trait/positive/pain_tolerance
	name = "Pain Tolerance"
	desc = "You are noticeably more resistant to pain than most, and experience 20% less pain from all sources."
	cost = 2
	var_changes = list("pain_mod" = 0.8)

/datum/trait/positive/pain_tolerance_advanced // High Pain Intolerance is 50% incoming pain, but this is 40% reduced incoming pain.
	name = "Pain Tolerance, Major"
	desc = "You are extremely resistant to pain sources, and experience 40% less pain from all sources."
	cost = 3 // Equivalent to High Pain Intolerance, but less pain resisted for balance reasons.
	var_changes = list("pain_mod" = 0.6)


/datum/trait/positive/improved_biocompat
	name = "Improved Biocompatibility"
	desc = "Your body is naturally (or artificially) more receptive to healing chemicals without being vulnerable to the 'bad stuff'. You heal more efficiently from most chemicals, with no other drawbacks. Remember to note this down in your medical records! Chems heal for 20% more."
	cost = 2
	var_changes = list("chem_strength_heal" = 1.2)

/datum/trait/positive/photoresistant_plus // YW added Trait
	name = "Photoresistance, Major"
	desc = "Decreases stun duration from flashes and other light-based stuns and disabilities by 50%."
	cost = 2
	var_changes = list("flash_mod" = 0.5)

/datum/trait/positive/hardy_extreme
	name = "Hardy, Extreme"
	desc = "Allows you to carry heavy equipment with no slowdown at all."
	cost = 3
	var_changes = list("item_slowdown_mod" = 0.0)
	excludes = list(/datum/trait/positive/speed_fast,/datum/trait/positive/hardy,/datum/trait/positive/hardy_plus)

/datum/trait/positive/bloodsucker_plus
	name = "Evolved Bloodsucker"
	desc = "Makes you able to gain nutrition by draining blood as well as eating food. To compensate, you get fangs that can be used to drain blood from prey."
	cost = 1
	var_changes = list("organic_food_coeff" = 0.5) // Hopefully this works???
	excludes = list(/datum/trait/neutral/bloodsucker)

/datum/trait/positive/bloodsucker_plus/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/carbon/human/proc/bloodsuck) //CHOMPEdit TGPanel

/datum/trait/positive/sonar
	name ="Perceptive Hearing"
	desc = "You can hear slight vibrations in the air very easily, if you focus."
	cost = 1

/datum/trait/positive/sonar/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/carbon/human/proc/sonar_ping) //CHOMPEdit TGPanel

/datum/trait/positive/toxin_gut
	name ="Robust Gut"
	desc = "You are immune to ingested toxins. Does not protect from possible harm caused by other drugs, meds, allergens etc."
	cost = 1

/datum/trait/positive/toxin_gut/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.toxin_gut = TRUE

/datum/trait/positive/nobreathe // CHOMPedit
	name = "Breathless"
	desc = "You or your species have adapted to no longer require lungs, and as such no longer need to breathe!"

	can_take = ORGANICS

	var_changes = list("breath_type" = "null", "poison_type" = "null", "exhale_type" = "null", "water_breather" = "TRUE")
	excludes = list(/datum/trait/negative/breathes/phoron,
					/datum/trait/negative/breathes/nitrogen,
					/datum/trait/positive/light_breather,
					/datum/trait/negative/deep_breather
)
	cost = 6

/datum/trait/positive/nobreathe/apply(var/datum/species/S, var/mob/living/carbon/human/H)
	..()
	H.does_not_breathe = 1
	var/obj/item/organ/internal/breathy = H.internal_organs_by_name[O_LUNGS]
	if(!breathy)
		return
	H.internal_organs -= breathy
	qdel(breathy)
