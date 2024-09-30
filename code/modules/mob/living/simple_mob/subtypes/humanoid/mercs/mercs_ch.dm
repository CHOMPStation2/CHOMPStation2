/datum/category_item/catalogue/fauna/mercenary
	name = "Mercenaries"
	desc = "Life on the Frontier is hard, and unregulated. Unlike life in \
	more 'civlized' areas of the Galaxy, violence and piracy remain common \
	this far out. The Megacorporations keep a tight grip on their holdings, \
	but there are always small bands or aspiring companies looking to make a \
	thaler. From simple pirates to legitimate PMCs, Frontier mercs come in \
	all shapes and sizes."
	value = CATALOGUER_REWARD_TRIVIAL
	unlocked_by_any = list(/datum/category_item/catalogue/fauna/mercenary)

// Obtained by scanning all X.
/datum/category_item/catalogue/fauna/all_mercenaries
	name = "Collection - Mercenaries"
	desc = "You have scanned a large array of different types of mercenary, \
	and therefore you have been granted a large sum of points, through this \
	entry."
	value = CATALOGUER_REWARD_HARD
	unlocked_by_all = list(
		/datum/category_item/catalogue/fauna/mercenary/human,
		/datum/category_item/catalogue/fauna/mercenary/human/peacekeeper,
		/datum/category_item/catalogue/fauna/mercenary/human/grenadier,
		/datum/category_item/catalogue/fauna/mercenary/human/space,
		/datum/category_item/catalogue/fauna/mercenary/human/space/suppressor,
		/datum/category_item/catalogue/fauna/mercenary/vox,
		/datum/category_item/catalogue/fauna/mercenary/vox/boarder,
		/datum/category_item/catalogue/fauna/mercenary/vox/technician,
		/datum/category_item/catalogue/fauna/mercenary/vox/suppressor,
		/datum/category_item/catalogue/fauna/mercenary/vox/captain
		)

/datum/category_item/catalogue/fauna/mercenary/human
	name = "Mercenaries - Human"
	desc = "Human Mercenary bands are extremely common on the Frontier. Many \
	of the modern outfits operating on the fringe today are veterans of the \
	Phoron Wars. After the dissolution of the Syndicate, these operatives were \
	left without a place to call home. Those who have survived have leveraged \
	their experience into a viable trade."
	value = CATALOGUER_REWARD_EASY

/datum/category_item/catalogue/fauna/mercenary/human/peacekeeper
	name = "Mercenaries - Solar Peacekeeper"
	desc = "Activist groups in Civlized Space often raise moral concerns about \
	conditions on the Frontier. The more organized groups will sometimes gather \
	bands of mercenaries from the core worlds together under the belief that they \
	can come out to the Frontier to enforce their way of life. Due to the Frontier \
	Act, these 'humanitarian operations' are quickly demolished."
	value = CATALOGUER_REWARD_EASY

/datum/category_item/catalogue/fauna/mercenary/human/grenadier
	name = "Mercenaries - Grenadier"
	desc = "After the Phoron Wars, many deniable operatives on both sides of \
	the conflict found that there was no place for them within their home companies \
	any more. Left without options, these highly motivated and trained specialists \
	often seek revenge, or attempt to carve out their own fiefdoms. Well equipped \
	and well trained, these outcasts are not to be taken lightly."
	value = CATALOGUER_REWARD_EASY

/datum/category_item/catalogue/fauna/mercenary/human/space
	name = "Mercenaries - Commando"
	desc = "Commandos, much like their less equipped brethren, are experts in \
	wet work. Honing their skills over years of training, the Commando's iconic \
	equipment summons memories of the bad old days in any survivor who sees them. \
	These mercs make a statement with their equipment - 'I was there. Come get me.' \
	It is usually not an idle boast."
	value = CATALOGUER_REWARD_EASY

/mob/living/simple_mob/humanoid/merc
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/human)

/mob/living/simple_mob/humanoid/merc/ranged
	desc = "A tough looking individual armed with an pistol."

