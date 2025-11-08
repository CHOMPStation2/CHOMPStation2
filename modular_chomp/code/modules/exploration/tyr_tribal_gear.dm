//Hello, welcome to the tyr outsider content.
//We're going to have some oddities here.
//Otherwise holds stuff meant for outsiders on tyr
/obj/item/reagent_containers/food/snacks/weatherlily
	name = "strange leaves"
	desc = "A strange flower producing an odd substance."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "leaves"
	bitesize = 1

/obj/item/reagent_containers/food/snacks/weatherlily/Initialize(mapload)
	. = ..()
	//reagents.add_reagent(REAGENT_ID_AMATOXIN, 1) I want this for lore of this being a strange bioenginered thing to mess with organic things buuuut it's one of two food sources
	reagents.add_reagent(REAGENT_ID_LUMINOL,1)
	reagents.add_reagent(REAGENT_ID_PROTEIN,1)

//The source of the materials
/obj/structure/outcrop/weathered_gate
	name = "outcrop"
	desc = "A boring rocky outcrop."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	density = TRUE
	throwpass = 1
	anchored = TRUE
	icon_state = "outcrop"
	mindrop = 3
	upperdrop = 8
	outcropdrop = /obj/item/stack/material/weathered_agate

/obj/structure/flora/tyr
	name = "flora"
	desc = "A strange plant."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'

	randomize_size = TRUE

	removal_tool = /obj/item/shovel
	harvest_tool = /obj/item/material/knife
	harvest_count = 0
	destroy_on_harvest = FALSE
	randomize_harvest_count = FALSE
	max_harvests = 3
	harvest_loot = list(/obj/item/stack/material/fiber = 1)

/obj/structure/flora/tyr/stonetree
	name = "flora"
	desc = "A strange plant."
	icon_state = "stonetree"
	harvest_loot = list(/obj/item/stack/material/wood = 1)

/obj/structure/flora/tyr/lilly
	name = "flora"
	desc = "A strange plant."
	icon_state = "lilly"
	harvest_loot = list(/obj/item/reagent_containers/food/snacks/weatherlily = 1)

/obj/structure/flora/tyr/flowers
	name = "flora"
	desc = "A strange plant."
	icon_state = "tyrflora"

/obj/structure/flora/tyr/flowers/Initialize(mapload)
	. = ..()
	icon_state = "tyrflora[rand(1, 5)]gb"

//tier 2
/obj/item/reagent_containers/food/snacks/ant
	name = "ant meat"
	desc = "A slice from a strange beast"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list(REAGENT_ID_PROTEIN = 4)
	bitesize = 2

/obj/item/reagent_containers/food/snacks/mutatedmeat/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PROTEIN, 4)

/obj/item/prop/alien/prototype
	name = "alien prototype"
	desc = "You have no idea what this thing does."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "crystal"
	w_class = ITEMSIZE_SMALL

	var/static/list/possible_states = list("crystal", "generator","core", "hilt")
	var/static/list/possible_tech = list(TECH_MATERIAL, TECH_ENGINEERING, TECH_PHORON, TECH_POWER, TECH_BIO, TECH_COMBAT, TECH_MAGNET, TECH_DATA)

/obj/item/prop/alien/prototype/Initialize(mapload)
	. = ..()
	icon_state = pick(possible_states)
	var/list/techs = possible_tech.Copy()
	origin_tech = list()
	for(var/i = 1 to rand(1, 4))
		var/new_tech = pick(techs)
		techs -= new_tech
		origin_tech[new_tech] = rand(3, 11)

	origin_tech[TECH_PRECURSOR] = rand(0,3)

/* Yoinked for refrence
/obj/item/arrow/standard
	name = "arrow"
	desc = "It's got a tip for you - get the point?"
	icon = 'icons/obj/guns/projectile/bows.dmi'
	icon_state = "arrow"
	item_state = "bolt"
	throwforce = 8
	w_class = ITEMSIZE_NORMAL
	sharp = TRUE
	edge = FALSE
*/

//So, going to have three/four intended source of damage
//Bows,a hammer, and a sword for certian. Debating spear or throwing weapon.
//From what I can tell, standard arrows deal 8 damage but have good range although strage ammo and slower
//As I type this, just going to go with spear.
//Hammer has a slower attack but thwacks harder.
//spear gets reach
//sword middling damage
//Tier 1 gear
/obj/item/melee/agate_spear
	name = "makeshift spear"
	desc = "A spear made from strange wood and gemstones"
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "agate_spear"
	force = 12
	reach = 2
/*	item_icons = list(
		slot_l_hand_str = 'modular_chomp/icons/mob/items/lefthand_melee.dmi',
		slot_r_hand_str = 'modular_chomp/icons/mob/items/righthand_melee.dmi',
		)*/

/obj/item/melee/agate_sword
	name = "makeshift sword"
	desc = "A sword made from strange wood and gemstones"
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "agate_sword"
/*	item_icons = list(
		slot_l_hand_str = 'modular_chomp/icons/mob/items/lefthand_melee.dmi',
		slot_r_hand_str = 'modular_chomp/icons/mob/items/righthand_melee.dmi',
		)*/
	force = 15

/obj/item/melee/agate_hammer
	name = "makeshift hammer"
	desc = "A hammer made from strange wood and gemstones"
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "agate_hammer"
/*	item_icons = list(
		slot_l_hand_str = 'modular_chomp/icons/mob/items/lefthand_melee.dmi',
		slot_r_hand_str = 'modular_chomp/icons/mob/items/righthand_melee.dmi',
		)*/
	force = 40
	attackspeed = 24 //Base attack speed is 8. So this is three times slower. 1 second equals 10.

