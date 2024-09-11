/datum/trait/positive
	category = TRAIT_TYPE_POSITIVE

/datum/trait/positive/speed_fast
	name = "Haste"
	desc = "Allows you to move faster on average than baseline."
	cost = 4 //CHOMPEdit
	var_changes = list("slowdown" = -0.5)
	excludes = list(/datum/trait/positive/hardy,/datum/trait/positive/hardy_extreme,/datum/trait/positive/hardy_plus)
//	banned_species = list(SPECIES_ALRAUNE, SPECIES_SHADEKIN_CREW, SPECIES_TESHARI, SPECIES_TAJ, SPECIES_DIONA, SPECIES_UNATHI) //Either not applicable or buffs ruin species flavour/balance
//	custom_only = FALSE //Keeping these in comments in case we decide to open them up in future, so the species are already organised.

/datum/trait/positive/hardy
	name = "Hardy"
	desc = "Allows you to carry heavy equipment with less slowdown."
	cost = 1
	var_changes = list("item_slowdown_mod" = 0.5)
	excludes = list(/datum/trait/positive/hardy_extreme,/datum/trait/positive/hardy_plus,/datum/trait/positive/speed_fast)
	custom_only = FALSE
	banned_species = list(SPECIES_ALRAUNE, SPECIES_TESHARI, SPECIES_UNATHI, SPECIES_DIONA, SPECIES_PROMETHEAN, SPECIES_PROTEAN) //Either not applicable or buffs are too strong

/datum/trait/positive/hardy_plus
	name = "Hardy, Major"
	desc = "Allows you to carry heavy equipment with almost no slowdown."
	cost = 2
	var_changes = list("item_slowdown_mod" = 0.25)
	excludes = list(/datum/trait/positive/speed_fast,/datum/trait/positive/hardy_extreme,/datum/trait/positive/hardy) // CHOMPEdit: Prevents Haste + Hardy being taken together.
	banned_species = list(SPECIES_ALRAUNE, SPECIES_TESHARI, SPECIES_UNATHI, SPECIES_DIONA, SPECIES_PROMETHEAN, SPECIES_PROTEAN) //Either not applicable or buffs are too strong
	custom_only = FALSE

/datum/trait/positive/endurance_high
	name = "High Endurance"
	desc = "Increases your maximum total hitpoints to 125. You require 250 damage in total to die, compared to 200 normally. You will still go into crit after losing 125 HP, compared to crit at 100 HP." // CHOMPEdit: Clarity for players' sake.
	cost = 3 // CHOMPEdit
	var_changes = list("total_health" = 125)
	custom_only = FALSE
	banned_species = list(SPECIES_TESHARI, SPECIES_UNATHI, SPECIES_SHADEKIN_CREW) //Either not applicable or buffs are too strong

/datum/trait/positive/endurance_high/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
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
	custom_only = FALSE
	banned_species = list(SPECIES_TAJARAN, SPECIES_SHADEKIN_CREW, SPECIES_SHADEKIN, SPECIES_XENOHYBRID, SPECIES_VULPKANIN, SPECIES_XENO, SPECIES_XENOCHIMERA, SPECIES_VASILISSAN, SPECIES_WEREBEAST) //These species already have strong darksight by default.

/datum/trait/positive/darksight_plus
	name = "Darksight, Major"
	desc = "Allows you to see in the dark for almost the whole screen and 20% more susceptible to flashes." //CHOMP Edit
	cost = 2
	var_changes = list("darksight" = 6)  //CHOMP Edit
	custom_only = FALSE
	banned_species = list(SPECIES_TAJARAN, SPECIES_SHADEKIN_CREW, SPECIES_SHADEKIN, SPECIES_XENOHYBRID, SPECIES_VULPKANIN, SPECIES_XENO, SPECIES_XENOCHIMERA, SPECIES_VASILISSAN, SPECIES_WEREBEAST) //These species already have strong darksight by default.
*/

/datum/trait/positive/melee_attack
	name = "Special Attack: Sharp Melee" // Trait Organization for easier browsing. TODO: Proper categorization of 'health/ability/resist/etc'
	desc = "Provides sharp melee attacks that do slightly more damage."
	cost = 1
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp))

/datum/trait/positive/melee_attack_fangs
	name = "Special Attack: Sharp Melee & Numbing Fangs" // Trait Organization for easier browsing. TODO: Proper categorization of 'health/ability/resist/etc'
	desc = "Provides sharp melee attacks that do slightly more damage, along with fangs that makes the person bit unable to feel their body or pain."
	cost = 2
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp, /datum/unarmed_attack/bite/sharp/numbing))

/datum/trait/positive/fangs
	name = "Special Attack: Numbing Fangs" // Trait Organization for easier browsing. TODO: Proper categorization of 'health/ability/resist/etc'
	desc = "Provides fangs that makes the person bit unable to feel their body or pain."
	cost = 1
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp/numbing))

