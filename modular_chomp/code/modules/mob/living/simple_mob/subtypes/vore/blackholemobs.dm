///-- file dedicated to the new blackhole faction's mobs!

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///oties! or, otie. singular. since... there's just one for now.///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/vore/otie/syndicate/blackhole //Spawn this one only if you're looking for a bad time. Not friendly.
	name = "Black Hole attack otie"
	desc = "The classic bioengineered longdog. This one seems to have developed a mutation from an abnormally phoron-rich diet. Now in fanatical cultist flavor!"
	tt_desc = "Otus robustus"
	icon = 'modular_chomp/icons/blackhole/blackhole64x32.dmi'
	icon_state = "bhotie"
	icon_living = "bhotie"
	icon_dead = "bhotie-dead"
	icon_rest = "bhotie-dead"
	faction = FACTION_BLACKHOLE
	maxHealth = 200
	health = 200
	minbodytemp = 200
	melee_damage_lower = 15
	melee_damage_upper = 20
	see_in_dark = 8
	response_help = "pets"
	response_disarm = "bops"
	response_harm = "hits"
	attacktext = list("mauled","chomped","savaged")
	friendly = list("nuzzles", "slobberlicks", "noses softly at", "noseboops", "headbumps against", "leans on", "nibbles affectionately on")
	meat_amount = 6
	movement_cooldown = -2.5
	melee_attack_delay = 0
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	melee_miss_chance = 0
	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE
	mount_offset_y = 10
	ai_holder_type = /datum/ai_holder/simple_mob/melee
	say_list_type = /datum/say_list/otie
	tame_chance = 0
	has_eye_glow = TRUE

	armor = list(			// Values for normal getarmor() checks
				"melee" = 20,
				"bullet" = 10,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)
	armor_soak = list(		// Values for getsoak() checks.
				"melee" = 0,
				"bullet" = 0,
				"laser" = 0,
				"energy" = 0,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 0
				)
	var/exploded = FALSE
	var/explosion_dev_range		= 0
	var/explosion_heavy_range	= 0
	var/explosion_light_range	= 1
	var/explosion_flash_range	= 2

	var/explosion_delay_lower	= 1 SECOND	// Lower bound for explosion delay.
	var/explosion_delay_upper	= 3 SECONDS	// Upper bound.

	special_attack_min_range = 2
	special_attack_max_range = 12
	special_attack_cooldown = 10 SECONDS

	leap_warmup = 0.5 SECOND // How long the leap telegraphing is.
	leap_sound = 'sound/weapons/spiderlunge.ogg'

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///otie pounce code!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/vore/otie/syndicate/blackhole/do_special_attack(atom/A)
	set waitfor = FALSE
	if(!isliving(A))
		return FALSE
	var/mob/living/L = A
	if(!L.devourable || !L.allowmobvore || L.unacidable)
		return FALSE

	set_AI_busy(TRUE)
	visible_message(span_warning("\The [src] suddenly crouches and wiggles its backside...!"))
	to_chat(L, span_danger("\The [src] focuses on you!"))

	do_windup_animation(A, leap_warmup)

	addtimer(CALLBACK(src, PROC_REF(doLeap), L), leap_warmup, TIMER_DELETE_ME)
	return TRUE

