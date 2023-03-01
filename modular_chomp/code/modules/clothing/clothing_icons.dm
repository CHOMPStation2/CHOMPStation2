/obj/item/clothing/shoes/apply_blood(var/image/standing)
	if(blood_DNA && blood_sprite_state && ishuman(loc))
		var/mob/living/carbon/human/H = loc
		var/image/bloodsies	= image(icon = H.digitigrade ? 'modular_chomp/icons/mob/human_races/masks/blood_digitigrade.dmi' : H.species.get_blood_mask(H), icon_state = blood_sprite_state)
		bloodsies.color		= blood_color
		standing.add_overlay(bloodsies)
