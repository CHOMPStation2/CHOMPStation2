/obj/item/weapon/flame/lighter/safesmzippo
    name = "Supermatter Zippo"
    desc = "State of the Art Supermatter Lighter."
    description_fluff = "A zippo style lighter with a tiny supermatter sliver held by a hardlight shield. When lighting a cigar, make sure to hover the tip near the sliver, not against it!"
    icon = 'icons/obj/zippo_ch.dmi'
    icon_state = "SMzippo"
    item_state = "SMzippo"
    activation_sound = 'modular_chomp/sound/items/open.ogg'
    deactivation_sound = 'sound/items/zippo_off.ogg'

/obj/item/weapon/flame/lighter/syndismzippo
    name = "Syndicate SM Zippo"
    desc = "State of the Art Supermatter Lighter."
    description_fluff = "A red zippo style lighter with a tiny supermatter sliver held by a phoron field."
    icon = 'icons/obj/zippo_ch.dmi'
    icon_state = "SyndiSMzippo"
    item_state = "SyndiSMzippo"
    activation_sound = 'modular_chomp/sound/items/open.ogg'
    deactivation_sound = 'sound/items/zippo_off.ogg'

// safe smzippo
/obj/item/weapon/flame/lighter/safesmzippo/attack_self(mob/living/user)
	if(!base_state)
		base_state = icon_state
	if(!lit)
		lit = 1
		icon_state = "[base_state]on"
		item_state = "[base_state]on"
		playsound(src, activation_sound, 75, 1)
		if(prob(50))
			user.visible_message("<span class='rose'>[user] safely activates the [src] with a push of a button!</span>")
		else
			if(prob(50))
				user.visible_message("<span class='notice'>After a few attempts, [user] manages to excite the supermatter within the [src].</span>")
			else
				to_chat(user, "<span class='warning'>You hurt yourself on the shielding!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(1,SEARING,"l_hand")
					user.apply_damage(2,ELECTROCUTE,"l_hand")
					user.apply_damage(3,CLONE,"l_hand")
					user.apply_damage(4,ELECTROMAG,"l_hand")
				else
					user.apply_damage(1,SEARING,"l_hand")
					user.apply_damage(2,ELECTROCUTE,"r_hand")
					user.apply_damage(3,CLONE,"r_hand")
					user.apply_damage(4,ELECTROMAG,"l_hand")
				user.visible_message("<span class='notice'>After a few attempts, [user] manages to activate the [src], they however sting themselves on the shielding!</span>")

		set_light(2)
		START_PROCESSING(SSobj, src)
	else
		lit = 0
		icon_state = "[base_state]"
		item_state = "[base_state]"
		playsound(src, deactivation_sound, 75, 1)
		if(istype(src, /obj/item/weapon/flame/lighter/safesmzippo) )
			user.visible_message("<span class='rose'>You hear a quiet click, as [user] shuts the [src] without even looking at what they're doing.</span>")
		else
			user.visible_message("<span class='notice'>[user] quietly shuts the [src].</span>")

		set_light(0)
		STOP_PROCESSING(SSobj, src)
	return


/obj/item/weapon/flame/lighter/safesmzippo/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return

	if(lit == 1)
		M.IgniteMob()
		add_attack_logs(user,M,"Lit on fire with [src]")

	if(istype(M.wear_mask, /obj/item/clothing/mask/smokable/cigarette) && user.zone_sel.selecting == O_MOUTH && lit)
		var/obj/item/clothing/mask/smokable/cigarette/cig = M.wear_mask
		if(M == user)
			cig.attackby(src, user)
		else
			if(istype(src, /obj/item/weapon/flame/lighter/zippo))
				cig.light("<span class='rose'>[user] whips the [name] out and holds it for [M].</span>")
			else
				cig.light("<span class='notice'>[user] holds the [name] out for [M], and lights the [cig.name].</span>")
	else
		..()

/obj/item/weapon/flame/lighter/safesmzippo/process()
	var/turf/location = get_turf(src)
	if(location)
		location.hotspot_expose(700, 5)
	return

// syndicate smzippo
/obj/item/weapon/flame/lighter/syndismzippo/attack_self(mob/living/user)
	if(!base_state)
		base_state = icon_state
	if(!lit)
		lit = 1
		icon_state = "[base_state]on"
		item_state = "[base_state]on"
		playsound(src, activation_sound, 75, 1)
		if(prob(50))
			user.visible_message("<span class='rose'>[user] safely activates the [src] with a push of a button!</span>")
		else
			if(prob(50))
				user.visible_message("<span class='notice'>After a few attempts, [user] manages to excite the supermatter within the [src].</span>")
			else
				to_chat(user, "<span class='warning'>You singe yourself on the phoron shielding the excited supermatter!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(30,HALLOSS,"l_hand")
					user.apply_damage(20,CLONE,"l_hand")
					user.apply_damage(5,BURN,"l_hand")
					user.apply_damage(5,ELECTROCUTE,"l_hand")
				else
					user.apply_damage(30,HALLOSS,"r_hand")
					user.apply_damage(20,CLONE,"r_hand")
					user.apply_damage(5,BURN,"r_hand")
					user.apply_damage(5,ELECTROCUTE,"r_hand")
				user.visible_message("<span class='notice'>After a few attempts, [user] manages to activate the [src], they however burn themselves with the heated phoron field!</span>")

		set_light(2)
		START_PROCESSING(SSobj, src)
	else
		lit = 0
		icon_state = "[base_state]"
		item_state = "[base_state]"
		playsound(src, deactivation_sound, 75, 1)
		if(istype(src, /obj/item/weapon/flame/lighter/syndismzippo) )
			user.visible_message("<span class='rose'>You hear a quiet click, as [user] shuts the [src] without even looking at what they're doing.</span>")
		else
			user.visible_message("<span class='notice'>[user] quietly shuts the [src].</span>")

		set_light(0)
		STOP_PROCESSING(SSobj, src)
	return


/obj/item/weapon/flame/lighter/syndismzippo/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return

	if(lit == 1)
		M.IgniteMob()
		add_attack_logs(user,M,"Lit on fire with [src]")

	if(istype(M.wear_mask, /obj/item/clothing/mask/smokable/cigarette) && user.zone_sel.selecting == O_MOUTH && lit)
		var/obj/item/clothing/mask/smokable/cigarette/cig = M.wear_mask
		if(M == user)
			cig.attackby(src, user)
		else
			if(istype(src, /obj/item/weapon/flame/lighter/syndismzippo))
				cig.light("<span class='rose'>[user] whips the [name] out and holds it for [M].</span>")
			else
				cig.light("<span class='notice'>[user] holds the [name] out for [M], and lights the [cig.name].</span>")
	else
		..()

/obj/item/weapon/flame/lighter/process()
	var/turf/location = get_turf(src)
	if(location)
		location.hotspot_expose(700, 5)
	return
