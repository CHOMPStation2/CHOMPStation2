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

/mob/living/simple_mob/vore/otie/syndicate/blackhole/proc/doLeap(mob/living/L)
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

/mob/living/simple_mob/vore/otie/syndicate/blackhole/proc/afterLeap(mob/living/L)
	if(status_flags & LEAPING)
		status_flags &= ~LEAPING

	set_AI_busy(FALSE)
	if(!L)
		return FALSE
	if(Adjacent(L))
		L.Weaken(1)
	return TRUE

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///the basic guy///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/vore/blackhole
	name = "Black Hole conscript"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "conscript-dead"
	icon_living = "conscript"
	icon_state = "conscript"
	icon_rest = "conscript-stunned"
	a_intent = I_HURT
	has_langs = list(LANGUAGE_SIIK, LANGUAGE_SLAVIC)
	see_in_dark = 8
	maxHealth = 100
	movement_cooldown = 0
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 15
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
	attack_sound = 'sound/weapons/slice.ogg'
	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	minbodytemp = 100
	maxbodytemp = 400
	light_range = 3
	light_power = 2
	light_color = "#CC60FF"
	grab_resist = 100

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
				"melee" = 10,
				"bullet" = 20,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 100
				)


/mob/living/simple_mob/vore/blackhole/ranged
	name = "Black Hole conscript"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask, and wield a pistol."
	icon_dead = "conscript-dead"
	icon_living = "conscript-pistol"
	icon_state = "conscript-pistol"
	icon_rest = "conscript-stunned"

	projectiletype = /obj/item/projectile/bullet/pistol/bh1
	projectilesound = 'sound/weapons/serdy/9mmpistol.ogg'
	projectile_dispersion = 3
	projectile_accuracy = -15
	base_attack_cooldown = 5 DECISECONDS
	reload_max = 8
	needs_reload = 1
	reload_time = 2 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole


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
	has_eye_glow = TRUE
	maxHealth = 75
	melee_miss_chance = 0
	melee_attack_delay = 0
	movement_cooldown = -3
	harm_intent_damage = 5
	say_list_type = /datum/say_list/merc/blackhole/grotesque
	ai_holder_type = /datum/ai_holder/simple_mob/melee
	attack_sound = 'sound/weapons/slice.ogg'
	melee_damage_lower = 30
	melee_damage_upper = 35
	attack_armor_pen = 10
	attack_sharp = TRUE
	attack_edge = 1

/mob/living/simple_mob/vore/blackhole/grotesque/death()
	..()
	visible_message(span_warning("[src] lets out a horrible cry as it collapses into an inky black pile of gore!"))
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)


/*


////////////Conscripts////////////


*/

/mob/living/simple_mob/vore/blackhole/conscript
	name = "Black Hole conscript butcher"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask, and wield a machete."
	icon_dead = "conscript-dead"
	icon_living = "conscript-melee"
	icon_state = "conscript-melee"
	icon_rest = "conscript-stunned"
	melee_damage_lower = 10
	melee_damage_upper = 25
	attack_armor_pen = 10
	attack_sharp = TRUE
	attack_edge = 1
	attack_sound = 'sound/weapons/slash.ogg'
	ai_holder_type = /datum/ai_holder/simple_mob/melee



/mob/living/simple_mob/vore/blackhole/ranged/conscript
	name = "Black Hole conscript"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask, and wield a pistol."
	icon_dead = "conscript-dead"
	icon_living = "conscript-pistol"
	icon_state = "conscript-pistol"
	icon_rest = "conscript-stunned"

	projectiletype = /obj/item/projectile/bullet/pistol/bh1
	projectilesound = 'sound/weapons/serdy/9mmpistol.ogg'
	projectile_dispersion = 3
	projectile_accuracy = -15
	base_attack_cooldown = 5 DECISECONDS
	reload_max = 8
	reload_time = 2 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole



/mob/living/simple_mob/vore/blackhole/ranged/conscript/shield
	name = "Black Hole conscript assaulter"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask, and wield a pistol and a shield."
	icon_living = "conscript-pshield"
	icon_state = "conscript-pshield"



/mob/living/simple_mob/vore/blackhole/ranged/conscript/smg
	name = "Black Hole conscript gunner"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask, and wield a sub machinegun."
	icon_living = "conscript-smg"
	icon_state = "conscript-smg"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/viper = 15, /obj/item/ammo_magazine/viper = 15, /obj/item/ammo_magazine/viper = 25, /obj/item/ammo_magazine/viper = 25)

	projectiletype = /obj/item/projectile/bullet/pistol/bh2
	projectilesound = 'sound/weapons/serdy/vityaz.ogg'
	base_attack_cooldown = 3 DECISECONDS
	reload_max = 25
	reload_time = 2 SECONDS


/mob/living/simple_mob/vore/blackhole/ranged/conscript/rifle
	name = "Black Hole conscript rifleman"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask, and wield an assault rifle."
	icon_living = "conscript-rifle"
	icon_state = "conscript-rifle"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/valik = 25, /obj/item/ammo_magazine/akm = 25, /obj/item/ammo_magazine/akm = 25, /obj/item/ammo_magazine/akm = 20)
	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh1
	projectilesound = 'sound/weapons/serdy/sks.ogg'
	base_attack_cooldown = 8
	reload_max = 30
	reload_time = 2 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole



/mob/living/simple_mob/vore/blackhole/ranged/conscript/shotgun
	name = "Black Hole conscript boarder"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask, and wield a combat shotgun."
	icon_living = "conscript-shotgun"
	icon_state = "conscript-shotgun"

	projectile_dispersion = 8
	projectile_accuracy = -18
	reload_sound = 'sound/weapons/shotgunpump.ogg'
	projectiletype = /obj/item/projectile/scatter/shotgun/blackhole
	projectilesound = 'sound/weapons/weaponsounds_shotgunshot.ogg'
	base_attack_cooldown = 12
	reload_max = 8
	reload_time = 5 SECONDS

/*


////////////Soldiers////////////


*/


/mob/living/simple_mob/vore/blackhole/soldier
	name = "Black Hole soldier"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking heavy armor. They appear to be wearing some kind of death mask."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "soldier-dead"
	icon_living = "soldier"
	icon_state = "soldier"
	icon_rest = "soldier-stunned"
	a_intent = I_HURT
	see_in_dark = 8
	maxHealth = 150
	movement_cooldown = 0.3
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 20
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

	exploded = FALSE
	explosion_dev_range		= 0
	explosion_heavy_range	= 0
	explosion_light_range	= 1
	explosion_flash_range	= 2

	explosion_delay_lower	= 1 SECOND	// Lower bound for explosion delay.
	explosion_delay_upper	= 3 SECONDS	// Upper bound.

	ai_holder_type = /datum/ai_holder/simple_mob/merc/blackhole

	say_list_type = /datum/say_list/merc/blackhole

	armor = list(			// Values for normal getarmor() checks
				"melee" = 20,
				"bullet" = 30,
				"laser" = 40,
				"energy" = 15,
				"bomb" = 5,
				"bio" = 5,
				"rad" = 100
				)



/mob/living/simple_mob/vore/blackhole/soldier/melee
	name = "Black Hole soldier bladesman"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking heavy armor. They appear to be wearing some kind of death mask, and wield a machete with a shield."
	icon_dead = "soldier-dead"
	icon_living = "soldier-melee"
	icon_state = "soldier-melee"
	icon_rest = "soldier-stunned"
	melee_damage_lower = 20
	melee_damage_upper = 25
	attack_armor_pen = 10
	attack_sharp = TRUE
	attack_edge = 1


/mob/living/simple_mob/vore/blackhole/soldier/melee/flagbearer
	name = "Black Hole soldier flagbearer"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking heavy armor. They appear to be wearing some kind of death mask, and wield a machete with a Black Hole banner."
	icon_dead = "soldier-dead"
	icon_living = "soldier-melee2"
	icon_state = "soldier-melee2"
	icon_rest = "soldier-stunned"


/mob/living/simple_mob/vore/blackhole/soldier/ranged
	name = "Black Hole soldier"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking heavy armor. They appear to be wearing some kind of death mask, and wield a pistol."
	icon_dead = "soldier-dead"
	icon_living = "soldier-pistol"
	icon_state = "soldier-pistol"
	icon_rest = "soldier-stunned"
	loot_list = list(/obj/item/gun/projectile/serdy_pistols/pmx = 15, /obj/item/ammo_magazine/pmx = 15, /obj/item/ammo_magazine/pmx = 15, /obj/item/ammo_magazine/pmx = 15)

	projectiletype = /obj/item/projectile/bullet/pistol/bh1
	projectilesound = 'sound/weapons/serdy/9mmpistol.ogg'
	projectile_dispersion = 2
	projectile_accuracy = -15
	base_attack_cooldown = 4 DECISECONDS
	needs_reload = 1
	reload_max = 8
	reload_time = 2 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole


/mob/living/simple_mob/vore/blackhole/soldier/ranged/smg
	name = "Black Hole soldier shieldbearer"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking heavy armor. They appear to be wearing some kind of death mask, and wield a shield with an SMG."
	icon_living = "soldier-smg"
	icon_state = "soldier-smg"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/viper = 15, /obj/item/ammo_magazine/viper = 15, /obj/item/ammo_magazine/viper = 25, /obj/item/ammo_magazine/viper = 25)

	projectiletype = /obj/item/projectile/bullet/pistol/bh2
	projectilesound = 'sound/weapons/serdy/vityaz.ogg'
	projectile_dispersion = 8
	projectile_accuracy = -25
	base_attack_cooldown = 3 DECISECONDS
	reload_max = 25
	reload_time = 2 SECONDS


/mob/living/simple_mob/vore/blackhole/soldier/ranged/rifle
	name = "Black Hole soldier rifleman"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking heavy armor. They appear to be wearing some kind of death mask, and wield an assault rifle."
	icon_living = "soldier-rifle"
	icon_state = "soldier-rifle"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/valik = 10, /obj/item/ammo_magazine/akm = 15, /obj/item/ammo_magazine/akm = 15, /obj/item/ammo_magazine/akm = 15)
	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh1
	projectilesound = 'sound/weapons/serdy/sks.ogg'
	base_attack_cooldown = 8
	reload_max = 30
	reload_time = 2 SECONDS


/mob/living/simple_mob/vore/blackhole/soldier/ranged/shotgun
	name = "Black Hole soldier boarder"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking heavy armor. They appear to be wearing some kind of death mask, and wield a combat shotgun."
	icon_living = "soldier-shotgun"
	icon_state = "soldier-shotgun"

	projectile_dispersion = 8
	projectile_accuracy = -18
	reload_sound = 'sound/weapons/shotgunpump.ogg'
	projectiletype = /obj/item/projectile/scatter/shotgun/blackhole
	projectilesound = 'sound/weapons/weaponsounds_shotgunshot.ogg'
	base_attack_cooldown = 12
	reload_max = 8
	reload_time = 5 SECONDS


/mob/living/simple_mob/vore/blackhole/soldier/ranged/plasma
	name = "Black Hole soldier plasma gunner"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking heavy armor. They appear to be wearing some kind of death mask, and wield an advanced plasma carbine."
	icon_living = "soldier-plasma"
	icon_state = "soldier-plasma"
	has_eye_glow = TRUE

	projectiletype = /obj/item/projectile/energy/plasma/vepr/blackhole
	projectilesound = 'sound/weapons/serdy/vepr.ogg'
	projectile_dispersion = 2
	projectile_accuracy = -15
	base_attack_cooldown = 4 DECISECONDS
	reload_max = 8
	reload_time = 5 SECONDS


/mob/living/simple_mob/vore/blackhole/soldier/ranged/lmg
	name = "Black Hole soldier machinegunner"
	desc = "A tajaran dressed in an ominous black and purple uniform, with advanced looking heavy armor. They appear to be wearing some kind of death mask, and wield a bullpupped LMG."
	icon_living = "soldier-lmg"
	icon_state = "soldier-lmg"

	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh1
	projectilesound = 'sound/weapons/serdy/strela.ogg'
	projectile_dispersion = 4
	projectile_accuracy = -25
	base_attack_cooldown = 1.5 DECISECONDS
	reload_max = 100
	reload_time = 8 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg



/*


////////////Troopers/Templars/Acolytes////////////


*/


/mob/living/simple_mob/vore/blackhole/trooper
	name = "Black Hole trooper"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them."
	icon = 'modular_chomp/icons/blackhole/blackhole32x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "trooper-dead"
	icon_living = "trooper"
	icon_state = "trooper"
	icon_rest = "trooper-stunned"
	a_intent = I_HURT
	see_in_dark = 8
	maxHealth = 150
	movement_cooldown = -0.5
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 20
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
	has_eye_glow = TRUE
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	minbodytemp = 0
	maxbodytemp = 1400

	exploded = FALSE
	explosion_dev_range		= 0
	explosion_heavy_range	= 0
	explosion_light_range	= 1
	explosion_flash_range	= 2

	explosion_delay_lower	= 1 SECOND	// Lower bound for explosion delay.
	explosion_delay_upper	= 3 SECONDS	// Upper bound.

	ai_holder_type = /datum/ai_holder/simple_mob/merc/blackhole

	say_list_type = /datum/say_list/merc/blackhole

	armor = list(			// Values for normal getarmor() checks
				"melee" = 40,
				"bullet" = 40,
				"laser" = 40,
				"energy" = 45,
				"bomb" = 5,
				"bio" = 5,
				"rad" = 100
				)


/mob/living/simple_mob/vore/blackhole/trooper/melee
	name = "Black Hole trooper bulwark"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have an energy sword and shield."
	icon_dead = "trooper-dead"
	icon_living = "trooper-sshield"
	icon_state = "trooper-sshield"
	icon_rest = "trooper-stunned"
	attack_sound = 'sound/weapons/blade1.ogg'
	loot_list = list(/obj/item/melee/energy/sword/pirate = 15, /obj/item/shield/energy = 10)
	melee_damage_lower = 30
	melee_damage_upper = 35
	attack_armor_pen = 50
	attack_sharp = TRUE
	attack_edge = 1
	attacktext = list("slashed")

	armor = list(			// Values for normal getarmor() checks
				"melee" = 70,
				"bullet" = 40,
				"laser" = 40,
				"energy" = 55,
				"bomb" = 65,
				"bio" = 65,
				"rad" = 100
				)


/mob/living/simple_mob/vore/blackhole/trooper/melee/attackby(obj/item/O, mob/user)
	if(!O.force)
		to_chat(user, span_notice("This weapon is ineffective, it does no damage."))
		visible_message(span_notice("\The [user] gently taps [src] with \the [O]."))
		return
	if(prob(20))
		visible_message(span_danger("\The [src] blocks \the [O] with its shield!"))
		if(user)
			ai_holder.react_to_attack(user)
		return
	. = ..()


/mob/living/simple_mob/vore/blackhole/trooper/melee/bullet_act(obj/item/projectile/proj)
	if(!proj)	return
	if(prob(35))
		visible_message(span_bolddanger("[src] blocks [proj] with its shield!"))
		if(proj.firer)
			ai_holder.react_to_attack(proj.firer)
		return
	. = ..()


/mob/living/simple_mob/vore/blackhole/trooper/ranged
	name = "Black Hole trooper"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have a pistol."
	icon_dead = "trooper-dead"
	icon_living = "trooper-pistol"
	icon_state = "trooper-pistol"
	icon_rest = "trooper-stunned"

	projectiletype = /obj/item/projectile/bullet/pistol/bh1
	projectilesound = 'sound/weapons/serdy/9mmpistol.ogg'
	projectile_dispersion = 2
	projectile_accuracy = -15
	base_attack_cooldown = 4 DECISECONDS
	needs_reload = 1
	reload_max = 8
	reload_time = 5 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole


/mob/living/simple_mob/vore/blackhole/trooper/ranged/pistols
	name = "Black Hole trooper gunslinger"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have TWO pistols."
	icon_dead = "trooper-dead"
	icon_living = "trooper-pistols"
	icon_state = "trooper-pistols"
	icon_rest = "trooper-stunned"
	loot_list = list(/obj/item/gun/projectile/serdy_pistols/pmx = 15, /obj/item/gun/projectile/serdy_pistols/pmx = 15, /obj/item/ammo_magazine/pmx = 15, /obj/item/ammo_magazine/pmx = 15, /obj/item/ammo_magazine/pmx = 15)
	projectiletype = /obj/item/projectile/bullet/pistol/bh1
	projectilesound = 'sound/weapons/serdy/9mmpistol.ogg'
	projectile_dispersion = 2
	projectile_accuracy = -15
	base_attack_cooldown = 2 DECISECONDS
	reload_max = 16
	reload_time = 5 SECONDS


/mob/living/simple_mob/vore/blackhole/trooper/ranged/smg
	name = "Black Hole trooper gunner"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have an SMG."
	icon_dead = "trooper-dead"
	icon_living = "trooper-smg"
	icon_state = "trooper-smg"
	icon_rest = "trooper-stunned"
	loot_list = list(/obj/item/gun/projectile/serdy_pistols/pmx = 15, /obj/item/gun/projectile/automatic/serdy/viper = 15, /obj/item/ammo_magazine/viper = 15, /obj/item/ammo_magazine/viper = 15, /obj/item/ammo_magazine/pmx = 15)
	projectiletype = /obj/item/projectile/bullet/pistol/bh2
	projectilesound = 'sound/weapons/serdy/vityaz.ogg'
	projectile_dispersion = 3
	projectile_accuracy = -15
	base_attack_cooldown = 1 DECISECONDS
	reload_max = 25
	reload_time = 2 SECONDS


