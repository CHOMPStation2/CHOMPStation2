/datum/trait/positive
	category = 1

/datum/trait/positive/speed_fast
	name = "Haste"
	desc = "Allows you to move faster on average than baseline."
	cost = 4 //CHOMPEdit
	var_changes = list("slowdown" = -0.5)
	excludes = list(/datum/trait/positive/hardy,/datum/trait/positive/hardy_extreme,/datum/trait/positive/hardy_plus,/datum/trait/positive/speed_fast_minor)
	

/datum/trait/positive/hardy
	name = "Hardy"
	desc = "Allows you to carry heavy equipment with less slowdown."
	cost = 1
	var_changes = list("item_slowdown_mod" = 0.5)
	excludes = list(/datum/trait/positive/hardy_extreme,/datum/trait/positive/hardy_plus,/datum/trait/positive/speed_fast)

/datum/trait/positive/hardy_plus
	name = "Hardy, Major"
	desc = "Allows you to carry heavy equipment with almost no slowdown."
	cost = 2
	var_changes = list("item_slowdown_mod" = 0.25)
	excludes = list(/datum/trait/positive/speed_fast,/datum/trait/positive/speed_fast_minor,/datum/trait/positive/hardy_extreme,/datum/trait/positive/hardy) // CHOMPEdit: Prevents Haste + Hardy being taken together.


/datum/trait/positive/endurance_high
	name = "High Endurance"
	desc = "Increases your maximum total hitpoints to 125. You require 250 damage in total to die, compared to 200 normally. You will still go into crit after losing 125 HP, compared to crit at 100 HP." // CHOMPEdit: Clarity for players' sake.
	cost = 3 // CHOMPEdit
	var_changes = list("total_health" = 125)

/datum/trait/positive/endurance_high/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.setMaxHealth(S.total_health)

/datum/trait/positive/nonconductive
	name = "Non-Conductive"
	desc = "Decreases your susceptibility to electric shocks by 25%." //CHOMP Edit - GRAMMAR PLS.
	cost = 2 //This effects tasers!
	var_changes = list("siemens_coefficient" = 0.75) //CHOMP Edit

/datum/trait/positive/nonconductive_plus
	name = "Non-Conductive, Major"
	desc = "Decreases your susceptibility to electric shocks by 50%." //CHOMP Edit - GRAMMAR PLS.
	cost = 3 //Let us not forget this effects tasers!
	var_changes = list("siemens_coefficient" = 0.5) //CHOMP Edit
	
/*   //Chompedit, moving to Positive_ch.dm so it wont be messed with from upstream
/datum/trait/positive/darksight
	name = "Darksight"
	desc = "Allows you to see a short distance in the dark and 10% more susceptible to flashes." //CHOMP Edit
	cost = 1
	var_changes = list("darksight" = 3)  //CHOMP Edit

/datum/trait/positive/darksight_plus
	name = "Darksight, Major"
	desc = "Allows you to see in the dark for almost the whole screen and 20% more susceptible to flashes." //CHOMP Edit
	cost = 2
	var_changes = list("darksight" = 6)  //CHOMP Edit
*/ 
/datum/trait/positive/melee_attack
	name = "Special Attack: Sharp Melee" // CHOMPEdit: Trait Organization for easier browsing. TODO: Proper categorization of 'health/ability/resist/etc'
	desc = "Provides sharp melee attacks that do slightly more damage."
	cost = 1
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp))

/datum/trait/positive/melee_attack_fangs
	name = "Special Attack: Sharp Melee & Numbing Fangs" // CHOMPEdit: Trait Organization for easier browsing. TODO: Proper categorization of 'health/ability/resist/etc'
	desc = "Provides sharp melee attacks that do slightly more damage, along with fangs that makes the person bit unable to feel their body or pain."
	cost = 2
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp, /datum/unarmed_attack/bite/sharp/numbing))