/mob/living/simple_mob/vore/otie/syndicate/blackhole/proc/doLeap(var/mob/living/L)
	if(!L)
		return FALSE
	if(L.z != z)
		set_AI_busy(FALSE)
		return FALSE

	status_flags |= LEAPING
	visible_message(span_warning("\The [src] pounces at \the [L]!!"))
	throw_at(get_step(L, get_turf(src)), special_attack_max_range+1, 1, src)
	playsound(src, leap_sound, 75, 1)

	addtimer(CALLBACK(src, PROC_REF(afterLeap), L), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/vore/otie/syndicate/blackhole/proc/afterLeap(var/mob/living/L)
	if(status_flags & LEAPING)
		status_flags &= ~LEAPING

	set_AI_busy(FALSE)
	if(!L)
		return FALSE
	if(Adjacent(L))
		L.Weaken(1)
	return TRUE

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///the black hole fanatics!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/vore/blackhole
	name = "Black Hole fanatic"
	desc = "A tough looking armored feline creature. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "trooper-dead"
	icon_living = "trooper"
	icon_state = "trooper"
	icon_rest = "trooper"
	see_in_dark = 8
	maxHealth = 200
	movement_cooldown = 0
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 20
	has_eye_glow = TRUE
	response_help = "heavily pets"
	response_disarm = "shoves"
	response_harm = "bites"
	attacktext = list("punched","clawed")
	vore_active = 0
	old_x = 0
	old_y = 0
	default_pixel_x = 0
	pixel_x = 0
	pixel_y = 0

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	var/exploded = FALSE
	var/explosion_dev_range		= 0
	var/explosion_heavy_range	= 0
	var/explosion_light_range	= 1
	var/explosion_flash_range	= 2

	var/explosion_delay_lower	= 1 SECOND	// Lower bound for explosion delay.
	var/explosion_delay_upper	= 3 SECONDS	// Upper bound.

	ai_holder_type = /datum/ai_holder/simple_mob/merc/blackhole

	say_list_type = /datum/say_list/merc/blackhole

	armor = list(			// Values for normal getarmor() checks
				"melee" = 40,
				"bullet" = 30,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 50,
				"bio" = 100,
				"rad" = 100
				)

/mob/living/simple_mob/vore/blackhole/shield
	name = "Black Hole bulwark"
	desc = "A tough looking armored feline creature armed with a shield and an energy lance. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "trooper-dead"
	icon_living = "trooper_shield"
	icon_state = "trooper_shield"
	icon_rest = "trooper_shield"
	attacktext = list("stabbed","slashed","impaled")
	maxHealth = 200
	melee_miss_chance = 0
	movement_cooldown = -1.5
	harm_intent_damage = 5
	melee_damage_lower = 25
	melee_damage_upper = 30
	attack_sound = 'sound/weapons/blade1.ogg'
	armor = list(			// Values for normal getarmor() checks
				"melee" = 60,
				"bullet" = 50,
				"laser" = 40,
				"energy" = 35,
				"bomb" = 70,
				"bio" = 100,
				"rad" = 100
				)


/mob/living/simple_mob/vore/blackhole/grotesque
	name = "grotesque"
	desc = "A horribly mutated, pale creature, poorly morphed into some hyperaggressive feline abomination. This is what tends to happen to those that Black Hole take prisoner-- Cannonfodder."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "grotesque-dead"
	icon_living = "grotesque"
	icon_state = "grotesque"
	icon_rest = "grotesque"
	attacktext = list("savaged","slashed","impaled","gored","clawed","brutalized")
	see_in_dark = 8
	maxHealth = 75
	melee_miss_chance = 0
	melee_attack_delay = 0
	movement_cooldown = -3
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
	say_list_type = /datum/say_list/merc/blackhole/grotesque
	ai_holder_type = /datum/ai_holder/simple_mob/melee
	attack_sound = 'sound/weapons/slice.ogg'

/mob/living/simple_mob/vore/blackhole/grotesque/death()
	..()
	visible_message("[src] lets out a horrible cry as it collapses into an inky black pile of gore!")
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)

/mob/living/simple_mob/vore/blackhole/ranged
	name = "Black Hole trooper"
	desc = "A tough looking armored feline creature armed with a pistol. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "trooper-dead"
	icon_living = "trooper_pistol"
	icon_state = "trooper_pistol"
	icon_rest = "trooper_pistol"

	projectiletype = /obj/item/projectile/bullet/pistol/bh1
	projectilesound = 'sound/weapons/serdy/9mmpistol.ogg'
	projectile_dispersion = 3
	projectile_accuracy = -15
	base_attack_cooldown = 8 DECISECONDS
	reload_max = 12
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole

/mob/living/simple_mob/vore/blackhole/ranged/smg
	name = "Black Hole gunner"
	desc = "A tough looking armored feline creature armed with an SMG. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "trooper-dead"
	icon_living = "trooper_smg"
	icon_state = "trooper_smg"
	icon_rest = "trooper_smg"

	projectiletype = /obj/item/projectile/bullet/pistol/bh2
	projectilesound = 'sound/weapons/serdy/vityaz.ogg'
	projectile_dispersion = 3
	projectile_accuracy = -15
	base_attack_cooldown = 2
	reload_max = 25
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole

/mob/living/simple_mob/vore/blackhole/ranged/rifle
	name = "Black Hole rifleman"
	desc = "A tough looking armored feline creature armed with a rifle. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "trooper-dead"
	icon_living = "trooper_rifle"
	icon_state = "trooper_rifle"
	icon_rest = "trooper_rifle"

	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh1
	projectilesound = 'sound/weapons/serdy/sks.ogg'
	projectile_dispersion = 3
	projectile_accuracy = -15
	base_attack_cooldown = 8
	reload_max = 30
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole

/mob/living/simple_mob/vore/blackhole/ranged/lmg
	name = "Black Hole machinegunner"
	desc = "A tough looking armored feline creature armed with a light machinegun. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "trooper-dead"
	icon_living = "trooper_lmg"
	icon_state = "trooper_lmg"
	icon_rest = "trooper_lmg"

	projectiletype = /obj/item/projectile/bullet/pistol/bh3
	projectilesound = 'sound/weapons/serdy/ak74.ogg'
	projectile_dispersion = 12
	projectile_accuracy = -25
	base_attack_cooldown = 0.1
	reload_max = 50
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///taur specific variations!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/vore/blackhole/taur
	name = "Black Hole fanatic"
	desc = "A tough looking armored feline taur. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole64x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "heavytrooper-dead"
	icon_living = "heavytrooper"
	icon_state = "heavytrooper"
	icon_rest = "heavytrooper"
	maxHealth = 300
	movement_cooldown = 0
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 20
	has_eye_glow = TRUE
	response_help = "heavily pets"
	response_disarm = "shoves"
	response_harm = "bites"
	attacktext = list("punched","clawed")
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	ai_holder_type = /datum/ai_holder/simple_mob/merc/blackhole

	say_list_type = /datum/say_list/merc/blackhole

	armor = list(			// Values for normal getarmor() checks
				"melee" = 40,
				"bullet" = 30,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 50,
				"bio" = 100,
				"rad" = 100
				)

/mob/living/simple_mob/vore/blackhole/taur/shield
	name = "Black Hole heavy bulwark"
	desc = "A tough looking armored feline taur armed with a shield and an energy lance. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole64x32.dmi'
	icon_living = "heavytrooper_shield"
	icon_state = "heavytrooper_shield"
	icon_rest = "heavytrooper_shield"
	maxHealth = 300
	movement_cooldown = -1.5
	harm_intent_damage = 5
	melee_damage_lower = 25
	melee_damage_upper = 30
	attacktext = list("stabbed","slashed","impaled")
	attack_sound = 'sound/weapons/blade1.ogg'
	armor = list(			// Values for normal getarmor() checks
				"melee" = 60,
				"bullet" = 50,
				"laser" = 40,
				"energy" = 35,
				"bomb" = 70,
				"bio" = 100,
				"rad" = 100
				)

/mob/living/simple_mob/vore/blackhole/taur/ranged
	name = "Black Hole machinegunner"
	desc = "A tough looking armored feline taur wielding a light machinegun. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole64x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "heavytrooper-dead"
	icon_living = "heavytrooper_lmg"
	icon_state = "heavytrooper_lmg"
	icon_rest = "heavytrooper_lmg"

	projectiletype = /obj/item/projectile/bullet/pistol/bh3
	projectilesound = 'sound/weapons/serdy/ak74.ogg'
	projectile_dispersion = 12
	projectile_accuracy = -25
	base_attack_cooldown = 0.1
	reload_max = 50
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg

/mob/living/simple_mob/vore/blackhole/taur/ranged/hmg
	name = "Black Hole heavy machinegunner"
	desc = "A tough looking armored feline taur wielding a harness mounted heavy machinegun. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole64x32.dmi'
	icon_living = "heavytrooper_hmg"
	icon_state = "heavytrooper_hmg"
	icon_rest = "heavytrooper_hmg"

	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh2
	projectilesound = 'sound/weapons/serdy/strela.ogg'
	projectile_dispersion = 12
	projectile_accuracy = -25
	base_attack_cooldown = 0.5
	reload_max = 100
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg

/mob/living/simple_mob/humanoid/merc/ranged/sniper/blackhole
	name = "Black Hole sniper"
	desc = "A tough looking armored feline taur wielding a large caliber sniper rifle. They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole64x32.dmi'
	icon_living = "heavytrooper_sniper"
	icon_state = "heavytrooper_sniper"
	icon_rest = "heavytrooper_sniper"
	projectiletype = /obj/item/projectile/bullet/rifle/a145/highvel // Really scary bullet.
	projectilesound = 'sound/weapons/serdy/molniyab.ogg'
	faction = FACTION_BLACKHOLE
	movement_cooldown = 0
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 20
	has_eye_glow = TRUE
	response_help = "heavily pets"
	response_disarm = "shoves"
	response_harm = "bites"
	attacktext = list("punched","clawed")
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	corpse = null
	loot_list = null
	say_list_type = /datum/say_list/merc/blackhole

	var/exploded = FALSE
	var/explosion_dev_range		= 0
	var/explosion_heavy_range	= 0
	var/explosion_light_range	= 1
	var/explosion_flash_range	= 2

	var/explosion_delay_lower	= 0 SECOND	// Lower bound for explosion delay.
	var/explosion_delay_upper	= 1 SECONDS	// Upper bound.

	armor = list(			// Values for normal getarmor() checks
				"melee" = 40,
				"bullet" = 30,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 50,
				"bio" = 100,
				"rad" = 100
				)

	projectile_accuracy = 75

	reload_max = 5
	reload_time = 5 SECONDS

	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/sniper/blackhole

	ranged_attack_delay = 1.5 SECONDS

/mob/living/simple_mob/humanoid/merc/ranged/sniper/blackhole/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 1 SECONDS, maxdistance = 20)


/mob/living/simple_mob/humanoid/merc/ranged/sniper/blackhole/rocket
	name = "Black Hole anti tank"
	desc = "A tough looking armored feline creature wielding a rocket launcher! They wear various insignias identifying them as a member of Black Hole."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	icon_living = "trooper_rpg"
	icon_state = "trooper_rpg"
	icon_rest = "trooper_rpg"
	old_x = 0
	old_y = 0
	default_pixel_x = 0
	pixel_x = 0
	pixel_y = 0
	reload_max = 1
	reload_time = 10 SECONDS

	projectiletype = /obj/item/projectile/explosive_rocket/blackhole

	ranged_attack_delay = 2.2 SECONDS
/mob/living/simple_mob/humanoid/merc/ranged/sniper/blackhole/rocket/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 2 SECONDS, maxdistance = 20)

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///BIKEUS///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/vore/blackhole/bikers
	name = "Black Hole mechanized troopers"
	desc = "A pair of armed Black Hole troops riding an armored motorcycle. Watch out!"
	icon = 'modular_chomp/icons/blackhole/blackhole64x64.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "bikeus"
	icon_living = "bikeus"
	icon_state = "bikeus"
	icon_rest = "bikeus"
	maxHealth = 200
	movement_cooldown = -0.5
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 20
	melee_attack_delay = 4
	has_eye_glow = TRUE
	response_help = "heavily pets"
	response_disarm = "shoves"
	response_harm = "bites"
	attacktext = list("hit","struck")
	vore_active = 0
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	movement_sound = 'sound/effects/carrev.ogg'

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	say_list_type = /datum/say_list/merc/blackhole

	armor = list(			// Values for normal getarmor() checks
				"melee" = 40,
				"bullet" = 30,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 50,
				"bio" = 100,
				"rad" = 100
				)

	projectiletype = /obj/item/projectile/bullet/pistol/bh3
	projectilesound = 'sound/weapons/serdy/ak74.ogg'
	projectile_dispersion = 25
	projectile_accuracy = -40
	base_attack_cooldown = 4
	reload_max = 30
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///mechs!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/mechanical/mecha/combat/gygax/dark/advanced/blackhole
	name = "singularity gygax"
	desc = "An experimental exosuit that utilizes advanced materials to allow for greater protection while still being lightweight and fast. \
	It also is armed with an array of next-generation weaponry."
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/blackhole)
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_living = "mech2"
	icon_state = "mech2"
	icon_rest = "mech2"
	has_eye_glow = TRUE
	wreckage = /obj/structure/loot_pile/mecha/gygax/dark/adv/blackhole
	icon_scale_x = 1.5
	icon_scale_y = 1.5
	movement_shake_radius = 14
	movement_cooldown = 0

	maxHealth = 450
	deflect_chance = 25
	has_repair_droid = FALSE
	armor = list(
				"melee"		= 50,
				"bullet"	= 50,
				"laser"		= 50,
				"energy"	= 30,
				"bomb"		= 30,
				"bio"		= 100,
				"rad"		= 100
				)

