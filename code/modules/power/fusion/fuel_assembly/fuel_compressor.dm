#define FUSION_ROD_SHEET_AMT 15
/obj/machinery/fusion_fuel_compressor
	var/blitzprogress = 0	//CHOMPEdit
	name = "fuel compressor"
	icon = 'icons/obj/machines/power/fusion.dmi'
	icon_state = "fuel_compressor1"
	density = TRUE
	anchored = TRUE

	circuit = /obj/item/circuitboard/fusion_fuel_compressor

/obj/machinery/fusion_fuel_compressor/Initialize(mapload)
	. = ..()
	default_apply_parts()
	verbs -= /obj/machinery/fusion_fuel_compressor/verb/eject_sheet //CHOMPAdd

/obj/machinery/fusion_fuel_compressor/MouseDrop_T(var/atom/movable/target, var/mob/user)
	if(user.incapacitated() || !user.Adjacent(src))
		return
	return do_special_fuel_compression(target, user)

/obj/machinery/fusion_fuel_compressor/proc/do_special_fuel_compression(var/obj/item/thing, var/mob/user)
	if(istype(thing) && thing.reagents && thing.reagents.total_volume && thing.is_open_container())
		if(thing.reagents.reagent_list.len > 1)
			to_chat(user, span_warning("The contents of \the [thing] are impure and cannot be used as fuel."))
			return 1
		if(thing.reagents.total_volume < 300)
			to_chat(user, span_warning("You need at least three hundred units of material to form a fuel rod."))
			return 1
		var/datum/reagent/R = thing.reagents.reagent_list[1]
		visible_message(span_infoplain(span_bold("\The [src]") + " compresses the contents of \the [thing] into a new fuel assembly."))
		var/obj/item/fuel_assembly/F = new(get_turf(src), R.id, R.color)
		thing.reagents.remove_reagent(R.id, R.volume)
		user.put_in_hands(F)

	else if(istype(thing, /obj/machinery/power/supermatter))
		var/obj/item/fuel_assembly/F = new(get_turf(src), MAT_SUPERMATTER)
		visible_message(span_infoplain(span_bold("\The [src]") + " compresses \the [thing] into a new fuel assembly."))
		qdel(thing)
		user.put_in_hands(F)
		return 1
	return 0

/obj/machinery/fusion_fuel_compressor/attackby(var/obj/item/thing, var/mob/user)

	if(default_deconstruction_screwdriver(user, thing))
		return
	if(default_deconstruction_crowbar(user, thing))
		return
	if(default_part_replacement(user, thing))
		return
//CHOMPEdit Begin
	if(istype(thing, /obj/item/stack/material))
		var/obj/item/stack/material/M = thing
		var/datum/material/mat = M.get_material()
		if(!blitzprogress)
			if(!mat.is_fusion_fuel)
				to_chat(user, span_warning("It would be pointless to make a fuel rod out of [mat.use_name]."))
				return
			if(M.get_amount() < FUSION_ROD_SHEET_AMT)
				if(mat.name==MAT_SUPERMATTER)
					visible_message(span_notice("\The [user] places the [mat.use_name] into the compressor."))
					M.use(1)
					blitzprogress = 1
					verbs |= /obj/machinery/fusion_fuel_compressor/verb/eject_sheet
					return
				to_chat(user, span_warning("You need at least 25 [mat.sheet_plural_name] to make a fuel rod."))
				return
			var/obj/item/fuel_assembly/F = new(get_turf(src), mat.name)
			visible_message(span_infoplain(span_bold("\The [src]") + " compresses \the [thing] into a new fuel assembly."))
			M.use(FUSION_ROD_SHEET_AMT)
			user.put_in_hands(F)
		else
			if(mat.name==MAT_PHORON)
				if(M.get_amount() < 25)
					to_chat(user, span_warning("You need at least 25 phoron sheets to make a blitz rod!"))
					return
				var/obj/item/fuel_assembly/blitz/unshielded/F = new(get_turf(src))
				visible_message(span_notice("\The [src] compresses the supermatter and phoron into a new blitz rod! It looks unstable, maybe you should be careful with it."))
				M.use(25)
				user.put_in_hands(F)
				blitzprogress = 0
				verbs -= /obj/machinery/fusion_fuel_compressor/verb/eject_sheet
			else
				to_chat(user, span_warning("A blitz rod is currently in progress! Either add 25 phoron sheets to complete it, or eject the supermatter sheet!"))
				return

	else if(do_special_fuel_compression(thing, user))
		return

	return ..()

/obj/machinery/fusion_fuel_compressor/verb/eject_sheet()
	set name = "Eject Supermatter Sheet"
	set category = "Object"
	set src in view(1)

	if(blitzprogress)
		new/obj/item/stack/material/supermatter(get_turf(src))
		blitzprogress = 0
	verbs -= /obj/machinery/fusion_fuel_compressor/verb/eject_sheet
//CHOMPEdit End

#undef FUSION_ROD_SHEET_AMT