/datum/trait/positive/fangs
	name = "Special Attack: Numbing Fangs" // CHOMPEdit: Trait Organization for easier browsing. TODO: Proper categorization of 'health/ability/resist/etc'
	desc = "Provides fangs that makes the person bit unable to feel their body or pain."
	cost = 1
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp/numbing))

/datum/trait/positive/minor_brute_resist
	name = "Brute Resist, Minor"
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
	name = "Burn Resist, Minor"
	desc = "Adds 10% resistance to burn damage sources." //CHOMP Edit
	cost = 1 //CHOMP Edit
	var_changes = list("burn_mod" = 0.9) //CHOMP Edit

/datum/trait/positive/burn_resist
	name = "Burn Resist"
	desc = "Adds 20% resistance to burn damage sources." //CHOMP Edit
	cost = 2 //CHOMP Edit
	var_changes = list("burn_mod" = 0.8) //CHOMP Edit
	//excludes = list(/datum/trait/positive/minor_brute_resist,/datum/trait/positive/brute_resist) //CHOMP disable, this is already handled in positive_ch.dm
	


/datum/trait/positive/photoresistant
	name = "Photoresistant"
	desc = "Decreases stun duration from flashes and other light-based stuns and disabilities by 25%" //CHOMP Edit
	cost = 1
	var_changes = list("flash_mod" = 0.75) //CHOMP Edit

/datum/trait/positive/winged_flight
	name = "Winged Flight"
	desc = "Allows you to fly by using your wings. Don't forget to bring them!"
	cost = 0

/datum/trait/positive/winged_flight/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/flying_toggle
	H.verbs |= /mob/living/proc/start_wings_hovering

/datum/trait/positive/soft_landing
	name = "Soft Landing"
	desc = "You can fall from certain heights without suffering any injuries, be it via wings, lightness of frame or general dexterity."
	cost = 1
	var_changes = list("soft_landing" = TRUE)

/datum/trait/positive/hardfeet
	name = "Hard Feet"
	desc = "Makes your nice clawed, scaled, hooved, armored, or otherwise just awfully calloused feet immune to glass shards."
	cost = 1 //CHOMP Edit
	var_changes = list("flags" = NO_MINOR_CUT) //Checked the flag is only used by shard stepping.


// CHOMPEdit: This has been removed for two years, since Jan 2020, pending "review". Uncommenting as per tankiness increase PR.
/datum/trait/positive/antiseptic_saliva
	name = "Antiseptic Saliva"
	desc = "Your saliva has especially strong antiseptic properties that can be used to heal small wounds."
	cost = 1

/datum/trait/positive/antiseptic_saliva/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/lick_wounds

/datum/trait/positive/traceur
	name = "Traceur"
	desc = "You're capable of parkour and can *flip over low objects (most of the time)."
	cost = 1 //CHOMPEdit this is not worth 2 points
	var_changes = list("agility" = 90)

/datum/trait/positive/snowwalker
	name = "Snow Walker"
	desc = "You are able to move unhindered on snow."
	cost = 1
	var_changes = list("snow_movement" = -2)

/datum/trait/positive/weaver
	name = "Weaver"
	desc = "You can produce silk and create various articles of clothing and objects."
	category = 0 //CHOMPEdit making weaver a neutral trait instead
	cost = 0 //Also not worth 2 points, wtf, this is literally just fluff
	var_changes = list("is_weaver" = 1)

/datum/trait/positive/weaver/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/check_silk_amount
	H.verbs |= /mob/living/carbon/human/proc/toggle_silk_production
	H.verbs |= /mob/living/carbon/human/proc/weave_structure
	H.verbs |= /mob/living/carbon/human/proc/weave_item
	H.verbs |= /mob/living/carbon/human/proc/set_silk_color

/datum/trait/positive/water_breather
	name = "Water Breather"
	desc = "You can breathe under water."
	cost = 1
	var_changes = list("water_breather" = 1)
