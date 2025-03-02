/*any items must be put under /obj/item/clothing/under/yw as a base path for icons to work, if put in uniforms_yw/uniform_yw and suits_yw/suit_yw.*/
//I use this for any away mission uniforms,job uniforms or character loadout gear I add for everyone to use. Not exactly custom items for people, so this is a good spot. -RadiantFlash
/obj/item/clothing/under/yw

/obj/item/clothing/under/yw/blueshield //fancy blueshield suit,
	name = "Blueshield officer Formal suit"
	desc = "Gold trim on blue cloth, this uniform displays the rank of \"Lieutenant\" and bears \"Nanotrasen Blueshield officer\" on the left shoulder"
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "blueshield"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "blueshield"

/obj/item/clothing/under/yw/blueshield2 //fancy blueshield suit,
	name = "Blueshield officer suit"
	desc = "A snazzy combat uniform with the a blueshield insignia on the back."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "blueshield2"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "blueshield2"
	armor = list(melee = 15, bullet = 10, laser = 10,energy = 5, bomb = 15, bio = 0, rad = 0)

/obj/item/clothing/accessory/storage/webbing/combatpilot //redefined to change the name and keep it loaded in the event the sc files are disabled in future
	name = "combat pilot harness"
	desc = "Sturdy mess of black synthcotton belts and buckles."
	icon_state = "pilot_webbing2"
	sprite_sheets = list(
			"Teshari" = 'icons/inventory/accessory/mob_teshari.dmi'
			)

/obj/item/clothing/under/rank/khi/sec/pilot //yes, we're inheriting from the khi version; that one has full rolldown sprites
	name = "security pilot uniform"
	desc = "A lightweight uniform intended for vehicle and powersuit operators, designed to allow free movement and maximum comfort in hot, cramped cockpits. Comes prefitted with a harness and webbing for gear."
	armor = list(melee = 0, bullet = 10, laser = 10, energy = 0, bomb = 10, bio = 0, rad = 0)
	//we probably won't get hit by melee attacks as a pilot, but logically you'd want protection against anything that might penetrate the armor
	starting_accessories = list(/obj/item/clothing/accessory/storage/webbing/combatpilot)
	//come prefitted with some snappy extra webbing

/obj/item/clothing/under/yw/rank/security/formal
	name = "security suit"
	desc = "A formal security suit for officers complete with nanotrasen belt buckle."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "securityformal"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "securityformal"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/yw/rank/warden/formal
	name = "warden's suit"
	desc = "A formal security suit for the warden with blue desginations and '/Warden/' stiched into the shoulders."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "wardenformal"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "wardenformal"
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/yw/rank/head_of_security/formal
	name = "head of security's suit"
	desc = "A security suit decorated for those few with the dedication to achieve the position of Head of Security."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "hosformal"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "hosformal"
	armor = list(melee = 10, bullet = 10, laser = 10,energy = 5, bomb = 0, bio = 0, rad = 0)

//Brig Physician
/obj/item/clothing/under/yw/rank/security/brigphys
	desc = "Jumpsuit for Brig Physician it has both medical and security protection."
	name = "brig physician's jumpsuit"
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "brigphysician"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "brigphysician"
	permeability_coefficient = 0.50
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/yw/rank/security/brigphys/skirt
	desc = "A skirted Brig Physician uniform. It has both security and medical protection."
	name = "brig physician's jumpskirt"
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "brigphysicianf"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "brigphysicianf"
	permeability_coefficient = 0.50
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 10, rad = 0)


/obj/item/clothing/under/yw/robotics //fancy blueshield suit,
	name = "A cybernetic uniform"
	desc = "A roboticist uniform with glowing trim, and some sort of machine port on the back."
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "robotics2"
	icon_override = 'icons/mob/uniform_yw.dmi'
	item_state = "Robotics2"