/obj/structure/loot_pile/mecha/gygax/dark/adv/blackhole
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	icon_state = "mech2_wreck"

/mob/living/simple_mob/mechanical/mecha/combat/durand/blackhole
	name = "singularity vulture"
	desc = "A robust, advanced exosuit of Black Hole design, utilizing highly dangerous tesla weaponry."
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/blackhole)
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_living = "mech1"
	icon_state = "mech1"
	icon_rest = "mech1"
	has_eye_glow = TRUE
	movement_cooldown = 1
	wreckage = /obj/structure/loot_pile/mecha/durand/blackhole
	icon_scale_x = 2
	icon_scale_y = 2
	maxHealth = 400
	deflect_chance = 20
	armor = list(
				"melee"		= 50,
				"bullet"	= 50,
				"laser"		= 50,
				"energy"	= 30,
				"bomb"		= 30,
				"bio"		= 100,
				"rad"		= 100
				)
	melee_damage_lower = 40
	melee_damage_upper = 90

	projectiletype = /obj/item/projectile/beam/shock/bh1
	projectilesound = 'sound/effects/lightningbolt.ogg'
	projectile_dispersion = 12
	projectile_accuracy = -25
	base_attack_cooldown = 12
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg

/obj/structure/loot_pile/mecha/durand/blackhole
	name = "vulture wreckage"
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	icon_state = "mech1_wreck"


///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///obelisk and monolith!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

#define OBELISK_LURE 401

GLOBAL_LIST_INIT(obelisk_lure_messages, list(
	"You see images of friends, and loved ones among the ranks of the Black Hole fanatics...",
	"The stone structure whispers soothing words to you, in familiar voices...",
	"The ominous stone structure calms your mind. It feels good...",
	"Your focus is drawn to the glowing stone structure, your vision briefly only able to perceive the monolith...",
	"You see your friends and associates kneeling beside the glowing pylon...",
	"You feel an inexplicable urge to stop fighting...",
	"You see images of Black Hole cultists communing with some indescribable greater power...",
	"The ominous stone structure promises you peace and happiness, accompanied by vivid images of family and loved ones in your mind..."))

/mob/living/simple_mob/vore/blackhole_obelisk
	name = "Black Hole Obelisk"
	desc = "A massive polished stone structure with twelve sides. It throbs with unknown energies, your mere presence near it makes your head ache horribly, and fills your mind with foreign images and language..."
	tt_desc = "!@ %*!($*- COME TO ME. @#%*(@#%"
	has_eye_glow = TRUE
	icon_state = "obelisk"
	icon_living = "obelisk"
	icon_dead = "obelisk-dead"
	icon = 'modular_chomp/icons/blackhole/blackhole64x64.dmi'
	faction = FACTION_BLACKHOLE
	a_intent = I_HURT
	anchored = 1
	maxHealth = 400
	health = 400
	ai_holder_type = /datum/ai_holder/simple_mob/passive/pitcher
	response_help = "touches"
	response_disarm = "pushes against"
	response_harm = "slams their fists against"
	movement_cooldown = 999
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	grab_resist = 100
	melee_damage_upper = 0
	melee_damage_lower = 0
	mob_size = MOB_LARGE
	mob_bump_flag = HEAVY
	mob_swap_flags = HEAVY
	mob_push_flags = HEAVY
	vore_active = 0

	var/scent_strength = 5 //How much can a hungry pitcher confuse nearby people?
	var/last_lifechecks = 0 //Timing variable to limit vore/hungry proc calls
	var/list/obelisk_lure_messages = null

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	var/exploded = FALSE
	var/explosion_dev_range		= 1
	var/explosion_heavy_range	= 2
	var/explosion_light_range	= 4
	var/explosion_flash_range	= 12

	var/explosion_delay_lower	= 5 SECOND	// Lower bound for explosion delay.
	var/explosion_delay_upper	= 8 SECONDS	// Upper bound.

	armor = list(
				"melee" = 100,
				"bullet" = 70,
				"laser" = 70,
				"energy" = 90,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100)
	armor_soak = list(
				"melee" = 15,
				"bullet" = 5,
				"laser" = 5,
				"energy" = 5,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)
	var/datum/looping_sound/obelisk/loopy = 1