/mob/living/simple_mob/vore/blackhole/trooper/ranged/smg_shield
	name = "Black Hole trooper assaulter"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have an SMG and a shield."
	icon_dead = "trooper-dead"
	icon_living = "trooper-smgshield"
	icon_state = "trooper-smgshield"
	icon_rest = "trooper-stunned"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/viper = 10, /obj/item/ammo_magazine/viper = 10, /obj/item/ammo_magazine/viper = 10, /obj/item/shield/energy = 15)
	projectiletype = /obj/item/projectile/bullet/pistol/bh2
	projectilesound = 'sound/weapons/serdy/vityaz.ogg'
	projectile_dispersion = 8
	projectile_accuracy = -15
	base_attack_cooldown = 1 DECISECONDS
	reload_max = 25
	reload_time = 2 SECONDS


/mob/living/simple_mob/vore/blackhole/trooper/ranged/smg_shield/attackby(obj/item/O, mob/user)
	if(!O.force)
		to_chat(user, span_notice("This weapon is ineffective, it does no damage."))
		visible_message(span_notice("\The [user] gently taps [src] with \the [O]."))
		return
	if(prob(20))
		visible_message(span_danger("\The [src] blocks \the [O] with its shield!"))
		if(user)
			ai_holder.react_to_attack(user)
		return
	. = ..()


/mob/living/simple_mob/vore/blackhole/trooper/ranged/smg_shield/bullet_act(obj/item/projectile/proj)
	if(!proj)	return
	if(prob(35))
		visible_message(span_bolddanger("[src] blocks [proj] with its shield!"))
		if(proj.firer)
			ai_holder.react_to_attack(proj.firer)
		return
	. = ..()


/mob/living/simple_mob/vore/blackhole/trooper/ranged/rifle
	name = "Black Hole trooper rifleman"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have an SMG."
	icon_dead = "trooper-dead"
	icon_living = "trooper-rifle"
	icon_state = "trooper-rifle"
	icon_rest = "trooper-stunned"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/valik = 15, /obj/item/ammo_magazine/akm = 15, /obj/item/ammo_magazine/akm = 15, /obj/item/ammo_magazine/akm = 25)
	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh1
	projectilesound = 'sound/weapons/serdy/sks.ogg'
	base_attack_cooldown = 8
	reload_max = 30
	reload_time = 2 SECONDS


/mob/living/simple_mob/vore/blackhole/trooper/ranged/sniper
	name = "Black Hole trooper marksman"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have a sniper rifle."
	icon_dead = "trooper-dead"
	icon_living = "trooper-sniper"
	icon_state = "trooper-sniper"
	icon_rest = "trooper-stunned"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/lynx = 15, /obj/item/ammo_magazine/lynx = 15, /obj/item/ammo_magazine/lynx = 15, /obj/item/ammo_magazine/lynx = 15)
	projectiletype = /obj/item/projectile/bullet/rifle/a145/bh2
	projectilesound = 'sound/weapons/gunshot_cannon.ogg'
	projectile_dispersion = 2
	ranged_attack_delay = 1.5 SECONDS
	projectile_accuracy = -15
	base_attack_cooldown = 4 DECISECONDS
	reload_max = 10
	reload_time = 5 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/sniper


/mob/living/simple_mob/vore/blackhole/trooper/ranged/sniper/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 2 SECONDS, maxdistance = 20)
	. = ..()

/mob/living/simple_mob/vore/blackhole/trooper/ranged/sniper/shoot_target(atom/A)
	set waitfor = FALSE

	if(!istype(A) || QDELETED(A))
		return

	setClickCooldown(get_attack_speed())

	face_atom(A)

	var/atom/orig_targ = A

	if(ranged_attack_delay)
		A = get_turf(orig_targ)
		ranged_pre_animation(A)
		handle_attack_delay(A, ranged_attack_delay) // This will sleep this proc for a bit, which is why waitfor is false.

	if(needs_reload)
		if(reload_count >= reload_max)
			try_reload()
			return FALSE

	/*
	 * CHOMP Addition: This section here is (duplicated) special snowflake code because sniper does not call parent. Basically, this is a non-stupid version of the above intended for ranged mobs.
	 * ranged_attack_delay is stupid because it sleeps the entire mob.
	 * This new ranged_cooldown_time is smarter in the sense that it is an internalized timer. Try not to confuse the names.
	*/
	if(ranged_cooldown_time) //If you have a non-zero number in a mob's variables, this pattern begins.
		if(ranged_cooldown <= world.time) //Further down, a timer keeps adding to the ranged_cooldown variable automatically.
			visible_message(span_danger(span_bold("\The [src]") + " fires at \the [A]!")) //Leave notice of shooting.
			shoot(A) //Perform the shoot action
			if(casingtype) //If the mob is designated to leave casings...
				new casingtype(loc) //... leave the casing.
			ranged_cooldown = world.time + ranged_cooldown_time + ((injury_level / 2) SECONDS) //Special addition here. This is a timer. Keeping updating the time after shooting. Add that ranged cooldown time specified in the mob to the world time.
		return TRUE	//End these commands here.
	// CHOMPAddition End

	visible_message(span_danger(span_bold("\The [src]") + " fires at \the [orig_targ]!"))
	shoot(A)
	if(casingtype)
		new casingtype(loc)

	if(ranged_attack_delay)
		ranged_post_animation(A)

	return TRUE


/mob/living/simple_mob/vore/blackhole/trooper/ranged/sniper/amr
	name = "Black Hole trooper sniper"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have an AMR."
	icon_dead = "trooper-dead"
	icon_living = "trooper-amr"
	icon_state = "trooper-amr"
	icon_rest = "trooper-stunned"

	projectiletype = /obj/item/projectile/bullet/rifle/a145/bh1 // Really scary bullet.
	projectilesound = 'sound/weapons/gunshot_cannon.ogg'
	projectile_dispersion = 0
	ranged_attack_delay = 2.5 SECONDS
	projectile_accuracy = 15
	base_attack_cooldown = 2 DECISECONDS
	reload_max = 4
	reload_time = 5 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/sniper


/mob/living/simple_mob/vore/blackhole/trooper/ranged/sniper/rpg
	name = "Black Hole trooper anti-tank"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have an AMR."
	icon_dead = "trooper-dead"
	icon_living = "trooper-rpg"
	icon_state = "trooper-rpg"
	icon_rest = "trooper-stunned"

	projectiletype = /obj/item/projectile/explosive_rocket/blackhole // RAWKET LAWNCHAIR
	projectile_dispersion = 0
	ranged_attack_delay = 2.5 SECONDS
	projectile_accuracy = 15
	base_attack_cooldown = 20 DECISECONDS
	reload_max = 1
	reload_sound = 'sound/weapons/serdy/rpg_reload.ogg'
	reload_time = 5 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/sniper


/mob/living/simple_mob/vore/blackhole/trooper/ranged/lmg
	name = "Black Hole trooper machinegunner"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have an LMG."
	icon_living = "trooper-lmg"
	icon_state = "trooper-lmg"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/zvir = 5, /obj/item/ammo_magazine/zvir = 15, /obj/item/ammo_magazine/zvir = 15, /obj/item/ammo_magazine/zvir = 10)
	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh1
	projectilesound = 'sound/weapons/serdy/strela.ogg'
	projectile_dispersion = 4
	projectile_accuracy = -25
	base_attack_cooldown = 1.5 DECISECONDS
	reload_max = 100
	reload_time = 12 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg


/mob/living/simple_mob/vore/blackhole/trooper/ranged/hmg
	name = "Black Hole trooper destroyer"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have a massive HMG slung low, and ready."
	icon_living = "trooper-hmg"
	icon_state = "trooper-hmg"
	has_eye_glow = TRUE
	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh3
	projectilesound = 'sound/weapons/serdy/strela.ogg'
	projectile_dispersion = 7
	projectile_accuracy = -25
	base_attack_cooldown = 2 DECISECONDS
	reload_max = 50
	reload_time = 8 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg


/mob/living/simple_mob/vore/blackhole/templar/melee
	name = "Black Hole templar"
	desc = "An ominous looking feline individual, wearing a reinforced dark black and purple voidsuit. There is something very uncanny about them. They appear to have an energy sword and shield."
	icon_dead = "templar-dead"
	icon_living = "templar-sshield"
	icon_state = "templar-sshield"
	icon_rest = "templar-stunned"
	attack_sound = 'sound/weapons/blade1.ogg'
	has_eye_glow = TRUE
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	minbodytemp = 0
	maxbodytemp = 1400


	loot_list = list(/obj/item/melee/energy/sword/pirate = 25, /obj/item/shield/energy = 10)
	melee_damage_lower = 30
	melee_damage_upper = 35
	attack_armor_pen = 50
	attack_sharp = TRUE
	attack_edge = 1
	attacktext = list("slashed")

	armor = list(			// Values for normal getarmor() checks
				"melee" = 50,
				"bullet" = 50,
				"laser" = 50,
				"energy" = 55,
				"bomb" = 65,
				"bio" = 65,
				"rad" = 100
				)

