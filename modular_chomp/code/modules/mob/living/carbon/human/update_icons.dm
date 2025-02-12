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

/mob/living/carbon/human/proc/GetAppearanceFromPrefs(var/flavourtext, var/oocnotes)
	/* Jank code that effectively creates the client's mob from save, then copies its appearance to our current mob.
	Intended to be used with shapeshifter species so we don't reset their organs in doing so.*/
	if(client.prefs)
		var/mob/living/carbon/human/dummy/mannequin/Dummy = get_mannequin(client.ckey)
		client.prefs.copy_to(Dummy)
		//Important, since some sprites only work for specific species
		/*	Probably not needed anymore since impersonate_bodytype no longer exists
		if(Dummy.species.base_species == "Promethean")
			impersonate_bodytype = "Human"
		else
			impersonate_bodytype = Dummy.species.base_species
		*/
		custom_species = Dummy.custom_species
		var/list/traits = dna.species_traits.Copy()
		dna = Dummy.dna.Clone()
		dna.species_traits.Cut()
		dna.species_traits = traits.Copy()
		UpdateAppearance()
		icon = Dummy.icon
		if(flavourtext)
			flavor_texts = client.prefs.flavor_texts.Copy()
		if(oocnotes)
			ooc_notes = client.prefs.read_preference(/datum/preference/text/living/ooc_notes)
			ooc_notes_likes = client.prefs.read_preference(/datum/preference/text/living/ooc_notes_likes)
			ooc_notes_dislikes = client.prefs.read_preference(/datum/preference/text/living/ooc_notes_dislikes)
			ooc_notes_favs = read_preference(/datum/preference/text/living/ooc_notes_favs)
			ooc_notes_maybes = read_preference(/datum/preference/text/living/ooc_notes_maybes)
			ooc_notes_style = read_preference(/datum/preference/toggle/living/ooc_notes_style)

/*	Alternative version of the above proc, incase it turns out cloning our dummy mob's DNA is an awful, terrible bad idea.
Would need to fix this proc up to work as smoothly as the above proc, though.
/mob/living/carbon/human/proc/GetAppearanceFromPrefs()
	/* Jank code that effectively creates the client's mob from save, then copies its appearance to our current mob.
	Intended to be used with shapeshifter species so we don't reset their organs in doing so.*/
	var/mob/living/carbon/human/dummy/mannequin/Dummy = new
	if(client.prefs)
		client.prefs.copy_to(Dummy)
		//Important, since some sprites only work for specific species
		if(Dummy.species.base_species == "Promethean")
			impersonate_bodytype = "Human"
		else
			impersonate_bodytype = Dummy.species.base_species
		custom_species = Dummy.custom_species
		for(var/tag in Dummy.dna.body_markings)
			var/obj/item/organ/external/E = organs_by_name[tag]
			if(E)
				E.markings.Cut()
				var/list/marklist = Dummy.dna.body_markings[tag]
				E.markings = marklist.Copy()
		UpdateAppearance(Dummy.dna.UI.Copy())
		icon = Dummy.icon
	qdel(Dummy)
*/

/mob/living/carbon/human/update_tail_showing()
	. = ..()
	update_vore_tail_sprite()