/obj/item/clothing/suit/armor/tyrtribalcloak
	name = "leaf cloak"
	desc = "A strange cloak made of leaves and fiber. A strange residue resides upon the equipment"
	slowdown = 0.2
	icon = 'modular_chomp/icons/mob/tribal_gear.dmi'
	icon_override = 'modular_chomp/icons/mob/tribal_gear.dmi'
	icon_state = "lilly_cloak"
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 0, bio = 60, rad = 60) //Seemingly medicore, but tack on the 20% chance to completly negate something and you get something that is average.
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS //Head be vunerable but cloak covers the other bits.
	var/block_chance = 20

/obj/item/clothing/suit/armor/tyrtribalcloak/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(prob(block_chance))
		user.visible_message(span_danger("\The [src] completely deflects [attack_text]!"))
		return TRUE
	return FALSE

//Placeholder placing here, but the special items found in the strange vaults of tyr.
//Starry Night
//ehh either making custom medicells later or some fancy science tool


//Blizzard
/obj/item/tool/wirecutters/hybrid/alien
	toolspeed = 0.2

/obj/item/tool/wrench/hybrid/alien
	toolspeed = 0.2

/obj/item/tool/crowbar/hybrid/alien
	toolspeed = 0.2

/obj/item/tool/screwdriver/hybrid/alien
	toolspeed = 0.2

/obj/item/weldingtool/experimental/hybrid/alien
	eye_safety_modifier = 0

//Rad Storm
/obj/item/pickaxe/diamonddrill/alien
	name = "alien mining drill"
	icon_state = "diamonddrill"
	item_state = "jackhammer"
	digspeed = 6
	sand_dig = TRUE
	reach = 3 //proabaly useless but someone may utilize it.
	color = "#FF3300"

//Blood Moon
/obj/item/melee/energy/sword/dualsaber
	name = "dual energy sword"
	desc = "May the force be within you."
	active_force = 40
	active_armourpen = 70
	active_throwforce = 40
	icon_state = "dualsaber"
	item_state = "dualsaber"
	sharp = TRUE
	edge = TRUE
	can_cleave = TRUE
	colorable = TRUE
	defend_chance = 65


/obj/item/shield_projector/rectangle/automatic/tyrbarrier
	name = "tyrian energy barrier"
	desc = "An automatic shield generator made from tyr tech. Wearable as a belt."
	description_info = "The barrier has 150 health, and does not benefit from armor. It will fully regenerate every 180 seconds."
	shield_health = 125
	max_shield_health = 125
	shield_regen_delay = 180 SECONDS
	shield_regen_amount = 125
	w_class = ITEMSIZE_NO_CONTAINER
	slot_flags = SLOT_BELT
	size_x = 4
	size_y = 4
	color = "#FF3300"
	high_color = "#FF3300"
	low_color = "#F08F4F"


//other Tyr Loot
/obj/item/melee/energy/sword/top_shield
	name = "energy spike shield"
	desc = "A makeshift shield."
	icon = 'modular_chomp/icons/mob/tribal_gear.dmi'
	icon_state = "topshield"
	item_state = "topshield"
	active_force = 10
	active_armourpen = 60
	active_throwforce = 40
	throw_speed = 1
	throw_range = 7
	slowdown = 2
	defend_chance = 70
	projectile_parry_chance = 70
	active_w_class = ITEMSIZE_HUGE
	w_class = ITEMSIZE_HUGE
	item_icons = list(
		slot_l_hand_str = 'modular_chomp/icons/obj/guns/precursor/lefthand.dmi',
		slot_r_hand_str = 'modular_chomp/icons/obj/guns/precursor/righthand.dmi',
		)

/obj/item/clothing/suit/armor/tyr_alien
	name = "expirmental biosuit"
	desc = "It's a strange piece of what appears to be a suit of some sort."
	description_info = "Organic users of the suit will be slowly healed, and given nutrition."
	icon_state = "lingchameleon"
	body_parts_covered = CHEST
	armor = list(melee = 60, bullet = 50, laser = 40, energy = 40, bomb = 0, bio = 80, rad = 80)
	siemens_coefficient = 0.4

/obj/item/clothing/suit/armor/tyr_alien/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/armor/tyr_alien/Destroy()
	wearer = null
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/armor/tyr_alien/process()
	var/mob/living/carbon/human/H = wearer?.resolve()
	if(!ishuman(H) || H.isSynthetic() || H.stat == DEAD || H.nutrition <= 10)
		return // Robots and dead people don't have a metabolism.

	if(H.getBruteLoss())
		H.adjustBruteLoss(-0.2)
		H.nutrition = max(H.nutrition + 5, 0)
	if(H.getFireLoss())
		H.adjustFireLoss(-0.2)
		H.nutrition = max(H.nutrition + 5, 0)
	if(H.getToxLoss())
		H.adjustToxLoss(-0.2)
		H.nutrition = max(H.nutrition + 5, 0)
	if(H.getOxyLoss())
		H.adjustOxyLoss(-0.2)
		H.nutrition = max(H.nutrition + 5, 0)
	if(H.getCloneLoss())
		H.adjustCloneLoss(-0.2)
		H.nutrition = max(H.nutrition + 5, 0)

