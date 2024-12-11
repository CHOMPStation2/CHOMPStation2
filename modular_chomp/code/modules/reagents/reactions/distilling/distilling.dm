//Grub
//Spider
//Carp
//Meteroid
//Deathclaw

/decl/chemical_reaction/distilling/energybooster
	name = "Distilling Energy Booster"
	id = "distill_energybooster"
	result = REAGENT_ID_ENERGYBOOSTER
	required_reagents = list(REAGENT_ID_HYPERZINE = 1, REAGENT_ID_STIMM = 1, REAGENT_ID_SHOCKCHEM = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 180, T0C + 200)

/decl/chemical_reaction/distilling/oceaniccure
	name = "Distilling Oceanic Cure"
	id = "distill_oceaniccure"
	result = REAGENT_ID_OCEANICCURE
	required_reagents = list(REAGENT_ID_CUREA = 1, REAGENT_ID_SOULDEW = 1, REAGENT_ID_CARPOTOXIN = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 130, T0C + 150)

/decl/chemical_reaction/distilling/deathclawmutagen
	name = "Distilling Deathclaw Mutagen"
	id = "distill_deathclawmutagen"
	result = REAGENT_ID_DEATHCLAWMUTAGEN
	required_reagents = list(REAGENT_ID_ARITHRAZINE = 1, REAGENT_ID_MUTAGEN = 1, REAGENT_ID_DEATHBLOOD = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 100, T0C + 120)

/decl/chemical_reaction/distilling/senseenhancer
	name = "Distilling Sense Enhancer"
	id = "distill_senseenhancer"
	result = REAGENT_ID_SENSEENHANCER
	required_reagents = list(REAGENT_ID_QUADCORD = 1, REAGENT_ID_MINDBREAKER = 1, REAGENT_ID_LIQUIDLIFE = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 50, T0C + 70)

/decl/chemical_reaction/distilling/heatnullifer
	name = "Distilling heatnullifer"
	id = "distill_heatnullifer"
	result = REAGENT_ID_HEATNULLIFER
	required_reagents = list(REAGENT_ID_TRAMADOL = 1, REAGENT_ID_LEPORAZINE = 1, REAGENT_ID_SPIDERTOXIN = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 230, T0C + 250)
