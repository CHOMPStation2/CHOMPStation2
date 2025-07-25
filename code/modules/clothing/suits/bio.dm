//Biosuit complete with shoes (in the item sprite)
/obj/item/clothing/head/bio_hood
	name = "bio hood"
	icon_state = "bio"
	desc = "A hood that protects the head and face from biological comtaminants."
	randpixel = 0
	center_of_mass_x = 0
	center_of_mass_y = 0
	permeability_coefficient = 0.01
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 100, rad = 20)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	siemens_coefficient = 0.9
	flags = PHORONGUARD
	item_flags = THICKMATERIAL | ALLOW_SURVIVALFOOD

/obj/item/clothing/suit/bio_suit
	name = "bio suit"
	desc = "A suit that protects against biological contamination."
	icon_state = "bio"
	w_class = ITEMSIZE_LARGE//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	body_parts_covered = CHEST|LEGS|ARMS|HANDS|FEET
	slowdown = 1.0
	allowed = list(POCKET_GENERIC, POCKET_EMERGENCY)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 100, rad = 20)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER
	siemens_coefficient = 0.9
	flags = PHORONGUARD
	item_flags = THICKMATERIAL

//Standard biosuit, orange stripe
/obj/item/clothing/head/bio_hood/general
	icon_state = "bio_general"
	item_state_slots = list(slot_r_hand_str = "bio", slot_l_hand_str = "bio")
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/suit/bio_suit/general
	icon_state = "bio_general"
	item_state_slots = list(slot_r_hand_str = "bio", slot_l_hand_str = "bio")
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER

//Virology biosuit, green stripe
/obj/item/clothing/head/bio_hood/virology
	icon_state = "bio_virology"

/obj/item/clothing/suit/bio_suit/virology
	icon_state = "bio_virology"
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER

//Security biosuit, grey with red stripe across the chest
/obj/item/clothing/head/bio_hood/security
	icon_state = "bio_security"

/obj/item/clothing/suit/bio_suit/security
	icon_state = "bio_security"
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER

//Janitor's biosuit, grey with purple arms
/obj/item/clothing/head/bio_hood/janitor
	icon_state = "bio_janitor"

/obj/item/clothing/suit/bio_suit/janitor
	icon_state = "bio_janitor"
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER

//Scientist's biosuit, white with a pink-ish hue
/obj/item/clothing/head/bio_hood/scientist
	icon_state = "bio_scientist"

/obj/item/clothing/suit/bio_suit/scientist
	icon_state = "bio_scientist"
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER

//CMO's biosuit, blue stripe
/obj/item/clothing/suit/bio_suit/cmo
	icon_state = "bio_cmo"
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER

/obj/item/clothing/head/bio_hood/cmo
	icon_state = "bio_cmo"

//Plague Dr mask can be found in clothing/masks/gasmask.dm. Golden can be found in labcoat.dm.
/obj/item/clothing/suit/bio_suit/plaguedoctorsuit
	name = "plague doctor suit"
	desc = "It protected doctors from the Black Death, back then. You bet your arse it's gonna help you against viruses."
	icon_state = "plaguedoctor"
	item_state_slots = list(slot_r_hand_str = "bio", slot_l_hand_str = "bio")
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER
