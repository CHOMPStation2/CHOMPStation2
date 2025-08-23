//File dedicated to my assorted syndicate mobtypes! -- Serdy

/mob/living/simple_mob/vore/otie/syndicate //Spawn this one only if you're looking for a bad time. Not friendly.
	name = "commandotie"
	desc = "The classic bioengineered longdog, now in treacherous anarchist flavor!"
	tt_desc = "Otus robustus"
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
	icon_state = "syndotie_std"
	icon_living = "syndotie_std"
	icon_dead = "syndotie_std-dead"
	icon_rest = "syndotie_std_rest"
	faction = "syndicate"
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

	// Leaping is a special attack, so these values determine when leap can happen.
	// Leaping won't occur if its on cooldown.
	special_attack_min_range = 1
	special_attack_max_range = 7
	special_attack_cooldown = 5 SECONDS

	var/leap_warmup = 0.5 SECOND // How long the leap telegraphing is.
	var/leap_sound = 'sound/weapons/spiderlunge.ogg'

	player_msg = "You are very fast, and " + span_bold("can perform a leaping attack") + " by clicking on someone from a short distance away.<br>\
	If the leap succeeds, the target will be knocked down briefly and you will be on top of them.<br>\
	Note that there is a short delay before you leap!<br>\
	In addition, you will do more damage to incapacitated opponents."

/mob/living/simple_mob/vore/otie/syndicate/chubby //Spawn this one only if you're looking for a bad time. Not friendly.
	name = "chubby commandotie"
	desc = "The classic bioengineered longdog, now in treacherous anarchist flavor! This one is an absolute unit, too."
	tt_desc = "Otus robustus"
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
	icon_state = "syndcotie_std"
	icon_living = "syndcotie_std"
	icon_dead = "syndcotie_std-dead"
	icon_rest = "syndcotie_std_rest"
	maxHealth = 350
	health = 350
	meat_amount = 12
	melee_attack_delay = 0.5
	movement_cooldown = 0
	special_attack_min_range = 1
	special_attack_max_range = 3
	special_attack_cooldown = 30 SECONDS

	armor = list(			// Values for normal getarmor() checks
				"melee" = 20,
				"bullet" = 20,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)
	armor_soak = list(		// Values for getsoak() checks.
				"melee" = 5,
				"bullet" = 5,
				"laser" = 5,
				"energy" = 5,
				"bomb" = 5,
				"bio" = 0,
				"rad" = 0
				)


/mob/living/simple_mob/vore/otie/syndicate/apply_bonus_melee_damage(atom/A, damage_amount)
	if(isliving(A))
		var/mob/living/L = A
		if(L.incapacitated(INCAPACITATION_DISABLED))
			return damage_amount * 1.5
	return ..()

/mob/living/simple_mob/vore/otie/syndicate/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	do_windup_animation(A, leap_warmup)
	sleep(leap_warmup) // For the telegraphing.

	status_flags |= LEAPING
	visible_message(span_danger("\The [src] leaps at \the [A]!"))
	throw_at(get_step(get_turf(A), get_turf(src)), special_attack_max_range+1, 1, src)
	playsound(src, leap_sound, 75, 1)

	sleep(5)

	if(status_flags & LEAPING)
		status_flags &= ~LEAPING

	var/turf/T = get_turf(src)

	. = FALSE

	// Now for the stun.
	var/mob/living/victim = null
	for(var/mob/living/L in T)
		if(L == src)
			continue

		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.check_shields(damage = 0, damage_source = src, attacker = src, def_zone = null, attack_text = "the leap"))
				continue // We were blocked.

		victim = L
		break

	if(victim)
		victim.Weaken(2)
		victim.visible_message(span_danger("\The [src] knocks down \the [victim]!"))
		to_chat(victim, span_critical("\The [src] jumps on you!"))
		. = TRUE

	set_AI_busy(FALSE)

