/obj/item/clothing/under/sec_flight_suit
	name = "flight suit"
	desc = "It's made of a slightly sturdier material than standard jumpsuits, to allow for robust protection."
	icon_state = "swatunder"
	item_state_slots = list(slot_r_hand_str = "green", slot_l_hand_str = "green")
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	rolled_sleeves = 0
	rolled_down = 0




//Star Trek things.

//TOS
/obj/item/clothing/under/rank/trek/sec
	name = "Operations Uniform"
	desc = "The uniform worn by operations officers of the mid 2260s. It comes with extra security padding, but you feel strangely vulnerable just seeing this..."
	icon_state = "trek_engsec"
	item_state = "trek_engsec"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

//TNG
/obj/item/clothing/under/rank/trek/sec/next
	desc = "The uniform worn by operation officers. This one's from the mid 2360s. This one has some additional security padding."
	icon_state = "trek_next_engsec"
	item_state = "trek_next_engsec"

//ENT
/obj/item/clothing/under/rank/trek/sec/ent
	desc = "The uniform worn by operations officers of the 2140s. This one has some additional security padding."
	icon_state = "trek_ent_engsec"
	item_state = "trek_ent_engsec"

//VOY
/obj/item/clothing/under/rank/trek/sec/voy
	desc = "The uniform worn by operations officers of the 2370s. This one has some additional security padding."
	icon_state = "trek_voy_engsec"
	item_state = "trek_voy_engsec"

//DS9
/obj/item/clothing/under/rank/trek/sec/ds9
	desc = "The uniform worn by operations officers of the 2380s. This one has some additional security padding."
	icon_state = "trek_engsec"
	item_state = "trek_ds9_engsec"


//Nullsuits (Zero Suits)
/obj/item/clothing/under/rank/nullsuit //The base suit. Don't use this or spawn this one.
	name = "actually null nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. Actually none at all since it's invisible and should not be spawned!"
	sensor_mode = 3
	icon = 'icons/vore/nullsuits.dmi'
	icon_override = 'icons/vore/nullsuits.dmi'
	icon_state = "nullsuit_civ" //Default
	item_state = "nullsuit_civ"
	worn_state = "nullsuit_civ"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/rank/nullsuit/civ
	name = "civilian nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination."
	sensor_mode = 3
	icon = 'icons/vore/nullsuits.dmi'
	icon_override = 'icons/vore/nullsuits.dmi'
	icon_state = "nullsuit_civ"
	item_state = "nullsuit_civ"
	worn_state = "nullsuit_civ"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/rank/nullsuit/cmd //Command version
	name = "command nullsuit"
	desc = ""
	icon_state = "nullsuit_cmd"
	item_state = "nullsuit_cmd"
	worn_state = "nullsuit_cmd"

/obj/item/clothing/under/rank/nullsuit/sec //Security version
	name = "security nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. This particular variant has a tiny bit of padding."
	icon_state = "nullsuit_sec"
	item_state = "nullsuit_sec"
	worn_state = "nullsuit_sec"
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/rank/nullsuit/sec/hos //HoS version
	name = "head of security nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination with colors to distinguish the Head of Security. This particular variant has a tiny bit more padding."
	icon_state = "nullsuit_hos"
	item_state = "nullsuit_hos"
	worn_state = "nullsuit_hos"

/obj/item/clothing/under/rank/nullsuit/med //Medical version
	name = "medical nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. This particular variant has a tiny bit of bio resistance."
	icon_state = "nullsuit_med"
	item_state = "nullsuit_med"
	worn_state = "nullsuit_med"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/nullsuit/med/cmo //Chief Medical Officer version
	name = "Chief Medical Officer nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination with colors to distinguish the Chief Medical Officer. This particular variant has a tiny bit of bio resistance."
	icon_state = "nullsuit_cmo"
	item_state = "nullsuit_cmo"
	worn_state = "nullsuit_cmo"

/obj/item/clothing/under/rank/nullsuit/eng //Engineering version
	name = "engineering nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. This particular variant has a tiny bit of radiation resistance."
	icon_state = "nullsuit_eng"
	item_state = "nullsuit_eng"
	worn_state = "nullsuit_eng"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 10)

/obj/item/clothing/under/rank/nullsuit/eng/ce //Chief Engineer version
	name = "chief engineer nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination with colors to distinguish the Chief Engineer. This particular variant has a tiny bit of radiation resistance."
	icon_state = "nullsuit_ce"
	item_state = "nullsuit_ce"
	worn_state = "nullsuit_ce"

/obj/item/clothing/under/rank/nullsuit/sci //Science version
	name = "science nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. This particular variant has a tiny bit of explosion resistance."
	icon_state = "nullsuit_sci"
	item_state = "nullsuit_sci"
	worn_state = "nullsuit_sci"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/under/rank/nullsuit/sci/rd //Research Director version
	name = "research director nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination with colors to distinguish the research director. This particular variant has a tiny bit of explosion resistance."
	icon_state = "nullsuit_rd"
	item_state = "nullsuit_rd"
	worn_state = "nullsuit_rd"

/obj/item/clothing/under/rank/nullsuit/cargo //Cargo
	name = "cargo nullsuit"
	desc = ""
	icon_state = "nullsuit_cargo"
	item_state = "nullsuit_cargo"
	worn_state = "nullsuit_cargo"

//VR Suit
/obj/item/clothing/under/vrsuit //Pathname of this particular object in the game.
	name = "VR Suit" //The name of the suit when examined
	desc = "An ancient suit used by studio companies long ago to make their virtual reality bones work better." //The description of the suit when examined
	sensor_mode = 3 //Sensor mode which means that by default when someone spawns they will have tracking sensors on
	icon = 'icons/inventory/uniform/item_ch.dmi' //The icon of the suit when shown in the player's HUD
	icon_override = 'icons/inventory/uniform/mob_ch.dmi' //The icon of the suit worn by the character's sprite
	icon_state = "vrsuit" //The name of the suit within the .dmi file