/mob/living/simple_mob/humanoid/merc/ranged/smg
	name = "mercenary soldier"
	desc = "A tough looking individual armed with an submachine gun."

/mob/living/simple_mob/humanoid/merc/ranged/smg/sol
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/human/peacekeeper)

/mob/living/simple_mob/humanoid/merc/ranged/laser
	name = "mercenary marksman"
	desc = "A tough looking individual armed with an laser rifle."

/mob/living/simple_mob/humanoid/merc/ranged/ionrifle
	name = "mercenary anti-technical"
	desc = "A tough looking individual armed with an ion rifle."


//Garand
/mob/living/simple_mob/humanoid/merc/ranged/garand
	name = "mercenary rifleman"
	desc = "A tough looking individual armed with a semiautomatic rifle."
	icon_state = "syndicateranged_veteran"
	icon_living = "syndicateranged_veteran"
	projectiletype = /obj/item/projectile/bullet/rifle/a762
	projectilesound = 'sound/weapons/Gunshot_heavy.ogg'
	loot_list = list(/obj/item/gun/projectile/garand = 100)
	reload_max = 8
	reload_time = 2 // It takes a bit to jam a stripper clip into the rifle.

//Hand Cannon
/mob/living/simple_mob/humanoid/merc/ranged/deagle
	name = "mercenary officer"
	desc = "A tough looking individual armed with an handcannon."
	icon_state = "syndicate_handcannon"
	icon_living = "syndicate_handcannon"
	projectiletype = /obj/item/projectile/bullet/pistol/strong
	projectilesound = 'sound/weapons/Gunshot_deagle.ogg'
	loot_list = list(/obj/item/gun/projectile/deagle = 100)
	needs_reload = TRUE
	reload_max = 7		// Deagle Reload

/mob/living/simple_mob/humanoid/merc/ranged/grenadier
	name = "mercenary grenadier"
	desc = "A tough looking individual armed with a shotgun and a belt of grenades."
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/human/grenadier)

/mob/living/simple_mob/humanoid/merc/melee/sword/space
	name = "mercenary commando"
	desc = "A tough looking individual, armred with an energy sword and shield."
	icon_state = "syndicatespace-melee"
	icon_living = "syndicatespace-melee"
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/human/space)

/mob/living/simple_mob/humanoid/merc/ranged/space
	name = "armored mercenary"
	desc = "A tough looking individual, armed with a submachine gun."
	icon_state = "syndicatespace-ranged"
	icon_living = "syndicatespceace-ranged"
	armor = list(melee = 60, bullet = 50, laser = 30, energy = 15, bomb = 35, bio = 100, rad = 100)	// Same armor as their voidsuit.
	base_attack_cooldown = 5 // Two attacks a second or so.
	reload_max = 20
	loot_list = list(/obj/item/gun/projectile/automatic/c20r = 100)

//Combat Shotgun Merc
/mob/living/simple_mob/humanoid/merc/ranged/space/shotgun
	name = "mercenary tactical"
	desc = "A tough looking individual armed with a combat shotgun."
	icon_state = "syndicatespace-shotgun"
	icon_living = "syndicatespace-shotgun"
	base_attack_cooldown = 10
	reload_max = 7
	reload_time = 2 SECONDS //Takes a While to load all those shells.
	projectiletype = /obj/item/projectile/bullet/pellet/shotgun		// Buckshot
	projectilesound = 'sound/weapons/Gunshot_shotgun.ogg'
	loot_list = list(/obj/item/gun/projectile/shotgun/pump/combat = 100)

//Auto-Shotgun Space Merc
/mob/living/simple_mob/humanoid/merc/ranged/space/shotgun/auto
	name = "mercenary sweeper"
	desc = "A tough looking individual armed with an automatic shotgun."
	icon_state = "syndicatespace-ashotgun"
	icon_living = "syndicatespace-ashotgun"
	base_attack_cooldown = 5 // Two attacks a second or so.
	reload_max = 24
	projectiletype = /obj/item/projectile/bullet/pellet/shotgun		// Buckshot
	projectilesound = 'sound/weapons/Gunshot_shotgun.ogg'
	loot_list = list(/obj/item/gun/projectile/automatic/as24 = 100)
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/suppressor