/datum/trait/positive/minor_brute_resist
	name = "Brute Resist, Minor"
	desc = "Adds 10% resistance to brute damage sources." //CHOMP Edit
	cost = 1 //CHOMP Edit
	var_changes = list("brute_mod" = 0.9) //CHOMP Edit
	custom_only = FALSE
	banned_species = list(SPECIES_TESHARI, SPECIES_UNATHI, SPECIES_XENOCHIMERA, SPECIES_VASILISSAN, SPECIES_WEREBEAST) //Most of these are already this resistant or stronger, or it'd be way too much of a boost for tesh.

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
	custom_only = FALSE //CHOMPEdit: We have synth wings as an option. Valid for most any species to be able to fly.
	has_preferences = list("flight_vore" = list(TRAIT_PREF_TYPE_BOOLEAN, "Flight Vore enabled on spawn", TRAIT_VAREDIT_TARGET_MOB, FALSE))

/datum/trait/positive/winged_flight/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/proc/flying_toggle) //CHOMPEdit TGPanel
	add_verb(H,/mob/living/proc/flying_vore_toggle) //CHOMPEdit TGPanel
	add_verb(H,/mob/living/proc/start_wings_hovering) //CHOMPEdit TGPanel

/datum/trait/positive/soft_landing
	name = "Soft Landing"
	desc = "You can fall from certain heights without suffering any injuries, be it via wings, lightness of frame or general dexterity."
	cost = 1
	var_changes = list("soft_landing" = TRUE)
	custom_only = FALSE

/*
/datum/trait/positive/hardfeet
	name = "Hard Feet"
	desc = "Makes your nice clawed, scaled, hooved, armored, or otherwise just awfully calloused feet immune to glass shards."
	cost = 1 //CHOMP Edit
	allowed_species = list(SPECIES_HANNER, SPECIES_CUSTOM) //So it only shows up for custom species and hanner
	custom_only = FALSE
	var_changes = list("flags" = NO_MINOR_CUT) //Checked the flag is only used by shard stepping.
*/

// CHOMPEdit: This has been removed for two years, since Jan 2020, pending "review". Uncommenting as per tankiness increase PR.
/datum/trait/positive/antiseptic_saliva
	name = "Antiseptic Saliva"
	desc = "Your saliva has especially strong antiseptic properties that can be used to heal small wounds."
	cost = 1

/datum/trait/positive/antiseptic_saliva/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/carbon/human/proc/lick_wounds) //CHOMPEdit TGPanel

/datum/trait/positive/traceur
	name = "Traceur"
	desc = "You're capable of parkour and can *flip over low objects (most of the time)."
	cost = 1 //CHOMPEdit this is not worth 2 points
	var_changes = list("agility" = 90)
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_MORE_BETTER

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
	allowed_species = list(SPECIES_HANNER, SPECIES_CUSTOM) //So it only shows up for custom species and hanner
	custom_only = FALSE
	has_preferences = list("silk_production" = list(TRAIT_PREF_TYPE_BOOLEAN, "Silk production on spawn", TRAIT_VAREDIT_TARGET_SPECIES), \
							"silk_color" = list(TRAIT_PREF_TYPE_COLOR, "Silk color", TRAIT_VAREDIT_TARGET_SPECIES))

/datum/trait/positive/weaver/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/carbon/human/proc/check_silk_amount) //CHOMPEdit TGPanel
	add_verb(H,/mob/living/carbon/human/proc/toggle_silk_production) //CHOMPEdit TGPanel
	add_verb(H,/mob/living/carbon/human/proc/weave_structure) //CHOMPEdit TGPanel
	add_verb(H,/mob/living/carbon/human/proc/weave_item) //CHOMPEdit TGPanel
	add_verb(H,/mob/living/carbon/human/proc/set_silk_color) //CHOMPEdit TGPanel

/datum/trait/positive/aquatic
	name = "Aquatic"
	desc = "You can breathe under water and can traverse water more efficiently. Additionally, you can eat others in the water."
	cost = 1
	custom_only = FALSE //CHOMPEdit: honestly within the bounds of genemods, just hopefully people actually design characters around it
	var_changes = list("water_breather" = 1, "water_movement" = -4) //Negate shallow water. Half the speed in deep water.
	allowed_species = list(SPECIES_HANNER, SPECIES_CUSTOM) //So it only shows up for custom species and hanner
	custom_only = FALSE

/datum/trait/positive/aquatic/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/carbon/human/proc/water_stealth) //CHOMPEdit TGPanel
	add_verb(H,/mob/living/carbon/human/proc/underwater_devour) //CHOMPEdit TGPanel

