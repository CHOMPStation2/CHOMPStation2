/obj/item/flame/lighter/supermatter
    name = "Hardlight Supermatter Zippo"	// Base SM Lighter
    desc = "State of the Art Supermatter Lighter."
    description_fluff = "A zippo style lighter with a tiny supermatter sliver held by a hardlight shield. When lighting a cigar, make sure to hover the tip near the sliver, not against it!"
    icon = 'icons/obj/zippo_ch.dmi'
    icon_state = "SMzippo"
    item_state = "SMzippo"
    activation_sound = 'modular_chomp/sound/items/open.ogg'
    deactivation_sound = 'sound/items/zippo_off.ogg'

/obj/item/flame/lighter/supermatter/syndismzippo
    name = "Phoron Supermatter Zippo"		// Syndicate SM Lighter
    desc = "State of the Art Supermatter Lighter."
    description_fluff = "A red zippo style lighter with a tiny supermatter sliver held by a phoron field."
    icon = 'icons/obj/zippo_ch.dmi'
    icon_state = "SyndiSMzippo"
    item_state = "SyndiSMzippo"
    activation_sound = 'modular_chomp/sound/items/open.ogg'
    deactivation_sound = 'sound/items/zippo_off.ogg'

/obj/item/flame/lighter/supermatter/expsmzippo
	name = "Experimental SM Lighter"		// Dangerous WIP (admin/event only ATM)
	desc = "State of the Art Supermatter Lighter"
	description_fluff = "A unique take originating from the zippo design, a shard of supermatter placed within lead-lined walls. Cautious, VERY DANGEROUS do NOT touch!"
	icon = 'icons/obj/zippo_ch.dmi'
	icon_state = "ExpSMzippo"
	item_state = "ExpSMzippo"
	activation_sound = 'modular_chomp/sound/items/button-open.ogg'
	deactivation_sound = 'modular_chomp/sound/items/button-close.ogg'

