/datum/material/resin
	name = "resin"
//	icon_colour = "#353C40" // CHOMPedit: No longer needed
	icon_base = "resin"
	integrity = 50 // CHOMPedit: Same as wood.
	hardness = 15 // CHOMPedit: Same as wood.
	table_icon_base = "stone"
	dooropen_noise = 'sound/effects/attackblob.ogg'
	door_icon_base = "resin"
	icon_reinf = "reinf_mesh"
	melting_point = T0C+300
	sheet_singular_name = "blob"
	sheet_plural_name = "blobs"
	conductive = 0
	explosion_resistance = 60
	radiation_resistance = 10
	stack_origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 2) // CHOMPedit: No longer super powerful for research.
	stack_type = /obj/item/stack/material/resin

/datum/material/resin/can_open_material_door(var/mob/living/user)
	var/mob/living/carbon/M = user
	if(istype(M) && locate(/obj/item/organ/internal/xenos/hivenode) in M.internal_organs)
		return TRUE
	if(istype(M) && locate(/obj/item/organ/internal/xenos/resinspinner/replicant) in M.internal_organs)
		return TRUE
	return FALSE

/datum/material/resin/wall_touch_special(var/turf/simulated/wall/W, var/mob/living/L)
	var/mob/living/carbon/M = L
	if(istype(M) && locate(/obj/item/organ/internal/xenos/hivenode) in M.internal_organs)
		to_chat(M, "\The [W] shudders under your touch, starting to become porous.")
		playsound(W, 'sound/effects/attackblob.ogg', 50, 1)
		if(!do_after(L, 5 SECONDS))
			return FALSE
		playsound(W, 'sound/effects/attackblob.ogg', 100, 1)
		W.dismantle_wall()
		return TRUE
	if(istype(M) && locate(/obj/item/organ/internal/xenos/resinspinner/replicant) in M.internal_organs)
		to_chat(M, "\The [W] shudders under your touch, starting to become porous.")
		playsound(W, 'sound/effects/attackblob.ogg', 50, 1)
		if(!do_after(L, 5 SECONDS))
			return FALSE
		playsound(W, 'sound/effects/attackblob.ogg', 100, 1)
		W.dismantle_wall()
		return TRUE
	return FALSE

/datum/material/resin/generate_recipes()
	recipes = list(
		new /datum/stack_recipe("[display_name] door", /obj/structure/simple_door/resin, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]", pass_stack_color = TRUE), // CHOMPedit: Reduced material cost.
		new /datum/stack_recipe("[display_name] barricade", /obj/structure/alien/wall, 1, time = 5 SECONDS, one_per_turf = 1, on_floor = 1, pass_stack_color = TRUE, recycle_material = "[name]"), // CHOMPedit: Reduced material cost.
		new /datum/stack_recipe("[display_name] nest", /obj/structure/bed/nest, 1, one_per_turf = 1, on_floor = 1, supplied_material = "[name]", pass_stack_color = TRUE), // CHOMPedit: Reduced material cost.
//		new /datum/stack_recipe("[display_name] wall girders", /obj/structure/girder/resin, 1, time = 5 SECONDS, one_per_turf = 1, on_floor = 1, supplied_material = "[name]", pass_stack_color = TRUE), // CHOMPedit: Removed, build walls with secrete resin
		new /datum/stack_recipe("crude [display_name] bandage", /obj/item/stack/medical/crude_pack, 2, time = 2 SECONDS, pass_stack_color = TRUE, recycle_material = "[name]"), // CHOMPedit: Increased material cost.
		new /datum/stack_recipe("[display_name] net", /obj/item/weapon/material/fishing_net, 2, time = 5 SECONDS, supplied_material = "[name]", pass_stack_color = TRUE), // CHOMPedit: Reduced material cost.
		new /datum/stack_recipe("[display_name] membrane", /obj/structure/alien/membrane, 1, time = 2 SECONDS, pass_stack_color = TRUE, recycle_material = "[name]"),
//		new /datum/stack_recipe("[display_name] node", /obj/effect/alien/weeds/node, 1, time = 4 SECONDS, recycle_material = "[name]") // CHOMPedit: No nodes.
	)
