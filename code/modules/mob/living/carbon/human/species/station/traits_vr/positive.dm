#define ORGANICS	1
#define SYNTHETICS	2

/datum/trait/positive
	category = 1

/datum/trait/positive/speed_fast
	name = "Haste"
	desc = "Allows you to move faster on average than baseline."
	cost = 3
	var_changes = list("slowdown" = -0.5)

/datum/trait/positive/hardy
	name = "Hardy"
	desc = "Allows you to carry heavy equipment with less slowdown."
	cost = 1
	var_changes = list("item_slowdown_mod" = 0.5)

/datum/trait/positive/hardy_plus
	name = "Major Hardy"
	desc = "Allows you to carry heavy equipment with almost no slowdown."
	cost = 2
	var_changes = list("item_slowdown_mod" = 0.25)

/datum/trait/positive/endurance_high
	name = "High Endurance"
	desc = "Increases your maximum total hitpoints to 125"
	cost = 2
	var_changes = list("total_health" = 125)

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		H.setMaxHealth(S.total_health)

/datum/trait/positive/nonconductive
	name = "Non-Conductive"
	desc = "Decreases your susceptibility to electric shocks by a 25% amount." //CHOMP Edit
	cost = 2 //This effects tasers!
	var_changes = list("siemens_coefficient" = 0.75) //CHOMP Edit

/datum/trait/positive/nonconductive_plus
	name = "Major Non-Conductive"
	desc = "Decreases your susceptibility to electric shocks by a 50% amount." //CHOMP Edit
	cost = 3 //Let us not forget this effects tasers!
	var_changes = list("siemens_coefficient" = 0.5) //CHOMP Edit

/datum/trait/positive/darksight
	name = "Darksight"
	desc = "Allows you to see a short distance in the dark and 10% more susceptible to flashes." //CHOMP Edit
	cost = 1
	var_changes = list("darksight" = 3)  //CHOMP Edit

/datum/trait/positive/darksight_plus
	name = "Darksight (Major)"
	desc = "Allows you to see in the dark for almost the whole screen and 20% more susceptible to flashes." //CHOMP Edit
	cost = 2
	var_changes = list("darksight" = 6)  //CHOMP Edit

/datum/trait/positive/melee_attack
	name = "Sharp Melee"
	desc = "Provides sharp melee attacks that do slightly more damage."
	cost = 1
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp))

/datum/trait/positive/melee_attack_fangs
	name = "Sharp Melee & Numbing Fangs"
	desc = "Provides sharp melee attacks that do slightly more damage, along with fangs that makes the person bit unable to feel their body or pain."
	cost = 2
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp, /datum/unarmed_attack/bite/sharp/numbing))

/datum/trait/positive/fangs
	name = "Numbing Fangs"
	desc = "Provides fangs that makes the person bit unable to feel their body or pain."
	cost = 1
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp/numbing))

/datum/trait/positive/minor_brute_resist
	name = "Minor Brute Resist"
	desc = "Adds 10% resistance to brute damage sources." //CHOMP Edit
	cost = 1 //CHOMP Edit
	var_changes = list("brute_mod" = 0.9) //CHOMP Edit

/datum/trait/positive/brute_resist
	name = "Brute Resist"
	desc = "Adds 20% resistance to brute damage sources." //CHOMP Edit
	cost = 2 //CHOMP Edit
	var_changes = list("brute_mod" = 0.8) //CHOMP Edit
	//excludes = list(/datum/trait/positive/minor_burn_resist,/datum/trait/positive/burn_resist) //CHOMP disable, this is already handled in positive_ch.dm

/datum/trait/positive/minor_burn_resist
	name = "Minor Burn Resist"
	desc = "Adds 10% resistance to burn damage sources." //CHOMP Edit
	cost = 1 //CHOMP Edit
	var_changes = list("burn_mod" = 0.9) //CHOMP Edit

/datum/trait/positive/burn_resist
	name = "Burn Resist"
	desc = "Adds 20% resistance to burn damage sources." //CHOMP Edit
	cost = 2 //CHOMP Edit
	var_changes = list("burn_mod" = 0.8) //CHOMP Edit
	//excludes = list(/datum/trait/positive/minor_brute_resist,/datum/trait/positive/brute_resist) //CHOMP disable, this is already handled in positive_ch.dm
	
