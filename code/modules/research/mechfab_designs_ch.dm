
/datum/design/item/mecha
	build_type = MECHFAB
	category = "Exosuit Equipment"
	time = 10
	materials = list(DEFAULT_WALL_MATERIAL = 7500)

/datum/design/item/mecha/AssembleDesignDesc()
	if(!desc)
		desc = "Allows for the construction of \a '[item_name]' exosuit module."

/datum/design/item/mecha/phoron_bore
	name = "PB-23 \"Phobos\" Phoron Bore"
	desc = "A large, mecha-mounted Phoron bore. It makes use a specialized compressed phoron crystal. The bolt it fires travels for 6 tiles before disapaiting, breaking rocks and extracting minerals."
	id ="mech_phoron_bore"
	req_tech = list(TECH_POWER = 5, TECH_PHORON = 5, TECH_MATERIAL = 5)
	materials = list(MAT_PLASTEEL = 4000, "phoron" = 10000, "silver" = 2000)
	build_path =/obj/item/mecha_parts/mecha_equipment/weapon/phoron_bore