/mob/living/simple_mob/vore/blackhole_obelisk/monolith
	name = "Black Hole Monolith"
	desc = "A towering, polished stone spire of dark psychic energy, with four sides, covered in constantly shifting inscriptions... It throbs with unknown energies, your mere presence near it makes your head ache horribly, and fills your mind with foreign images and language..."
	tt_desc = "!@ %*!($*- COME TO ME. @#%*(@#%"
	has_eye_glow = TRUE
	icon_state = "monolith"
	icon_living = "monolith"
	icon_dead = "monolith-dead"
	icon = 'modular_chomp/icons/blackhole/blackhole32x96.dmi'
	old_x = 0
	old_y = 0
	default_pixel_x = 0
	pixel_x = 0
	pixel_y = 0
	explosion_dev_range		= 4
	explosion_heavy_range	= 6
	explosion_light_range	= 12
	explosion_flash_range	= 30

	explosion_delay_lower	= 5 SECOND	// Lower bound for explosion delay.
	explosion_delay_upper	= 8 SECONDS	// Upper bound.

/mob/living/simple_mob/vore/blackhole_obelisk/Life()
	. = ..()
	if(!.)
		return
	if(world.time > last_lifechecks + 15 SECONDS)
		last_lifechecks = world.time
		handle_hungry()

// hackified shitcode poached from the pitcher plant for ~~cool flavor text~~ when you're near either 'structure'

/mob/living/simple_mob/vore/blackhole_obelisk/Initialize(mapload)
	. = ..()
	obelisk_lure_messages = GLOB.obelisk_lure_messages
	loopy = new(list(src),FALSE)
	loopy.start()

/mob/living/simple_mob/vore/blackhole_obelisk/proc/handle_hungry()
	if(nutrition <= OBELISK_LURE)
		for(var/mob/living/carbon/human/H in oview(6, src))
			if(!istype(H) || !isliving(H) || H.stat == DEAD)
				continue
			if(isSynthetic(H))
				continue
			if(src.Adjacent(H))
				to_chat(H,span_danger("The overwhelming psychic influence from \the [src] makes your senses reel!"))
				H.Confuse(scent_strength)
				continue
			else
				to_chat(H,span_danger("[pick(obelisk_lure_messages)]"))
				return

/datum/looping_sound/obelisk ///thanks to BM for helpin' me make this work <3
	mid_sounds = 'sound/effects/monolith_ambience.ogg'
	mid_length = 50
	chance = 100
	volume = 35
	exclusive = TRUE
	volume_chan = VOLUME_CHANNEL_MACHINERY

/mob/living/simple_mob/vore/blackhole_obelisk/Destroy()
	QDEL_NULL(loopy)
	. = ..()

/mob/living/simple_mob/vore/blackhole_obelisk/attack_hand(mob/living/L)
	..()

	switch(L.a_intent)
		if(I_HELP)
			if(health > 0)
				if(L.zone_sel.selecting == BP_GROIN) //CHOMPEdit
					if(L.vore_bellyrub(src))
						return
				L.visible_message(span_notice("\The [L] [response_help] \the [src]."))

		if(I_DISARM)
			L.visible_message(span_notice("\The [L] [response_disarm] \the [src]."))
			L.do_attack_animation(src)
			//TODO: Push the mob away or something

		if(I_GRAB)
			if (L == src)
				return
			if (!(status_flags & CANPUSH))
				return
			if(!incapacitated(INCAPACITATION_ALL) && prob(grab_resist))
				L.visible_message(span_warning("[src] pulses ominously at [L], forcefully pushing them away with psychic energy as they try to grab it!"))
				return


/mob/living/simple_mob/vore/blackhole_obelisk/death()
	..()
	visible_message("[src] flashes brightly, crumbling as its psychic influence suddenly vanishes from the minds of those nearby...")
	playsound(src, 'sound/effects/monolith_death.ogg', 100)

#undef OBELISK_LURE

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///size randomization!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/vore/blackhole/Initialize(mapload)
	. = ..()
	var/oursize = rand(90, 150) / 100
	resize(oursize)

/mob/living/simple_mob/vore/blackhole/bikers/Initialize(mapload)
	. = ..()
	resize(1) // Scale them back down

/mob/living/simple_mob/vore/otie/syndicate/blackhole/Initialize(mapload)
	. = ..()
	var/oursize = rand(100, 180) / 100
	resize(oursize)