/mob/living/simple_mob/vore/blackhole/templar/melee/attackby(obj/item/O, mob/user)
	if(!O.force)
		to_chat(user, span_notice("This weapon is ineffective, it does no damage."))
		visible_message(span_notice("\The [user] gently taps [src] with \the [O]."))
		return
	if(prob(20))
		visible_message(span_danger("\The [src] blocks \the [O]!"))
		if(user)
			ai_holder.react_to_attack(user)
		return
	. = ..()


/mob/living/simple_mob/vore/blackhole/templar/melee/bullet_act(obj/item/projectile/proj)
	if(!proj)	return
	if(prob(35))
		visible_message(span_bolddanger("[src] blocks [proj]!"))
		if(proj.firer)
			ai_holder.react_to_attack(proj.firer)
		return
	. = ..()


/mob/living/simple_mob/vore/blackhole/templar/melee/desword
	name = "Black Hole templar defender"
	desc = "An ominous looking feline individual, wearing a reinforced dark black and purple voidsuit. There is something very uncanny about them. They appear to have a double energy sword."
	icon_dead = "templar-dead"
	icon_living = "templar-dsword"
	icon_state = "templar-dsword"
	icon_rest = "templar-stunned"
	has_eye_glow = TRUE
	attack_sound = 'sound/weapons/blade1.ogg'
	loot_list = list(/obj/item/melee/energy/sword/pirate = 15, /obj/item/melee/energy/sword/pirate = 15)
	melee_damage_lower = 30
	melee_damage_upper = 35
	attack_armor_pen = 50
	attack_sharp = TRUE
	melee_attack_delay = 0.5
	base_attack_cooldown = 5
	attack_edge = 1
	attacktext = list("slashed", "quigonned", "styled on", "darth mauled", "oppressed")


/mob/living/simple_mob/vore/blackhole/templar/melee/hammer
	name = "Black Hole templar mauler"
	desc = "An ominous looking feline individual, wearing a reinforced dark black and purple voidsuit. There is something very uncanny about them. They appear to have a giant shock maul."
	icon_dead = "templar-dead"
	icon_living = "templar-hammer"
	icon_state = "templar-hammer"
	icon_rest = "templar-stunned"
	has_eye_glow = TRUE
	attack_sound = 'sound/weapons/heavysmash.ogg'
	loot_list = list(/obj/item/melee/shock_maul = 25)
	melee_damage_lower = 30
	melee_damage_upper = 45
	base_attack_cooldown = 12
	attack_armor_pen = 10
	attack_sharp = FALSE
	attack_edge = 0
	attacktext = list("struck", "bonked", "hammered", "vibe checked", "sledged", "thrashed")


/mob/living/simple_mob/vore/blackhole/templar/melee/hammer/apply_melee_effects(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		L.electrocute_act(10, src, def_zone = BP_TORSO)
		visible_message(span_danger("\The [src] sends \the [L] flying with a thunderous crackle of electricity!"))
		playsound(src, 'sound/effects/lightningbolt.ogg', 50, 1)
		playsound(src.loc, "sparks", 50, 1)
		L.stun_effect_act(1 , 3, BP_TORSO, src)
		L.take_organ_damage(10)
		L.Paralyse(1)
		var/throwdir = get_dir(src, L)
		L.throw_at(get_edge_target_turf(L, throwdir), 50, 4, src)
	. = ..()



/mob/living/simple_mob/vore/blackhole/templar/ranged
	name = "Black Hole templar assaulter"
	desc = "An ominous looking feline individual, wearing a reinforced dark black and purple voidsuit. There is something very uncanny about them. They appear to have a pistol and a shield."
	icon_dead = "templar-dead"
	icon_living = "templar-pshield"
	icon_state = "templar-pshield"
	icon_rest = "templar-stunned"
	has_eye_glow = TRUE

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	minbodytemp = 0
	maxbodytemp = 1400


	loot_list = list(/obj/item/melee/energy/sword/pirate = 35, /obj/item/shield/energy = 30)

	projectiletype = /obj/item/projectile/bullet/pistol/bh1
	projectilesound = 'sound/weapons/serdy/9mmpistol.ogg'
	projectile_dispersion = 2
	projectile_accuracy = -15
	base_attack_cooldown = 4 DECISECONDS
	needs_reload = 1
	reload_max = 8
	reload_time = 2 SECONDS
	armor = list(			// Values for normal getarmor() checks
				"melee" = 40,
				"bullet" = 40,
				"laser" = 40,
				"energy" = 45,
				"bomb" = 45,
				"bio" = 65,
				"rad" = 100
				)


/mob/living/simple_mob/vore/blackhole/templar/ranged/smg_shield
	name = "Black Hole templar assaulter"
	desc = "An ominous looking feline individual, wearing a reinforced dark black and purple voidsuit. There is something very uncanny about them. They appear to have an SMG and a shield."
	icon_dead = "templar-dead"
	icon_living = "templar-smgshield"
	icon_state = "templar-smgshield"
	icon_rest = "templar-stunned"
	loot_list = list(/obj/item/gun/projectile/automatic/serdy/viper = 25, /obj/item/ammo_magazine/viper = 15, /obj/item/ammo_magazine/viper = 15, /obj/item/shield/energy = 10)

	projectiletype = /obj/item/projectile/bullet/pistol/bh2
	projectilesound = 'sound/weapons/serdy/vityaz.ogg'
	projectile_dispersion = 8
	projectile_accuracy = -15
	base_attack_cooldown = 1 DECISECONDS
	reload_max = 25
	reload_time = 3 SECONDS
	armor = list(			// Values for normal getarmor() checks
				"melee" = 40,
				"bullet" = 40,
				"laser" = 40,
				"energy" = 45,
				"bomb" = 45,
				"bio" = 65,
				"rad" = 100
				)


/mob/living/simple_mob/vore/blackhole/templar/ranged/smg_shield/attackby(obj/item/O, mob/user)
	if(!O.force)
		to_chat(user, span_notice("This weapon is ineffective, it does no damage."))
		visible_message(span_notice("\The [user] gently taps [src] with \the [O]."))
		return
	if(prob(20))
		visible_message(span_danger("\The [src] blocks \the [O] with its shield!"))
		if(user)
			ai_holder.react_to_attack(user)
		return
	. = ..()


/mob/living/simple_mob/vore/blackhole/templar/ranged/smg_shield/bullet_act(obj/item/projectile/proj)
	if(!proj)	return
	if(prob(35))
		visible_message(span_bolddanger("[src] blocks [proj] with its shield!"))
		if(proj.firer)
			ai_holder.react_to_attack(proj.firer)
		return
	. = ..()



/mob/living/simple_mob/vore/blackhole/acolyte/ranged
	name = "Black Hole acolyte"
	desc = "An ominous looking feline individual, wearing a sleek, dark black and purple voidsuit. There is something very uncanny about them. They appear to have a pistol."
	icon_dead = "acolyte-dead"
	icon_living = "acolyte-pistol"
	icon_state = "acolyte-pistol"
	icon_rest = "acolyte-stunned"
	has_eye_glow = TRUE

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 15
	minbodytemp = 0
	maxbodytemp = 1400

	projectiletype = /obj/item/projectile/bullet/pistol/bh1
	projectilesound = 'sound/weapons/serdy/vityaz.ogg'
	projectile_dispersion = 3
	projectile_accuracy = -15
	base_attack_cooldown = 1 DECISECONDS
	needs_reload = 1
	reload_max = 12
	reload_time = 2 SECONDS
	armor = list(			// Values for normal getarmor() checks
				"melee" = 40,
				"bullet" = 40,
				"laser" = 40,
				"energy" = 45,
				"bomb" = 45,
				"bio" = 65,
				"rad" = 100
				)

	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole


/mob/living/simple_mob/vore/blackhole/acolyte/ranged/ion
	name = "Black Hole acolyte disruptor"
	desc = "An ominous looking feline individual, wearing a sleek, dark black and purple voidsuit. There is something very uncanny about them. They appear to have an ion pistol."
	icon_living = "acolyte-ion"
	icon_state = "acolyte-ion"

	projectiletype = /obj/item/projectile/ion/bh1
	projectile_dispersion = 3
	projectile_accuracy = -25
	base_attack_cooldown = 4 DECISECONDS
	reload_max = 10


/mob/living/simple_mob/vore/blackhole/acolyte/ranged/pulse
	name = "Black Hole acolyte annihilator"
	desc = "An ominous looking feline individual, wearing a sleek, dark black and purple voidsuit. There is something very uncanny about them. They appear to have a fucking pulse rifle!"
	icon_living = "acolyte-pulse"
	icon_state = "acolyte-pulse"

	projectiletype = /obj/item/projectile/beam/pulse/bh1
	projectile_dispersion = 3
	projectile_accuracy = -25
	base_attack_cooldown = 12 DECISECONDS
	reload_max = 10


/mob/living/simple_mob/vore/blackhole/acolyte/ranged/lightning
	name = "Black Hole acolyte conduit"
	desc = "An ominous looking feline individual, wearing a sleek, dark black and purple voidsuit. There is something very uncanny about them. They appear to have a lightning gun."
	icon_living = "acolyte-lightning"
	icon_state = "acolyte-lightning"

	projectiletype = /obj/item/projectile/beam/shock/bh1
	projectile_dispersion = 3
	projectile_accuracy = -25
	base_attack_cooldown = 20 DECISECONDS
	reload_max = 10


/mob/living/simple_mob/vore/blackhole/acolyte/ranged/sniper/gauss
	name = "Black Hole acolyte monolithian"
	desc = "An ominous looking feline individual, wearing a sleek, dark black and purple voidsuit. There is something very uncanny about them. They appear to have a gauss rifle."
	icon_living = "acolyte-gauss"
	icon_state = "acolyte-gauss"

	projectiletype = /obj/item/projectile/bullet/rifle/a145/bh3
	projectile_dispersion = 0
	ranged_attack_delay = 1.5 SECONDS
	projectile_accuracy = 15
	base_attack_cooldown = 2 DECISECONDS
	reload_max = 1
	reload_time = 2 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/sniper

/mob/living/simple_mob/vore/blackhole/acolyte/ranged/sniper/ranged_pre_animation(atom/A)
	Beam(get_turf(A), icon_state = "sniper_beam", time = 2 SECONDS, maxdistance = 20)
	. = ..()

/mob/living/simple_mob/vore/blackhole/acolyte/ranged/sniper/shoot_target(atom/A)
	set waitfor = FALSE

	if(!istype(A) || QDELETED(A))
		return

	setClickCooldown(get_attack_speed())

	face_atom(A)

	var/atom/orig_targ = A

	if(ranged_attack_delay)
		A = get_turf(orig_targ)
		ranged_pre_animation(A)
		handle_attack_delay(A, ranged_attack_delay) // This will sleep this proc for a bit, which is why waitfor is false.

	if(needs_reload)
		if(reload_count >= reload_max)
			try_reload()
			return FALSE

	/*
	 * CHOMP Addition: This section here is (duplicated) special snowflake code because sniper does not call parent. Basically, this is a non-stupid version of the above intended for ranged mobs.
	 * ranged_attack_delay is stupid because it sleeps the entire mob.
	 * This new ranged_cooldown_time is smarter in the sense that it is an internalized timer. Try not to confuse the names.
	*/
	if(ranged_cooldown_time) //If you have a non-zero number in a mob's variables, this pattern begins.
		if(ranged_cooldown <= world.time) //Further down, a timer keeps adding to the ranged_cooldown variable automatically.
			visible_message(span_danger(span_bold("\The [src]") + " fires at \the [A]!")) //Leave notice of shooting.
			shoot(A) //Perform the shoot action
			if(casingtype) //If the mob is designated to leave casings...
				new casingtype(loc) //... leave the casing.
			ranged_cooldown = world.time + ranged_cooldown_time + ((injury_level / 2) SECONDS) //Special addition here. This is a timer. Keeping updating the time after shooting. Add that ranged cooldown time specified in the mob to the world time.
		return TRUE	//End these commands here.
	// CHOMPAddition End

	visible_message(span_danger(span_bold("\The [src]") + " fires at \the [orig_targ]!"))
	shoot(A)
	if(casingtype)
		new casingtype(loc)

	if(ranged_attack_delay)
		ranged_post_animation(A)

	return TRUE


/mob/living/simple_mob/vore/blackhole/acolyte/ranged/plasma
	name = "Black Hole acolyte purifyer"
	desc = "An ominous looking feline individual, wearing a sleek, dark black and purple voidsuit. There is something very uncanny about them. They appear to have a plasma carbine."
	icon_living = "acolyte-plasma"
	icon_state = "acolyte-plasma"

	projectiletype = /obj/item/projectile/energy/plasma/vepr/blackhole
	projectilesound = 'sound/weapons/serdy/vepr.ogg'
	projectile_dispersion = 2
	projectile_accuracy = -15
	base_attack_cooldown = 3 DECISECONDS
	reload_max = 8
	reload_time = 5 SECONDS


/mob/living/simple_mob/vore/blackhole/acolyte/ranged/shotgun
	name = "Black Hole acolyte blackhand"
	desc = "An ominous looking feline individual, wearing a sleek, dark black and purple voidsuit. There is something very uncanny about them. They appear to have a combat shotgun."
	icon_living = "acolyte-shotgun"
	icon_state = "acolyte-shotgun"

	projectile_dispersion = 8
	projectile_accuracy = -18
	reload_sound = 'sound/weapons/shotgunpump.ogg'
	projectiletype = /obj/item/projectile/scatter/shotgun/blackhole
	projectilesound = 'sound/weapons/weaponsounds_shotgunshot.ogg'
	base_attack_cooldown = 12
	reload_max = 8
	reload_time = 5 SECONDS


/mob/living/simple_mob/vore/blackhole/acolyte/ranged/sniper/amr
	name = "Black Hole acolyte wishgranter"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have an AMR."
	icon_living = "acolyte-amr"
	icon_state = "acolyte-amr"

	projectiletype = /obj/item/projectile/bullet/rifle/a145/bh1 // Really scary bullet.
	projectilesound = 'sound/weapons/gunshot_cannon.ogg'
	projectile_dispersion = 0
	ranged_attack_delay = 2.5 SECONDS
	projectile_accuracy = 15
	base_attack_cooldown = 2 DECISECONDS
	reload_max = 4
	reload_time = 5 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/sniper


/mob/living/simple_mob/vore/blackhole/acolyte/ranged/hmg
	name = "Black Hole acolyte destroyer"
	desc = "An ominous looking feline individual, wearing a dark black and purple voidsuit. There is something very uncanny about them. They appear to have a massive HMG slung low, and ready."
	icon_living = "acolyte-hmg"
	icon_state = "acolyte-hmg"

	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh3
	projectilesound = 'sound/weapons/serdy/strela.ogg'
	projectile_dispersion = 7
	projectile_accuracy = -25
	base_attack_cooldown = 2 DECISECONDS
	reload_max = 50
	reload_time = 8 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg


/mob/living/simple_mob/vore/blackhole/acolyte/ranged/flagbearer
	name = "Black Hole acolyte flagbearer"
	desc = "An ominous looking feline individual, wearing a sleek, dark black and purple voidsuit. There is something very uncanny about them. They appear to have a plasma carbine and a banner bearing the symbol of Black Hole."
	icon_living = "acolyte-banner"
	icon_state = "acolyte-banner"

	projectiletype = /obj/item/projectile/energy/plasma/vepr/blackhole
	projectilesound = 'sound/weapons/serdy/vepr.ogg'
	projectile_dispersion = 3
	projectile_accuracy = -25
	base_attack_cooldown = 3 DECISECONDS
	reload_max = 8
	reload_time = 5 SECONDS






///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///taur specific variations!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///

/mob/living/simple_mob/vore/blackhole/taur
	name = "Black Hole soldier"
	desc = "A tauric tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask."
	icon = 'modular_chomp/icons/blackhole/blackhole64x32.dmi'
	faction = FACTION_BLACKHOLE
	icon_dead = "soldier-dead"
	icon_living = "soldier"
	icon_state = "soldier"
	icon_rest = "soldier-stunned"
	a_intent = I_HURT
	see_in_dark = 8
	maxHealth = 200
	movement_cooldown = 0
	harm_intent_damage = 15
	melee_damage_lower = 20
	melee_damage_upper = 25
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
	attack_sound = 'sound/weapons/slice.ogg'
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	light_range = 1
	light_power = 0.5
	light_color = "CC60FF"
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0


	exploded = FALSE
	explosion_dev_range		= 0
	explosion_heavy_range	= 0
	explosion_light_range	= 1
	explosion_flash_range	= 2

	explosion_delay_lower	= 1 SECOND	// Lower bound for explosion delay.
	explosion_delay_upper	= 3 SECONDS	// Upper bound.

	ai_holder_type = /datum/ai_holder/simple_mob/merc/blackhole

	say_list_type = /datum/say_list/merc/blackhole

	armor = list(			// Values for normal getarmor() checks
				"melee" = 10,
				"bullet" = 20,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 100
				)


/mob/living/simple_mob/vore/blackhole/taur/soldier/melee
	name = "Black Hole soldier"
	desc = "A tauric tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask. They have an energy sword and an energy shield."
	icon_living = "soldier-sshield"
	icon_state = "soldier-sshield"

/mob/living/simple_mob/vore/blackhole/taur/soldier/melee/attackby(obj/item/O, mob/user)
	if(!O.force)
		to_chat(user, span_notice("This weapon is ineffective, it does no damage."))
		visible_message(span_notice("\The [user] gently taps [src] with \the [O]."))
		return
	if(prob(20))
		visible_message(span_danger("\The [src] blocks \the [O] with its shield!"))
		if(user)
			ai_holder.react_to_attack(user)
		return
	. = ..()


/mob/living/simple_mob/vore/blackhole/taur/soldier/melee/bullet_act(obj/item/projectile/proj)
	if(!proj)	return
	if(prob(35))
		visible_message(span_bolddanger("[src] blocks [proj] with its shield!"))
		if(proj.firer)
			ai_holder.react_to_attack(proj.firer)
		return
	. = ..()


/mob/living/simple_mob/vore/blackhole/taur/soldier/ranged
	name = "Black Hole rifleman"
	desc = "A tauric tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask. They have an assault rifle."
	icon_living = "soldier-rifle"
	icon_state = "soldier-rifle"

	loot_list = list(/obj/item/gun/projectile/automatic/serdy/valik = 25, /obj/item/ammo_magazine/akm = 25, /obj/item/ammo_magazine/akm = 15, /obj/item/ammo_magazine/akm = 10)
	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh1
	projectilesound = 'sound/weapons/serdy/sks.ogg'
	base_attack_cooldown = 8

	needs_reload = 1
	reload_max = 30
	reload_time = 3 SECONDS
	armor = list(			// Values for normal getarmor() checks
				"melee" = 10,
				"bullet" = 20,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 100
				)

	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole



/mob/living/simple_mob/vore/blackhole/taur/soldier/ranged/lmg
	name = "Black Hole machinegunner"
	desc = "A tauric tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask. They have an LMG."
	icon_living = "soldier-lmg"
	icon_state = "soldier-lmg"

	loot_list = null
	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh3
	projectilesound = 'sound/weapons/serdy/strela.ogg'
	projectile_dispersion = 7
	projectile_accuracy = -25
	base_attack_cooldown = 2 DECISECONDS
	reload_max = 50
	reload_time = 8 SECONDS


	armor = list(			// Values for normal getarmor() checks
				"melee" = 10,
				"bullet" = 20,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 100
				)

	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg



/mob/living/simple_mob/vore/blackhole/taur/soldier/ranged/hmg
	name = "Black Hole heavy machinegunner"
	desc = "A tauric tajaran dressed in an ominous black and purple uniform, with advanced looking armor. They appear to be wearing some kind of death mask. They have a heavy machinegun!"
	icon_living = "soldier-hmg"
	icon_state = "soldier-hmg"

	loot_list = null
	projectiletype = /obj/item/projectile/bullet/rifle/a545/bh3
	projectilesound = 'sound/weapons/serdy/strela.ogg'
	projectile_dispersion = 7
	projectile_accuracy = -25
	base_attack_cooldown = 2 DECISECONDS
	reload_max = 50
	reload_time = 8 SECONDS


	armor = list(			// Values for normal getarmor() checks
				"melee" = 10,
				"bullet" = 20,
				"laser" = 20,
				"energy" = 5,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 100
				)

	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg


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
	"The stone structure beckons you closer with promises of power...",
	"The stone structure whispers soothing words to you, in familiar voices...",
	"The ominous stone structure calms your mind. It feels good...",
	"Your focus is drawn to the glowing stone structure, your vision briefly only able to perceive the monolith...",
	"You see your friends and associates kneeling beside the glowing pylon peacefully...",
	"You feel an inexplicable urge to stop fighting.",
	"You see images of Black Hole cultists communing with some indescribable greater power...",
	"The ominous stone structure promises you peace and happiness, accompanied by vivid images of a brighter future..."))

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
				"bullet" = 80,
				"laser" = 80,
				"energy" = 97,
				"bomb" = 0,
				"bio" = 100,
				"rad" = 100)
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
///rocket doggy///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///


