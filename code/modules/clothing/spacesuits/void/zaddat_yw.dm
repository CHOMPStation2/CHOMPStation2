/obj/item/clothing/suit/space/void/zaddat/engineer
	name = "\improper Engineer's Guild Shroud"
	desc = "This rugged Shroud was created by the Xozi Engineering Guild."
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 100, rad = 100)
	icon_state = "zaddat_engie"
	item_state = "zaddat_engie"
	helmet = new/obj/item/clothing/head/helmet/space/void/zaddat/engineer


/obj/item/clothing/head/helmet/space/void/zaddat/engineer
	name = "\improper Engineer's Guild Shroud helmet"
	desc = "A Shroud helmet designed for good visibility in low-light environments."
	icon_state = "zaddat_engie"
	item_state = "zaddat_engie"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 100)

/obj/item/clothing/suit/space/void/zaddat/security
	name = "\improper Security Knight's Shroud"
	desc = "This distinctive steel-plated Shroud was popularized by the Noble Guild."
	armor = list(melee = 30, bullet = 20, laser = 20,energy = 10, bomb = 10, bio = 100, rad = 30)
	icon_state = "zaddat_knight"
	item_state = "zaddat_knight"
	helmet = new/obj/item/clothing/head/helmet/space/void/zaddat/security

/obj/item/clothing/head/helmet/space/void/zaddat/security
	name = "\improper Security Knight's Shroud helm"
	desc = "This spaceworthy helmet was patterned after the knight's helmets used by Zaddat before their discovery by the Unathi."
	icon_state = "zaddat_knight"
	item_state = "zaddat_knight"
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 10, bomb = 10, bio = 100, rad = 30)





/obj/item/clothing/suit/space/void/zaddat/security/custom_suit() //so it cant turn into looks that dont makes sense and keep security name in it
	set name = "Customize Shroud"
	set category = "Object"
	set desc = "Pick an appearence for your Shroud."

	var/mob/M = usr
	var/suit_style = null

	if(has_been_customized)
		to_chat(M, "This Shroud has already been customized!")
		return 0

	suit_style = input(M, "Which suit style would you like?") in list("Engineer", "Spacer", "Knight", "Fashion", "Bishop", "Hegemony", "Rugged", "Soft")
	switch(suit_style)
		if("Spacer")
			name = "\improper Security Spacer's Guild Shroud"
			base_name = "\improper Spacer's Guild Shroud"
			desc = "The blue plastic Shroud worn by members of the Zaddat Spacer's Guild. This one has a layer of armor"
			icon_state = "zaddat_spacer"
			item_state = "zaddat_spacer"
			if(helmet)
				helmet.name = "\improper Security Spacer's Guild Shroud helmet"
				helmet.desc = "A cool plastic-and-glass helmet designed after popular adventure fiction. This one has a layer of armor"
				helmet.icon_state = "zaddat_spacer"
				helmet.item_state = "zaddat_spacer"
		if("Knight")
			name = "\improper Security Knight's Shroud"
			base_name = "\improper Knight's Shroud"
			desc = "This distinctive steel-plated Shroud was popularized by the Noble Guild. This one has a layer of armor"
			icon_state = "zaddat_knight"
			item_state = "zaddat_knight"
			if(helmet)
				helmet.name = "\improper Security Knight's Shroud helm"
				helmet.desc = "This spaceworthy helmet was patterned after the knight's helmets used by Zaddat before their discovery by the Unathi. This one has a layer of armor"
				helmet.icon_state = "zaddat_knight"
				helmet.item_state = "zaddat_knight"
		if("Fashion")
			name = "\improper Security Avazi House Shroud"
			base_name = "\improper Security Avazi House Shroud"
			desc = "The designers of the Avazi Fashion House are among the most renowned in Zaddat society, and their Shroud designs second to none. This one has a layer of armor"
			icon_state = "zaddat_fashion"
			item_state = "zaddat_fashion"
			if(helmet)
				helmet.name = "\improper Security Avazi House Shroud helmet"
				helmet.desc = "The Avazi Fashion House recently designed this popular Shroud helmet, designed to pleasingly frame a Zaddat's face. This one has a layer of armor"
				helmet.icon_state = "zaddat_fashion"
				helmet.item_state = "zaddat_fashion"
		if("Bishop")
			name = "\improper Security Bishop-patterned Shroud"
			base_name = "\improper Bishop-patterned Shroud"
			desc = "The bold designers of the Dzaz Fashion House chose to make this Bishop-themed Shroud design as a commentary on the symbiotic nature of Vanax and human culture. Allegedly. This one has a layer of armor"
			icon_state = "zaddat_bishop"
			item_state = "zaddat_bishop"
			if(helmet)
				helmet.name = "\improper Security Bishop-patterned Shroud helmet"
				helmet.desc = "The Shroud helmet that inspired a dozen lawsuits. This one has a layer of armor"
				helmet.icon_state = "zaddat_bishop"
				helmet.item_state = "zaddat_bishop"
		if("Rugged")
			name = "Security rugged Shroud"
			base_name = "rugged Shroud"
			desc = "This Shroud was patterned after from First Contact era human voidsuits. This one has a layer of armor"
			icon_state = "zaddat_rugged"
			item_state = "zaddat_rugged"
			if(helmet)
				helmet.name = "Security rugged Shroud helmet"
				helmet.desc = "Supposedly, this helmet should make humans more comfortable and familiar with the Zaddat. This one has a layer of armor"
				helmet.icon_state = "zaddat_rugged"
				helmet.item_state = "zaddat_rugged"

	to_chat(M, "You finish customizing your Shroud. Looking good!")
	has_been_customized = TRUE
	M.regenerate_icons()
	return 1


