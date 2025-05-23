GLOBAL_DATUM_INIT(gas_data, /datum/xgm_gas_data, new())

/datum/xgm_gas_data
	//Simple list of all the gas IDs.
	var/list/gases = list()
	//The friendly, human-readable name for the gas.
	var/list/name = list()
	//Specific heat of the gas.  Used for calculating heat capacity.
	var/list/specific_heat = list()
	//Molar mass of the gas.  Used for calculating specific entropy.
	var/list/molar_mass = list()
	//Tile overlays.  /images, created from references to 'icons/effects/tile_effects.dmi'
	var/list/tile_overlay = list()
	//Overlay limits.  There must be at least this many moles for the overlay to appear.
	var/list/overlay_limit = list()
	//Flags.
	var/list/flags = list()

/datum/xgm_gas_data/New()
	. = ..()
	for(var/p in subtypesof(/decl/xgm_gas))
		var/decl/xgm_gas/gas = new p //avoid initial() because of potential New() actions

		if(gas.id in gases)
			error("Duplicate gas id `[gas.id]` in `[p]`")

		gases += gas.id
		name[gas.id] = gas.name
		specific_heat[gas.id] = gas.specific_heat
		molar_mass[gas.id] = gas.molar_mass
		if(gas.tile_overlay)
			var/atom/movable/gas_visuals/GV = new(null)
			GV.icon_state = gas.tile_overlay
			tile_overlay[gas.id] = GV
		if(gas.overlay_limit)
			overlay_limit[gas.id] = gas.overlay_limit
		flags[gas.id] = gas.flags

	return 1

/decl/xgm_gas
	var/id = ""
	var/name = "Unnamed Gas"
	var/specific_heat = 20	// J/(mol*K)
	var/molar_mass = 0.032	// kg/mol

	var/tile_overlay = null
	var/overlay_limit = null

	var/flags = 0

<<<<<<< HEAD
/hook/startup/proc/generateGasData()
	gas_data = new
	for(var/p in subtypesof(/decl/xgm_gas))
		var/decl/xgm_gas/gas = new p //avoid initial() because of potential New() actions

		if(gas.id in gas_data.gases)
			error("Duplicate gas id `[gas.id]` in `[p]`")

		gas_data.gases += gas.id
		gas_data.name[gas.id] = gas.name
		gas_data.specific_heat[gas.id] = gas.specific_heat
		gas_data.molar_mass[gas.id] = gas.molar_mass
		if(gas.tile_overlay)
			gas_data.tile_overlay[gas.id] = gas.tile_overlay // CHOMPEdit
		if(gas.overlay_limit)
			gas_data.overlay_limit[gas.id] = gas.overlay_limit
		gas_data.flags[gas.id] = gas.flags

	return 1

// CHOMPEdit Start
/obj/effect/gas_overlay
	name = "gas"
	desc = "You shouldn't be clicking this."
=======
/atom/movable/gas_visuals
>>>>>>> 959b1728d9 (Fix gas overlays (#17735))
	icon = 'icons/effects/tile_effects.dmi'
	icon_state = "generic"
	layer = GASFIRE_LAYER
	appearance_flags = PIXEL_SCALE | RESET_COLOR
	mouse_opacity = 0
<<<<<<< HEAD
	var/gas_id

/obj/effect/gas_overlay/Initialize(mapload, gas)
	. = ..()
	gas_id = gas
	if(gas_data.tile_overlay[gas_id])
		icon_state = gas_data.tile_overlay[gas_id]
// CHOMPEdit End
=======
	plane = ABOVE_MOB_PLANE
>>>>>>> 959b1728d9 (Fix gas overlays (#17735))
