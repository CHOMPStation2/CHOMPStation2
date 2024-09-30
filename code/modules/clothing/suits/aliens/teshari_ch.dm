//Chompstation teshari cloaks
/obj/item/clothing/suit/storage/teshari/cloak/standard/dark_retrowave
	name = "dark aesthetic cloak"
	icon_state = "tesh_cloak_dretrowave"
	item_state = "tesh_cloak_dretrowave"
	icon = 'icons/mob/species/teshari/teshari_cloak_ch.dmi'
	icon_override = 'icons/mob/species/teshari/teshari_cloak_ch.dmi'

/obj/item/clothing/suit/storage/teshari/cloak/standard/black_glow
	name = "black and glowing cloak"
	icon_state = "tesh_cloak_bglowing"
	item_state = "tesh_cloak_bglowing"
	icon = 'icons/mob/species/teshari/teshari_cloak_ch.dmi'
	icon_override = 'icons/mob/species/teshari/teshari_cloak_ch.dmi'

//Hooded teshari cloaks
/obj/item/clothing/suit/storage/hooded/teshari
	name = "Hooded Teshari Cloak"
	desc = "A soft teshari cloak with an added hood."
	icon_override = 'icons/mob/species/teshari/teshari_hood_ch.dmi'
	icon = 'icons/mob/species/teshari/teshari_hood_ch.dmi'
	icon_state = "tesh_hcloak_bo"
	item_state_slots = list(slot_r_hand_str = "tesh_hcloak_bo", slot_l_hand_str = "tesh_hcloak_bo")
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	flags_inv = HIDEHOLSTER|HIDETIE
	//hooded = 1 Variable no longer exists, hood is now handled by code/modules/clothing/suit/storage/hooded.dm
	action_button_name = "Toggle Cloak Hood"
	hoodtype = /obj/item/clothing/head/tesh_hood
	allowed = list (/obj/item/pen, /obj/item/paper, /obj/item/flashlight,/obj/item/tank/emergency/oxygen, /obj/item/storage/fancy/cigarettes, /obj/item/storage/box/matches, /obj/item/reagent_containers/food/drinks/flask)

/obj/item/clothing/head/tesh_hood
	name = "Cloak Hood"
	desc = "A hood attached to a teshari cloak."
	icon_override = 'icons/mob/species/teshari/teshari_hood_ch.dmi'
	icon = 'icons/mob/species/teshari/teshari_hood_ch.dmi'
	icon_state = "tesh_hood_bo"
	item_state_slots = list(slot_r_hand_str = "tesh_hood_bo", slot_l_hand_str = "tesh_hood_bo")
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_orange
	name = "black and orange hooded cloak"
	icon_state = "tesh_hcloak_bo"
	item_state = "tesh_hcloak_bo"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_orange

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_grey
	name = "black and grey hooded cloak"
	icon_state = "tesh_hcloak_bg"
	item_state = "tesh_hcloak_bg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_midgrey
	name = "black and medium grey hooded cloak"
	icon_state = "tesh_hcloak_bmg"
	item_state = "tesh_hcloak_bmg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_midgrey

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_lightgrey
	name = "black and light grey hooded cloak"
	icon_state = "tesh_hcloak_blg"
	item_state = "tesh_hcloak_blg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_lightgrey

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_white
	name = "black and white hooded cloak"
	icon_state = "tesh_hcloak_bw"
	item_state = "tesh_hcloak_bw"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_white

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_red
	name = "black and red hooded cloak"
	icon_state = "tesh_hcloak_br"
	item_state = "tesh_hcloak_br"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_red

/obj/item/clothing/suit/storage/hooded/teshari/standard/black
	name = "black hooded cloak"
	icon_state = "tesh_hcloak_bn"
	item_state = "tesh_hcloak_bn"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_yellow
	name = "black and yellow hooded cloak"
	icon_state = "tesh_hcloak_by"
	item_state = "tesh_hcloak_by"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_yellow

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_green
	name = "black and green hooded cloak"
	icon_state = "tesh_hcloak_bgr"
	item_state = "tesh_hcloak_bgr"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_green

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_blue
	name = "black and blue hooded cloak"
	icon_state = "tesh_hcloak_bbl"
	item_state = "tesh_hcloak_bbl"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_blue

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_purple
	name = "black and purple hooded cloak"
	icon_state = "tesh_hcloak_bp"
	item_state = "tesh_hcloak_bp"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_purple

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_pink
	name = "black and pink hooded cloak"
	icon_state = "tesh_hcloak_bpi"
	item_state = "tesh_hcloak_bpi"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_pink

