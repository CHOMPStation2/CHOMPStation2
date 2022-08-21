/obj/item/clothing/head/cone/New()
	. = ..()
	var/shtfound = sprite_sheets.Find(SPECIES_TESHARI)
	if(shtfound)
		sprite_sheets[SPECIES_TESHARI] = 'modular_chomp/icons/inventory/head/mob_teshari.dmi'
	else
		sprite_sheets[SPECIES_TESHARI] = 'modular_chomp/icons/inventory/head/mob_teshari.dmi'