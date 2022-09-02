// Expand shoe layer to allow changing the icon for digi legs
// For some reason, suit and uniform already has this funcitonality, but shoes do not.

#define SHOES_LAYER_ALT			8		//Shoe-slot item (when set to be under uniform via verb)
#define SHOES_LAYER				11		//Shoe-slot item
#define VORE_BELLY_LAYER		31		//Should be the same that it is in update_icons.dm

/mob/living/carbon/human/update_inv_shoes()
	//. = ..()
	remove_layer(SHOES_LAYER)
	remove_layer(SHOES_LAYER_ALT) //Dumb alternate layer for shoes being under the uniform.

	if(!shoes || (wear_suit && wear_suit.flags_inv & HIDESHOES) || (w_uniform && w_uniform.flags_inv & HIDESHOES))
		return //Either nothing to draw, or it'd be hidden.

	for(var/f in list(BP_L_FOOT, BP_R_FOOT))
		var/obj/item/organ/external/foot/foot = get_organ(f)
		if(istype(foot) && foot.is_hidden_by_tail()) //If either foot is hidden by the tail, don't render footwear.
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

/mob/living/carbon/human/proc/update_vore_belly_sprite()
	if(QDESTROYING(src))
		return

	remove_layer(VORE_BELLY_LAYER)

	var/image/vore_belly_image = get_vore_belly_image()
	if(vore_belly_image)
		vore_belly_image.layer = BODY_LAYER+VORE_BELLY_LAYER
		overlays_standing[VORE_BELLY_LAYER] = vore_belly_image

	apply_layer(VORE_BELLY_LAYER)

/mob/living/carbon/human/proc/get_vore_belly_image()
	if(!(wear_suit && wear_suit.flags_inv & HIDETAIL))
		var/vs_fullness = vore_fullness_ex["stomach"]
		var/icon/vorebelly_s = new/icon(icon = 'icons/mob/vore/Bellies.dmi', icon_state = "[species.vore_belly_default_variant]Belly[vs_fullness][struggle_anim_stomach ? "" : " idle"]")
		vorebelly_s.Blend(rgb(r_skin, g_skin, b_skin), species.color_mult ? ICON_MULTIPLY : ICON_ADD)
		var/image/working = image(vorebelly_s)
		working.overlays += em_block_image_generic(working)
		return working
	return null

/mob/living/carbon/human/proc/vore_belly_animation()
	if(!struggle_anim_stomach)
		struggle_anim_stomach = TRUE
		update_vore_belly_sprite()
		spawn(12)
			struggle_anim_stomach = FALSE
			update_vore_belly_sprite()

/mob/living/carbon/human/proc/update_vore_tail_sprite()
	if(QDESTROYING(src))
		return

	remove_layer(VORE_TAIL_LAYER)

	var/image/vore_tail_image = get_vore_tail_image()
	if(vore_tail_image)
		vore_tail_image.layer = BODY_LAYER+VORE_TAIL_LAYER
		overlays_standing[VORE_TAIL_LAYER] = vore_tail_image

	apply_layer(VORE_TAIL_LAYER)

/mob/living/carbon/human/proc/get_vore_tail_image()
	if(tail_style && istaurtail(tail_style) && tail_style:vore_tail_sprite_variant)
		var/vs_fullness = vore_fullness_ex["taur belly"]
		var/icon/vorebelly_s = new/icon(icon = 'icons/mob/vore/Taur_Bellies.dmi', icon_state = "Taur[tail_style:vore_tail_sprite_variant]-Belly-[vs_fullness][struggle_anim_taur ? "" : " idle"]")
		vorebelly_s.Blend(rgb(src.r_tail, src.g_tail, src.b_tail), tail_style.color_blend_mode)
		var/image/working = image(vorebelly_s)
		working.pixel_x = -16
		if(tail_style.em_block)
			working.overlays += em_block_image_generic(working)
		return working
	return null

/mob/living/carbon/human/proc/vore_tail_animation()
	if(!struggle_anim_taur)
		struggle_anim_taur = TRUE
		update_vore_tail_sprite()
		spawn(12)
			struggle_anim_taur = FALSE
			update_vore_tail_sprite()
