/// Grinds down various objects into their reagent components. Returns true if any reagents were gained from the attempt.
/proc/grind_items_to_reagents(var/list/holdingitems,var/datum/reagents/R)
	var/start_volume = R.total_volume

	for(var/obj/item/O in holdingitems)
		var/remaining_volume = R.maximum_volume - R.total_volume
		if(remaining_volume <= 0)
			break

		//CHOMPedit start
		if(istype(O,/obj/item/stack/material/supermatter))
			var/regrets = 0
			for(var/obj/item/stack/material/supermatter/S in holdingitems)
				regrets += S.get_amount()
			puny_protons(regrets, R.my_atom, holdingitems)
			return
		//CHOMPedit end

		if(GLOB.sheet_reagents[O.type])
			var/obj/item/stack/stack = O
			if(istype(stack))
				var/list/sheet_components = GLOB.sheet_reagents[stack.type]
				// Some stacks can be made into other stacks with a multiplier. This handles that.
				var/remove_amount = stack.reagents_per_sheet()
				var/amount_to_take = max(0,min(stack.get_amount(),round(remaining_volume/remove_amount)))
				if(amount_to_take)
					stack.use(amount_to_take)
					if(QDELETED(stack))
						holdingitems -= stack
					if(islist(sheet_components))
						amount_to_take = (amount_to_take/(sheet_components.len))
						for(var/i in sheet_components)
							R.add_reagent(i, (amount_to_take*remove_amount))
					else
						R.add_reagent(sheet_components, (amount_to_take*remove_amount))
					continue

		else if(GLOB.ore_reagents[O.type])
			var/obj/item/ore/D = O
			if(istype(D))
				var/list/ore_components = GLOB.ore_reagents[D.type]
				if(remaining_volume >= REAGENTS_PER_ORE)
					holdingitems -= D
					qdel(D)
					if(islist(ore_components))
						var/amount_to_take = (REAGENTS_PER_ORE/(ore_components.len))
						for(var/i in ore_components)
							R.add_reagent(i, amount_to_take)
					else
						R.add_reagent(ore_components, REAGENTS_PER_ORE)
					continue

		else if(O.reagents && O.reagents.total_volume > 0)
			O.reagents.trans_to_obj(R.my_atom, min(O.reagents.total_volume, remaining_volume))
			if(O.reagents.total_volume == 0)
				holdingitems -= O
				qdel(O)
			if (R.total_volume >= R.maximum_volume)
				break

		else
			// Cronch
			holdingitems -= O
			qdel(O)

	return (R.total_volume > start_volume)

// CHOMPedit start: Repurposed coffee grinders and supermatter do not mix.
/proc/puny_protons(regrets = 0, var/atom/our_atom, var/list/holdingitems)
	our_atom.set_light(0)
	if(regrets > 0) // If you thought grinding supermatter would end well. Values taken from ex_act() for the supermatter stacks.
		SSradiation.radiate(get_turf(our_atom), 15 + regrets * 4)
		explosion(get_turf(our_atom), round(regrets / 12) , round(regrets / 6), round(regrets / 3), round(regrets / 25))
		qdel(our_atom)
		return

	else // If you added supermatter but didn't try grinding it, or somehow this is negative.
		for(var/obj/item/stack/material/supermatter/S in holdingitems)
			S.loc = our_atom.loc
			holdingitems -= S
			regrets += S.get_amount()
		SSradiation.radiate(get_turf(our_atom), 15 + regrets)
		our_atom.visible_message(span_warning("\The [our_atom] glows brightly, bursting into flames and flashing into ash."),\
		span_warning("You hear an unearthly shriek, burning heat washing over you."))
		new /obj/effect/decal/cleanable/ash(our_atom.loc)
		qdel(our_atom)
// CHOMPedit end