/mob/living/simple_mob/vore/wolf/direwolf/syndicate
	name = "mercenary commandoggo"
	desc = "A huge white furred wolfdog, wearing a blood red combat harness. They look ravenously hungry, too..."
	tt_desc = "Canis maxdirus"
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
	faction = "syndicate"
	icon_dead = "synddog_wht-dead"
	icon_living = "synddog_wht"
	icon_state = "synddog_wht"
	icon_rest = "synddog_wht_rest"
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	movement_cooldown = 0
	harm_intent_damage = 10
	melee_damage_lower = 30
	melee_damage_upper = 35
	maxHealth = 350
	melee_attack_delay = 1
	minbodytemp = 0

	max_buckled_mobs = 1
	mount_offset_y = 14
	mount_offset_x = 2
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
	armor = list(			// Values for normal getarmor() checks
				"melee" = 30,
				"bullet" = 10,
				"laser" = 10,
				"energy" = 5,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100
				)
	armor_soak = list(		// Values for getsoak() checks.
				"melee" = 5,
				"bullet" = 5,
				"laser" = 5,
				"energy" = 5,
				"bomb" = 5,
				"bio" = 0,
				"rad" = 0
				)

/mob/living/simple_mob/vore/wolf/direwolf/syndicate/black
	name = "mercenary commandoggo"
	desc = "A huge black furred wolfdog, wearing a blood red combat harness. They look ravenously hungry, too..."
	tt_desc = "Canis maxdirus"
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
	faction = "syndicate"
	icon_dead = "synddog_blk-dead"
	icon_living = "synddog_blk"
	icon_state = "synddog_blk"
	icon_rest = "synddog_blk_rest"


/datum/ai_holder/simple_mob/merc/ranged/torch //Only use these ai types if you want them not to give any warning before blastin'
	threaten = FALSE
	returns_home = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 0 SECONDS
	use_astar = TRUE

/datum/ai_holder/simple_mob/merc/ranged/torch/lmg
	threaten = FALSE
	returns_home = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 0 SECONDS
	use_astar = TRUE
	conserve_ammo = FALSE

/datum/ai_holder/simple_mob/merc/ranged/torch/lmg/chill
	threaten = FALSE
	returns_home = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 30 SECONDS
	use_astar = TRUE
	conserve_ammo = FALSE

/datum/ai_holder/simple_mob/merc/ranged/sniper/torch
	vision_range = 20
	threaten = FALSE
	returns_home = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 0 SECONDS
	use_astar = TRUE

/mob/living/simple_mob/vore/wolftaur/syndicate
	name = "mercenary commando"
	desc = "A tough looking armored canid creature armed with a battle rifle."
	icon = 'modular_chomp/icons/mob/vore64x32_ch.dmi'
	faction = "syndicate"
	icon_dead = "synditaur"
	icon_living = "synditaur"
	icon_state = "synditaur"
	icon_rest = "synditaur"
	maxHealth = 200
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 20
	response_help = "heavily pets"
	response_disarm = "shoves"
	response_harm = "bites"
	attacktext = list("punched","clawed")
	random_skin = 0
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	random_skin = 0

	var/exploded = FALSE
	var/explosion_dev_range		= 0
	var/explosion_heavy_range	= 0
	var/explosion_light_range	= 1
	var/explosion_flash_range	= 6

	var/explosion_delay_lower	= 0 SECOND	// Lower bound for explosion delay.
	var/explosion_delay_upper	= 1 SECONDS	// Upper bound.


	loot_list = list(/obj/item/gun/projectile/automatic/z8 = 1)

	projectiletype = /obj/item/projectile/bullet/rifle/a545
	projectilesound = 'sound/weapons/serdy/type901.ogg'
	projectile_dispersion = 3
	projectile_accuracy = -15
	base_attack_cooldown = 8
	reload_max = 30
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged

	say_list_type = /datum/say_list/merc

	armor = list(			// Values for normal getarmor() checks
				"melee" = 40,
				"bullet" = 30,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 50,
				"bio" = 100,
				"rad" = 100
				)
/mob/living/simple_mob/vore/wolftaur/Initialize(mapload)
	. = ..()
	var/oursize = rand(90, 200) / 100
	resize(oursize)

