//Chemist update
/decl/chemical_reaction/instant/livingagent
	name = REAGENT_LIVINGAGENT
	id = REAGENT_ID_LIVINGAGENT
	result = REAGENT_ID_LIVINGAGENT
	required_reagents = list(REAGENT_ID_TRICORDRAZINE = 1, REAGENT_ID_LIQUIDLIFE = 1, REAGENT_ID_SUGAR = 1)
	result_amount = 2

/decl/chemical_reaction/instant/performancepeaker
	name = REAGENT_PERFORMANCEPEAKER
	id = REAGENT_ID_PERFORMANCEPEAKER
	result = REAGENT_ID_PERFORMANCEPEAKER
	required_reagents = list(REAGENT_ID_HYPERZINE = 1, REAGENT_ID_LIQUIDLIFE = 1, REAGENT_ID_INAPROVALINE = 1)
	result_amount = 2

/decl/chemical_reaction/instant/burncard
	name = "Burning Bicard"
	id = REAGENT_ID_BURNCARD
	result = REAGENT_ID_BURNCARD
	required_reagents = list(REAGENT_ID_LIQUIDFIRE = 1, REAGENT_ID_BICARIDINE = 1, REAGENT_ID_OXYGEN = 1)
	result_amount = 2

/decl/chemical_reaction/instant/flamecure
	name = REAGENT_FLAMECURE
	id = REAGENT_ID_FLAMECURE
	result = REAGENT_ID_FLAMECURE
	required_reagents = list(REAGENT_ID_LIQUIDFIRE = 1, REAGENT_ID_MYELAMINE = 1, REAGENT_ID_KELOTANE = 1)
	result_amount = 2

/decl/chemical_reaction/instant/neotane
	name = REAGENT_NEOTANE
	id = REAGENT_ID_NEOTANE
	result = REAGENT_ID_NEOTANE
	required_reagents = list(REAGENT_ID_NEOLIQUIDFIRE = 1, REAGENT_ID_KELOTANE = 1, REAGENT_ID_IRON = 1)
	result_amount = 2

/decl/chemical_reaction/instant/bloodsealer
	name = REAGENT_BLOODSEALER
	id = REAGENT_ID_BLOODSEALER
	result = REAGENT_ID_BLOODSEALER
	required_reagents = list(REAGENT_ID_NEOLIQUIDFIRE = 1, REAGENT_ID_GLUCOSE = 1, REAGENT_ID_HYDROGEN = 1)
	result_amount = 2

/decl/chemical_reaction/instant/purifyingagent
	name = REAGENT_PURIFYINGAGENT
	id = REAGENT_ID_PURIFYINGAGENT
	result = REAGENT_ID_PURIFYINGAGENT
	required_reagents = list(REAGENT_ID_DEATHBLOOD = 1, REAGENT_ID_CARTHATOLINE = 1, REAGENT_ID_HYRONALIN = 1)
	result_amount = 2

/decl/chemical_reaction/instant/cleansingagent
	name = REAGENT_CLEANSINGAGENT
	id = REAGENT_ID_CLEANSINGAGENT
	result = REAGENT_ID_CLEANSINGAGENT
	required_reagents = list(REAGENT_ID_DEATHBLOOD = 1, REAGENT_ID_HYRONALIN = 1, REAGENT_ID_ANTITOXIN = 1)
	result_amount = 2

//tier 1
/decl/chemical_reaction/instant/souldew
	name = REAGENT_ID_SOULDEW
	id = REAGENT_ID_SOULDEW
	result = REAGENT_ID_SOULDEW
	required_reagents = list(REAGENT_ID_ALKYSINE = 1, REAGENT_ID_TRICORDRAZINE = 1, REAGENT_ID_SULFUR = 1)
	result_amount = 3

/decl/chemical_reaction/instant/quadcord
	name = REAGENT_QUADCORD
	id = REAGENT_ID_QUADCORD
	result = REAGENT_ID_QUADCORD
	required_reagents = list(REAGENT_ID_TRICORDRAZINE = 1, REAGENT_ID_PHORON = 1, REAGENT_ID_SACID = 1)
	result_amount = 3