/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound
	name = "BhX. 08 mobile artillery platform"
	desc = "A massive, hulking quadrupedal platform with five self-loading rocket artillery pods on it's back, and multiple smaller MLRS pods. The heavy armor has arrived."
	catalogue_data = list(/datum/category_item/catalogue/technology/adv_dark_gygax)
	has_eye_glow = TRUE
	icon_state = "rocketdoggy"
	icon_living = "rocketdoggy"
	icon_dead = "rocketdoggy"
	faction = FACTION_BLACKHOLE
	pixel_x = -48
	default_pixel_x = -48
	old_x = -48
	old_y = 0
	vis_height = 92
	movement_cooldown = 10
	icon = 'modular_chomp/icons/blackhole/blackhole128x92.dmi'
	wreckage = /obj/structure/loot_pile/mecha/gygax/dark/adv/blackhole/doggy
	icon_scale_x = 1
	icon_scale_y = 1
	movement_shake_radius = 15
	base_attack_cooldown = 0.5 DECISECONDS
	maxHealth = 750
	deflect_chance = 25
	has_repair_droid = FALSE
	devourable = 0	//fuck off immediately
	digestable = 0
	allow_mind_transfer = FALSE //i know what you are
	mob_size = MOB_LARGE //also no grab fu
	armor = list(
				"melee"		= 10,
				"bullet"	= 10,
				"laser"		= 10,
				"energy"	= 10,
				"bomb"		= 90,
				"bio"		= 100,
				"rad"		= 100
				)

	special_attack_min_range = 0
	special_attack_max_range = 30
	special_attack_cooldown = 5 SECONDS
	projectiletype = /obj/item/projectile/energy/homing_bolt/microrocket
	glow_range = 7
	glow_intensity = 3
	glow_color = "#ED9200"

	needs_reload = 1
	reload_max = 8
	reload_time = 3 SECONDS
	projectile_dispersion = 8
	projectile_accuracy = -18
	reload_sound = 'sound/weapons/serdy/rpg_reload.ogg'

	var/flames
	var/charge_warmup = 2 SECOND

	ai_holder_type = /datum/ai_holder/simple_mob/intentional/adv_dark_gygax/blackhole
	var/obj/effect/overlay/energy_ball/energy_ball = null
	var/shottype_index = 1
	var/list/rocketdoggy = list(/obj/item/projectile/energy/homing_bolt/microrocket,/obj/item/projectile/energy/homing_bolt/microrocket,/obj/item/projectile/energy/homing_bolt/microrocket,/obj/item/projectile/energy/homing_bolt/microrocket,/obj/item/projectile/arc/explosive_rocket/rocket/bh1,/obj/item/projectile/arc/explosive_rocket/rocket/bh1,/obj/item/projectile/arc/explosive_rocket/rocket/bh1,/obj/item/projectile/arc/explosive_rocket/rocket/bh1)

/obj/structure/loot_pile/mecha/gygax/dark/adv/blackhole/doggy
	icon = 'modular_chomp/icons/blackhole/blackhole128x92.dmi'
	icon_state = "rocketdoggy-wreck"
	pixel_x = -48
	old_x = -48
	old_y = 0

/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/shoot_target(atom/A)
	projectiletype = rocketdoggy[shottype_index]
	shottype_index++
	if(shottype_index > rocketdoggy.len) shottype_index = 1
	. = ..()

/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/Destroy()
	if(energy_ball)
		energy_ball.stop_orbit()
		qdel(energy_ball)
	return ..()

/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/do_special_attack(atom/A)
	. = TRUE // So we don't fire a bolt as well.
	switch(a_intent)
		if(I_DISARM)
			electric_defense(A)
		if(I_HURT) // Rockets
			launch_rockets(A)
		if(I_GRAB) // Micro-singulo
			launch_microsingularity(A)


/obj/item/projectile/energy/homing_bolt/microrocket/launch_projectile(atom/target, target_zone, mob/user, params, angle_override, forced_spread = 2)
	..()
	if(target)
		set_homing_target(target)

/obj/item/projectile/energy/homing_bolt/microrocket/fire(angle, atom/direct_target)
	..()
	set_pixel_speed(0.5)


/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/update_icon()
	..()
	build_icons()


/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/proc/build_icons()
	cut_overlays()
	if(stat == DEAD)
		plane = MOB_LAYER
		return
	else
		plane = ABOVE_MOB_PLANE
	var/image/I = image(icon)
	if(flames)
		I = image(icon, "rocketdoggy_flame")
		I.appearance_flags |= PIXEL_SCALE
		I.plane = PLANE_LIGHTING_ABOVE
		add_overlay(I)