/mob/living/simple_mob/vore/wolftaur/syndicate/death()
	visible_message(span_critical("\The [src]'s explosive implant lets out a shrill beep!!!"))
	var/delay = rand(explosion_delay_lower, explosion_delay_upper)
	spawn(0)
		// Flash black and red as a warning.
		for(var/i = 1 to delay)
			if(i % 2 == 0)
				color = "#FFFFFF"
			else
				color = "#FF7777"
			sleep(1)

	spawn(delay)
		// The actual boom.
		if(src && !exploded)
			visible_message(span_danger("\The [src]'s body violentl explodes!"))
			exploded = TRUE
			new /obj/effect/decal/cleanable/blood/gibs(src.loc)
			explosion(src.loc, explosion_dev_range, explosion_heavy_range, explosion_light_range, explosion_flash_range)
			gib(src)
	return ..()

/mob/living/simple_mob/vore/wolftaur/syndicate/alt1
	icon_dead = "synditaur_r1"
	icon_living = "synditaur_r1"
	icon_state = "synditaur_r1"
	icon_rest = "synditaur_r1"
/mob/living/simple_mob/vore/wolftaur/syndicate/alt2
	icon_dead = "synditaur_r3"
	icon_living = "synditaur_r3"
	icon_state = "synditaur_r3"
	icon_rest = "synditaur_r3"
/mob/living/simple_mob/vore/wolftaur/syndicate/alt3
	icon_dead = "synditaur_r2"
	icon_living = "synditaur_r2"
	icon_state = "synditaur_r2"
	icon_rest = "synditaur_r2"


/mob/living/simple_mob/vore/wolftaur/syndicate/lmg
	name = "mercenary commando heavy"
	desc = "A tough looking armored canid creature armed with an LMG!"
	faction = "syndicate"
	icon_dead = "synditaur_lmg"
	icon_living = "synditaur_lmg"
	icon_state = "synditaur_lmg"
	icon_rest = "synditaur_lmg"
	loot_list = list(/obj/item/gun/projectile/automatic/l6_saw = 1)
	projectiletype = /obj/item/projectile/bullet/pistol
	projectilesound = 'sound/weapons/ballistics/a545.ogg'
	projectile_dispersion = 12
	projectile_accuracy = -25
	random_skin = 0
	base_attack_cooldown = 0.3
	reload_max = 50
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/torch/lmg/chill

/mob/living/simple_mob/vore/wolftaur/syndicate/smg
	name = "mercenary commando"
	desc = "A tough looking armored canid creature armed with an SMG!"
	faction = "syndicate"
	icon_dead = "synditaur_smg"
	icon_living = "synditaur_smg"
	icon_state = "synditaur_smg"
	icon_rest = "synditaur_smg"
	loot_list = list(/obj/item/gun/projectile/automatic/p90 = 15)
	projectiletype = /obj/item/projectile/bullet/a57
	projectilesound = 'sound/weapons/ballistics/a545.ogg'
	projectile_dispersion = 1
	projectile_accuracy = -10
	random_skin = 0
	base_attack_cooldown = 0.1
	reload_max = 15
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged
/*
/mob/living/simple_mob/vore/wolftaur/syndicate/awp
	name = "mercenary commando sniper"
	desc = "A tough looking armored canid creature armed with a sniper rifle!"
	faction = "syndicate"
	icon_dead = "synditaur_awp"
	icon_living = "synditaur_awp"
	icon_state = "synditaur_awp"
	icon_rest = "synditaur_awp"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/awp = 1)
	projectiletype = /obj/item/projectile/bullet/rifle/a338
	projectilesound = 'sound/weapons/ballistics/a762x54.ogg'
	projectile_dispersion = 0
	projectile_accuracy = 50
	random_skin = 0
	base_attack_cooldown = 30
	ranged_attack_delay = 2.5
	reload_max = 5
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/sniper/torch
\*
*/

///commented this guy out because i couldn't figure out how to make him do the neat little laser pointer targeting thingy the regular merc sniper does before blastin' - Serdy