//Machine Gun Merc
/mob/living/simple_mob/humanoid/merc/ranged/space/heavy
	name = "mercenary heavy gunner"
	desc = "A tough looking individual armed with an light machinegun."
	icon_state = "syndicatespace-heavy"
	icon_living = "syndicatespace-heavy"
	base_attack_cooldown = 2.5 // Four Attacks a Second. MOAR DAKKA
	reload_max = 50
	projectiletype = /obj/item/projectile/bullet/rifle/a545
	projectilesound = 'sound/weapons/Gunshot_light.ogg'
	loot_list = list(/obj/item/gun/projectile/automatic/l6_saw = 100)
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/suppressor

//Tommy-Las Merc
/mob/living/simple_mob/humanoid/merc/ranged/space/tommylas
	name = "mercenary light burster"
	desc = "A tough looking individual armed with an automatic laser."
	icon_state = "syndicatespace-tommylas"
	icon_living = "syndicatespace-tommylas"
	base_attack_cooldown = 2.5 // Four Attacks a Second. MOAR DAKKA
	reload_max = 3
	reload_time = 0.5  // Meant to Simulate controlled Supressive Bursts
	projectiletype = /obj/item/projectile/beam/weaklaser
	projectilesound = 'sound/weapons/Laser.ogg'
	loot_list = list(/obj/item/gun/energy/tommylaser = 100)
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/suppressor

/mob/living/simple_mob/humanoid/merc/ranged/space/fal
	name = "mercenary commando"
	desc = "A tough looking individual armed with a assault rifle."
	icon_state = "syndicatespace-commando"
	icon_living = "syndicatespace-commando"
	projectiletype = /obj/item/projectile/bullet/rifle/a762
	projectilesound = 'sound/weapons/Gunshot_heavy.ogg'
	loot_list = list(/obj/item/gun/projectile/automatic/fal = 100)
	reload_max = 20

// suppressors are just assholes and are intended to be a piss poor experience for everyone on both sides
/datum/category_item/catalogue/fauna/mercenary/human/space/suppressor
	name = "Mercenaries - Suppressor"
	desc = "Just because the Phoron Wars are over, it doesn't 		mean that covert \
	actions and corporate espionage ended too. When you encounter mercs with \
	the latest gear and the best training, you can bet your bottom Thaler that \
	they've got a Corporate sponsor backing them up."
	value = CATALOGUER_REWARD_MEDIUM

/datum/ai_holder/simple_mob/merc/ranged/suppressor
	respect_alpha = FALSE // he really just shoots you
	vision_range = 10 // plutonia experience
	conserve_ammo = FALSE

/mob/living/simple_mob/humanoid/merc/ranged/space/suppressor // adminspawn only, and also Probably Going To Kill The Unprepared
	name = "mercenary suppressor"
	desc = "Geeze, weren't shotgun ops bad enough? At least when you fade these jerks you get a flashbang to the face."
	icon_state = "syndi-ranged-space-sup"
	icon_living = "syndi-ranged-space-sup"
	armor = list(melee = 80, bullet = 65, laser = 50, energy = 15, bomb = 80, bio = 100, rad = 100) // this is the merc rig's stats
	ai_holder_type = /datum/ai_holder/simple_mob/merc/ranged/suppressor
	say_list_type = /datum/say_list/merc/elite
	projectiletype = /obj/item/projectile/bullet/pistol/medium/ap/suppressor // it's high velocity
	projectilesound = 'sound/weapons/doompistol.ogg' // converted from .wavs extracted from doom 2
	base_attack_cooldown = 3 // three? attacks a second
	reload_max = 30 // extended mags
	special_attack_charges = 5
	loot_list = list() // oh, you killed him?
	corpse = null // well, sorry, buddy, he doesn't drop shit
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/human/space/suppressor)
// 	var/deathnade_path = /obj/item/grenade/flashbang/stingbang
/* far too fun for the codebase at the moment
/mob/living/simple_mob/humanoid/merc/ranged/space/suppressor/death()
	// you thought killing him would be the least of your worries?
	// think again
	var/obj/item/grenade/banger = new deathnade_path(get_turf(src))
	banger.throw_at(ai_holder.target, 9, 9, null)
	banger.det_time = 25
	banger.activate(null)
	..()
*/
/mob/living/simple_mob/humanoid/merc/ranged/space/suppressor/elite // really reconsider why you're spawning this dude
	name = "mercenary elite suppressor"
	desc = "Geeze, weren't normal suppressors bad enough? At least if you fade this jerk, you'll have an awful time anyway."
	icon_state = "syndi-ranged-space-sup-elite"
	icon_living = "syndi-ranged-space-sup-elite"
	armor = list(melee = 80, bullet = 70, laser = 55, energy = 15, bomb = 80, bio = 100, rad = 100) // see code for military hardsuit
	projectiletype = /obj/item/projectile/bullet/pistol/medium/ap/suppressor/turbo // fuck it, fast bullets
	grenade_type = /obj/item/grenade/shooter/rubber // don't group up
	grenade_timer = 30 // well, look what you've done, you've grouped up
