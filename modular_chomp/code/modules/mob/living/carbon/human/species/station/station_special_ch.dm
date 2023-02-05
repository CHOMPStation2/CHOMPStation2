/datum/species/xenochimera/get_bodytype(var/mob/living/carbon/human/H)
	if(!H || base_species == name) return ..()
	var/datum/species/S = GLOB.all_species[base_species]
	return S.get_bodytype(H)

/datum/species/xenochimera/get_icobase(var/mob/living/carbon/human/H, var/get_deform)
	if(!H || base_species == name) return ..()
	var/datum/species/S = GLOB.all_species[base_species]
	return S.get_icobase(H, get_deform)

/datum/species/xenochimera/get_tail(var/mob/living/carbon/human/H)
	if(!H || base_species == name) return ..()
	var/datum/species/S = GLOB.all_species[base_species]
	return S.get_tail(H)

/datum/species/xenochimera/get_tail_animation(var/mob/living/carbon/human/H)
	if(!H || base_species == name) return ..()
	var/datum/species/S = GLOB.all_species[base_species]
	return S.get_tail_animation(H)

/datum/species/xenochimera/get_tail_hair(var/mob/living/carbon/human/H)
	if(!H || base_species == name) return ..()
	var/datum/species/S = GLOB.all_species[base_species]
	return S.get_tail_hair(H)

/datum/species/xenochimera/get_blood_mask(var/mob/living/carbon/human/H)
	if(!H || base_species == name) return ..()
	var/datum/species/S = GLOB.all_species[base_species]
	return S.get_blood_mask(H)

/datum/species/xenochimera/get_damage_mask(var/mob/living/carbon/human/H)
	if(!H || base_species == name) return ..()
	var/datum/species/S = GLOB.all_species[base_species]
	return S.get_damage_mask(H)

/datum/species/xenochimera/get_damage_overlays(var/mob/living/carbon/human/H)
	if(!H || base_species == name) return ..()
	var/datum/species/S = GLOB.all_species[base_species]
	return S.get_damage_overlays(H)
