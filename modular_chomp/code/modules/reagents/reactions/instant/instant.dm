/decl/chemical_reaction/instant/amorphorovir
	name = "Amorphorovir"
	id = "amorphorovir"
	result = "amorphorovir"
	required_reagents = list("cryptobiolin" = 30, "biomass" = 30, "hyperzine" = 20)
	catalysts = list("phoron" = 5)
	result_amount = 1

/decl/chemical_reaction/instant/androrovir
	result = "change_drug_male"

/decl/chemical_reaction/instant/gynorovir
	result = "change_drug_female"

/decl/chemical_reaction/instant/androgynorovir
	result = "change_drug_intersex"

/decl/chemical_reaction/instant/androrovir_bootleg
	result = "change_drug_male"

/decl/chemical_reaction/instant/gynorovir_bootleg
	result = "change_drug_female"

/decl/chemical_reaction/instant/androgynorovir_bootleg
	result = "change_drug_intersex"

//Chemist update
/decl/chemical_reaction/instant/livingagent
	name = "Living Agent"
	id = "livingagent"
	result = "livingagent"
	required_reagents = list("tricordrazine" = 1, "liquidlife" = 1, "sugar" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/performancepeaker
	name = "Performance Peaker"
	id = "performancepeaker"
	result = "performancepeaker"
	required_reagents = list("hyperzine" = 1, "liquidlife" = 1, "inaprovaline" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/burncard
	name = "Burning Bicard"
	id = "burncard"
	result = "burncard"
	required_reagents = list("liquidfire" = 1, "bicaridine" = 1, "oxygen" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/flamecure
	name = "Flame Cure"
	id = "flamecure"
	result = "flamecure"
	required_reagents = list("liquidfire" = 1, "myelamine" = 1, "kelotane" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/neotane
	name = "Neo Kelotane"
	id = "neotane"
	result = "neotane"
	required_reagents = list("neoliquidfire" = 1, "kelotane" = 1, "iron" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/bloodsealer
	name = "Blood Sealer"
	id = "bloodsealer"
	result = "bloodsealer"
	required_reagents = list("neoliquidfire" = 1, "glucose" = 1, "hydrogen" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/purifyingagent
	name = "Purifying Agent"
	id = "purifyingagent"
	result = "purifyingagent"
	required_reagents = list("deathblood" = 1, "carthatoline" = 1, "hyronalin" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/cleansingagent
	name = "Cleansing Agent"
	id = "cleansingagent"
	result = "cleansingagent"
	required_reagents = list("deathblood" = 1, "hyronalin" = 1, "anti_toxin" = 1)
	result_amount = 2

//tier 1
/decl/chemical_reaction/instant/souldew
	name = "souldew"
	id = "souldew"
	result = "souldew"
	required_reagents = list("alkysine" = 1, "tricordrazine" = 1, "sulfur" = 1)
	result_amount = 3

/decl/chemical_reaction/instant/quadcord
	name = "quadcord"
	id = "quadcord"
	result = "quadcord"
	required_reagents = list("tricordrazine" = 1, "phoron" = 1, "sacid" = 1)
	result_amount = 3

//tier 2
/decl/chemical_reaction/instant/juggernog
	name = "juggernog"
	id = "juggernog"
	result = "juggernog"
	required_reagents = list("paracetamol" = 1, "tramadol" = 1, "synaptizine" = 1, "mercury" = 1)
	result_amount = 4

/decl/chemical_reaction/instant/curea
	name = "curea"
	id = "curea"
	result = "curea"
	required_reagents = list("spaceacillin" = 1, "adranol" = 1, "inaprovaline" = 1, "iron" = 1)
	result_amount = 4

//tier 3
/decl/chemical_reaction/instant/liquidhealer
	name = "liquidhealer"
	id = "liquidhealer"
	result = "liquidhealer"
	required_reagents = list("bicaridine" = 1, "kelotane" = 1, "liquidlife" = 1, "carpotoxin" = 1, "quadcord" = 1, "cryptobiolin" = 1)
	result_amount = 6

/decl/chemical_reaction/instant/phoenixbreath
	name = "phoenixbreath"
	id = "phoenixbreath"
	result = "phoenixbreath"
	required_reagents = list("vermicetol" = 1, "liquidlife" = 1, "neoliquidfire" = 1, "souldew" = 1, "phoron" = 1, "dermaline" = 1)
	result_amount = 6

/decl/chemical_reaction/instant/dryagent
	name = "Dry Agent"
	id = "dryagent"
	result = "dryagent"
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