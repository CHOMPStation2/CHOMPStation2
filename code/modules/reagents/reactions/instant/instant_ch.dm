/decl/chemical_reaction/instant/aphrodisiac
	name = REAGENT_APHRODISIAC
	id = REAGENT_ID_APHRODISIAC
	result = REAGENT_ID_APHRODISIAC
	required_reagents = list(REAGENT_ID_CARBON = 2, REAGENT_ID_HYDROGEN = 2, REAGENT_ID_OXYGEN = 2, REAGENT_ID_WATER = 1)
	result_amount = 6

/decl/chemical_reaction/instant/claridyl
	name = REAGENT_CLARIDYL
	id = REAGENT_ID_CLARIDYL
	result = REAGENT_ID_CLARIDYL
	required_reagents = list(REAGENT_ID_LITHIUM = 1, REAGENT_ID_RADIUM = 1, REAGENT_ID_SUGAR = 1)
	result_amount = 1

/decl/chemical_reaction/instant/dyloteane
	name = REAGENT_DYLOTEANE
	id = REAGENT_ID_DYLOTEANE
	result = REAGENT_ID_DYLOTEANE
	required_reagents = list(REAGENT_ID_ANTITOXIN = 1, REAGENT_ID_TEA = 1)
	result_amount = 1

/decl/chemical_reaction/instant/dyloteane/super
	name = "dyloteanesuper"
	id = "dyloteanesuper"
	result = REAGENT_ID_DYLOTEANE
	required_reagents = list(REAGENT_ID_ANTITOXIN = 1, REAGENT_ID_TEA = 1,REAGENT_ID_SUGAR = 1)
	result_amount = 10 //by the powers of england for sugaring your tea you gain *10 result

/decl/chemical_reaction/instant/eden
	name = REAGENT_EDEN
	id = REAGENT_ID_EDEN
	result = REAGENT_ID_EDEN
	required_reagents = list(REAGENT_ID_ANTITOXIN = 60, REAGENT_ID_PHORON = 60)
	result_amount = 1

/decl/chemical_reaction/instant/eden/snake
	id = REAGENT_ID_EDENSNAKE
	result = REAGENT_ID_EDENSNAKE
	required_reagents = list(REAGENT_ID_EDEN = 1, REAGENT_ID_ETHANOL = 1)

/decl/chemical_reaction/instant/tercozolam
	id = REAGENT_ID_TERCOZOLAM
	result = REAGENT_ID_TERCOZOLAM
	required_reagents = list(REAGENT_ID_ANTITOXIN = 1, REAGENT_ID_ETHANOL = 1, REAGENT_ID_LITHIUM = 1)
	result_amount = 3

/decl/chemical_reaction/instant/peridaxon_ch
	name = REAGENT_PERIDAXON
	id = "peridaxon_ch"
	result = REAGENT_ID_PERIDAXON
	required_reagents = list(REAGENT_ID_CORDRADAXON = 1,REAGENT_ID_GASTIRODAXON = 1, REAGENT_ID_HEPANEPHRODAXON = 1, REAGENT_ID_RESPIRODAXON = 1)
	result_amount = 12 //More phoron-efficient alternative recipe.

/decl/chemical_reaction/instant/sorbitol
	name = REAGENT_SORBITOL
	id = REAGENT_ID_SORBITOL
	result = REAGENT_ID_SORBITOL
	required_reagents = list(REAGENT_ID_UNSORBITOL = 1, REAGENT_ID_PHORON = 1)
	result_amount = 2

/decl/chemical_reaction/instant/glucose
	name = REAGENT_GLUCOSE
	id = REAGENT_ID_GLUCOSE
	result = REAGENT_ID_GLUCOSE
	required_reagents = list(REAGENT_ID_SODIUMCHLORIDE = 1, REAGENT_ID_WATER = 1, REAGENT_ID_SUGAR = 1)
	result_amount = 1
///SAP RECIPES//////

/decl/chemical_reaction/instant/myelamine_sap //This is the clotting agent used by clotting packs.
	name = REAGENT_MYELAMINE
	id = REAGENT_ID_MYELAMINE + "sap"
	result = REAGENT_ID_MYELAMINE
	required_reagents = list(REAGENT_ID_BICARIDINE = 1, REAGENT_ID_IRON = 2, REAGENT_ID_KELOTANE = 1, REAGENT_ID_BLUESAP = 1)
	result_amount = 1

/decl/chemical_reaction/instant/hannoa
	name = REAGENT_HANNOA
	id = REAGENT_ID_HANNOA
	result = REAGENT_ID_HANNOA
	required_reagents = list(REAGENT_PURPLESAP = 1, REAGENT_ID_IRON = 2, REAGENT_ID_KELOTANE = 1, REAGENT_ID_CARBON = 1)
	result_amount = 1

