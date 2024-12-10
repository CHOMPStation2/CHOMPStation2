//Chemist update
/decl/chemical_reaction/instant/livingagent
	name = REAGENT_LIVINGAGENT
	id = REAGENT_ID_LIVINGAGENT
	result = REAGENT_ID_LIVINGAGENT
	required_reagents = list("tricordrazine" = 1, "liquidlife" = 1, "sugar" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/performancepeaker
	name = REAGENT_PERFORMANCEPEAKER
	id = REAGENT_ID_PERFORMANCEPEAKER
	result = REAGENT_ID_PERFORMANCEPEAKER
	required_reagents = list("hyperzine" = 1, "liquidlife" = 1, "inaprovaline" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/burncard
	name = "Burning Bicard"
	id = REAGENT_ID_BURNCARD
	result = REAGENT_ID_BURNCARD
	required_reagents = list("liquidfire" = 1, "bicaridine" = 1, "oxygen" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/flamecure
	name = REAGENT_FLAMECURE
	id = REAGENT_ID_FLAMECURE
	result = REAGENT_ID_FLAMECURE
	required_reagents = list("liquidfire" = 1, "myelamine" = 1, "kelotane" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/neotane
	name = REAGENT_NEOTANE
	id = REAGENT_ID_NEOTANE
	result = REAGENT_ID_NEOTANE
	required_reagents = list("neoliquidfire" = 1, "kelotane" = 1, "iron" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/bloodsealer
	name = REAGENT_BLOODSEALER
	id = REAGENT_ID_BLOODSEALER
	result = REAGENT_ID_BLOODSEALER
	required_reagents = list("neoliquidfire" = 1, "glucose" = 1, "hydrogen" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/purifyingagent
	name = REAGENT_PURIFYINGAGENT
	id = REAGENT_ID_PURIFYINGAGENT
	result = REAGENT_ID_PURIFYINGAGENT
	required_reagents = list("deathblood" = 1, "carthatoline" = 1, "hyronalin" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/cleansingagent
	name = REAGENT_CLEANSINGAGENT
	id = REAGENT_ID_CLEANSINGAGENT
	result = REAGENT_ID_CLEANSINGAGENT
	required_reagents = list("deathblood" = 1, "hyronalin" = 1, "anti_toxin" = 1)
	result_amount = 2

//tier 1
/decl/chemical_reaction/instant/souldew
	name = REAGENT_ID_SOULDEW
	id = REAGENT_ID_SOULDEW
	result = REAGENT_ID_SOULDEW
	required_reagents = list("alkysine" = 1, "tricordrazine" = 1, "sulfur" = 1)
	result_amount = 3

/decl/chemical_reaction/instant/quadcord
	name = REAGENT_QUADCORD
	id = REAGENT_ID_QUADCORD
	result = REAGENT_ID_QUADCORD
	required_reagents = list("tricordrazine" = 1, "phoron" = 1, "sacid" = 1)
	result_amount = 3

//tier 2
/decl/chemical_reaction/instant/juggernog
	name = REAGENT_JUGGERNOG
	id = REAGENT_ID_JUGGERNOG
	result = REAGENT_ID_JUGGERNOG
	required_reagents = list("paracetamol" = 1, "tramadol" = 1, "synaptizine" = 1, "mercury" = 1)
	result_amount = 4

/decl/chemical_reaction/instant/curea
	name = REAGENT_CUREA
	id = REAGENT_ID_CUREA
	result = REAGENT_ID_CUREA
	required_reagents = list("spaceacillin" = 1, "adranol" = 1, "inaprovaline" = 1, "iron" = 1)
	result_amount = 4

//tier 3
/decl/chemical_reaction/instant/liquidhealer
	name = REAGENT_LIQUIDHEALER
	id = REAGENT_ID_LIQUIDHEALER
	result = REAGENT_ID_LIQUIDHEALER
	required_reagents = list("bicaridine" = 1, "kelotane" = 1, "liquidlife" = 1, "carpotoxin" = 1, REAGENT_ID_QUADCORD = 1, "cryptobiolin" = 1)
	result_amount = 6

/decl/chemical_reaction/instant/phoenixbreath
	name = REAGENT_PHOENIXBREATH
	id = REAGENT_ID_PHOENIXBREATH
	result = REAGENT_ID_PHOENIXBREATH
	required_reagents = list("vermicetol" = 1, "liquidlife" = 1, "neoliquidfire" = 1, REAGENT_ID_SOULDEW = 1, "phoron" = 1, "dermaline" = 1)
	result_amount = 6

/decl/chemical_reaction/instant/dryagent
	name = REAGENT_DRYAGENT
	id = REAGENT_ID_DRYAGENT
	result = REAGENT_ID_DRYAGENT
	required_reagents = list("ethanol" = 2, "sodium" = 2, "phoron" = 0.1)
	catalysts = list("phoron" = 5)
	result_amount = 4

//Xenobotany update
/decl/chemical_reaction/instant/neoliquidfire
	name = "neoliquidfire" //distil phoron dragon blood from basic dragon blood
	id = "neoliquidfire"
	result = "neoliquidfire"
	required_reagents = list("liquidfire" = 1, "sulfur" = 1, "phoron" = 0.1)
	catalysts = list("phoron" = 5)
	result_amount = 1

//Some extra metal solidification reactions
/decl/chemical_reaction/instant/solidification/deuterium
	name = "Solid Deuterium"
	id = "soliddeuterium"
	required_reagents = list("frostoil" = 5, "deuterium" = REAGENTS_PER_SHEET)
	sheet_to_give = /obj/item/stack/material/deuterium

//Injectable toxin reactions
/decl/chemical_reaction/instant/succubi_paralize
	name = "paralyzingfluid"
	id = "paralyzingfluid"
	result = "succubi_paralize"
	required_reagents = list("benzilate" = 1, "cryptobiolin" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/numbingenzyme
	name = "numbingenzyme"
	id = "numbingenzyme"
	result = "numbenzyme"
	required_reagents = list("tramadol" = 1, "protein" = 2, "adranol" = 1)
	result_amount = 4