// safe smzippo
/obj/item/flame/lighter/supermatter/attack_self(mob/living/user)
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
			if(prob(95))
				user.visible_message("<span class='notice'>After a few attempts, [user] manages to excite the supermatter within the [src].</span>")
			else			// Just like the cheap lighter, this time you can shock/burn yourself a little on the hardlight shield
				to_chat(user, "<span class='warning'>You hurt yourself on the shielding!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(1,SEARING,"l_hand")
					user.apply_damage(2,ELECTROCUTE,"l_hand")
					user.apply_damage(3,CLONE,"l_hand")
					user.apply_damage(4,ELECTROMAG,"l_hand")
				else
					user.apply_damage(1,SEARING,"r_hand")
					user.apply_damage(2,ELECTROCUTE,"r_hand")
					user.apply_damage(3,CLONE,"r_hand")
					user.apply_damage(4,ELECTROMAG,"r_hand")
				user.visible_message("<span class='notice'>After a few attempts, [user] manages to activate the [src], they however sting themselves on the shielding!</span>")

		set_light(2)
		START_PROCESSING(SSobj, src)
	else
		lit = 0
		icon_state = "[base_state]"
		item_state = "[base_state]"
		playsound(src, deactivation_sound, 75, 1)
		if(istype(src, /obj/item/flame/lighter/supermatter) )
			user.visible_message("<span class='rose'>You hear a quiet click, as [user] shuts the [src] without even looking at what they're doing.</span>")
		else
			user.visible_message("<span class='notice'>[user] quietly shuts the [src].</span>")

		set_light(0)
		STOP_PROCESSING(SSobj, src)
	return


/obj/item/flame/lighter/supermatter/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
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
			if(istype(src, /obj/item/flame/lighter/supermatter))
				cig.light("<span class='rose'>[user] whips the [name] out and holds it for [M].</span>")
			else
				cig.light("<span class='notice'>[user] holds the [name] out for [M], and lights the [cig.name].</span>")
	else
		..()

/obj/item/flame/lighter/supermatter/process()
	var/turf/location = get_turf(src)
	if(location)
		location.hotspot_expose(700, 5)
	return

// syndicate smzippo
/obj/item/flame/lighter/supermatter/syndismzippo/attack_self(mob/living/user)
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
			if(prob(95))
				user.visible_message("<span class='notice'>After a few attempts, [user] manages to excite the supermatter within the [src].</span>")
			else			// Just like with the cheap lighter, but this time you can hurt yourself on the heated phoron field
				to_chat(user, "<span class='warning'>You singe yourself on the phoron shielding the excited supermatter!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(30,HALLOSS,"l_hand")
					user.apply_effect(20,IRRADIATE)
					user.apply_damage(5,BURN,"l_hand")
					user.apply_damage(5,ELECTROCUTE,"l_hand")
				else
					user.apply_damage(30,HALLOSS,"r_hand")
					user.apply_effect(20,IRRADIATE)
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
		if(istype(src, /obj/item/flame/lighter/supermatter/syndismzippo) )
			user.visible_message("<span class='rose'>You hear a quiet click, as [user] shuts the [src] without even looking at what they're doing.</span>")
		else
			user.visible_message("<span class='notice'>[user] quietly shuts the [src].</span>")

		set_light(0)
		STOP_PROCESSING(SSobj, src)
	return


/obj/item/flame/lighter/supermatter/syndismzippo/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
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
			if(istype(src, /obj/item/flame/lighter/supermatter/syndismzippo))
				cig.light("<span class='rose'>[user] whips the [name] out and holds it for [M].</span>")
			else
				cig.light("<span class='notice'>[user] holds the [name] out for [M], and lights the [cig.name].</span>")
	else
		..()

/obj/item/flame/lighter/process()
	var/turf/location = get_turf(src)
	if(location)
		location.hotspot_expose(700, 5)
	return

// Experimental smzippo
/obj/item/flame/lighter/supermatter/expsmzippo/attack_self(mob/living/user)
	if (!base_state)
		base_state = icon_state
	if (!lit)
		lit = 1
		icon_state = "[base_state]on"
		item_state = "[base_state]on"
		playsound(src, activation_sound, 75, 1)
		var/i = rand(1, 100)
		switch(i)
			if(1 to 22)
				to_chat(user, "<span class='rose'>[user] safely reveals the supermatter shard within the [src]!</span>")
				user.visible_message("<span class='rose'>You safely revealed the supermatter shard within the [src]!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(1, IRRADIATE, "l_hand")
				else			// Even using this safely will irradiate you a tiny tiny bit.
					user.apply_damage(1, IRRADIATE, "r_hand")
			if(23 to 33)
				to_chat(user, "<span class='warning'>[user]'s hand slipped and they brush against the supermatter within [src]!</span>")
				user.visible_message("<span class='notice'>You accidentally grazed your hand across the supermatter!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(10, IRRADIATE, "l_hand")
					user.apply_damage(20, BURN, "l_hand")
					user.apply_damage(20, ELECTROCUTE, "l_hand")
					user.apply_damage(50, AGONY, "l_hand")
				else			// One of the outcomes will burn and shock you, the pain is the worst part of this one though.
					user.apply_damage(10, IRRADIATE, "r_hand")
					user.apply_damage(20, BURN, "r_hand")
					user.apply_damage(20, ELECTROCUTE, "r_hand")
					user.apply_damage(50, AGONY, "r_hand")
			if(34 to 44)
				to_chat(user, "<span class='warning'>[user] burned themselves on the [src]!</span>")
				user.visible_message("<span class='notice'>You accidentally burn yourself on the [src]!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(30, IRRADIATE, "l_hand")
					user.apply_damage(20, SEARING, "l_hand")
					user.apply_damage(15, BURN, "l_hand")
				else			// One of the outcomes is pure burn and radiation.
					user.apply_damage(30, IRRADIATE, "r_hand")
					user.apply_damage(20, SEARING, "r_hand")
					user.apply_damage(15, BURN, "r_hand")
			if(45 to 55)
				to_chat(user, "<span class='warning'>[user] fumbled the [src] and the supermatter let out sparks!</span>")
				user.visible_message("<span class='notice'>You fumble the [src], letting the supermatter spark as the case opens!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(1, ELECTROCUTE, "l_hand")
					user.apply_damage(100, ELECTROMAG, "l_hand")
				else			// This one is mostly dangerous to synthetics and it will EMP you. But otherwise it's safe.
					user.apply_damage(1, ELECTROCUTE, "r_hand")
					user.apply_damage(100, ELECTROMAG, "r_hand")
			if(56 to 66)
				to_chat(user, "<span class='warning'>[user] struggles to open their [src], but when they do they get burned by the extreme heat within!</span>")
				user.visible_message("<span class='notice'>You struggle to get the case to open, and when it does the heat that pours out of the [src] burns!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(1, IRRADIATE, "l_hand")
					user.apply_damage(1, BRUISE, "l_hand")
					user.apply_damage(200, BURN, "l_hand")
					user.drop_l_hand()
				else			// This will INSTA-DUST your hand that you're holding the item in, and then make you drop the lighter.
					user.apply_damage(1, IRRADIATE, "r_hand")
					user.apply_damage(1, BRUISE, "r_hand")
					user.apply_damage(200, BURN, "r_hand")
					user.drop_r_hand()
			if(67 to 77)
				to_chat(user, "<span class='warning'>Ouch! While pushing on the release to open the [src], [user]'s finger slipped right as the case opened, pressing their finger firm against the supermatter!</span>")
				user.visible_message("<span class='notice'>You accidentally pushed your finger against the supermatter!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(50, HALLOSS, "l_hand")
					user.apply_damage(40, IRRADIATE, "l_hand")
					user.apply_damage(30, BURN, "l_hand")
					user.apply_damage(20, TOX, "l_hand")
					user.apply_damage(10, ELECTROCUTE, "l_hand")
					user.apply_effect(25, STUTTER)
					user.apply_effect(15, SLUR)
					user.apply_effect(5, STUN)
				else			// This one is VERY punishing, you get a ton of damage, a lot of pain, and a minor stun. Once the stun goes away you'll be stuttering for awhile as if in crit.
					user.apply_damage(50, HALLOSS, "r_hand")
					user.apply_damage(40, IRRADIATE, "r_hand")
					user.apply_damage(30, BURN, "r_hand")
					user.apply_damage(20, TOX, "r_hand")
					user.apply_damage(10, ELECTROCUTE, "r_hand")
					user.apply_effect(25, STUTTER)
					user.apply_effect(15, SLUR)
					user.apply_effect(5, STUN)
			if(78 to 88)
				to_chat(user, "<span class='notice'>[user] managed to pinch themselves on the case of their [src]... it could have been worse.</span>")
				user.visible_message("<span class='notice'>You manage to pinch yourself on the case!</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(1, CLONE, "l_hand")
					user.apply_damage(1, HALLOSS, "l_hand")
				else			// Aside from the base, this one isn't punishing outside of giving you genetic damage.
					user.apply_damage(1, CLONE, "r_hand")
					user.apply_damage(1, HALLOSS, "r_hand")
			if(89 to 99)
				to_chat(user, "<span class='notice'>[user] opened the [src] but forgot that you aren't supposed to look at supermatter!</span>")
				user.visible_message("<span class='notice'>You find yourself looking at the supermatter for longer than you should...</span>")
				if (user.get_left_hand() == src)
					user.apply_damage(15, HALLOSS, "l_hand")
					user.apply_effect(5, WEAKEN)
					user.apply_damage(15, IRRADIATE, "l_hand")
					user.apply_effect(100, EYE_BLUR)
					user.apply_effect(50, AGONY)
					user.apply_damage(5, OXY)
					user.eye_blurry = 10
				else			// This one just blinds and blurs your screen, but otherwise doesn't actually risk harming you. Even the oxy damage heals on its own.
					user.apply_damage(15, HALLOSS, "r_hand")
					user.apply_effect(5, WEAKEN)
					user.apply_damage(15, IRRADIATE, "l_hand")
					user.apply_effect(100, EYE_BLUR)
					user.apply_effect(50, AGONY)
					user.apply_damage(15, OXY)
					user.eye_blurry = 10
			if(100)				// This is the part that makes it admin only for the moment, it spawns 500 rads from the carbon's position, and dusts the carbon instantly. It does also drop everything unlike the supermatter crystal though, so hopefully you won't lose any items if you fumble this badly!
				to_chat(user, "<span class='warning'>OH NO! [user] almost dropped their live [src]! Thank goodness they caught it... by the glowing yellow crystal... oh.</span>")
				user.visible_message("<span class='danger'>You almost dropped your [src], thank goodness you caught it! By the glowing crystal within. You find your ears filled with unearthly ringing and your last thought is \"Oh, fuck.\"</span>")
				user.drop_r_hand() // To ensure the lighter is dropped <3
				user.drop_l_hand() // To ensure the lighter is dropped <3
				for(var/obj/item/e in user)
					user.drop_from_inventory(e)
				log_and_message_admins("[user] dusted themselves and caused massive radiation with [src]!",user)
				user.dust()
				var/rads = 500
				SSradiation.radiate(src, rads)

		set_light(5)
		START_PROCESSING(SSobj, src)
	else
		lit = 0
		icon_state = "[base_state]"
		item_state = "[base_state]"
		playsound(src, deactivation_sound, 75, 1)
		if (istype(src, /obj/item/flame/lighter/supermatter/expsmzippo))
			user.visible_message("<span class='rose'>You hear a quiet click, as [user] closes the [src].</span>")
		else
			user.visible_message("<span class='notice'>[user] quietly shuts the [src].</span>")

		set_light(0)
		STOP_PROCESSING(SSobj, src)

/obj/item/flame/lighter/supermatter/expsmzippo/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if (!istype(M, /mob))
		return

	if (lit == 1)
		M.IgniteMob()
		add_attack_logs(user, M, "Lit on fire with [src]")

	if (istype(M.wear_mask, /obj/item/clothing/mask/smokable/cigarette) && user.zone_sel.selecting == O_MOUTH && lit)
		var/obj/item/clothing/mask/smokable/cigarette/cig = M.wear_mask
		if (M == user)
			cig.attackby(src, user)
		else
			if (istype(src, /obj/item/flame/lighter/supermatter/expsmzippo))
				cig.light("<span class='rose'>[user] whips the [name] out and holds it for [M].</span>")
			else
				cig.light("<span class='notice'>[user] holds the [name] out for [M], and lights the [cig.name].</span>")
	else
		..()

/obj/item/flame/lighter/supermatter/expsmzippo/process()
	var/turf/location = get_turf(src)
	if (location)
		location.hotspot_expose(700, 5)
	return