//Explorers uniforms Start
/obj/item/clothing/under/explorer/utility
	name = "\improper Explorer uniform"
	desc = "The utility uniform of the Explorer's association, made from biohazard resistant material. This one has silver trim."
	icon = 'icons/obj/clothing/uniforms_yw.dmi'
	icon_state = "blackutility_crew"
	icon_override = 'icons/mob/uniform_yw.dmi'
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 10)

/obj/item/clothing/under/explorer/utility/supply
	name = "\improper explorer supply uniform"
	desc = "The utility uniform of the Explorer's association, made from biohazard resistant material. This one has silver trim and brown blazes."
	icon_state = "blackutility_sup"

/obj/item/clothing/under/explorer/utility/command
	name = "\improper explorer command uniform"
	desc = "The utility uniform of the Explorer's association, made from biohazard resistant material. This one has silver trim."
	icon_state = "blackutility_com"

/obj/item/clothing/under/explorer/utility/medical
	name = "\improper explorer medical uniform"
	desc = "The utility uniform of the Explorer's association, made from biohazard resistant material. This one has silver trim and blue blazes."
	icon_state = "blackutility_med"

/obj/item/clothing/under/explorer/utility/command/medical
	name = "\improper explorer medical command uniform"
	desc = "The utility uniform of the Explorer's association, made from biohazard resistant material. his one has gold trim and blue blazes."
	icon_state = "blackutility_medcom"

/obj/item/clothing/under/explorer/utility/security
	name = "\improper explorer security uniform"
	desc = "The utility uniform of the Explorer's association, made from biohazard resistant material. This one has silver trim and red blazes."
	icon_state = "blackutility_sec"

/obj/item/clothing/under/explorer/utility/command/security
	name = "\improper explorer security command uniform"
	desc = "The utility uniform of the Explorer's association, made from biohazard resistant material. This one has gold trim and red blazes."
	icon_state = "blackutility_seccom"

/obj/item/clothing/under/explorer/utility/engineering
	name = "\improper explorer engineering uniform"
	desc = "The utility uniform of the Explorer's association, made from biohazard resistant material. This one has silver trim and organge blazes."
	icon_state = "blackutility_eng"

/obj/item/clothing/under/explorer/utility/command/engineering
	name = "\improper explorer engineering command uniform"
	desc = "The utility uniform of the Explorer's association, made from biohazard resistant material. This one has gold trim and organge blazes."
	icon_state = "blackutility_engcom"
//Explorer uniforms end