/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/proc/electric_defense(atom/target)
	glow_toggle = 1
	set_light(glow_range, glow_intensity, glow_color) //Setting it here so the light starts immediately
	set_AI_busy(TRUE)
	flames = 1
	visible_message(span_warning("\The [src] ignites it's mouth flamethrower!"))
	build_icons()
	addtimer(CALLBACK(src, PROC_REF(firebreathend), target), 2 SECONDS, TIMER_DELETE_ME)
	playsound(src, "sound/magic/Fireball.ogg", 50, 1)

/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/proc/firebreathend(atom/A)
	// clear our cosmetics even if the target is deleted
	glow_toggle = 0
	flames = 0
	build_icons()
	set_light(0)
	set_AI_busy(FALSE)
	//make sure our target still exists and is on a turf
	if(QDELETED(A) || !isturf(get_turf(A)))
		return
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/dragon(get_turf(src))
	src.visible_message(span_danger("\The [src] spews fire at \the [A]!"))
	playsound(src, "sound/weapons/serdy/heavyflamethrower.ogg", 50, 1)
	P.launch_projectile(A, BP_TORSO, src)


/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/proc/launch_rockets(atom/target)
	// Telegraph our next move.
	Beam(target, icon_state = "sat_beam", time = 3.5 SECONDS, maxdistance = INFINITY)
	visible_message(span_warning("\The [src] raises it's rocket battery!"))
	playsound(src, 'sound/effects/metalscrape1.ogg', 150, 1, extrarange = 10)
	addtimer(CALLBACK(src, PROC_REF(launch_rocket_fireloop), target, 5), 0.5 SECONDS, TIMER_DELETE_ME)

/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/proc/launch_rocket_fireloop(atom/target, remaining)
	SHOULD_NOT_OVERRIDE(TRUE)
	PRIVATE_PROC(TRUE)

	// Might get deleted in the meantime.
	var/turf/T = get_turf(target)
	if(!target || !T || !remaining) // Finish shooting
		visible_message(span_warning("\The [src] lowers it's rocket battery."))
		playsound(src, 'sound/effects/metalscrape3.ogg', 100, 1, extrarange = 10)
		return
	// And I started blastin--
	visible_message(span_warning("\The [src] fires a rocket into the air!"))
	playsound(src, 'sound/weapons/rocketartillery1.ogg', 500, 5, extrarange = 50)
	face_atom(T)
	// pew pew pew

	var/obj/item/projectile/arc/explosive_rocket/rocket/bh2/rocket = new(loc)
	rocket.old_style_target(T, src)
	rocket.fire()

	// and do it again till we're out of remaining shots
	addtimer(CALLBACK(src, PROC_REF(launch_rocket_fireloop), target, --remaining), 0.5 SECONDS, TIMER_DELETE_ME)


/mob/living/simple_mob/mechanical/mecha/combat/blackhole/artilleryhound/proc/launch_microsingularity(atom/target)
	var/turf/T = get_turf(target)
	visible_message(span_warning("\The [src] fires an energetic sphere into the air!"))
	playsound(src, 'sound/weapons/Laser.ogg', 50, 1)
	face_atom(T)
	var/obj/item/projectile/arc/microsingulo/sphere = new(loc)
	sphere.old_style_target(T, src)
	sphere.fire()

/obj/item/projectile/arc/microsingulo
	name = "micro singularity"
	icon_state = "bluespace"

/obj/item/projectile/arc/microsingulo/on_impact(turf/T)
	new /obj/effect/temporary_effect/pulse/microsingulo(T)


/obj/effect/temporary_effect/pulse/microsingulo
	name = "micro singularity"
	desc = "It's sucking everything in!"
	icon = 'icons/obj/objects.dmi'
	icon_state = "bhole3"
	light_range = 4
	light_power = 5
	light_color = "#CC60FF"
	pulses_remaining = 10
	pulse_delay = 0.5 SECONDS
	pull_radius = 3
	pull_strength = STAGE_THREE

/obj/effect/temporary_effect/pulse/microsingulo/on_pulse()
	for(var/atom/A in range(pull_radius, src))
		A.singularity_pull(src, pull_strength)


/datum/ai_holder/simple_mob/intentional/adv_dark_gygax/blackhole
	conserve_ammo = TRUE
	vision_range = 30
	closest_desired_distance = 5
	cooperative = FALSE
	electric_defense_radius = 5			// How big to assume electric defense's area is.
	microsingulo_radius = 9				// Same but for microsingulo pull.
	rocket_explosive_radius = 4			// Explosion radius for the rockets.

	electric_defense_threshold = 1		// How many non-targeted people are needed in close proximity before electric defense is viable.
	microsingulo_threshold = 4			// Similar to above, but uses an area around the target.

// Used to control the mob's positioning based on which special attack it has done.
// Note that the intent will not change again until the next special attack is about to happen.
/datum/ai_holder/simple_mob/intentional/adv_dark_gygax/on_engagement(atom/A)
	// Make the AI backpeddle if using an AoE special attack.
	var/list/risky_intents = list(I_GRAB, I_HURT) // Mini-singulo and missiles.
	if(holder.a_intent in risky_intents)
		var/closest_distance = 1
		switch(holder.a_intent) // Plus one just in case.
			if(I_HURT)
				closest_distance = rocket_explosive_radius + 1
			if(I_GRAB)
				closest_distance = microsingulo_radius + 1

		if(get_dist(holder, A) <= closest_distance)
			holder.IMove(get_step_away(holder, A, closest_distance))

	// Otherwise get up close and personal.
	else if(get_dist(holder, A) > closest_desired_distance)
		holder.IMove(get_step_towards(holder, A))

// Changes the mob's intent, which controls which special attack is used.
// I_DISARM causes Electric Defense, I_GRAB causes Micro-Singularity, and I_HURT causes Missile Barrage.
/datum/ai_holder/simple_mob/intentional/adv_dark_gygax/pre_special_attack(atom/A)
	if(isliving(A))
		var/mob/living/target = A

		// If we're surrounded, Electric Defense will quickly fix that.
		var/tally = 0
		var/list/potential_targets = list_targets() // Returns list of mobs and certain objects like mechs and turrets.
		for(var/atom/movable/AM in potential_targets)
			if(get_dist(holder, AM) > electric_defense_radius)
				continue
			if(!can_attack(AM))
				continue
			tally++

		// Should we shock them?
		if(tally >= electric_defense_threshold || get_dist(target, holder) <= electric_defense_radius)
			holder.a_intent = I_DISARM
			return

		// Otherwise they're a fair distance away and we're not getting mobbed up close.
		// See if we should use missiles or microsingulo.
		tally = 0 // Let's recycle the var.
		for(var/atom/movable/AM in potential_targets)
			if(get_dist(target, AM) > microsingulo_radius) // Deliberately tests distance between target and nearby targets and not the holder.
				continue
			if(!can_attack(AM))
				continue
			if(AM.anchored) // Microsingulo doesn't do anything to anchored things.
				tally--
			else
				tally++

		// Lots of people means minisingulo would be more useful.
		if(tally >= microsingulo_threshold)
			holder.a_intent = I_GRAB
		else // Otherwise use rockets.
			holder.a_intent = I_HURT

	else
		if(get_dist(holder, A) >= rocket_explosive_radius + 1)
			holder.a_intent = I_HURT // Fire rockets if it's an obj/turf.
		else
			holder.a_intent = I_DISARM // Electricity might not work but it's safe up close.


/obj/item/projectile/arc/explosive_rocket/rocket/bh1
	name = "mini mortar shell"
	icon_state = "grenade"
	damage = 30
	arc_height_multiplier = 0.2
	damage_type = BRUTE
	var/list/fragment_types = list(
		/obj/item/projectile/bullet/pellet/fragment, /obj/item/projectile/bullet/pellet/fragment, \
		/obj/item/projectile/bullet/pellet/fragment, /obj/item/projectile/bullet/pellet/fragment
		)
	var/fragment_amount = 8 // Same as a grenade.
	var/spread_range = 7
	check_armour = "bullet"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	fire_sound = 'sound/weapons/rpg.ogg'
	speed = 0.5

/obj/item/projectile/arc/explosive_rocket/rocket/bh1/on_impact(turf/T)
	new /obj/effect/explosion(T) // Weak explosions don't produce this on their own, apparently.
	explosion(T, 0, 0, 2, adminlog = FALSE)
	fragmentate(T, fragment_amount, spread_range, fragment_types)

/obj/item/projectile/energy/homing_bolt/microrocket
	name = "displacer micro rocket"
	icon_state = "atrocket"
	damage = 15
	range = 100
	damage_type = BRUTE
	check_armour = "bullet"
	fire_sound = 'sound/weapons/grenade_launcher.ogg'
	speed = 1
	hitsound_wall = 'sound/effects/contactor_off.ogg'

/obj/item/projectile/energy/homing_bolt/microrocket/on_hit(atom/movable/target, blocked = 0)
	if(istype(target))
		var/throwdir = get_dir(firer,target)
		target.throw_at(get_edge_target_turf(target, throwdir),1,1)
		new /obj/effect/explosion(target)
		explosion(target, 0, 0, 0, adminlog = FALSE)
		return 1

