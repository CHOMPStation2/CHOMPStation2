#define MAT_TYRWOOD			"petrified wood"
#define MAT_WAGATE			"weathered agate"
//Hello, welcome to the tyr outsider content.
//We're going to have some oddities here.
//Two-ish tiers. The first tier is made from natural stuff around the caverns.
//Tier 2 armor is made from the hides and such from the dangerous wildlife.
//Whilst weapons have parts from the wildlife, and the alien ruins.
//tier 1
//Agate and wood for weapons
//cloth and something else is used for armor
//tier 2
//monster flesh for armor
//agate, alien props, and monster bits for weapons.
/datum/material/wood/tyr
	name = MAT_TYRWOOD
	stack_type = /obj/item/stack/material/wood/tyr
	icon_colour = "#808080" // grey-ish
	stack_origin_tech = list(TECH_MATERIAL = 8, TECH_BIO = 2)


/obj/item/stack/material/wood/tyr
	name = "petrified bark"
	color = "#808080"
	default_type = MAT_TYRWOOD


/datum/material/weathered_agate
	name = MAT_WAGATE
	display_name = "weathered agate"
	use_name = "weather agate"
	icon_colour = "#FF3300"
	stack_type = /obj/item/stack/material/weathered_agate
	flags = MATERIAL_UNMELTABLE
	cut_delay = 60
	reflectivity = 0
	conductivity = 1
	shard_type = SHARD_SHARD
	tableslam_noise = 'sound/effects/Glasshit.ogg'
	stack_origin_tech = list(TECH_ARCANE = 1)
	sheet_singular_name = "gem"
	sheet_plural_name = "gems"
	supply_conversion_value = 40	// These are hilariously rare.
	icon_base = "stone"
	table_icon_base = "stone"


/obj/item/stack/material/weathered_agate
	name = "weathered agate"
	icon_state = "sheet-void_opal"
	singular_name = "weathered agate"
	default_type = "weathered agate"

/obj/item/weapon/reagent_containers/food/snacks/weatherlily
	name = "strange leaves"
	desc = "A strange flower producing an odd substance."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "leaves"
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/weatherlily/Initialize()
	. = ..()
	//reagents.add_reagent("amatoxin", 1) I want this for lore of this being a strange bioenginered thing to mess with organic things buuuut it's one of two food sources
	reagents.add_reagent("luminol",1)
	reagents.add_reagent("protein",1)

//The source of the materials
/obj/structure/outcrop/weathered_gate
	name = "outcrop"
	desc = "A boring rocky outcrop."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	density = TRUE
	throwpass = 1
	climbable = TRUE
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

	removal_tool = /obj/item/weapon/shovel
	harvest_tool = /obj/item/weapon/material/knife
	harvest_count = 0
	destroy_on_harvest = FALSE
	randomize_harvest_count = FALSE
	max_harvests = 3
	harvest_loot = list(/obj/item/stack/material/fiber = 1)

/obj/structure/flora/tyr/stonetree
	name = "flora"
	desc = "A strange plant."
	icon_state = "stonetree"
	harvest_loot = list(/obj/item/stack/material/wood/tyr = 1)

/obj/structure/flora/tyr/lilly
	name = "flora"
	desc = "A strange plant."
	icon_state = "lilly"
	harvest_loot = list(/obj/item/weapon/reagent_containers/food/snacks/weatherlily = 1)

/obj/structure/flora/tyr/flowers
	name = "flora"
	desc = "A strange plant."
	icon_state = "tyrflora"

/obj/structure/flora/tyr/flowers/New()
	..()
	icon_state = "tyrflora[rand(1, 5)]gb"

//tier 2
/obj/item/weapon/reagent_containers/food/snacks/ant
	name = "ant meat"
	desc = "A slice from a strange beast"
	icon_state = "meat"
	center_of_mass_x = 17 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
	nutriment_amt = 3
	nutriment_desc = list("protein" = 4)
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/mutatedmeat/Initialize()
	. = ..()
	reagents.add_reagent("protein", 4)

/obj/item/prop/alien/prototype
	name = "alien prototype"
	desc = "You have no idea what this thing does."
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "crystal"
	w_class = ITEMSIZE_SMALL

	var/static/list/possible_states = list("crystal", "generator","core", "hilt")
	var/static/list/possible_tech = list(TECH_MATERIAL, TECH_ENGINEERING, TECH_PHORON, TECH_POWER, TECH_BIO, TECH_COMBAT, TECH_MAGNET, TECH_DATA)

/obj/item/prop/alien/prototype/Initialize()
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
/obj/item/weapon/arrow/standard
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
/obj/item/weapon/melee/agate_spear
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

/obj/item/weapon/melee/agate_sword
	name = "makeshift sword"
	desc = "A sword made from strange wood and gemstones"
	icon = 'modular_chomp/icons/obj/tribal_gear.dmi'
	icon_state = "agate_sword"
/*	item_icons = list(
		slot_l_hand_str = 'modular_chomp/icons/mob/items/lefthand_melee.dmi',
		slot_r_hand_str = 'modular_chomp/icons/mob/items/righthand_melee.dmi',
		)*/
	force = 15

/obj/item/weapon/melee/agate_hammer
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
		user.visible_message("<span class='danger'>\The [src] completely deflects [attack_text]!</span>")
		return TRUE
	return FALSE

//Tier 2...is mostly going into a new gun folder. Unsure what to do for the armor currently.