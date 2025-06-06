/obj/item/clothing/shoes/apply_blood(var/image/standing)
	if(forensic_data?.has_blooddna() && blood_sprite_state && ishuman(loc))
		var/mob/living/carbon/human/H = loc
		var/image/bloodsies	= image(icon = H.digitigrade ? 'icons/mob/human_races/masks/blood_digitigrade.dmi' : H.species.get_blood_mask(H), icon_state = blood_sprite_state)
		bloodsies.color		= blood_color
		standing.add_overlay(bloodsies)
