// Micro Holders - Extends /obj/item/holder // CHOMPEdit - Removal of obj/item/weapon

/obj/item/holder/micro // CHOMPEdit - Removal of obj/item/weapon
	name = "micro"
	desc = "Another crewmember, small enough to fit in your hand."
	icon_state = "blank" //CHOMPEdit
	icon_override = 'icons/inventory/head/mob_vr.dmi'
	slot_flags = SLOT_FEET | SLOT_HEAD | SLOT_ID | SLOT_HOLSTER
	w_class = ITEMSIZE_SMALL
	item_icons = null // No in-hand sprites (for now, anyway, we could totally add some)
	pixel_y = 0		  // Override value from parent.

/obj/item/holder/examine(mob/user) // CHOMPEdit - Removal of obj/item/weapon
	. = list()
	for(var/mob/living/M in contents)
		. += M.examine(user)

/obj/item/holder/MouseDrop(mob/M) // CHOMPEdit - Removal of obj/item/weapon
	..()
	if(M != usr) return
	if(usr == src) return
	if(!Adjacent(usr)) return
	if(isAI(M)) return
	for(var/mob/living/carbon/human/O in contents)
		O.show_inventory_panel(usr, state = GLOB.tgui_deep_inventory_state)

/obj/item/holder/micro/attack_self(mob/living/carbon/user) //reworked so it works w/ nonhumans // CHOMPEdit - Removal of obj/item/weapon
	user.setClickCooldown(user.get_attack_speed())
	for(var/L in contents)
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			H.help_shake_act(user)
		if(isanimal(L))
			var/mob/living/simple_mob/S = L
			user.visible_message("<span class='notice'>[user] [S.response_help] \the [S].</span>")

//Egg features.
/obj/item/holder/attack_hand(mob/living/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(src.loc, /obj/item/storage/vore_egg)) //Don't scoop up the egged mob // CHOMPEdit - Removal of obj/item/weapon
		src.pickup(user)
		user.drop_from_inventory(src)
		return
	..()

/obj/item/holder/container_resist(mob/living/held) // CHOMPEdit - Removal of obj/item/weapon
	if(!istype(src.loc, /obj/item/storage/vore_egg)) // CHOMPEdit - Removal of obj/item/weapon
		..()
	else
		var/obj/item/storage/vore_egg/E = src.loc // CHOMPEdit - Removal of obj/item/weapon
		if(isbelly(E.loc))
			var/obj/belly/B = E.loc
			B.relay_resist(held, E)
			return
		E.hatch(held)
		return
