// Don't need a new list for every grinder in the game
var/global/list/sheet_reagents = list( //have a number of reagents divisible by REAGENTS_PER_SHEET (default 20) unless you like decimals.
	/obj/item/stack/material/plastic = list("carbon","carbon","oxygen","chlorine","sulfur"),
	/obj/item/stack/material/copper = list("copper"),
	/obj/item/stack/material/wood = list("carbon","woodpulp","nitrogen","potassium","sodium"),
	/obj/item/stack/material/stick = list("carbon","woodpulp","nitrogen","potassium","sodium"),
	/obj/item/stack/material/log = list("carbon","woodpulp","nitrogen","potassium","sodium"),
	/obj/item/stack/material/algae = list("carbon","nitrogen","nitrogen","phosphorus","phosphorus"),
	/obj/item/stack/material/graphite = list("carbon"),
	/obj/item/stack/material/aluminium = list("aluminum"), // The material is aluminium, but the reagent is aluminum...
	/obj/item/stack/material/glass/reinforced = list("silicon","silicon","silicon","iron","carbon"),
	/obj/item/stack/material/leather = list("carbon","carbon","protein","protein","triglyceride"),
	/obj/item/stack/material/cloth = list("carbon","carbon","carbon","protein","sodium"),
	/obj/item/stack/material/fiber = list("carbon","carbon","carbon","protein","sodium"),
	/obj/item/stack/material/fur = list("carbon","carbon","carbon","sulfur","sodium"),
	/obj/item/stack/material/deuterium = list("hydrogen"),
	/obj/item/stack/material/glass/phoronrglass = list("silicon","silicon","silicon","phoron","phoron"),
	/obj/item/stack/material/diamond = list("carbon"),
	/obj/item/stack/material/durasteel = list("iron","iron","carbon","carbon","platinum"),
	/obj/item/stack/material/wax = list("ethanol","triglyceride"),
	/obj/item/stack/material/iron = list("iron"),
	/obj/item/stack/material/uranium = list("uranium"),
	/obj/item/stack/material/phoron = list("phoron"),
	/obj/item/stack/material/gold = list("gold"),
	/obj/item/stack/material/silver = list("silver"),
	/obj/item/stack/material/platinum = list("platinum"),
	/obj/item/stack/material/mhydrogen = list("hydrogen"),
	/obj/item/stack/material/steel = list("iron", "carbon"),
	/obj/item/stack/material/plasteel = list("iron", "iron", "carbon", "carbon", "platinum"), //8 iron, 8 carbon, 4 platinum,
	/obj/item/stack/material/snow = list("water"),
	/obj/item/stack/material/sandstone = list("silicon", "oxygen"),
	/obj/item/stack/material/glass = list("silicon"),
	/obj/item/stack/material/glass/phoronglass = list("platinum", "silicon", "silicon", "silicon"), //5 platinum, 15 silicon,
	/obj/item/stack/material/supermatter = list("supermatter")
	)
var/global/list/ore_reagents = list( //have a number of reageents divisible by REAGENTS_PER_ORE (default 20) unless you like decimals.
	/obj/item/ore/glass = list("silicon"),
	/obj/item/ore/iron = list("iron"),
	/obj/item/ore/coal = list("carbon"),
	/obj/item/ore/phoron = list("phoron"),
	/obj/item/ore/silver = list("silver"),
	/obj/item/ore/gold = list("gold"),
	/obj/item/ore/marble = list("silicon","aluminum","aluminum","sodium","calcium"), // Some nice variety here
	/obj/item/ore/uranium = list("uranium"),
	/obj/item/ore/diamond = list("carbon"),
	/obj/item/ore/osmium = list("platinum"), // should contain osmium
	/obj/item/ore/lead = list("lead"),
	/obj/item/ore/hydrogen = list("hydrogen"),
	/obj/item/ore/verdantium = list("radium","phoron","nitrogen","phosphorus","sodium"), // Some fun stuff to be useful with
	/obj/item/ore/rutile = list("tungsten","oxygen") // Should be titanium
)

/obj/machinery/reagentgrinder

	name = "All-In-One Grinder"
	desc = "Grinds stuff into itty bitty bits."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "juicer1"
	density = FALSE
	anchored = FALSE
	use_power = USE_POWER_IDLE
	idle_power_usage = 5
	active_power_usage = 100
	circuit = /obj/item/circuitboard/grinder
	var/inuse = 0
	var/obj/item/reagent_containers/beaker = null
	var/limit = 10
	var/list/holdingitems = list()

	var/static/radial_examine = image(icon = 'icons/mob/radial.dmi', icon_state = "radial_examine")
	var/static/radial_eject = image(icon = 'icons/mob/radial.dmi', icon_state = "radial_eject")
	var/static/radial_grind = image(icon = 'icons/mob/radial.dmi', icon_state = "radial_grind")
	// var/static/radial_juice = image(icon = 'icons/mob/radial.dmi', icon_state = "radial_juice")
	// var/static/radial_mix = image(icon = 'icons/mob/radial.dmi', icon_state = "radial_mix")

