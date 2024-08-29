/obj/machinery/chemical_dispenser/xenoflora
	name = "xenoflora chem dispenser"
	ui_title = "Xenoflora Chemical Dispenser"
	dispense_reagents = list(
		"water", "sugar", "ethanol", "radium", "ammonia", "diethylamine", "plantbgone", "mutagen", "calcium"
		)

/obj/machinery/chemical_dispenser/xenoflora/full
	spawn_cartridges = list(
			/obj/item/reagent_containers/chem_disp_cartridge/water, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/sugar, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/ethanol, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/radium, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/ammonia, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/diethylamine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/plantbgone, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/mutagen, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/calcium // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/machinery/chemical_dispenser/biochemistry
	name = "bioproduct dispenser"
	ui_title = "Bioproduct Dispenser"
	dispense_reagents = list(
		"nutriment", "protein", "milk"
		)

/obj/machinery/chemical_dispenser/biochemistry/full
	spawn_cartridges = list(
			/obj/item/reagent_containers/chem_disp_cartridge/nutriment, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/protein, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/milk // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/machinery/chemical_dispenser/ert/specialops
	spawn_cartridges = list(
			/obj/item/reagent_containers/chem_disp_cartridge/inaprov, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/dylovene, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/ryetalyn, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/tramadol, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/oxycodone, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/sterilizine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/leporazine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/kelotane, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/dermaline, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/dexalin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/dexalin_p, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/synaptizine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/hyronalin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/arithrazine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/alkysine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/imidazoline, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/peridaxon, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/bicaridine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/hyperzine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/rezadone, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/spaceacillin, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/ethylredox, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/carthatoline, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/corophizine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/myelamine, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/osteodaxon, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/biomass, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/iron, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/nutriment, // CHOMPEdit - Removal of obj/item/weapon
			/obj/item/reagent_containers/chem_disp_cartridge/protein // CHOMPEdit - Removal of obj/item/weapon
		)

/obj/machinery/chemical_dispenser/ert/specialops/abductor
	name = "chemical dispenser"
	icon = 'icons/obj/abductor_vr.dmi'
	icon_state = "dispenser_2way"
	desc = "A mysterious machine which can fabricate many chemicals."