//Away mission uniforms begin
/obj/item/clothing/under/away/patrol
	name = "\improper nanotrasen fleet uniform"
	desc = "The Fleet uniform of the Nanotrasen Space Patrol, made from resistant material."
	icon = 'icons/obj/clothing/uniforms_yw.dmi'
	icon_state = "navyutility"
	icon_override = 'icons/mob/uniform_yw.dmi'
	armor = list(melee = 10, bullet = 10, laser = 10,energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/away/patrol/medical
	name = "\improper nanotrasen fleet medical uniform"
	desc = "The Fleet uniform of the Nanotrasen Space Patrol, made from resistant material. This one has blue blazes."
	icon_state = "navyutility_med"
	worn_state = "navyutility_med"

/obj/item/clothing/under/away/patrol/security
	name = "\improper nanotrasen fleet security uniform"
	desc = "The Fleet uniform of the Nanotrasen Space Patrol, made from resistant material. This one has red blazes."
	icon_state = "navyutility_sec"
	worn_state = "navyutility_sec"

/obj/item/clothing/under/away/patrol/engineering
	name = "\improper nanotrasen fleet engineering uniform"
	desc = "The Fleet uniform of the Nanotrasen Space Patrol, made from resistant material. This one has orange blazes."
	icon_state = "navyutility_eng"
	worn_state = "navyutility_eng"

/obj/item/clothing/under/away/patrol/command
	name = "\improper nanotrasen fleet command uniform"
	desc = "The Fleet uniform of the Nanotrasen Space Patrol, made from resistant material. This one has gold blazes."
	icon_state = "navyutility_com"
	worn_state = "navyutility_com"
	icon_override = 'icons/mob/uniform_yw.dmi'

/obj/item/clothing/under/away/patrol/supply
	name = "\improper nanotrasen fleet supply uniform"
	desc = "The Fleet uniform of the Nanotrasen Space Patrol, made from resistant material. This one has brown blazes"
	icon_state = "navyutility_sup"
	worn_state = "navyutility_sup"
	icon_override = 'icons/mob/uniform_yw.dmi'


/obj/item/clothing/under/away/daedalus
	name = "\improper daedalus uniform"
	desc = "An old and worn down unifom of a missing exploration expedition. It has the words SGV DAEDALUS written on the back."
	icon = 'icons/obj/clothing/uniforms_yw.dmi'
	icon_state = "greyutility"
	worn_state = "greyutility"
	icon_override = 'icons/mob/uniform_yw.dmi'
	armor = list(melee = 10, bullet = 10, laser = 10,energy = 5, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/away/daedalus/engineering
	name = "\improper daedalus engineering uniform"
	desc = "An old and worn down unifom of a missing exploration expedition. It has the words SGV DAEDALUS written on the back."
	icon_state = "greyutility_eng"
	worn_state = "greyutility_eng"
	icon_override = 'icons/mob/uniform_yw.dmi'

/obj/item/clothing/under/away/daedalus/security
	name = "\improper daedalus security uniform"
	desc = "An old and worn down unifom of a missing exploration expedition. It has the words SGV DAEDALUS written on the back."
	icon_state = "greyutility_sec"
	worn_state = "greyutility_sec"
	icon_override = 'icons/mob/uniform_yw.dmi'

/obj/item/clothing/under/away/daedalus/command
	name = "\improper daedalus security uniform"
	desc = "An old and worn down unifom of a missing exploration expedition. It has the words SGV DAEDALUS written on the back."
	icon_state = "greyutility_com"
	worn_state = "greyutility_com"
	icon_override = 'icons/mob/uniform_yw.dmi'

/obj/item/clothing/under/away/daedalus/medical
	name = "\improper daedalus medical uniform"
	desc = "An old and worn down unifom of a missing exploration expedition. It has the words SGV DAEDALUS written on the back."
	icon_state = "greyutility_med"
	worn_state = "greyutility_med"
	icon_override = 'icons/mob/uniform_yw.dmi'

/obj/item/clothing/under/away/daedalus/supply
	name = "\improper daedalus supply uniform"
	desc = "An old and worn down unifom of a missing exploration expedition. It has the words SGV DAEDALUS written on the back."
	icon_state = "greyutility_sup"
	worn_state = "greyutility_sup"
	icon_override = 'icons/mob/uniform_yw.dmi'


/obj/item/clothing/under/yw/victsuit/victdress
	name = "black victorian dress"
	desc = "A victorian style dress, fancy!"
	icon_state = "victorianblackdress"
	item_state = "victorianblackdress"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/yw/victsuit/victdress/red
	name = "red victorian dress"
	icon_state = "victorianreddress"
	item_state = "victorianreddress"

/obj/item/clothing/under/yw/victsuit
	name = "black victorian suit"
	desc = "A victorian style suit, fancy!"
	icon = 'icons/mob/uniform_yw.dmi'
	icon_state = "victorianvest"
	item_state = "victorianvest"
	icon_override = 'icons/mob/uniform_yw.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/yw/victsuit/redblk
	name = "red and black victorian suit"
	icon_state = "victorianblred"
	item_state = "victorianblred"

/obj/item/clothing/under/yw/victsuit/red
	name = "red victorian suit"
	icon_state = "victorianredvest"
	item_state = "victorianredvest"

/obj/item/clothing/under/yw/victsuit/get_worn_icon_file(var/body_type,var/slot_name,var/default_icon,var/inhands)
	if(body_type == SPECIES_GREY_YW)
		if(!inhands)
			return 'icons/mob/species/grey/uniform.dmi'

	else
		return ..()
