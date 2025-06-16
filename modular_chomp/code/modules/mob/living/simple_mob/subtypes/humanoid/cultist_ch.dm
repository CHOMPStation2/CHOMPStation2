
/*
/mob/living/simple_mob/humanoid/cultist
	maxHealth = 75
	health = 75
*/
/mob/living/simple_mob/humanoid/cultist/human
	movement_cooldown = 1
	melee_damage_lower = 15
	melee_damage_upper = 15

/mob/living/simple_mob/humanoid/cultist/caster
	movement_cooldown = 1
	projectiletype = /obj/item/projectile/energy/inversion
	melee_damage_lower = 15 //Old 7
	melee_damage_upper = 15

/mob/living/simple_mob/humanoid/cultist/tesh
	movement_cooldown = -1
	melee_damage_lower = 15 //Old 7
	melee_damage_upper = 15
	maxHealth = 37
	health = 37

/mob/living/simple_mob/humanoid/cultist/castertesh
	movement_cooldown = -1
	projectiletype = /obj/item/projectile/energy/inversion
	melee_damage_lower = 15
	melee_damage_upper = 15
	maxHealth = 50
	health = 50

/mob/living/simple_mob/humanoid/cultist/elite
	movement_cooldown = 1
	melee_damage_lower = 20
	melee_damage_upper = 20

/mob/living/simple_mob/humanoid/cultist/magus
	movement_cooldown = 1
	projectiletype = /obj/item/projectile/energy/inversion
	maxHealth = 150 //Old 100
	health = 150
	melee_damage_lower = 15
	melee_damage_upper = 15

/mob/living/simple_mob/humanoid/cultist/hunter
	maxHealth = 175 //Ehhh, this AI is like mini-boss at best //Old 87
	health = 175
	movement_cooldown = 0
	melee_damage_lower = 21	//Saw Cleaver Brutality
	melee_damage_upper = 21

/mob/living/simple_mob/humanoid/cultist/human/bloodjaunt/fireball //Teleporting Cultists, now with fireballs
	name = "Burning Mage"
	desc = "An indiuval wrapped up in red robes, with orange highlights, their paws glowing.."
	icon_state = "fire-fluff"
	icon_living = "fire-fluff"
	special_attack_min_range = 4
	special_attack_max_range = 7
	special_attack_cooldown = 10 SECONDS
	movement_cooldown = 0

	harm_intent_damage = 5
	melee_damage_lower = 7
	melee_damage_upper = 7
	ai_holder_type = /datum/ai_holder/simple_mob/ranged
	projectiletype = /obj/item/projectile/energy/fireball

/mob/living/simple_mob/humanoid/cultist/noodle
	name = "Converted"
	desc = "An indiuval wrapped up in a makeshift rig, made from fallen cultist."
	icon_state = "cobra-cultist"
	icon_living = "cobra-cultist"
	maxHealth = 150 //Old 75
	health = 150

	faction = "cult"

	status_flags = 0

	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	harm_intent_damage = 5
	melee_damage_lower = 15 //old 7
	melee_damage_upper = 25 //old 15
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("slashed", "stabbed")
	armor = list(melee = 60, bullet = 40, laser = 60, energy = 80, bomb = 25, bio = 100, rad = 100)
	attack_sound = 'sound/weapons/rapidslice.ogg'
	projectiletype = /obj/item/projectile/energy/plasma/vepr
	projectilesound = 'sound/weapons/spiderlunge.ogg'
	movement_cooldown = 2
	ai_holder_type = /datum/ai_holder/simple_mob/ranged

/obj/item/shield_projector/rectangle/automatic/magus
	name = "cult shield stone"
	desc = "A stone wielded by only the most powerful of cult leaders. It projects a shield around the user."
	icon = 'icons/obj/device.dmi'
	icon_state = "implant_melted"
	shield_health = 100
	max_shield_health = 100
	shield_regen_delay = 10 SECONDS

//Nibbler//
/mob/living/simple_mob/humanoid/cultist/human/bloodjaunt/fireball
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = null

	can_be_drop_prey = FALSE //CHOMP Add

/mob/living/simple_mob/humanoid/cultist/human/bloodjaunt/fireball/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/humanoid/cultist/human/bloodjaunt/fireball/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/humanoid/cultist/human/bloodjaunt/fireball/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = " Through fire and smoke, you have been grappled and shoved head first into a gapping maw. Rippling powerful red flesh dragging deep into the mage's gullet, your frame causing their stomach is swell out against crimson robes. As you're forced to curl up in the stomach, the walls would ripple, flickers of orange dancing as they press and knead against your flesh. Laughter, and gutteral stomach noises would fill your ears as the cultist firmly kneads their hanging gutt, sloshing it  further about."

	B.emote_lists[DM_HOLD] = list(
		"Your useless struggling and squirming only causes the cultist to pause, firmly grasping their gut and shoving down on their belly.",
		"As you lay within the gullet, you would be rocked about as the cultist jaunts around the physical and redspace realm.",
		"The bloated organ around you groans and rumbles, the flesh rippling as a wave of heat washes over you.",)

	B.emote_lists[DM_DIGEST] = list(
		"Your useless struggling would seem to just cause pleasured rubblings and cackling. The taunt stomach jostling around even further, as if attempt to encourage your squirming further.",
		"Your body would be ushered upwards, you glimpsing the outside world as it looked as if you're about to be released. The cultist then gulps down, sending you plummet back down into the gullet, their taunt belly jiggling as it's walls squish firmly against you..",
		"Caustic juices splash over to you as the predator's stomach sways, the belly walls rumbling and rippling as they release a loud caustic belch." ,)


/mob/living/simple_mob/humanoid/cultist/noodle
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = null

	can_be_drop_prey = FALSE //CHOMP Add

/mob/living/simple_mob/humanoid/cultist/noodle/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/humanoid/cultist/noodle/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/humanoid/cultist/noodle/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = " Through fire and smoke, you have been grappled and shoved head first into a gapping maw. Rippling powerful red flesh dragging deep into the mage's gullet, your frame causing their stomach is swell out against crimson robes. As you're forced to curl up in the stomach, the walls would ripple, and knead against your flesh. Laughter, and gutteral stomach noises would fill your ears as the cultist firmly kneads their hanging gut, sloshing it  further about before shoving you deeper into their system, descending deep within the serpent."

	B.emote_lists[DM_HOLD] = list(
		"As you're forced to lay down in the gullet, you can feel each swift and strong movement of their tail. the stomach walls forcing your body to shift alongside it.",
		"As you shift around, the dark red flesh would ripple, air rushing past you as the beast lets out a thunderous belch.",
		"As you shift about, the beast lifts their tail and slams it down, trying to encourage you to relax. Your their's.",)

	B.emote_lists[DM_DIGEST] = list(
		"Your squirming and thrasing only causes the serpent to curl their tail around your frame, squeeze down on it in sync with the muscles, pressing you further into the caustic acids.",
		"Your body would swish and slosh in the burbling caustic acid as it nips at your armor and flesh.",
		"The serpent cultist would let out a lazy out, streching, then remebers your exsistance pressing a claw into the you shaped bulge and grumbling." ,)


//Thank you Ears for the teshari bellies
/mob/living/simple_mob/humanoid/cultist/tesh
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = null

	can_be_drop_prey = FALSE //CHOMP Add

/mob/living/simple_mob/humanoid/cultist/tesh/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/humanoid/cultist/tesh/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/humanoid/cultist/tesh/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "Taking advantage of your weakened state, the %pred makes their pounce! The world going dark as the ravenous Teshari forces your battered frame down their throat. It all coming to a stop as you're packed neatly into their steaming guts. Low and content chuckling barely audible over the rising cacophony of the stomach's activity."

	B.emote_lists[DM_HOLD] = list(
		"Your body is bounced and jostled as the %pred purses their next prey.  Unimpeded by your weight and eager for more.",
		"The already oprrssive hold of the %belly restrains you with a heavy clench and squeeze from the hands outside. The %pred securing their catch.",
		"You're given a heavy squeeze as the stale air is forced out from the %pred giving a crass belch.  Suspending you in a claustrophobic hold until the organ relaxes with more stale air filling the space.",)

	B.emote_lists[DM_DIGEST] = list(
		"The bubbling of the carnivorous, little predator's belly cuts off the sounds outside, the greedy walls working in and giving you a fresh coat of enzymes.",
		"The %pred traces their claws over your form and sings an incantation, and you feel your strength wane as the walls work in with renewed vigor.",
		"The motion of the %pred's trotting sloshes and sways you from side to side, occasionally coating you in more hot fluids! Eating away your stamina with irragular flexes to allow them to keep eating you away." ,)


/mob/living/simple_mob/humanoid/cultist/castertesh
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = null

	can_be_drop_prey = FALSE //CHOMP Add

/mob/living/simple_mob/humanoid/cultist/castertesh/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/humanoid/cultist/castertesh/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/humanoid/cultist/castertesh/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "Not too long after you hit the ground the caster makes their way to your fallen self.  The ground below you glows a deep red and you sink through the surface, only to find yourself folded tightly in a cramped, slick, and caustic chamber! The mage's chanting barely audible over the sounds of the stomach walls making their claim."

	B.emote_lists[DM_HOLD] = list(
		"Your body is bounced and jostled as the %pred purses their next prey.  Unimpeded by your weight and eager for more.",
		"The already oprrssive hold of the %belly restrains you with a heavy clench and squeeze from the hands outside. The %pred securing their catch.",
		"You're given a heavy squeeze as the stale air is forced out from the %pred giving a crass belch.  Suspending you in a claustrophobic hold until the organ relaxes with more stale air filling the space.",)

	B.emote_lists[DM_DIGEST] = list(
		"The bubbling of the carnivorous, little predator's belly cuts off the sounds outside, the greedy walls working in and giving you a fresh coat of enzymes.",
		"The %pred traces their claws over your form and sings an incantation, and you feel your strength wane as the walls work in with renewed vigor.",
		"The motion of the %pred's trotting sloshes and sways you from side to side, occasionally coating you in more hot fluids! Eating away your stamina with irragular flexes to allow them to keep eating you away." ,)