//tier 2
/decl/chemical_reaction/instant/juggernog
	name = REAGENT_JUGGERNOG
	id = REAGENT_ID_JUGGERNOG
	result = REAGENT_ID_JUGGERNOG
	required_reagents = list(REAGENT_ID_PARACETAMOL = 1, REAGENT_ID_TRAMADOL = 1, REAGENT_ID_SYNAPTIZINE = 1, REAGENT_ID_MERCURY = 1)
	result_amount = 4

/decl/chemical_reaction/instant/curea
	name = REAGENT_CUREA
	id = REAGENT_ID_CUREA
	result = REAGENT_ID_CUREA
	required_reagents = list(REAGENT_ID_SPACEACILLIN = 1, REAGENT_ID_ADRANOL = 1, REAGENT_ID_INAPROVALINE = 1, REAGENT_ID_IRON = 1)
	result_amount = 4

//tier 3
/decl/chemical_reaction/instant/liquidhealer
	name = REAGENT_LIQUIDHEALER
	id = REAGENT_ID_LIQUIDHEALER
	result = REAGENT_ID_LIQUIDHEALER
	required_reagents = list(REAGENT_ID_BICARIDINE = 1, REAGENT_ID_KELOTANE = 1, REAGENT_ID_LIQUIDLIFE = 1, REAGENT_ID_CARPOTOXIN = 1, REAGENT_ID_QUADCORD = 1, REAGENT_ID_CRYPTOBIOLIN = 1)
	result_amount = 6

/decl/chemical_reaction/instant/phoenixbreath
	name = REAGENT_PHOENIXBREATH
	id = REAGENT_ID_PHOENIXBREATH
	result = REAGENT_ID_PHOENIXBREATH
	required_reagents = list(REAGENT_ID_VERMICETOL = 1, REAGENT_ID_LIQUIDLIFE = 1, REAGENT_ID_NEOLIQUIDFIRE = 1, REAGENT_ID_SOULDEW = 1, REAGENT_ID_PHORON = 1, REAGENT_ID_DERMALINE = 1)
	result_amount = 6

/decl/chemical_reaction/instant/dryagent
	name = REAGENT_DRYAGENT
	id = REAGENT_ID_DRYAGENT
	result = REAGENT_ID_DRYAGENT
	required_reagents = list(REAGENT_ID_ETHANOL = 2, REAGENT_ID_SODIUM = 2, REAGENT_ID_PHORON = 0.1)
	catalysts = list(REAGENT_ID_PHORON = 5)
	result_amount = 4

//Xenobotany update
/decl/chemical_reaction/instant/neoliquidfire
	name = REAGENT_ID_NEOLIQUIDFIRE //distil phoron dragon blood from basic dragon blood
	id = REAGENT_ID_NEOLIQUIDFIRE
	result = REAGENT_ID_NEOLIQUIDFIRE
	required_reagents = list(REAGENT_ID_LIQUIDFIRE = 1, REAGENT_ID_SULFUR = 1, REAGENT_ID_PHORON = 0.1)
	catalysts = list(REAGENT_ID_PHORON = 5)
	result_amount = 1

//Some extra metal solidification reactions
/decl/chemical_reaction/instant/solidification/deuterium
	name = "Solid Deuterium"
	id = "soliddeuterium"
	required_reagents = list(REAGENT_ID_FROSTOIL = 5, REAGENT_ID_DEUTERIUM = REAGENTS_PER_SHEET)
	sheet_to_give = /obj/item/stack/material/deuterium

//Injectable toxin reactions
/decl/chemical_reaction/instant/succubi_paralize
	name = "paralyzingfluid"
	id = "paralyzingfluid"
	result = "succubi_paralize"
	required_reagents = list(REAGENT_ID_BENZILATE = 1, REAGENT_ID_CRYPTOBIOLIN = 1)
	result_amount = 2

/decl/chemical_reaction/instant/numbingenzyme
	name = "numbingenzyme"
	id = "numbingenzyme"
	result = REAGENT_ID_NUMBENZYME
	required_reagents = list(REAGENT_ID_TRAMADOL = 1, REAGENT_ID_PROTEIN = 2, REAGENT_ID_ADRANOL = 1)
	result_amount = 4