/decl/chemical_reaction/instant/bullvalene
	name = REAGENT_BULLVALENE
	id = REAGENT_ID_BULLVALENE
	result = REAGENT_ID_BULLVALENE
	required_reagents = list(REAGENT_ID_DERMALINE = 1, REAGENT_ID_ORANGESAP = 1, REAGENT_ID_COPPER = 1)
	result_amount = 1

/decl/chemical_reaction/instant/nutrient
	name = REAGENT_NUTRIMENT
	id = REAGENT_ID_NUTRIMENT
	result = REAGENT_ID_NUTRIMENT
	required_reagents = list(REAGENT_PURPLESAP = 1, REAGENT_ID_ORANGESAP = 1, REAGENT_ID_BLUESAP = 1)
	catalysts = list(REAGENT_ID_WATER = 5) //CHOMPedit: Catalyst added to prevent conflict with reagents reacting and nixxing each other in black sapbeans
	result_amount = 3

/////SERAZINE RECIPES//////

/decl/chemical_reaction/instant/alizene
	name = REAGENT_ALIZENE
	id = REAGENT_ID_ALIZENE
	result = REAGENT_ID_ALIZENE
	required_reagents = list(REAGENT_ID_BICARIDINE = 1, REAGENT_ID_SERAZINE = 1, REAGENT_ID_TUNGSTEN = 1)
	result_amount = 3

// Frost oil reactions for material sheets
/decl/chemical_reaction/instant/solidification/aluminium
	name = "Solid Aluminium"
	id = "solidaluminium"
	required_reagents = list(REAGENT_ID_FROSTOIL = 5, REAGENT_ID_ALUMINIUM = REAGENTS_PER_SHEET)
	sheet_to_give = /obj/item/stack/material/aluminium

/decl/chemical_reaction/instant/solidification/copper
	name = "Solid Copper"
	id = "solidcopper"
	required_reagents = list(REAGENT_ID_FROSTOIL = 5, REAGENT_ID_COPPER = REAGENTS_PER_SHEET)
	sheet_to_give = /obj/item/stack/material/copper

//YW stuff
/decl/chemical_reaction/instant/benzilate
	name = "Benzilate"
	id = REAGENT_ID_BENZILATE
	result = REAGENT_ID_BENZILATE
	required_reagents = list(REAGENT_ID_PARACETAMOL = 1, REAGENT_ID_MINDBREAKER = 1)
	result_amount = 2

/decl/chemical_reaction/instant/phenethylamine
	name = REAGENT_PHENETHYLAMINE
	id = REAGENT_ID_PHENETHYLAMINE
	result = REAGENT_ID_PHENETHYLAMINE
	required_reagents = list(REAGENT_ID_PAROXETINE = 1, REAGENT_ID_BENZILATE = 1)
	result_amount = 2

// Xenochem stuff
/decl/chemical_reaction/instant/xenolazarus // Moved here because upstream axed it and this file cannot conflict
	name = "Discount Lazarus"
	id = "discountlazarus"
	result = null
	required_reagents = list(REAGENT_ID_MONSTERTAMER = 5, REAGENT_ID_CLONEXADONE = 5)

/decl/chemical_reaction/instant/xenolazarus/on_reaction(var/datum/reagents/holder, var/created_volume) //literally all this does is mash the regenerate button
	if(ishuman(holder.my_atom))
		var/mob/living/carbon/human/H = holder.my_atom
		if(H.stat == DEAD && (/mob/living/carbon/human/proc/reconstitute_form in H.verbs)) //no magical regen for non-regenners, and can't force the reaction on live ones
			if(H.hasnutriment()) // make sure it actually has the conditions to revive
				if(H.revive_ready >= 1) // if it's not reviving, start doing so
					H.revive_ready = REVIVING_READY // overrides the normal cooldown
					H.visible_message(span_info("[H] shudders briefly, then relaxes, faint movements stirring within."))
					H.chimera_regenerate()
				else if (/mob/living/carbon/human/proc/hatch in H.verbs)// already reviving, check if they're ready to hatch
					H.chimera_hatch()
					H.visible_message(span_danger(span_huge("[H] violently convulses and then bursts open, revealing a new, intact copy in the pool of viscera."))) // Hope you were wearing waterproofs, doc...
					H.adjustBrainLoss(10) // they're reviving from dead, so take 10 brainloss
				else //they're already reviving but haven't hatched. Give a little message to tell them to wait.
					H.visible_message(span_info("[H] stirs faintly, but doesn't appear to be ready to wake up yet."))
			else
				H.visible_message(span_info("[H] twitches for a moment, but remains still.")) // no nutriment