/obj/machinery/reagentgrinder/Initialize()
	. = ..()
	beaker = new /obj/item/reagent_containers/glass/beaker/large(src)
	default_apply_parts()

/obj/machinery/reagentgrinder/examine(mob/user)
	. = ..()
	if(!in_range(user, src) && !issilicon(user) && !isobserver(user))
		. += span_warning("You're too far away to examine [src]'s contents and display!")
		return

	if(inuse)
		. += span_warning("\The [src] is operating.")
		return

	if(beaker || length(holdingitems))
		. += span_notice("\The [src] contains:")
		if(beaker)
			. += span_notice("- \A [beaker].")
		for(var/obj/item/O as anything in holdingitems)
			. += span_notice("- \A [O.name].")

	if(!(stat & (NOPOWER|BROKEN)))
		. += span_notice("The status display reads:") + "\n"
		if(beaker)
			for(var/datum/reagent/R in beaker.reagents.reagent_list)
				. += span_notice("- [R.volume] units of [R.name].")

/obj/machinery/reagentgrinder/update_icon()
	icon_state = "juicer"+num2text(!isnull(beaker))
	return

/obj/machinery/reagentgrinder/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(beaker)
		if(default_deconstruction_screwdriver(user, O))
			return
		if(default_deconstruction_crowbar(user, O))
			return

	//VOREStation edit start - for solargrubs
	if (istype(O, /obj/item/multitool))
		return ..()
	//VOREStation edit end

	if (istype(O,/obj/item/reagent_containers/glass) || \
		istype(O,/obj/item/reagent_containers/food/drinks/glass2) || \
		istype(O,/obj/item/reagent_containers/food/drinks/shaker))

		if (beaker)
			return 1
		else
			src.beaker =  O
			user.drop_item()
			O.loc = src
			update_icon()
			src.updateUsrDialog()
			return 0

	if(holdingitems && holdingitems.len >= limit)
		to_chat(user, "The machine cannot hold anymore items.")
		return 1

	if(!istype(O))
		return

	if(istype(O,/obj/item/storage/bag/plants))
		var/obj/item/storage/bag/plants/bag = O
		var/failed = 1
		for(var/obj/item/G in O.contents)
			if(!G.reagents || !G.reagents.total_volume)
				continue
			failed = 0
			bag.remove_from_storage(G, src)
			holdingitems += G
			if(holdingitems && holdingitems.len >= limit)
				break

		if(failed)
			to_chat(user, "Nothing in the plant bag is usable.")
			return 1

		if(!O.contents.len)
			to_chat(user, "You empty \the [O] into \the [src].")
		else
			to_chat(user, "You fill \the [src] from \the [O].")

		src.updateUsrDialog()
		return 0

	if(istype(O,/obj/item/gripper))
		var/obj/item/gripper/B = O	//B, for Borg.
		if(!B.wrapped)
			to_chat(user, "\The [B] is not holding anything.")
			return 0
		else
			var/B_held = B.wrapped
			to_chat(user, "You use \the [B] to load \the [src] with \the [B_held].")

		return 0

	if(!global.sheet_reagents[O.type] && !global.ore_reagents[O.type] && (!O.reagents || !O.reagents.total_volume))
		to_chat(user, "\The [O] is not suitable for blending.")
		return 1

	user.remove_from_mob(O)
	O.loc = src
	holdingitems += O
	//CHOMPedit start
	if(istype(O,/obj/item/stack/material/supermatter))
		var/obj/item/stack/material/supermatter/S = O
		set_light(l_range = max(1, S.get_amount()/10), l_power = max(1, S.get_amount()/10), l_color = "#8A8A00")
		addtimer(CALLBACK(src, PROC_REF(puny_protons)), 30 SECONDS)
	//CHOMPedit end
	return 0

/obj/machinery/reagentgrinder/AltClick(mob/user)
	. = ..()
	if(user.incapacitated() || !Adjacent(user))
		return
	replace_beaker(user)

/obj/machinery/reagentgrinder/attack_hand(mob/user as mob)
	interact(user)

/obj/machinery/reagentgrinder/interact(mob/user as mob) // The microwave Menu //I am reasonably certain that this is not a microwave
	if(inuse || user.incapacitated())
		return

	var/list/options = list()

	if(beaker || length(holdingitems))
		options["eject"] = radial_eject

	if(isAI(user))
		if(stat & NOPOWER)
			return
		options["examine"] = radial_examine

	// if there is no power or it's broken, the procs will fail but the buttons will still show
	if(length(holdingitems))
		options["grind"] = radial_grind

	var/choice = show_radial_menu(user, src, options, require_near = !issilicon(user), autopick_single_option = FALSE)

	// post choice verification
	if(inuse || (isAI(user) && stat & NOPOWER) || user.incapacitated())
		return

	switch(choice)
		if("eject")
			eject(user)
		if("grind")
			grind(user)
		if("examine")
			examine(user)