// 	deathnade_path = /obj/item/grenade/flashbang/stingbang/shredbang // REALLY don't group up
// being Actual Professionals, they have better (read: player-level) blocking chances
/mob/living/simple_mob/humanoid/merc/ranged/space/suppressor/attackby(var/obj/item/O, var/mob/user)
	if(O.force)
		if(prob(50))
			visible_message("<span class='danger'>\The [src] blocks \the [O] with its shield!</span>")
			if(user)
				ai_holder.react_to_attack(user)
			return
		else
			..()
	else
		visible_message("<span class='warning'>\The [user] gently taps [src] with \the [O].</span>")
/mob/living/simple_mob/humanoid/merc/ranged/space/suppressor/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)	return
	if(prob(50))
		visible_message("<span class='warning'>[src] blocks [Proj] with its shield!</span>")
		if(Proj.firer)
			ai_holder.react_to_attack(Proj.firer)
		return
	else
		..()






////////////////////////////////
//			Vox Pirates
////////////////////////////////
//Classifying these as Mercs, due to the general power level I want them at.

/datum/category_item/catalogue/fauna/mercenary/vox
	name = "Mercenaries - Vox"
	desc = "For centuries the Vox have inflicted their way of life upon the \
	Galaxy. Regarded with distrust due to their tendency to engage in piracy \
	and violence, the Vox are equally feared for their robust physiology and \
	curiously advanced xenotech. Due to ancient compacts, Vox pirates try to \
	avoid bloodshed, but will react to violence in kind."
	value = CATALOGUER_REWARD_MEDIUM
	unlocked_by_any = list(/datum/category_item/catalogue/fauna/mercenary/vox)

/mob/living/simple_mob/humanoid/merc/voxpirate	//Don't use this one.
	name = "vox mannequin"
	desc = "You shouldn't be seeing this one."
	icon_state = "voxpirate"
	icon_living = "voxpirate"
	icon_dead = "voxpirate_dead"

	faction = "voxpirate"
	movement_cooldown = 4

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	harm_intent_damage = 5
	melee_damage_lower = 20		//Vox Hunting rifle blade damage
	melee_damage_upper = 20
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	armor = list(melee = 60, bullet = 50, laser = 30, energy = 15, bomb = 35, bio = 100, rad = 100)	// Matching Merc voidsuit stats to represent toughness.

	min_oxy = 0 //Vox are spaceproof.
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	corpse = /obj/effect/landmark/mobcorpse/vox/pirate
	loot_list = list(/obj/item/gun/projectile/shotgun/pump/rifle/vox_hunting = 100,
					/obj/item/ammo_magazine/clip/c762 = 30,
					/obj/item/ammo_magazine/clip/c762 = 30
					)

	ai_holder_type = /datum/ai_holder/simple_mob/merc
	say_list_type = /datum/say_list/merc/voxpirate