/obj/item/projectile/arc/explosive_rocket/rocket/bh2
	name = "artillery rocket"
	icon_state = "bigrocket"
	damage = 30
	range = 350
	arc_height_multiplier = 0.2
	damage_type = BRUTE
	check_armour = "bullet"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	fire_sound = 'sound/weapons/rocketartillery1.ogg'
	speed = 0.5

/obj/item/projectile/arc/explosive_rocket/rocket/bh2/on_impact(turf/T)
	new /obj/effect/explosion(T) // Weak explosions don't produce this on their own, apparently.
	explosion(T, 0, 1, 4, adminlog = FALSE)


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
	say_threaten = list("Enemy spotted!", "Resisting is futile!", "Target spotted!", "Contact!", "Enemy!", "Heathens!", "Nonbelievers!", "You cannot hide from the will of the singularity!")
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

/mob/living/simple_mob/vore/blackhole/death()
	playsound(src, 'sound/voice/death/feline/feline_death.ogg', 50, 1)
	..()

///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///ai holder stuff!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///


/datum/ai_holder/simple_mob/merc/blackhole
	vision_range = 9
	threaten = TRUE
	returns_home = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 1 SECONDS
	use_astar = TRUE
	pointblank = TRUE
	firing_lanes = TRUE
	violent_breakthrough = TRUE
	home_low_priority = TRUE
	call_distance = 14
	cooperative = TRUE

/datum/ai_holder/simple_mob/merc/ranged/blackhole
	vision_range = 9
	threaten = TRUE
	returns_home = TRUE
	wander = TRUE
	pointblank = TRUE
	firing_lanes = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 1 SECONDS
	use_astar = TRUE
	home_low_priority = TRUE
	call_distance = 14
	cooperative = TRUE

/datum/ai_holder/simple_mob/merc/ranged/blackhole/lmg
	vision_range = 9
	threaten = TRUE
	returns_home = TRUE
	wander = TRUE
	pointblank = TRUE		// They get close? Just shoot 'em!
	firing_lanes = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 1 SECONDS
	use_astar = TRUE
	conserve_ammo = FALSE
	home_low_priority = TRUE
	call_distance = 14
	cooperative = TRUE

/datum/ai_holder/simple_mob/merc/ranged/sniper/blackhole
	vision_range = 30
	threaten = FALSE
	returns_home = TRUE
	pointblank = TRUE		// They get close? Just shoot 'em!
	firing_lanes = TRUE
	wander = TRUE
	intelligence_level = AI_SMART
	threaten_delay = 0 SECONDS
	use_astar = TRUE
	home_low_priority = TRUE
	call_distance = 20
	cooperative = TRUE



///-------------------------------------------------------------------------------------------------------------------------------------------------------------///
///special bullets, because the 'projectilesound' var does not work!///
///-------------------------------------------------------------------------------------------------------------------------------------------------------------///


/obj/item/projectile/bullet/pistol/bh1
	name = "bullet"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/9mmpistol.ogg'
	speed = 1

/obj/item/projectile/bullet/pistol/bh2
	name = "bullet"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/vityaz.ogg'
	speed = 1

/obj/item/projectile/bullet/pistol/bh3
	name = "bullet"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/ak74.ogg'
	speed = 1

/obj/item/projectile/bullet/rifle/a545/bh1
	name = "bullet"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/sks.ogg'
	speed = 1

/obj/item/projectile/bullet/rifle/a545/bh2
	name = "bullet"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/strela.ogg'
	speed = 1

/obj/item/projectile/bullet/rifle/a545/bh3
	name = "bullet"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "bullet"
	fire_sound = 'sound/weapons/serdy/strela.ogg'
	damage = 20
	stun = 0
	weaken = 0
	penetrating = 150
	armor_penetration = 100
	speed = 1

/obj/item/projectile/bullet/rifle/a145/bh1
	name = "bullet"
	fire_sound = 'sound/weapons/gunshot_cannon.ogg'
	damage = 90
	stun = 1
	weaken = 1
	penetrating = 1450
	armor_penetration = 90
	hitscan = 1 //so the PTR isn't useless as a sniper weapon
	hud_state = "sniper"

	icon_state = "bullet_alt"
	tracer_type = /obj/effect/projectile/tracer/cannon

/obj/item/projectile/bullet/rifle/a145/bh2
	name = "bullet"
	fire_sound = 'sound/weapons/serdy/sks.ogg'
	damage = 30
	stun = 0
	weaken = 0
	penetrating = 400
	armor_penetration = 50
	hitscan = 1
	hud_state = "sniper"

	icon_state = "bullet_alt"
	tracer_type = /obj/effect/projectile/tracer/cannon

/obj/item/projectile/bullet/rifle/a145/bh3
	name = "gauss rifle slug"
	fire_sound = 'sound/weapons/serdy/gauss2.ogg'
	damage = 50
	stun = 1
	weaken = 1
	penetrating = 3400
	armor_penetration = 100
	hitscan = 1
	hud_state = "sniper"

	icon_state = "bullet_alt"
	tracer_type = /obj/effect/projectile/tracer/cannon


/obj/item/projectile/beam/shock/bh1
	name = "tesla beam"
	icon_state = "lightning"
	damage_type = ELECTROCUTE

	muzzle_type = /obj/effect/projectile/muzzle/lightning
	tracer_type = /obj/effect/projectile/tracer/lightning
	impact_type = /obj/effect/projectile/impact/lightning

	damage = 10
	agony = 1
	eyeblur = 1
	fire_sound = 'sound/effects/lightningbolt.ogg'
	hitsound = 'sound/effects/lightningshock.ogg'
	hud_state = "taser"

/obj/item/projectile/explosive_rocket/blackhole
	name = "80mm recoilless rifle shell"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "grenade"
	fire_sound = 'sound/weapons/serdy/recoilless.ogg'
	damage = 40
	speed = 1
	armor_penetration = 90

/obj/item/projectile/explosive_rocket/blackhole/on_impact(turf/T)
	new /obj/effect/explosion(T) // Weak explosions don't produce this on their own, apparently.
	explosion(T, 0, 0, 4, adminlog = FALSE)


/obj/item/projectile/scatter/shotgun/blackhole
	name = "buckshot pellet"
	fire_sound = 'sound/weapons/weaponsounds_shotgunshot.ogg'
	hud_state = "shotgun_buckshot"
	spread_submunition_damage = FALSE
	submunition_spread_max = 60
	submunition_spread_min = 50
	submunitions = list(
		/obj/item/projectile/bullet/shotgun/scatterprojectile = 6
		)


/obj/item/projectile/energy/plasma/vepr/blackhole
	name = "plasma bolt"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "energy_darkpulse"
	fire_sound = 'sound/weapons/serdy/plasma2.ogg'
	damage = 30
	armor_penetration = 20
	speed = 1
	damage_type = BURN
	check_armour = "laser"
	light_range = 3
	light_power = 2
	light_color = "#CC60FF"
	muzzle_type = null
	impact_effect_type = null
	hitsound_wall = 'sound/weapons/effects/searwall.ogg'
	hitsound = 'sound/weapons/sear.ogg'
	hud_state = "laser_overcharge"

/* //a bit TOO strong -- Serdy

/obj/item/projectile/energy/plasma/vepr/blackhole/strong
	name = "plasma bolt"
	icon = 'modular_chomp/icons/blackhole/pre-gattening-misc.dmi'
	icon_state = "energy_darkpulse"
	fire_sound = 'sound/weapons/serdy/plasma2.ogg'
	damage = 40
	armor_penetration = 20
	speed = 0.5
*/

/obj/item/projectile/ion/bh1
	name = "ion bolt"
	icon_state = "ion"
	fire_sound = 'sound/weapons/serdy/ionrifle1.ogg'
	damage = 0
	damage_type = BURN
	nodamage = 1
	check_armour = "energy"
	light_range = 2
	light_power = 1
	light_color = "#55AAFF"
	hud_state = "plasma_blast"
	hud_state_empty = "battery_empty"

	combustion = FALSE
	impact_effect_type = /obj/effect/temp_visual/impact_effect/ion
	hitsound_wall = 'sound/weapons/effects/searwall.ogg'
	hitsound = 'sound/weapons/ionrifle.ogg'


/obj/item/projectile/beam/pulse/bh1
	name = "pulse"
	icon_state = "u_laser"
	fire_sound = 'sound/weapons/serdy/plasma4.ogg'
	damage = 40	//halved from normal
	armor_penetration = 50
	light_range = 3
	light_power = 1
	light_color = "#0066FF"
	hud_state = "pulse"

	muzzle_type = /obj/effect/projectile/muzzle/laser_pulse
	tracer_type = /obj/effect/projectile/tracer/laser_pulse
	impact_type = /obj/effect/projectile/impact/laser_pulse
