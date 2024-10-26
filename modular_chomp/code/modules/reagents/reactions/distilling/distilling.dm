//Grub
//Spider
//Carp
//Meteroid
//Deathclaw

/decl/chemical_reaction/distilling/energybooster
	name = "Distilling Energy Booster"
	id = "distill_energybooster"
	result = "energybooster"
	required_reagents = list("hyperzine" = 1, "stimm" = 1, "shockchem" = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 180, T0C + 200)

/decl/chemical_reaction/distilling/oceaniccure
	name = "Distilling Oceanic Cure"
	id = "distill_oceaniccure"
	result = "oceaniccure"
	required_reagents = list("curea" = 1, "souldew" = 1, "carpotoxin" = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 130, T0C + 150)

/decl/chemical_reaction/distilling/deathclawmutagen
	name = "Distilling Deathclaw Mutagen"
	id = "distill_deathclawmutagen"
	result = "deathclawmutagen"
	required_reagents = list("arithrazine" = 1, "mutagen" = 1, "deathblood" = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 100, T0C + 120)

/decl/chemical_reaction/distilling/senseenhancer
	name = "Distilling Sense Enhancer"
	id = "distill_senseenhancer"
	result = "senseenhancer"
	required_reagents = list("quadcord" = 1, "mindbreaker" = 1, "liquidlife" = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 50, T0C + 70)

/decl/chemical_reaction/distilling/heatnullifer
	name = "Distilling heatnullifer"
	id = "distill_heatnullifer"
	result = "heatnullifer"
	required_reagents = list("tramadol" = 1, "leporazine" = 1, "spidertoxin" = 1)
	result_amount = 2

	reaction_rate = HALF_LIFE(10)

	temp_range = list(T0C + 230, T0C + 250)