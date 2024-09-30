
/*
*
*Sledgehammer
*Mjollnir
*
*/

/obj/item/material/twohanded/sledgehammer  // a SLEGDGEHAMMER
	icon_state = "sledgehammer0"
	base_icon = "sledgehammer"
	name = "sledgehammer"
	desc = "A long, heavy hammer meant to be used with both hands. Typically used for breaking rocks and driving posts, it can also be used for breaking bones or driving points home."
	description_info = "This weapon can cleave, striking nearby lesser, hostile enemies close to the primary target.  It must be held in both hands to do this."
	unwielded_force_divisor = 0.25
	force = 25
	force_divisor = 0.9 // 10/42 with hardness 60 (steel) and 0.25 unwielded divisor
	hitsound = 'sound/weapons/heavysmash.ogg'
	icon = 'icons/obj/hammer_sprites_ch.dmi'
	w_class = ITEMSIZE_HUGE
	slowdown = 1.5
	dulled_divisor = 0.95	//Still metal on a stick
	sharp = 0
	edge = 0
	force_wielded = 23 //A fair bit less than the fireaxe.
	attack_verb = list("attacked", "smashed", "crushed", "wacked", "pounded")
	applies_material_colour = 0

	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_material_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_material_ch.dmi',
		)

/obj/item/material/twohanded/sledgehammer/update_held_icon()
	var/mob/living/M = loc
	if(istype(M) && !issmall(M) && M.item_is_in_hands(src) && !M.hands_are_full())
		wielded = 1
		pry = 1
		force = force_wielded
		name = "[base_name] (wielded)"
		update_icon()
	else
		wielded = 0
		pry = 0
		force = force_unwielded
		name = "[base_name]"
	update_icon()
	..()

/obj/item/material/twohanded/sledgehammer/afterattack(atom/A as mob|obj|turf|area, mob/user as mob, proximity)
	if(!proximity) return
	..()
	if(A && wielded)
		if(istype(A,/obj/structure/window))
			var/obj/structure/window/W = A
			W.shatter()
		else if(istype(A,/obj/structure/grille))
			qdel(A)
		else if(istype(A,/obj/effect/plant))
			var/obj/effect/plant/P = A
			P.die_off()

// This cannot go into afterattack since some mobs delete themselves upon dying.
/obj/item/material/twohanded/sledgehammer/pre_attack(var/mob/living/target, var/mob/living/user)
	if(istype(target))
		cleave(user, target)

/obj/item/material/twohanded/sledgehammer/mjollnir
	icon_state = "mjollnir0"
	base_icon = "mjollnir"
	name = "Mjollnir"
	desc = "A long, heavy hammer. This weapons crackles with barely contained energy."
	force_divisor = 2
	hitsound = 'sound/effects/lightningbolt.ogg'
	force = 50
	throwforce = 15
	force_wielded = 75
	slowdown = 0

/obj/item/material/twohanded/sledgehammer/mjollnir/afterattack(mob/living/G, mob/user)
	..()

	if(wielded)
		if(prob(10))
			G.electrocute_act(500, src, def_zone = BP_TORSO)
			return
		if(prob(10))
			G.dust()
			return
		else
			G.stun_effect_act(10 , 50, BP_TORSO, src)
			G.take_organ_damage(10)
			G.Paralyse(20)
			playsound(src.loc, "sparks", 50, 1)
			return

/obj/item/material/twohanded/sledgehammer/mjollnir/update_icon()  //Currently only here to fuck with the on-mob icons.
	icon_state = "mjollnir[wielded]"
	return