/mob/living/simple_mob/humanoid/merc/ranged/sniper/blackhole/Initialize(mapload)
	. = ..()
	var/oursize = rand(100, 180) / 100
	resize(oursize)
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///explode on death!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/vore/blackhole/proc/explode()
	if(src && !exploded)
		visible_message(span_danger("\The [src]'s body violently explodes!"))
		exploded = TRUE
		explosion(src.loc, explosion_dev_range, explosion_heavy_range, explosion_light_range, explosion_flash_range)
		gib(src)

/mob/living/simple_mob/vore/blackhole/death()
	visible_message(span_critical("\The [src]'s explosive implant lets out a shrill beep!!!"))
	var/delay = rand(explosion_delay_lower, explosion_delay_upper)
	animate(src, color = "#FFFFFF", time = 0.1 SECONDS, loop = ceil(delay/2))
	animate(color = "#A663FF", time = 0.1 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(explode)), delay, TIMER_DELETE_ME)
	return ..()

/mob/living/simple_mob/vore/otie/syndicate/blackhole/proc/explode()
	if(src && !exploded)
		visible_message(span_danger("\The [src]'s body violently explodes!"))
		exploded = TRUE
		explosion(src.loc, explosion_dev_range, explosion_heavy_range, explosion_light_range, explosion_flash_range)

/mob/living/simple_mob/vore/otie/syndicate/blackhole/death()
	visible_message(span_critical("\The [src]'s explosive implant lets out a shrill beep!!!"))
	var/delay = rand(explosion_delay_lower, explosion_delay_upper)
	animate(src, color = "#FFFFFF", time = 0.1 SECONDS, loop = ceil(delay/2))
	animate(color = "#A663FF", time = 0.1 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(explode)), delay, TIMER_DELETE_ME)
	return ..()

/mob/living/simple_mob/vore/blackhole_obelisk/proc/explode()
	if(src && !exploded)
		visible_message(span_danger("\The [src] violently explodes!"))
		exploded = TRUE
		explosion(src.loc, explosion_dev_range, explosion_heavy_range, explosion_light_range, explosion_flash_range)

/mob/living/simple_mob/vore/blackhole_obelisk/death()
	visible_message(span_critical("\\The [src] suddenly destablizes!"))
	var/delay = rand(explosion_delay_lower, explosion_delay_upper)
	animate(src, color = "#FFFFFF", time = 0.1 SECONDS, loop = ceil(delay/2))
	animate(color = "#A663FF", time = 0.1 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(explode)), delay, TIMER_DELETE_ME)
	return ..()

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///flavor stuff!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
/datum/say_list/merc/blackhole
	speak = list("Praise the Black Monoliths...",
				"Oblivion, grant me strength.",
				"No hostiles yet.",
				"Bring death to those who spurned the holy power of Singularity.",
				"Location under control.")
	emote_see = list("checks their gear.", "is keeping an eye out.", "mumbles fanatical litanies to themselves.", "looks around, alert.")

	say_understood = list("10-4.")
	say_cannot = list("Unable.")
	say_maybe_target = list("Come, embrace oblivion!", "Where did you go?!", "You cannot hide from the will of the singularity!")
	say_got_target = list("Die, heathen!", "Target spotted!", "Purge the nonbelievers!", "Your death will not be swift!")
	say_threaten = list("Enemy spotted!", "Resisting is futile!", "Target spotted!", "Contact!", "Enemy!", "Heathens!", "Nonbelievers!")
	say_stand_down = list("Come back here!")
	say_escalate = list("Die, heathen!", "Thy end is now!", "The Monolith commands your death!", "Come here!!", "Get some!!", "Die!", "This will hurt!", "Embrace oblivion!", "Suffering awaits!", "Destroy!")

	threaten_sound = 'sound/weapons/TargetOn.ogg'
	stand_down_sound = 'sound/weapons/TargetOff.ogg'

