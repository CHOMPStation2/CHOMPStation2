/obj/item/rig
	var/protean = 0
	var/obj/item/storage/backpack/rig_storage
	permeability_coefficient = 0  //Protect the squishies, after all this shit should be waterproof.

/obj/item/clothing/head/helmet/space/rig
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_PROMETHEAN, SPECIES_TESHARI, SPECIES_SHADEKIN)
	sprite_sheets = list(
		SPECIES_TAJ = 'icons/inventory/suit/mob_tajaran.dmi',
		SPECIES_UNATHI = 'icons/inventory/suit/mob_unathi.dmi',
		SPECIES_VOX = 'icons/inventory/suit/mob_vox.dmi',
		SPECIES_TESHARI = 'icons/inventory/suit/mob_teshari.dmi',
		SPECIES_SHADEKIN = 'icons/inventory/suit/mob_tajaran.dmi'
		)

/obj/item/clothing/gloves/gauntlets/rig
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_PROMETHEAN, SPECIES_TESHARI, SPECIES_SHADEKIN)

/obj/item/clothing/shoes/magboots/rig
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_PROMETHEAN, SPECIES_TESHARI, SPECIES_SHADEKIN)

/obj/item/clothing/suit/space/rig
	species_restricted = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_TAJ, SPECIES_UNATHI, SPECIES_PROMETHEAN, SPECIES_TESHARI, SPECIES_SHADEKIN)