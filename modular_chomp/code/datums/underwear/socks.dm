/datum/category_item/underwear/socks/generate_image(var/list/metadata, var/layer = FLOAT_LAYER, var/digitigrade = FALSE) //CHOMPEdit
	if(!icon_state)
		return

	var/image/I = image(icon = digitigrade ? 'modular_chomp/icons/mob/human.dmi' : icon, icon_state = icon_state, layer = layer) //CHOMPEdit
	for(var/datum/gear_tweak/gt in tweaks)
		gt.tweak_item(I, metadata && metadata["[gt]"] ? metadata["[gt]"] : gt.get_default())
	return I