/datum/say_list/merc/blackhole/grotesque
	speak = list("AAAAAAAAAA!!",
				"EVERYTHING HURTS!!",
				"GRRRRRH!!",
				"RRRRRRRAAAAAH!!",
				"AAAARGH!!")
	emote_see = list("spasms uncontrollably!", "twitches spasmotically.", "gurgles audibly.", "scratches at its own face with its horrendous clawed hands.")

	say_understood = list("YES!!")
	say_cannot = list("NO!!")
	say_maybe_target = list("WHO?!!", "HELP!! ME!!", "STAY AWAY!!")
	say_got_target = list("AAAAAAAAAAAAAAAA!!", "REND AND RIP!!", "AAAAAAAAAAAAA!!!", "BLEED!!")
	say_threaten = list("GO!! AWAY!!", "GET AWAY FROM ME!!", "IT HURTS!!", "AAAAAAAAAAAAA!!!!", "ENEMY!!!")
	say_stand_down = list("NO, COME BACK!!")
	say_escalate = list("KILL KILL KILL KILL!!", "SUFFER AS I DO!!", "GET OVER HERE!!", "RIP AND TEAR!!", "KILL ME!!", "REND AND RIP!!", "AAAAAAAAAAAAAAAAAAAAA!!!", "DIE!!")

	threaten_sound = 'sound/weapons/TargetOn.ogg'
	stand_down_sound = 'sound/weapons/TargetOff.ogg'

/datum/category_item/catalogue/fauna/mercenary/blackhole
	name = "Black Hole fanatics"
	desc = "Described by most as just 'Crazed Gunmen', the Black Hole fanatics are a recently spawned faction of assorted doomsday cultists and killers, working in a seeming hivemind under the\
	command of unknown forces, evidently linked to the large, psychoactive monoliths they guard jealously within their vessels. They seek to destroy the universe, as a whole-- To return\
	everything to oblivion, and start anew. They are most commonly associated with terrorist singularity bombings on isolated stations and planetary bodies, and the kidnapping and indoctrination\
	of unwilling spacefarers to bolster their numbers. Unlike the common mercenary, they do not negotiate unless it furthers their own goals. They will come until they deplete\
	their numbers down to the last, or destroy whatever or whomever has earned their wrath, all in their fanatical worship of whatever is controlling them."
	value = CATALOGUER_REWARD_HARD
	unlocked_by_any = list(/datum/category_item/catalogue/fauna/mercenary/blackhole)

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///ai holder stuff!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///


/datum/ai_holder/simple_mob/merc/blackhole
	threaten = TRUE
	returns_home = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 2 SECONDS
	use_astar = TRUE

/datum/ai_holder/simple_mob/merc/ranged/blackhole
	threaten = TRUE
	returns_home = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 2 SECONDS
	use_astar = TRUE

/datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg
	threaten = TRUE
	returns_home = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 2 SECONDS
	use_astar = TRUE
	conserve_ammo = FALSE

/datum/ai_holder/simple_mob/merc/ranged/sniper/blackhole
	vision_range = 20
	threaten = TRUE
	returns_home = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 2 SECONDS
	use_astar = TRUE

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///special bullets, because the 'projectilesound' var does not work!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///


/obj/item/projectile/bullet/pistol/bh1
	name = "7mm bullet"
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/9mmpistol.ogg'
	speed = 0.8

/obj/item/projectile/bullet/pistol/bh2
	name = "10mm bullet"
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/vityaz.ogg'
	speed = 0.8

/obj/item/projectile/bullet/pistol/bh3
	name = "9mm bullet"
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/ak74.ogg'
	speed = 0.8

/obj/item/projectile/bullet/rifle/a545/bh1
	name = "6mm rifle bullet"
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/sks.ogg'
	speed = 0.8

/obj/item/projectile/bullet/rifle/a545/bh2
	name = "15mm MG bullet"
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/strela.ogg'
	speed = 0.8

/obj/item/projectile/beam/shock/bh1
	name = "tesla beam"
	icon_state = "lightning"
	damage_type = ELECTROCUTE

	muzzle_type = /obj/effect/projectile/muzzle/lightning
	tracer_type = /obj/effect/projectile/tracer/lightning
	impact_type = /obj/effect/projectile/impact/lightning

	damage = 20
	agony = 1
	eyeblur = 1
	fire_sound = 'sound/effects/lightningbolt.ogg'
	hitsound = 'sound/effects/lightningshock.ogg'
	hud_state = "taser"

/obj/item/projectile/explosive_rocket/blackhole
	name = "80mm rocket propelled grenade"
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	icon_state = "rocket"
	fire_sound = 'sound/weapons/rpg.ogg'
	damage = 40
	speed = 0.6
	armor_penetration = 90

/obj/item/projectile/explosive_rocket/blackhole/on_impact(turf/T)
	new /obj/effect/explosion(T) // Weak explosions don't produce this on their own, apparently.
	explosion(T, 0, 0, 3, adminlog = FALSE)