/mob/living/simple_mob/humanoid/merc/voxpirate/pirate
	name = "vox pirate"
	desc = "A desperate looking Vox. Get your gun."

	projectiletype = /obj/item/projectile/bullet/rifle/a762
	projectilesound = 'sound/weapons/riflebolt.ogg'
	needs_reload = TRUE
	reload_max = 20

////////////////////////////////
//			Vox Melee
////////////////////////////////

/datum/category_item/catalogue/fauna/mercenary/vox/boarder
	name = "Mercenaries - Vox Boarder"
	desc = "Vox are squat creatures, with powerful muscles and tough, scaly \
	hides. Their dense bones and sharp talons make them a formidable threat in \
	close quarters combat. Low level Vox weaponry generally emphasizes closing \
	the distance to exploit these facts."
	value = CATALOGUER_REWARD_MEDIUM

/mob/living/simple_mob/humanoid/merc/voxpirate/boarder
	name = "vox melee boarder"
	desc = "A howling Vox with a sword. Run."
	icon_state = "voxboarder_m"
	icon_living = "voxboarder_m"
	icon_dead = "voxboarder_m_dead"
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/vox/boarder)

	melee_damage_lower = 30		//Energy sword damage
	melee_damage_upper = 30
	attack_sharp = 1
	attack_edge = 1

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive
	corpse = /obj/effect/landmark/mobcorpse/vox/boarder_m
	loot_list = list(/obj/item/melee/energy/sword = 100)

// They're good with the swords? I dunno. I like the idea they can deflect.
/mob/living/simple_mob/humanoid/merc/voxpirate/boarder/attackby(var/obj/item/O, var/mob/user)
	if(O.force)
		if(prob(20))
			visible_message("<span class='danger'>\The [src] blocks \the [O] with its sword!</span>")
			if(user)
				ai_holder.react_to_attack(user)
			return
		else
			..()
	else
		to_chat(user, "<span class='warning'>This weapon is ineffective, it does no damage.</span>")
		visible_message("<span class='warning'>\The [user] gently taps [src] with \the [O].</span>")

/mob/living/simple_mob/humanoid/merc/voxpirate/boarder/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)	return
	if(prob(35))
		visible_message("<span class='warning'>[src] blocks [Proj] with its sword!</span>")
		if(Proj.firer)
			ai_holder.react_to_attack(Proj.firer)
		return
	else
		..()

////////////////////////////////
//			Vox Ranged
////////////////////////////////

/mob/living/simple_mob/humanoid/merc/voxpirate/boarder
	name = "vox ranged boarder"
	desc = "A howling Vox with a shotgun. Get to cover!"
	icon_state = "voxboarder_r"
	icon_living = "voxboarder_r"
	icon_dead = "voxboarder_r_dead"
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/vox/boarder)

	projectiletype = /obj/item/projectile/bullet/pellet/shotgun
	projectilesound = 'sound/weapons/Gunshot_shotgun.ogg'

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/aggressive
	corpse = /obj/effect/landmark/mobcorpse/vox/boarder_r
	loot_list = list(/obj/item/gun/projectile/shotgun/pump/combat = 100,
					/obj/item/ammo_magazine/m12gdrum = 30,
					/obj/item/ammo_magazine/m12gdrum = 30
					)

	needs_reload = TRUE
	reload_max = 10

/datum/category_item/catalogue/fauna/mercenary/vox/technician
	name = "Mercenaries - Vox Technician"
	desc = "The belief that Vox are unintelligent comes largely from a kind \
	of anthrochauvanism. Due to their difficulty speaking GalCom and their tendency \
	to resort to underhanded methods, the Galaxy sees Vox as brutal, unintelligent \
	aliens. In reality, Vox are just as intelligent as everyone else, as the state \
	of their technology shows. Vox Technicians maintain ancient vessels and tools \
	with scraps and odd bits, often recieving no external recognition for their work."
	value = CATALOGUER_REWARD_MEDIUM

