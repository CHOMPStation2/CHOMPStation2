//////////Sleeping Slug Pilot Headgear//////////

/obj/item/clothing/head/pilot_vr/sleeping_slug
	name = "Sleeping Slug pilot helmet"
	desc = "An ITV Sleeping Slug version of the standard pilot helmet. Protects the head from impacts. This one has a retractable visor"
	icon_state = "pilot3"
	item_icons = list(slot_head_str = 'icons/inventory/head/mob_vr.dmi')
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/inventory/head/mob_vr_teshari.dmi'
		)
	action_button_name = "Toggle Visor"

/obj/item/clothing/head/pilot_vr/alt/attack_self(mob/user as mob)
	if(src.icon_state == initial(icon_state))
		src.icon_state = "[icon_state]up"
		to_chat(user, "You raise the visor on the pilot helmet.")
	else
		src.icon_state = initial(icon_state)
		to_chat(user, "You lower the visor on the pilot helmet.")
	update_clothing_icon() //so our mob-overlays update