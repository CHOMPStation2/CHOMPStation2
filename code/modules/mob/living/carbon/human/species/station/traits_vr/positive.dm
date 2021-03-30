#define ORGANICS	1
#define SYNTHETICS	2

/datum/trait/speed_fast
	name = "Haste"
	desc = "Allows you to move faster on average than baseline."
	cost = 3
	var_changes = list("slowdown" = -0.5)
//CHOMPStation Removal Start
/*
/datum/trait/speed_fast_plus
	name = "Major Haste"
	desc = "Allows you to move MUCH faster on average than baseline."
	cost = 5
	var_changes = list("slowdown" = -1.0)
*/
//CHOMPStation Removal End
/datum/trait/hardy
	name = "Hardy"
	desc = "Allows you to carry heavy equipment with less slowdown."
	cost = 1
	var_changes = list("item_slowdown_mod" = 0.5)

/datum/trait/hardy_plus
	name = "Major Hardy"
	desc = "Allows you to carry heavy equipment with almost no slowdown."
	cost = 2
	var_changes = list("item_slowdown_mod" = 0.1)

/datum/trait/endurance_high
	name = "High Endurance"
	desc = "Increases your maximum total hitpoints to 125"
	cost = 2
	var_changes = list("total_health" = 125)

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		H.setMaxHealth(S.total_health)
//CHOMPStation Removal Start
/*
/datum/trait/endurance_very_high
	name = "Very High Endurance"
	desc = "Increases your maximum total hitpoints to 150"
	cost = 3
	var_changes = list("total_health" = 150)

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		H.setMaxHealth(S.total_health)

/datum/trait/endurance_extremely_high
	name = "Extremely High Endurance"
	desc = "Increases your maximum total hitpoints to 175"
	cost = 4
	var_changes = list("total_health" = 175)

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		H.setMaxHealth(S.total_health)
*/
//CHOMPStation Removal End
/datum/trait/nonconductive
	name = "Non-Conductive"
	desc = "Decreases your susceptibility to electric shocks by 25%."
	cost = 2 //This effects tasers!
	var_changes = list("siemens_coefficient" = 0.75)

/datum/trait/nonconductive_plus
	name = "Major Non-Conductive"
	desc = "Decreases your susceptibility to electric shocks by 50%."
	cost = 3 //Let us not forget this effects tasers!
	var_changes = list("siemens_coefficient" = 0.5)
//CHOMPStation Removal Start
/*
/datum/trait/nonconductive_robust
	name = "Robustly Non-Conductive"
	desc = "Decreases your susceptibility to electric shocks by 75%."
	cost = 4 //Let us not forget this effects tasers!
	var_changes = list("siemens_coefficient" = 0.25)
*/
//CHOMPStation Removal End
/datum/trait/darksight
	name = "Darksight"
	desc = "Allows you to see a short distance in the dark."
	cost = 1
	var_changes = list("darksight" = 3)

/datum/trait/darksight_plus
	name = "Darksight (Major)"
	desc = "Allows you to see in the dark for almost the whole screen."
	cost = 2
	var_changes = list("darksight" = 6)

/datum/trait/melee_attack
	name = "Sharp Melee"
	desc = "Provides sharp melee attacks that do slightly more damage."
	cost = 1
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp))

/datum/trait/melee_attack_fangs
	name = "Sharp Melee & Numbing Fangs"
	desc = "Provides sharp melee attacks that do slightly more damage, along with fangs that makes the person bit unable to feel their body or pain."
	cost = 2
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp, /datum/unarmed_attack/bite/sharp/numbing))

/datum/trait/fangs
	name = "Numbing Fangs"
	desc = "Provides fangs that makes the person bit unable to feel their body or pain."
	cost = 1
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp/numbing))

/datum/trait/minor_brute_resist
	name = "Minor Brute Resist"
	desc = "Adds 10% resistance to brute damage sources."
	cost = 1
	var_changes = list("brute_mod" = 0.9)

/datum/trait/brute_resist
	name = "Brute Resist"
	desc = "Adds 20% resistance to brute damage sources."
	cost = 2
	var_changes = list("brute_mod" = 0.8)
//CHOMPStation Removal Start
/*
/datum/trait/brute_resist_plus
	name = "Major Brute Resist"
	desc = "Adds 40% resistance to brute damage sources."
	cost = 3
	var_changes = list("brute_mod" = 0.6)
*/
//CHOMPStation Removal End
/datum/trait/minor_burn_resist
	name = "Minor Burn Resist"
	desc = "Adds 10% resistance to burn damage sources."
	cost = 1
	var_changes = list("burn_mod" = 0.9)

/datum/trait/burn_resist
	name = "Burn Resist"
	desc = "Adds 20% resistance to burn damage sources."
	cost = 2
	var_changes = list("burn_mod" = 0.8)
//CHOMPStation Removal Start
/*
/datum/trait/burn_resist_plus
	name = "Major Burn Resist"
	desc = "Adds 40% resistance to burn damage sources."
	cost = 3
	var_changes = list("burn_mod" = 0.6)
*/
//CHOMPStation Removal End

//YW ADDITIONS START
/datum/trait/improved_biocompat
	name = "Improved Biocompatibility"
	desc = "Your body is naturally (or artificially) more receptive to healing chemicals without being vulnerable to the 'bad stuff'. You heal more efficiently from most chemicals, with no other drawbacks. Remember to note this down in your medical records!"
	cost = 2
	var_changes = list("chem_strength_heal" = 1.2)

/datum/trait/alcohol_tolerance_advanced
	name = "Liver of Steel"
	desc = "Drinks tremble before your might! You can hold your alcohol twice as well as those blue-bellied barnacle boilers! You may wish to note this down in your medical records."
	cost = 1
	var_changes = list("alcohol_mod" = 0.5)

