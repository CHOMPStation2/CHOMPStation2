/mob/living/simple_mob/vore/aggressive/dragon
	name = "red dragon"
	desc = "Here to pillage stations and kidnap princesses, and there probably aren't any princesses."

	icon_dead = "reddragon-dead"
	icon_living = "reddragon"
	icon_state = "reddragon"
	icon = 'icons/mob/vore64x64.dmi'
	vis_height = 64

	faction = "dragon"
	maxHealth = 500 // Boss
	health = 500
	see_in_dark = 8

	melee_damage_lower = 5
	melee_damage_upper = 30

	//Space dragons aren't affected by atmos.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	maxbodytemp = 700

	response_help = "pats"
	response_disarm = "tries to shove"
	response_harm = "hits"

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	mount_offset_y = 15
	mount_offset_x = -12
	max_buckled_mobs = 1
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE

	ai_holder_type = /datum/ai_holder/simple_mob/melee
	say_list_type = /datum/say_list/dragonboss

/mob/living/simple_mob/vore/aggressive/dragon/Process_Spacemove(var/check_drift = 0)
	return 1	//No drifting in space for space dragons!
/*
/mob/living/simple_mob/vore/aggressive/dragon/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"snaps at [.]")
*/
// Activate Noms!
/mob/living/simple_mob/vore/aggressive/dragon
	vore_active = 1
	vore_capacity = 2
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = SA_ICON_LIVING

/datum/category_item/catalogue/fauna/phoron_dragon //CHOMP Edit: the lore.
	name = "Virgo 3b Fauna - Phoron Dragon"
	desc = "Classification: Phoron Draconinae\
	<br><br>\
	The phoron dragon is a mutant, a result of a bioweapons experiment gone rogue. This phoron-enhanced dragon is \
	incredibly strong, armored, and well armed with claws infused with nanoscopic shards of hardened phoron. The \
	rest of their body is covered by black scales with pulsating phoron veins breaking up the surface texture. \
	Due to the nature of their phoron infusions, they have increased dietary requirements and shorter life spans. \
	They have a twin diet of meat and phoron as only those two have the energy needed to sustain them. They will agressively \
	slaughter their prey, or even swallow them whole to satisfy their requirements. Their natural habitat will always be in caves, \
	and they will use their claws to carve out homes and to extract phoron crystals. It is not unheard of for a dragon to horde phoron \
	for later consumption, a sight said to be similar to myths of old."
	value = CATALOGUER_REWARD_HARD

/mob/living/simple_mob/vore/aggressive/dragon/virgo3b
	name = "phoron dragon"
	tt_desc = "Phoron Draconinae"
	catalogue_data = list(/datum/category_item/catalogue/fauna/phoron_dragon)
	maxHealth = 300
	health = 300
	faction = "virgo3b"
	icon_dead = "phoron_dragon_dead"
	icon_living = "phoron_dragon"
	icon_state = "phoron_dragon"
	mount_offset_y = 24
	mount_offset_x = -9
	has_eye_glow = TRUE

/mob/living/simple_mob/vore/aggressive/dragon/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	movement_cooldown = 3

/mob/living/simple_mob/vore/aggressive/dragon/MouseDrop_T(mob/living/M, mob/living/user)
	return

/datum/say_list/dragonboss
	say_got_target = list("roars and snaps it jaws!")