/mob/living/simple_mob/humanoid/merc/voxpirate/technician
	name = "vox salvage technician"
	desc = "A screeching Vox with an ion rifle. Usually sent on scrapping operations."
	icon_state = "voxboarder_t"
	icon_living = "voxboarder_t"
	icon_dead = "voxboarder_t_dead"
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/vox/technician)

	projectiletype = /obj/item/projectile/ion
	projectilesound = 'sound/weapons/Laser.ogg'

	ai_holder_type = /datum/ai_holder/simple_mob/ranged/kiting
	corpse = /obj/effect/landmark/mobcorpse/vox/boarder_t
	loot_list = list(/obj/item/gun/energy/ionrifle)

	needs_reload = TRUE
	reload_max = 25 //Suppressive tech weapon.

/datum/category_item/catalogue/fauna/mercenary/vox/suppressor
	name = "Mercenaries - Vox Suppressor"
	desc = "Among Vox bands, Suppressors are an even more motley crew. \
	Staying true to the name, Suppressors are veteran Vox pirates who have \
	faced hundreds of engagements. Tough and well suited for violence, these \
	Vox wear bright, mismatching colors into battle to draw attention. Serving \
	as a beacon to draw eyes away from their companions, Suppressors wield the \
	fearsome Sonic Cannon - a booming directed frequency device capable of \
	wreaking havoc all its own. It doesn't sound half bad either, when it isn't \
	pointed at you."
	value = CATALOGUER_REWARD_MEDIUM

/mob/living/simple_mob/humanoid/merc/voxpirate/ranged/suppressor
	name = "vox suppressor"
	desc = "Come on, feel the noise!"
	icon_state = "voxsuppressor"
	icon_living = "voxsuppressor"
	icon_dead = "voxsuppresor_dead"
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/vox/suppressor)

	armor = list(melee = 30, bullet = 50, laser = 60, energy = 30, bomb = 35, bio = 100, rad = 100)	// Boosted armor to represent Tank role.

	projectiletype = /obj/item/projectile/sonic/weak
	projectilesound = 'sound/effects/basscannon.ogg'

	ai_holder_type = /datum/ai_holder/simple_mob/destructive
	corpse = /obj/effect/landmark/mobcorpse/vox/suppressor
	loot_list = list(/obj/item/gun/energy/sonic = 100)

	base_attack_cooldown = 5 // Two attacks a second or so.
	needs_reload = TRUE
	reload_max = 30 //Gotta lay down that fire, son.

/datum/category_item/catalogue/fauna/mercenary/vox/captain
	name = "Mercenaries - Vox Captain"
	desc = "Accomplished Vox who bring in scrap reliably eventually become the \
	'Quills' of their own expeditions. This Vox term is considered analagous to \
	the word 'Captain'. As such, any Vox who has attained this rank has certainly \
	earned the powerful equipment they carry into combat: Dark Matter cannons, \
	advanced armor, proper Hunting Rifles - the list goes on. The Vox Captain \
	is a formidable opponent, honed by years of hard living and harder fighting. \
	If you are unable to negotiate, expect to face their entire crew head on."
	value = CATALOGUER_REWARD_MEDIUM

/mob/living/simple_mob/humanoid/merc/voxpirate/ranged/captain
	name = "vox pirate captain"
	desc = "Walkings the plank, dustlung! Yayaya."
	icon_state = "voxcaptain"
	icon_living = "voxcaptain"
	icon_dead = "voxcaptain_dead"
	catalogue_data = list(/datum/category_item/catalogue/fauna/mercenary/vox/captain)

	armor = list(melee = 60, bullet = 50, laser = 40, energy = 15, bomb = 30, bio = 100, rad = 100)	// Vox RIG armor values.

	projectiletype = /obj/item/projectile/beam/darkmatter
	projectilesound = 'sound/weapons/eLuger.ogg'

	ai_holder_type = /datum/ai_holder/simple_mob/destructive
	corpse = /obj/effect/landmark/mobcorpse/vox/captain
	loot_list = list(/obj/item/gun/energy/darkmatter = 100)

	needs_reload = TRUE
	reload_max = 15 //Other Vox should be carrying ammo.