/obj/item/clothing/suit/space/void/zaddat/engineer/custom_suit()
	set name = "Customize Shroud"
	set category = "Object"
	set desc = "Pick an appearence for your Shroud."

	var/mob/M = usr
	var/suit_style = null

	if(has_been_customized)
		to_chat(M, "This Shroud has already been customized!")
		return 0

	suit_style = input(M, "Which suit style would you like?") in list("Engineer", "Spacer", "Knight", "Fashion", "Bishop", "Hegemony", "Rugged", "Soft")
	switch(suit_style)
		if("Engineer")
			name = "\improper Rad-Plated Engineer's Guild Shroud"
			base_name = "\improper Engineer's Guild Shroud"
			desc = "This rugged Shroud was created by the Xozi Engineering Guild. It has extra radiation shielding"
			icon_state = "zaddat_engie"
			item_state = "zaddat_engie"
			if(helmet)
				helmet.name = "\improper Rad-Plated Engineer's Guild Shroud helmet"
				helmet.desc = "A Shroud helmet designed for good visibility in low-light environments. It has extra radiation shielding"
				helmet.icon_state = "zaddat_engie"
				helmet.item_state = "zaddat_engie"
		if("Spacer")
			name = "\improper Rad-Plated Spacer's Guild Shroud"
			base_name = "\improper Spacer's Guild Shroud"
			desc = "The blue plastic Shroud worn by members of the Zaddat Spacer's Guild. It has extra radiation shielding"
			icon_state = "zaddat_spacer"
			item_state = "zaddat_spacer"
			if(helmet)
				helmet.name = "\improper Rad-Plated Spacer's Guild Shroud helmet"
				helmet.desc = "A cool plastic-and-glass helmet designed after popular adventure fiction. It has extra radiation shielding"
				helmet.icon_state = "zaddat_spacer"
				helmet.item_state = "zaddat_spacer"
		if("Knight")
			name = "\improper Rad-Plated Knight's Shroud"
			base_name = "\improper Knight's Shroud"
			desc = "This distinctive steel-plated Shroud was popularized by the Noble Guild. It has extra radiation shielding"
			icon_state = "zaddat_knight"
			item_state = "zaddat_knight"
			if(helmet)
				helmet.name = "\improper Rad-Plated Knight's Shroud helm"
				helmet.desc = "This spaceworthy helmet was patterned after the knight's helmets used by Zaddat before their discovery by the Unathi. It has extra radiation shielding"
				helmet.icon_state = "zaddat_knight"
				helmet.item_state = "zaddat_knight"
		if("Fashion")
			name = "\improper Rad-Plated Avazi House Shroud"
			base_name = "\improper Avazi House Shroud"
			desc = "The designers of the Avazi Fashion House are among the most renowned in Zaddat society, and their Shroud designs second to none. It has extra radiation shielding"
			icon_state = "zaddat_fashion"
			item_state = "zaddat_fashion"
			if(helmet)
				helmet.name = "\improper Rad-Plated Avazi House Shroud helmet"
				helmet.desc = "The Avazi Fashion House recently designed this popular Shroud helmet, designed to pleasingly frame a Zaddat's face. It has extra radiation shielding"
				helmet.icon_state = "zaddat_fashion"
				helmet.item_state = "zaddat_fashion"
		if("Bishop")
			name = "\improper Rad-Plated Bishop-patterned Shroud"
			base_name = "\improper Bishop-patterned Shroud"
			desc = "The bold designers of the Dzaz Fashion House chose to make this Bishop-themed Shroud design as a commentary on the symbiotic nature of Vanax and human culture. Allegedly. It has extra radiation shielding"
			icon_state = "zaddat_bishop"
			item_state = "zaddat_bishop"
			if(helmet)
				helmet.name = "\improper Rad-Plated Bishop-patterned Shroud helmet"
				helmet.desc = "The Shroud helmet that inspired a dozen lawsuits. It has extra radiation shielding"
				helmet.icon_state = "zaddat_bishop"
				helmet.item_state = "zaddat_bishop"
		if("Rugged")
			name = "rugged Rad-Plated Shroud"
			base_name = "rugged Shroud"
			desc = "This Shroud was patterned after from First Contact era human voidsuits. It has extra radiation shielding"
			icon_state = "zaddat_rugged"
			item_state = "zaddat_rugged"
			if(helmet)
				helmet.name = "rugged Rad-Plated Shroud helmet"
				helmet.desc = "Supposedly, this helmet should make humans more comfortable and familiar with the Zaddat. It has extra radiation shielding"
				helmet.icon_state = "zaddat_rugged"
				helmet.item_state = "zaddat_rugged"
		if("Soft")
			name = "\improper Rad-Plated soft Shroud"
			base_name = "\improper soft Shroud"
			desc = "Material and design is chosen for practical reasons, making it take as little space as possible when stowed whilst also providing reasonable comfort when worn for long periods. It has extra radiation shielding"
			icon_state = "zaddat_soft"
			item_state = "zaddat_soft"
			if(helmet)
				helmet.name = "\improper Rad-Plated soft Shroud hood"
				helmet.desc = "Not as solid as a proper helmet, but works nonetheless. It has extra radiation shielding"
				helmet.icon_state = "zaddat_soft"
				helmet.item_state = "zaddat_soft"

	to_chat(M, "You finish customizing your Shroud. Looking good!")
	has_been_customized = TRUE
	M.regenerate_icons()
	return 1
