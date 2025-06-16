// Procs to allow tiles to have material variables, consider unifying this on stack parent?
// Uncertain if any of these procs can result in unforseen issues with tile objects, if there are bugs with tiles check if any of these procs are the cause

//^Does the bug this comment refers to even exist anymore. idk.

/obj/item/stack/tile/Initialize(mapload)
	. = ..()

	if(!default_type)
		default_type = DEFAULT_WALL_MATERIAL
	material = get_material_by_name("[default_type]")
	if(!material)
		return INITIALIZE_HINT_QDEL

	//recipes = material.get_recipes()	No.
	stacktype = material.stack_type
	if(islist(material.stack_origin_tech))
		origin_tech = material.stack_origin_tech.Copy()

	if(apply_colour)
		color = material.icon_colour

	if(!material.conductive)
		flags |= NOCONDUCT

	//matter = material.get_matter()	Bad.


/obj/item/stack/material/get_material()
	return material

/*
 * Carpets
 */
/obj/item/stack/tile/carpet
	name = "red carpet"
	singular_name = "red carpet"
	desc = "A piece of red carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-carpet"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0
	no_variants = FALSE
	default_type = MAT_CARPET

/obj/item/stack/tile/carpet/teal
	name = "teal carpet"
	singular_name = "teal carpet"
	desc = "A piece of teal carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-tealcarpet"
	default_type = MAT_CARPET_TEAL

/obj/item/stack/tile/carpet/bcarpet
	name = "black carpet"
	singular_name = "black carpet"
	desc = "A piece of black carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-carpet"
	default_type = MAT_CARPET_BLACK

/obj/item/stack/tile/carpet/blucarpet
	name = "blue carpet"
	singular_name = "blue carpet"
	desc = "A piece of blue carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-carpet"
	default_type = MAT_CARPET_BLUE

/obj/item/stack/tile/carpet/turcarpet
	name = "turquoise carpet"
	singular_name = "turquoise carpet"
	desc = "A piece of turquoise carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-carpet"
	default_type = MAT_CARPET_TURQUOISE

/obj/item/stack/tile/carpet/sblucarpet
	name = "silver blue carpet"
	singular_name = "silver blue carpet"
	desc = "A piece of silver blue carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-carpet"
	default_type = MAT_CARPET_SILVERBLUE

/obj/item/stack/tile/carpet/gaycarpet
	name = "clown carpet"
	singular_name = "clown carpet"
	desc = "A piece of clown carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-carpet"
	default_type = MAT_CARPET_PINK

/obj/item/stack/tile/carpet/purcarpet
	name = "purple carpet"
	singular_name = "purple carpet"
	desc = "A piece of purple carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-carpet"
	default_type = MAT_CARPET_PURPLE

/obj/item/stack/tile/carpet/oracarpet
	name = "orange carpet"
	singular_name = "orange carpet"
	desc = "A piece of orange carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-carpet"
	default_type = MAT_CARPET_ORANGE

/obj/item/stack/tile/carpet/brncarpet
	icon_state = "tile-carpet"

/obj/item/stack/tile/carpet/blucarpet2
	icon_state = "tile-carpet"

/obj/item/stack/tile/carpet/greencarpet
	icon_state = "tile-carpet"

/obj/item/stack/tile/carpet/purplecarpet
	icon_state = "tile-carpet"

/obj/item/stack/tile/carpet/geo
	icon_state = "tile-carpet-deco"
	desc = "A piece of carpet with a gnarly geometric design. It is the same size as a normal floor tile!"

/obj/item/stack/tile/carpet/retro
	icon_state = "tile-carpet-retro"
	desc = "A piece of carpet with totally wicked blue space patterns. It is the same size as a normal floor tile!"

/obj/item/stack/tile/carpet/retro_red
	icon_state = "tile-carpet-retro-red"
	desc = "A piece of carpet with red-ical space patterns. It is the same size as a normal floor tile!"

/obj/item/stack/tile/carpet/happy
	icon_state = "tile-carpet-happy"
	desc = "A piece of carpet with happy patterns. It is the same size as a normal floor tile!"