/obj/item/clothing/suit/storage/hooded/teshari/standard/black_brown
	name = "black and brown hooded cloak"
	icon_state = "tesh_hcloak_bbr"
	item_state = "tesh_hcloak_bbr"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/black_brown

/obj/item/clothing/suit/storage/hooded/teshari/standard/orange_grey
	name = "orange and grey hooded cloak"
	icon_state = "tesh_hcloak_og"
	item_state = "tesh_hcloak_og"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/orange_grey

///obj/item/clothing/suit/storage/hooded/teshari/standard/rainbow
//	name = "rainbow hooded cloak"
//	icon_state = "tesh_hcloak_rainbow"
//	item_state = "tesh_hcloak_rainbow"
//	hoodtype = /obj/item/clothing/head/tesh_hood/standard/rainbow

/obj/item/clothing/suit/storage/hooded/teshari/standard/lightgrey_grey
	name = "light grey and grey hooded cloak"
	icon_state = "tesh_hcloak_lgg"
	item_state = "tesh_hcloak_lgg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/lightgrey_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/white_grey
	name = "white and grey hooded cloak"
	icon_state = "tesh_hcloak_wg"
	item_state = "tesh_hcloak_wg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/white_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/red_grey
	name = "red and grey hooded cloak"
	icon_state = "tesh_hcloak_rg"
	item_state = "tesh_hcloak_rg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/red_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/orange
	name = "orange hooded cloak"
	icon_state = "tesh_hcloak_on"
	item_state = "tesh_hcloak_on"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/orange

/obj/item/clothing/suit/storage/hooded/teshari/standard/yellow_grey
	name = "yellow and grey hooded cloak"
	icon_state = "tesh_hcloak_yg"
	item_state = "tesh_hcloak_yg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/yellow_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/green_grey
	name = "green and grey hooded cloak"
	icon_state = "tesh_hcloak_gg"
	item_state = "tesh_hcloak_gg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/green_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/blue_grey
	name = "blue and grey hooded cloak"
	icon_state = "tesh_hcloak_blug"
	item_state = "tesh_hcloak_blug"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/blue_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/purple_grey
	name = "purple and grey hooded cloak"
	icon_state = "tesh_hcloak_pg"
	item_state = "tesh_hcloak_pg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/purple_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/pink_grey
	name = "pink and grey hooded cloak"
	icon_state = "tesh_hcloak_pig"
	item_state = "tesh_hcloak_pig"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/pink_grey

/obj/item/clothing/suit/storage/hooded/teshari/standard/brown_grey
	name = "brown and grey hooded cloak"
	icon_state = "tesh_hcloak_brg"
	item_state = "tesh_hcloak_brg"
	hoodtype = /obj/item/clothing/head/tesh_hood/standard/brown_grey

/obj/item/clothing/head/tesh_hood/standard/black_orange
	name = "black and orange cloak hood"
	icon_state = "tesh_hood_bo"
	item_state = "tesh_hood_bo"

/obj/item/clothing/head/tesh_hood/standard/black_grey
	name = "black and grey cloak hood"
	icon_state = "tesh_hood_bg"
	item_state = "tesh_hood_bg"

/obj/item/clothing/head/tesh_hood/standard/black_midgrey
	name = "black and medium grey cloak hood"
	icon_state = "tesh_hood_bmg"
	item_state = "tesh_hood_bmg"

/obj/item/clothing/head/tesh_hood/standard/black_lightgrey
	name = "black and light grey cloak hood"
	icon_state = "tesh_hood_blg"
	item_state = "tesh_hood_blg"