/obj/machinery/reagentgrinder/proc/eject(mob/user)
	if(user.incapacitated())
		return
	for(var/obj/item/O in holdingitems)
		O.loc = src.loc
		holdingitems -= O
	holdingitems.Cut()
	if(beaker)
		replace_beaker(user)

/obj/machinery/reagentgrinder/proc/grind()

	power_change()
	if(stat & (NOPOWER|BROKEN))
		return

	// Sanity check.
	if (!beaker || (beaker && beaker.reagents.total_volume >= beaker.reagents.maximum_volume))
		return

	playsound(src, 'sound/machines/blender.ogg', 50, 1)
	inuse = 1

	// Reset the machine.
	spawn(60)
		inuse = 0

	// Process.
	for (var/obj/item/O in holdingitems)
		//CHOMPedit start
		if(istype(O,/obj/item/stack/material/supermatter))
			var/regrets = 0
			for(var/obj/item/stack/material/supermatter/S in holdingitems)
				regrets += S.get_amount()
			puny_protons(regrets)
			return
		//CHOMPedit end

		var/remaining_volume = beaker.reagents.maximum_volume - beaker.reagents.total_volume
		if(remaining_volume <= 0)
			break

		if(global.sheet_reagents[O.type])
			var/obj/item/stack/stack = O
			if(istype(stack))
				var/list/sheet_components = global.sheet_reagents[stack.type]
				var/amount_to_take = max(0,min(stack.get_amount(),round(remaining_volume/REAGENTS_PER_SHEET)))
				if(amount_to_take)
					stack.use(amount_to_take)
					if(QDELETED(stack))
						holdingitems -= stack
					if(islist(sheet_components))
						amount_to_take = (amount_to_take/(sheet_components.len))
						for(var/i in sheet_components)
							beaker.reagents.add_reagent(i, (amount_to_take*REAGENTS_PER_SHEET))
					else
						beaker.reagents.add_reagent(sheet_components, (amount_to_take*REAGENTS_PER_SHEET))
					continue

		if(global.ore_reagents[O.type])
			var/obj/item/ore/R = O
			if(istype(R))
				var/list/ore_components = global.ore_reagents[R.type]
				if(remaining_volume >= REAGENTS_PER_ORE)
					holdingitems -= R
					qdel(R)
					if(islist(ore_components))
						var/amount_to_take = (REAGENTS_PER_ORE/(ore_components.len))
						for(var/i in ore_components)
							beaker.reagents.add_reagent(i, amount_to_take)
					else
						beaker.reagents.add_reagent(ore_components, REAGENTS_PER_ORE)
					continue

		if(O.reagents)
			O.reagents.trans_to_obj(beaker, min(O.reagents.total_volume, remaining_volume))
			if(O.reagents.total_volume == 0)
				holdingitems -= O
				qdel(O)
			if (beaker.reagents.total_volume >= beaker.reagents.maximum_volume)
				break

/obj/machinery/reagentgrinder/proc/replace_beaker(mob/living/user, obj/item/reagent_containers/new_beaker)
	if(!user)
		return FALSE
	if(beaker)
		if(!user.incapacitated() && Adjacent(user))
			user.put_in_hands(beaker)
		else
			beaker.forceMove(drop_location())
		beaker = null
	if(new_beaker)
		beaker = new_beaker
	update_icon()
	return TRUE

// CHOMPedit start: Repurposed coffee grinders and supermatter do not mix.
/obj/machinery/reagentgrinder/proc/puny_protons(regrets = 0)
	set_light(0)
	if(regrets > 0) // If you thought grinding supermatter would end well. Values taken from ex_act() for the supermatter stacks.
		SSradiation.radiate(get_turf(src), 15 + regrets * 4)
		explosion(get_turf(src), round(regrets / 12) , round(regrets / 6), round(regrets / 3), round(regrets / 25))
		qdel(src)
		return

	else // If you added supermatter but didn't try grinding it, or somehow this is negative.
		for(var/obj/item/stack/material/supermatter/S in holdingitems)
			S.loc = src.loc
			holdingitems -= S
			regrets += S.get_amount()
		SSradiation.radiate(get_turf(src), 15 + regrets)
		visible_message(span_warning("\The [src] glows brightly, bursting into flames and flashing into ash."),\
		span_warning("You hear an unearthly shriek, burning heat washing over you."))
		new /obj/effect/decal/cleanable/ash(src.loc)
		qdel(src)
// CHOMPedit end