//YW ADDITIONS START
/datum/trait/positive/improved_biocompat
	name = "Improved Biocompatibility"
	desc = "Your body is naturally (or artificially) more receptive to healing chemicals without being vulnerable to the 'bad stuff'. You heal more efficiently from most chemicals, with no other drawbacks. Remember to note this down in your medical records!"
	cost = 2
	var_changes = list("chem_strength_heal" = 1.2)

/datum/trait/positive/pain_tolerance_advanced
	name = "High Pain Tolerance"
	desc = "You are noticeably more resistant to pain than most, and experience 20% less pain from all sources."
	cost = 2
	var_changes = list("pain_mod" = 0.8)

//YW ADDITIONS END


/datum/trait/positive/photoresistant
	name = "Photoresistant"
	desc = "Decreases stun duration from flashes and other light-based stuns and disabilities by 25%" //CHOMP Edit
	cost = 1
	var_changes = list("flash_mod" = 0.75) //CHOMP Edit

//YW add
/datum/trait/positive/photoresistant_plus
	name = "Major Photoresistance"
	desc = "Decreases stun duration from flashes and other light-based stuns and disabilities by 50%"
	cost = 2
	var_changes = list("flash_mod" = 0.5)
//YW end

/datum/trait/positive/winged_flight
	name = "Winged Flight"
	desc = "Allows you to fly by using your wings. Don't forget to bring them!"
	cost = 0

/datum/trait/positive/winged_flight/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/flying_toggle
	H.verbs |= /mob/living/proc/start_wings_hovering

/datum/trait/positive/hardfeet
	name = "Hard Feet"
	desc = "Makes your nice clawed, scaled, hooved, armored, or otherwise just awfully calloused feet immune to glass shards."
	cost = 1 //CHOMP Edit
	var_changes = list("flags" = NO_MINOR_CUT) //Checked the flag is only used by shard stepping.

//CHOMPStation Removal Start
/*

/datum/trait/positive/antiseptic_saliva
	name = "Antiseptic Saliva"
	desc = "Your saliva has especially strong antiseptic properties that can be used to heal small wounds."
	cost = 1

/datum/trait/positive/antiseptic_saliva/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/lick_wounds
*/
//CHOMPStation Removal End

/datum/trait/positive/traceur
	name = "Traceur"
	desc = "You're capable of parkour and can *flip over low objects (most of the time)."
	cost = 2
	var_changes = list("agility" = 90)

// YW Addition
/datum/trait/positive/bloodsucker_plus
	name = "Evolved Bloodsucker"
	desc = "Makes you able to gain nutrition by draining blood as well as eating food. To compensate, you get fangs that can be used to drain blood from prey."
	cost = 1
	var_changes = list("organic_food_coeff" = 0.5) // Hopefully this works???
	excludes = list(/datum/trait/neutral/bloodsucker)

/datum/trait/positive/bloodsucker_plus/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/bloodsuck

/datum/trait/positive/sonar
	name="Perceptive Hearing"
	desc = "You can hear slight vibrations in the air very easily, if you focus."
	cost = 1
	
/datum/trait/positive/sonar/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/sonar_ping
// YW Addition end

/datum/trait/positive/snowwalker
	name = "Snow Walker"
	desc = "You are able to move unhindered on snow."
	cost = 1
	var_changes = list("snow_movement" = -2)

/datum/trait/positive/weaver
	name = "Weaver"
	desc = "You can produce silk and create various articles of clothing and objects."
	cost = 2
	var_changes = list("is_weaver" = 1)

/datum/trait/positive/weaver/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/check_silk_amount
	H.verbs |= /mob/living/carbon/human/proc/toggle_silk_production
	H.verbs |= /mob/living/carbon/human/proc/weave_structure
	H.verbs |= /mob/living/carbon/human/proc/weave_item
	H.verbs |= /mob/living/carbon/human/proc/set_silk_color
