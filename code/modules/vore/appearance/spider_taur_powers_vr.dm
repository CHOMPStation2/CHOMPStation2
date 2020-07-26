/obj/item/clothing/suit/web_bindings/
	icon = 'icons/vore/custom_clothes_vr.dmi'
	icon_override = 'icons/vore/custom_clothes_vr.dmi'
	name = "web bindings"
	desc = "A webbed cocoon that completely restrains the wearer."
	icon_state = "web_bindings"
	item_state = "web_bindings_mob"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	//yw edit - Teshari sprite
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/vore/custom_onmob_yw.dmi'
		)
	//yw edit end

//yw edit start - Teshari Sprite
/obj/item/clothing/suit/web_bindings/get_worn_icon_file(var/body_type,var/slot_name,var/default_icon,var/inhands)
	if(body_type == SPECIES_TESHARI)
		if(!inhands)
			return 'icons/vore/custom_onmob_yw.dmi'
	return ..()
//yw edit end

/mob/living/proc/weaveWebBindings()
	set name = "Weave Web Bindings"
	set category = "Species Powers"
	if(nutrition >= 30) //This isn't a huge problem. This is so you can bind people up.
		src.visible_message("<span class='notice'>\the [src] pulls silk from their manibles and delicately weaves it into bindings.</span>")
		adjust_nutrition(-30)
		spawn(30) //5 seconds to weave the bindings~
			var/obj/item/clothing/suit/web_bindings/bindings = new() //This sprite is amazing, I must say.
			src.put_in_hands(bindings)
	else
		to_chat(src, "You do not have enough nutrition to create webbing!") //CK~