/datum/trait/positive/cocoon_tf
	name = "Cocoon Spinner"
	desc = "Allows you to build a cocoon around yourself, using it to transform your body if you desire."
	cost = 1
	allowed_species = list(SPECIES_HANNER, SPECIES_CUSTOM) //So it only shows up for custom species and hanner
	custom_only = FALSE

/datum/trait/positive/cocoon_tf/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/carbon/human/proc/enter_cocoon) //CHOMPEdit TGPanel

/* //CHOMPedit: We already have our own version of this trait.
/datum/trait/positive/linguist
	name = "Linguist"
	desc = "Allows you to have more languages."
	cost = 1
	var_changes = list("num_alternate_languages" = 6)
	var_changes_pref = list("extra_languages" = 3)
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_MORE_BETTER
*/

/* // CHOMPedit: commented out because we disabled baymiss so this does nothing.
/datum/trait/positive/good_shooter
	name = "Eagle Eye"
	desc = "You are better at aiming than most."
	cost = 2
	var_changes = list("gun_accuracy_mod" = 25)
	custom_only = FALSE
	varchange_type = TRAIT_VARCHANGE_MORE_BETTER
*/

/datum/trait/positive/trauma_tolerance //CHOMPEdit renamed because we already have pain_tolerance pathname for halloss damage resistance.
	name = "Grit"
	desc = "You can keep going a little longer, a little harder when you get hurt, Injuries only inflict 85% as much pain, and slowdown from pain is 85% as effective."
	cost = 2
	var_changes = list("trauma_mod" = 0.85)
	excludes = list(/datum/trait/negative/neural_hypersensitivity)
	can_take = ORGANICS
	custom_only = FALSE

/datum/trait/positive/throw_resistance
	name = "Firm Body"
	desc = "Your body is firm enough that small thrown items can't do anything to you."
	cost = 1
	var_changes = list("throwforce_absorb_threshold" = 10)




/datum/trait/positive/wall_climber
	name = "Climber, Amateur"
	desc = "You can climb certain walls without tools! This is likely a personal skill you developed."
	tutorial = "You must approach a wall and right click it and select the \
	'climb wall' verb to climb it. You suffer from a movement delay of 1.5 with this trait.\n \
	Your total climb time is expected to be 17.5 seconds. Tools may reduce this. \n\n \
	This likewise allows descending walls, provided you're facing an empty space and standing on \
	a climbable wall. To climbe like so, use the verb 'Climb Down Wall' in IC tab!"
	cost = 1
	custom_only = FALSE
	banned_species = list(SPECIES_TAJ, SPECIES_VASILISSAN)	// They got unique climbing delay.
	var_changes = list("can_climb" = TRUE)
	excludes = list(/datum/trait/positive/wall_climber_pro, /datum/trait/positive/wall_climber_natural)

/datum/trait/positive/wall_climber_natural
	name = "Climber, Natural"
	desc = "You can climb certain walls without tools! This is likely due to the unique anatomy of your species. CUSTOM AND XENOCHIM ONLY"
	tutorial = "You must approach a wall and right click it and select the \
	'climb wall' verb to climb it. You suffer from a movement delay of 1.5 with this trait.\n \
	Your total climb time is expected to be 17.5 seconds. Tools may reduce this. \n\n \
	This likewise allows descending walls, provided you're facing an empty space and standing on \
	a climbable wall. To climbe like so, use the verb 'Climb Down Wall' in IC tab!"
	cost = 0
	custom_only = FALSE
	var_changes = list("can_climb" = TRUE)
	allowed_species = list(SPECIES_XENOCHIMERA, SPECIES_CUSTOM)	//So that we avoid needless bloat for xenochim
	excludes = list(/datum/trait/positive/wall_climber_pro, /datum/trait/positive/wall_climber)

/datum/trait/positive/wall_climber_pro
	name = "Climber, Professional"
	desc = "You can climb certain walls without tools! You are a professional rock climber at this, letting you climb almost twice as fast!"
	tutorial = "You must approach a wall and right click it and select the \
	'climb wall' verb to climb it. Your movement delay is just 1.25 with this trait.\n \
	Your climb time is expected to be 9 seconds. Tools may reduce this. \n\n \
	This likewise allows descending walls, provided you're facing an empty space and standing on \
	a climbable wall. To climbe like so, use the verb 'Climb Down Wall' in IC tab!"
	cost = 2
	custom_only = FALSE
	var_changes = list("climbing_delay" = 1.25)
	varchange_type = TRAIT_VARCHANGE_LESS_BETTER
	excludes = list(/datum/trait/positive/wall_climber,/datum/trait/positive/wall_climber_natural)

// This feels jank, but it's the cleanest way I could do TRAIT_VARCHANGE_LESS_BETTER while having a boolean var change
// Alternate would've been banned_species = list(SPECIES_TAJ, SPECIES_VASSILISIAN)
// Opted for this as it's "future proof"
/datum/trait/positive/wall_climber_pro/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	S.can_climb = TRUE