/datum/trait/alcohol_immunity
	name = "Liver of Durasteel"
	desc = "You've drunk so much that most booze doesn't even faze you. It takes something like a Pan-Galactic or a pint of Deathbell for you to even get slightly buzzed. You may wish to note this down in your medical records."
	cost = 2
	var_changes = list("alcohol_mod" = 0.25)

/datum/trait/pain_tolerance_basic
	name = "Pain Tolerant"
	desc = "You're a little more resistant to pain than most, and experience 10% less pain from from all sources."
	cost = 1
	var_changes = list("pain_mod" = 0.9)

/datum/trait/pain_tolerance_advanced
	name = "High Pain Tolerance"
	desc = "You are noticeably more resistant to pain than most, and experience 20% less pain from all sources."
	cost = 2
	var_changes = list("pain_mod" = 0.8)

//YW ADDITIONS END

/datum/trait/photoresistant
	name = "Photoresistance"
	desc = "Decreases stun duration from flashes and other light-based stuns and disabilities by 25%"
	cost = 1
	var_changes = list("flash_mod" = 0.75)

/datum/trait/photoresistant_plus
	name = "Major Photoresistance"
	desc = "Decreases stun duration from flashes and other light-based stuns and disabilities by 50%"
	cost = 2
	var_changes = list("flash_mod" = 0.5)

/datum/trait/winged_flight
	name = "Winged Flight"
	desc = "Allows you to fly by using your wings. Don't forget to bring them!"
	cost = 1

/datum/trait/winged_flight/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/flying_toggle
	H.verbs |= /mob/living/proc/start_wings_hovering

/datum/trait/hardfeet
	name = "Hard Feet"
	desc = "Makes your nice clawed, scaled, hooved, armored, or otherwise just awfully calloused feet immune to glass shards."
	cost = 1
	var_changes = list("flags" = NO_MINOR_CUT) //Checked the flag is only used by shard stepping.
//CHOMPStation Removal Start
/*
/datum/trait/antiseptic_saliva
	name = "Antiseptic Saliva"
	desc = "Your saliva has especially strong antiseptic properties that can be used to heal small wounds."
	cost = 1

/datum/trait/antiseptic_saliva/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/lick_wounds
*/
//CHOMPStation Removal End

/datum/trait/traceur
	name = "Traceur"
	desc = "You're capable of parkour and can *flip over low objects (most of the time)."
	cost = 2
	var_changes = list("agility" = 90)

// YW Addition
/datum/trait/bloodsucker_plus
	name = "Evolved Bloodsucker"
	desc = "Makes you able to gain nutrition by draining blood as well as eating food. To compensate, you get fangs that can be used to drain blood from prey."
	cost = 1
	var_changes = list("organic_food_coeff" = 0.5) // Hopefully this works???
	excludes = list(/datum/trait/bloodsucker)

/datum/trait/bloodsucker_plus/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/bloodsuck

/datum/trait/sonar
	name="Perceptive Hearing"
	desc = "You can hear slight vibrations in the air very easily, if you focus."
	cost = 1
/datum/trait/sonar/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/sonar_ping


/datum/trait/coldadapt
	name = "Cold-Adapted"
	desc = "You are able to withstand much colder temperatures than other species, and can even be comfortable in extremely cold environments. You are also more vulnerable to hot environments as a consequence of these adaptations."
	cost = 2
	var_changes = list("cold_level_1" = 200,  "cold_level_2" = 150, "cold_level_3" = 90, "breath_cold_level_1" = 180, "breath_cold_level_2" = 100, "breath_cold_level_3" = 60, "cold_discomfort_level" = 210, "heat_level_1" = 305, "heat_level_2" = 360, "heat_level_3" = 700, "breath_heat_level_1" = 345, "breath_heat_level_2" = 380, "breath_heat_level_3" = 780, "heat_discomfort_level" = 295)
	excludes = list(/datum/trait/hotadapt)
	can_take = ORGANICS // CHOMP edit

/datum/trait/hotadapt
	name = "Heat-Adapted"
	desc = "You are able to withstand much hotter temperatures than other species, and can even be comfortable in extremely hot environments. You are also more vulnerable to cold environments as a consequence of these adaptations."
	cost = 2
	var_changes = list("heat_level_1" = 420, "heat_level_2" = 460, "heat_level_3" = 1100, "breath_heat_level_1" = 440, "breath_heat_level_2" = 510, "breath_heat_level_3" = 1500, "heat_discomfort_level" = 390, "cold_level_1" = 280, "cold_level_2" = 220, "cold_level_3" = 140, "breath_cold_level_1" = 260, "breath_cold_level_2" = 240, "breath_cold_level_3" = 120, "cold_discomfort_level" = 280)
	excludes = list(/datum/trait/coldadapt)
	can_take = ORGANICS // CHOMP edit
// YW Addition end

/datum/trait/snowwalker
	name = "Snow Walker"
	desc = "You are able to move unhindered on snow."
	cost = 2 //YW EDIT
	var_changes = list("snow_movement" = -2)

/datum/trait/weaver
	name = "Weaver"
	desc = "You can produce silk and create various articles of clothing and objects."
	cost = 2
	var_changes = list("is_weaver" = 1)

/datum/trait/weaver/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/check_silk_amount
	H.verbs |= /mob/living/carbon/human/proc/toggle_silk_production
	H.verbs |= /mob/living/carbon/human/proc/weave_structure
	H.verbs |= /mob/living/carbon/human/proc/weave_item
	H.verbs |= /mob/living/carbon/human/proc/set_silk_color
