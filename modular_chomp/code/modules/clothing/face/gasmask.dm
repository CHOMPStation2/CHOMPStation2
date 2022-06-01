/obj/item/clothing/mask/gas/plaguedoctor/New()
	. = ..()
	var/shtfound = sprite_sheets.Find(SPECIES_TESHARI)
	if(shtfound)
		sprite_sheets[SPECIES_TESHARI] = 'modular_chomp/icons/inventory/face/mob_teshari.dmi'
	else
		sprite_sheets[SPECIES_TESHARI] = 'modular_chomp/icons/inventory/face/mob_teshari.dmi'

/obj/item/clothing/mask/gas/plaguedoctor/gold/New()
	. = ..()
	var/shtfound = sprite_sheets.Find(SPECIES_TESHARI)
	if(shtfound)
		sprite_sheets[SPECIES_TESHARI] = 'modular_chomp/icons/inventory/face/mob_teshari.dmi'
	else
		sprite_sheets[SPECIES_TESHARI] = 'modular_chomp/icons/inventory/face/mob_teshari.dmi'