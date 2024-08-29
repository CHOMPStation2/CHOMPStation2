/obj/item/fuel_assembly // CHOMPEdit - Removal of obj/item/weapon
	name = "fuel rod assembly"
	icon = 'icons/obj/machines/power/fusion.dmi'
	icon_state = "fuel_assembly"

	var/material_name

	var/percent_depleted = 1
	var/list/rod_quantities = list()
	var/fuel_type = "composite"
	var/fuel_colour
	var/radioactivity = 0
	var/const/initial_amount = 3000000

/obj/item/fuel_assembly/New(var/newloc, var/_material, var/_colour) // CHOMPEdit - Removal of obj/item/weapon
	fuel_type = _material
	fuel_colour = _colour
	..(newloc)

/obj/item/fuel_assembly/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	var/datum/material/material = get_material_by_name(fuel_type)
	if(istype(material))
		name = "[material.use_name] fuel rod assembly"
		desc = "A fuel rod for a fusion reactor. This one is made from [material.use_name]."
		fuel_colour = material.icon_colour
		fuel_type = material.use_name
		if(material.radioactivity)
			radioactivity = material.radioactivity
			desc += " It is warm to the touch."
			START_PROCESSING(SSobj, src)
		if(material.luminescence)
			set_light(material.luminescence, material.luminescence, material.icon_colour)
	else
		name = "[fuel_type] fuel rod assembly"
		desc = "A fuel rod for a fusion reactor. This one is made from [fuel_type]."

	icon_state = "blank"
	var/image/I = image(icon, "fuel_assembly")
	I.color = fuel_colour
	add_overlay(list(I, image(icon, "fuel_assembly_bracket")))
	rod_quantities[fuel_type] = initial_amount

/obj/item/fuel_assembly/process() // CHOMPEdit - Removal of obj/item/weapon
	if(!radioactivity)
		return PROCESS_KILL

	if(istype(loc, /turf))
		SSradiation.radiate(src, max(1,CEILING(radioactivity/30, 1)))

/obj/item/fuel_assembly/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	STOP_PROCESSING(SSobj, src)
	return ..()

// Mapper shorthand.
/obj/item/fuel_assembly/deuterium/New(var/newloc) // CHOMPEdit - Removal of obj/item/weapon
	..(newloc, "deuterium")

/obj/item/fuel_assembly/tritium/New(var/newloc) // CHOMPEdit - Removal of obj/item/weapon
	..(newloc, "tritium")

/obj/item/fuel_assembly/phoron/New(var/newloc) // CHOMPEdit - Removal of obj/item/weapon
	..(newloc, "phoron")

/obj/item/fuel_assembly/supermatter/New(var/newloc) // CHOMPEdit - Removal of obj/item/weapon
	..(newloc, "supermatter")
