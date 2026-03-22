/obj/item/fuel_assembly/blitz
	name = "blitz rod"
	desc = "A highly unstable mixture of supermatter and phoron. It's probably not a good idea to try to use this in a reactor..."
	fuel_colour = "#FCE300"
	fuel_type = "blitz"

/obj/item/fuel_assembly/blitz/Initialize(mapload)
	. = ..(mapload, "blitz")

/obj/item/fuel_assembly/blitz/unshielded/Initialize(mapload)
	. = ..()
	name = "unshielded blitz rod"
	desc = "An extremely unstable, raw rod of compressed supermatter and phoron. This seems like a terrible idea."
	fuel_colour = "#FCE300"
	fuel_type = "blitzu"
	icon_state = "blank"
	var/image/I = image(icon, "fuel_assembly")
	I.color = "#FCE300"
	overlays += list(I, image(icon, "fuel_assembly_bracket"),image(icon,"glow"))
	rod_quantities[fuel_type] = initial_amount
	radiation_pulse(
		source = src,
		max_range = 5,
		threshold = RAD_EXTREME_INSULATION,
		chance = DEFAULT_RADIATION_CHANCE,
		strength = 20
	)
	set_light(3, 3, "#FCE300")

/obj/item/fuel_assembly/blitz/throw_impact(atom/hit_atom)
	if(!..())
		visible_message(span_warning("\The [src] loses stability and shatters in a violent explosion!"))
		radiation_pulse(
			source = src,
			max_range = 7,
			threshold = RAD_MEDIUM_INSULATION,
			chance = 100,
			strength = 250
		)
		explosion(src.loc, 1, 2, 4, 6)
		qdel(src)

/obj/item/fuel_assembly/blitz/unshielded/attackby(var/obj/item/I, mob/user as mob)
	..()
	var/obj/item/stack/material/lead/M = I
	if(istype(M))
		if(M.get_amount() > 5)
			to_chat(user,span_notice("You add a lead shell to the blitz rod."))
			qdel(src)
			var/obj/item/fuel_assembly/blitz/shielded/rod = new(get_turf(user))
			user.put_in_hands(rod)
			return
		else
			to_chat(user,span_warning("You need at least five sheets of lead to add shielding!"))

/obj/item/fuel_assembly/blitz/unshielded/attack_hand(mob/user)
	. = ..()

	if(!ishuman(user))
		return

	radiation_pulse(
		source = src,
		max_range = 2,
		threshold = RAD_MEDIUM_INSULATION,
		chance = DEFAULT_RADIATION_CHANCE,
		strength = 5
	)

	var/mob/living/carbon/human/H = user
	var/obj/item/clothing/gloves/G = H.gloves
	if(istype(G) && ((G.flags & THICKMATERIAL && prob(70)) || istype(G, /obj/item/clothing/gloves/gauntlets)))
		return

	H.visible_message(span_danger("\The [src] flashes as it scorches [H]'s hand!"))

	if(H.hand)
		H.apply_damage(7, BURN, "l_hand", used_weapon="Blitz Rod")
	else
		H.apply_damage(7, BURN, "r_hand", used_weapon="Blitz Rod")
	H.drop_from_inventory(src, get_turf(H))
	return

/obj/item/fuel_assembly/blitz/shielded
	name = "blitz rod"

/obj/item/fuel_assembly/blitz/shielded/Initialize(mapload)
	. = ..()
	name = "blitz rod"
	desc = "A highly unstable, and highly explosive supermatter and phoron fuel rod with a lead shell, created by someone of questionable sanity. This thing has to violate at least a few intergalactic regulations."
	fuel_colour = "#76888F"
	fuel_type = "blitz"
	icon_state = "blank"
	var/image/I = image(icon, "fuel_assembly")
	I.color = "#76888F"
	overlays += list(I, image(icon, "fuel_assembly_bracket"),image(icon,"glow"))
	rod_quantities[fuel_type] = initial_amount
	set_light(2, 2, "#FCE300")
