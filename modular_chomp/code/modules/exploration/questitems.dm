// Mostly useless. Research might like it, however.
/obj/item/prop/datadisc
	name = "rusty data disc"
	desc = "A rust disc for data storage. Not very useable currently, but research may get some data from it"
	icon = 'modular_chomp/icons/obj/questitems.dmi'
	icon_state = "disc"
	w_class = ITEMSIZE_SMALL

//soo, they're meant to give access to strange special item(s). 10 is theortically obtainable for several things, but this is instant access
//and doesn't need prop/alien/junk rng.
/obj/item/prop/datadisc/combat //Debating shield
	origin_tech = list(TECH_COMBAT = 11)

/obj/item/prop/datadisc/biotech //Goggles. They are, at the time of writing, legit just xray vision slapped onto goggles
	origin_tech = list(TECH_BIO = 11)

/obj/item/prop/datadisc/bluespace //Something about storage
	origin_tech = list(TECH_BLUESPACE = 11)

/obj/item/prop/datadisc/powerstorage //DRILL
	origin_tech = list(TECH_POWER = 11)

/obj/item/prop/datadisc/phoron //Unsure
	origin_tech = list(TECH_PHORON = 11)

//The funny items research can make with the above things
/datum/design/item/hud/xray_visor
	name = "x-ray visor"
	id = "xray_goggles"
	req_tech = list(TECH_MAGNET = 5, TECH_ENGINEERING = 3, TECH_BLUESPACE = 6, TECH_PHORON = 6, TECH_BIO = 10)
	materials = list(MAT_PLASTEEL = 2000, MAT_GLASS = 3000, MAT_PHORON = 4500, MAT_SUPERMATTER = 1500) //Note to self, find valhedoi
	build_path = /obj/item/clothing/glasses/omni
	sort_string = "EAAAE"

/datum/design/item/boh/belt_holding_true
	name = "Belt of Holding"
	desc = "A belt that uses localized bluespace pockets to hold more items than expected!"
	id = "belt_holding_true"
	req_tech = list(TECH_BLUESPACE = 4, TECH_MATERIAL = 6, TECH_BLUESPACE = 10)
	materials = list("gold" = 5000, "diamond" = 3000, "titanium" = 1000, MAT_SUPERMATTER = 1500) //Note to self, find valhedoi
	build_path = /obj/item/weapon/storage/belt/holding
	sort_string = "QAAAE"

/datum/design/item/weapon/mining/drill_morphium
	id = "drill_morphium"
	req_tech = list(TECH_MATERIAL = 8, TECH_POWER = 10, TECH_ENGINEERING = 5)
	materials = list(MAT_STEEL = 6000, MAT_PLASTEEL = 4000, MAT_MORPHIUM = 2000, MAT_SUPERMATTER = 1500)
	build_path = /obj/item/weapon/pickaxe/morphiumdrill
	sort_string = "FAAAF"

/obj/item/weapon/pickaxe/morphiumdrill
	name = "morphium mining drill"
	icon_state = "diamonddrill"
	item_state = "jackhammer"
	digspeed = 1 //Will this cause issues? Perhaps.
	sand_dig = TRUE
	origin_tech = list(TECH_MATERIAL = 8, TECH_POWER = 9, TECH_ENGINEERING = 5)
	matter = list(MAT_STEEL = 4500, MAT_PLASTEEL = 3000, MAT_MORPHIUM = 1000, MAT_SUPERMATTER = 500)
	desc = "Yours is the drill that will pierce spacetime!"
	drill_verb = "drilling"

//Trophies aka plushies
/obj/item/toy/plushie/mosquito
	name = "mosquito plush"
	desc = "A plushie of a mosquito. You're not sure why you picked this up, but you have it now"
	icon = 'modular_chomp/icons/obj/questitems.dmi'
	icon_state = "mosquito_red"
	pokephrase = "Sksksk!"

/obj/item/toy/plushie/mosquito/orange
	icon_state = "mosquito_orange"

/obj/item/toy/plushie/mosquito/yellow
	icon_state = "mosquito_yellow"

/obj/item/toy/plushie/mosquito/blue
	icon_state = "mosquito_blue"

/obj/item/toy/plushie/mosquito/green
	icon_state = "mosquito_green"

/obj/item/toy/plushie/mosquito/purple
	icon_state = "mosquito_purple"

/* For later use
/obj/item/device/personal_shield_generator/stardiver
	name = "strange personal shield generator"
	desc = "A strange personal shield generator."
	icon_state = "shield_back_active"
	item_state = "shield_pack"
	has_weapon = 0
	modifier_type = /datum/modifier/shield_projection/biohazard/diver


/datum/modifier/shield_projection/biohazard/diver
	slowdown = 3
	outgoing_melee_damage_percent = 1.3
	attack_speed_percent = 0.5

/obj/item/weapon/melee/stardivertrident
	name = "precursor trident"
	desc = "A strange trident recreated after ages of effort."
	icon_state = "stunbaton" //to be made
	item_state = "baton" //to be made
	slot_flags = SLOT_BELT
	force = 35
	sharp = TRUE
	edge = FALSE
	w_class = ITEMSIZE_NORMAL
	defend_chance = 30	// The base chance for the weapon to parry.
	projectile_parry_chance = 30

/obj/item/weapon/melee/stardivertrident/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(user.a_intent == I_HURT) //Reduce healing
		. = ..()
		target.add_modifier(/datum/modifier/fire/weak, 12 SECONDS)
	else if(user.a_intent == I_GRAB) //Slow down target
		. = ..()
		target.add_modifier(/datum/modifier/fire/weak, 12 SECONDS)
	else if(user.a_intent == I_DISARM) //Yeet target
		target.throw_at(target_zone, 3, 2, user, FALSE)
*/