/obj/item/clothing/head/tesh_hood/standard/black_white
	name = "black and white cloak hood"
	icon_state = "tesh_hood_bw"
	item_state = "tesh_hood_bw"

/obj/item/clothing/head/tesh_hood/standard/black_red
	name = "black and red cloak hood"
	icon_state = "tesh_hood_br"
	item_state = "tesh_hood_br"

/obj/item/clothing/head/tesh_hood/standard/black
	name = "black cloak hood"
	icon_state = "tesh_hood_bn"
	item_state = "tesh_hood_bn"

/obj/item/clothing/head/tesh_hood/standard/black_yellow
	name = "black and yellow cloak hood"
	icon_state = "tesh_hood_by"
	item_state = "tesh_hood_by"

/obj/item/clothing/head/tesh_hood/standard/black_green
	name = "black and green cloak hood"
	icon_state = "tesh_hood_bgr"
	item_state = "tesh_hood_bgr"

/obj/item/clothing/head/tesh_hood/standard/black_blue
	name = "black and blue cloak hood"
	icon_state = "tesh_hood_bbl"
	item_state = "tesh_hood_bbl"

/obj/item/clothing/head/tesh_hood/standard/black_purple
	name = "black and purple cloak hood"
	icon_state = "tesh_hood_bp"
	item_state = "tesh_hood_bp"

/obj/item/clothing/head/tesh_hood/standard/black_pink
	name = "black and pink cloak hood"
	icon_state = "tesh_hood_bpi"
	item_state = "tesh_hood_bpi"

/obj/item/clothing/head/tesh_hood/standard/black_brown
	name = "black and brown cloak hood"
	icon_state = "tesh_hood_bbr"
	item_state = "tesh_hood_bbr"

/obj/item/clothing/head/tesh_hood/standard/orange_grey
	name = "orange and grey cloak hood"
	icon_state = "tesh_hood_og"
	item_state = "tesh_hood_og"

/obj/item/clothing/head/tesh_hood/standard/rainbow
	name = "rainbow cloak hood"
	icon_state = "tesh_hood_rainbow"
	item_state = "tesh_hood_rainbow"

/obj/item/clothing/head/tesh_hood/standard/lightgrey_grey
	name = "light grey and grey cloak hood"
	icon_state = "tesh_hood_lgg"
	item_state = "tesh_hood_lgg"

/obj/item/clothing/head/tesh_hood/standard/white_grey
	name = "white and grey cloak hood"
	icon_state = "tesh_hood_wg"
	item_state = "tesh_hood_wg"

/obj/item/clothing/head/tesh_hood/standard/red_grey
	name = "red and grey cloak hood"
	icon_state = "tesh_hood_rg"
	item_state = "tesh_hood_rg"

/obj/item/clothing/head/tesh_hood/standard/orange
	name = "orange cloak hood"
	icon_state = "tesh_hood_on"
	item_state = "tesh_hood_on"

/obj/item/clothing/head/tesh_hood/standard/yellow_grey
	name = "yellow and grey cloak hood"
	icon_state = "tesh_hood_yg"
	item_state = "tesh_hood_yg"

/obj/item/clothing/head/tesh_hood/standard/green_grey
	name = "green and grey cloak hood"
	icon_state = "tesh_hood_gg"
	item_state = "tesh_hood_gg"

/obj/item/clothing/head/tesh_hood/standard/blue_grey
	name = "blue and grey cloak hood"
	icon_state = "tesh_hood_blug"
	item_state = "tesh_hood_blug"

/obj/item/clothing/head/tesh_hood/standard/purple_grey
	name = "purple and grey cloak hood"
	icon_state = "tesh_hood_pg"
	item_state = "tesh_hood_pg"

/obj/item/clothing/head/tesh_hood/standard/pink_grey
	name = "pink and grey cloak hood"
	icon_state = "tesh_hood_pig"
	item_state = "tesh_hood_pig"

/obj/item/clothing/head/tesh_hood/standard/brown_grey
	name = "brown and grey cloak hood"
	icon_state = "tesh_hood_brg"
	item_state = "tesh_hood_brg"
