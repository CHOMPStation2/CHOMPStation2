// Expand shoe layer to allow changing the icon for digi legs
// For some reason, suit and uniform already has this funcitonality, but shoes do not.

/mob/living/carbon/human/update_inv_shoes()
	//. = ..()
	remove_layer(SHOES_LAYER)
	remove_layer(SHOES_LAYER_ALT) //Dumb alternate layer for shoes being under the uniform.

	if(!shoes || (wear_suit && wear_suit.flags_inv & HIDESHOES) || (w_uniform && w_uniform.flags_inv & HIDESHOES))
		return //Either nothing to draw, or it'd be hidden.

	for(var/f in list(BP_L_FOOT, BP_R_FOOT))
		var/obj/item/organ/external/foot/foot = get_organ(f)
		if(istype(foot) && foot.is_hidden_by_sprite_accessory()) //If either foot is hidden by the tail, don't render footwear.
			return

	var/obj/item/clothing/shoes/shoe = shoes
	var/shoe_sprite

	if(istype(shoe) && !isnull(shoe.update_icon_define))
		shoe_sprite = shoe.update_icon_define
	else
		shoe_sprite = INV_FEET_DEF_ICON

	//Allow for shoe layer toggle nonsense
	var/shoe_layer = SHOES_LAYER
	if(istype(shoes, /obj/item/clothing/shoes))
		var/obj/item/clothing/shoes/ushoes = shoes
		if(ushoes.shoes_under_pants == 1)
			shoe_layer = SHOES_LAYER_ALT

	//NB: the use of a var for the layer on this one
	overlays_standing[shoe_layer] = shoes.make_worn_icon(body_type = species.get_bodytype(src), slot_name = slot_shoes_str, default_icon = shoe_sprite, default_layer = shoe_layer)

	apply_layer(SHOES_LAYER)
	apply_layer(SHOES_LAYER_ALT)



/mob/living/carbon/human/update_tail_showing()
	. = ..()
	update_vore_tail_sprite()
