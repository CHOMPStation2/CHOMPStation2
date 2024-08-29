//
// This is for custom circuits, mostly the initialization of global properties about them.
// Might make this also process them in the future if its better to do that than using the obj ticker.
//
SUBSYSTEM_DEF(circuit)
	name = "Circuit"
	init_order = INIT_ORDER_CIRCUIT
	flags = SS_NO_FIRE
	var/list/all_components = list()								// Associative list of [component_name]:[component_path] pairs
	var/list/cached_components = list()								// Associative list of [component_path]:[component] pairs
	var/list/all_assemblies = list()								// Associative list of [assembly_name]:[assembly_path] pairs
	var/list/cached_assemblies = list()								// Associative list of [assembly_path]:[assembly] pairs
	var/list/all_circuits = list()									// Associative list of [circuit_name]:[circuit_path] pairs
	var/list/circuit_fabricator_recipe_list = list()				// Associative list of [category_name]:[list_of_circuit_paths] pairs
//	var/cost_multiplier = MINERAL_MATERIAL_AMOUNT / 10 // Each circuit cost unit is 200cm3

/datum/controller/subsystem/circuit/Recover()
	flags |= SS_NO_INIT // Make extra sure we don't initialize twice.

/datum/controller/subsystem/circuit/Initialize() // CHOMPEdit
	circuits_init()
	return SS_INIT_SUCCESS // CHOMPEdit

/datum/controller/subsystem/circuit/proc/circuits_init()
	//Cached lists for free performance
	for(var/obj/item/integrated_circuit/IC as anything in typesof(/obj/item/integrated_circuit))
		var/path = IC
		all_components[initial(IC.name)] = path // Populating the component lists
		cached_components[path] = new path

		if(!(initial(IC.spawn_flags) & (IC_SPAWN_DEFAULT | IC_SPAWN_RESEARCH)))
			continue

		var/category = initial(IC.category_text)
		if(!circuit_fabricator_recipe_list[category])
			circuit_fabricator_recipe_list[category] = list()
		var/list/category_list = circuit_fabricator_recipe_list[category]
		category_list += IC // Populating the fabricator categories

	for(var/obj/item/electronic_assembly/A as anything in typesof(/obj/item/electronic_assembly)) // CHOMPEdit - Removal of obj/item/device
		var/path = A
		all_assemblies[initial(A.name)] = path
		cached_assemblies[path] = new path


	circuit_fabricator_recipe_list["Assemblies"] = list(
		/obj/item/electronic_assembly/default, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/calc, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/clam, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/simple, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/hook, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/pda, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/tiny/default, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/tiny/cylinder, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/tiny/scanner, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/tiny/hook, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/tiny/box, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/medium/default, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/medium/box, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/medium/clam, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/medium/medical, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/medium/gun, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/medium/radio, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/large/default, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/large/scope, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/large/terminal, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/large/arm, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/large/tall, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/large/industrial, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/drone/default, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/drone/arms, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/drone/secbot, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/drone/medbot, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/drone/genbot, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/drone/android, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/wallmount/tiny, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/wallmount/light, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/wallmount, // CHOMPEdit - Removal of obj/item/device
		/obj/item/electronic_assembly/wallmount/heavy, // CHOMPEdit - Removal of obj/item/device
		/obj/item/implant/integrated_circuit, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/under/circuitry,
		/obj/item/clothing/gloves/circuitry,
		/obj/item/clothing/glasses/circuitry,
		/obj/item/clothing/shoes/circuitry,
		/obj/item/clothing/head/circuitry,
		/obj/item/clothing/ears/circuitry,
		/obj/item/clothing/suit/circuitry
		)

	circuit_fabricator_recipe_list["Tools"] = list(
		/obj/item/integrated_electronics/wirer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/integrated_electronics/debugger, // CHOMPEdit - Removal of obj/item/device
		/obj/item/integrated_electronics/detailer // CHOMPEdit - Removal of obj/item/device
		)
