/decl/chemical_reaction/instant/aphrodisiac
	name = "Aphrodisiac"
	id = "aphrodisiac"
	result = "aphrodisiac"
	required_reagents = list("carbon" = 2, "hydrogen" = 2, "oxygen" = 2, "water" = 1)
	result_amount = 6

/decl/chemical_reaction/instant/claridyl
	name = "claridyl"
	id = "claridyl"
	result = "claridyl"
	required_reagents = list("lithium" = 1, "radium" = 1, "sugar" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/dyloteane
	name = "dyloteane"
	id = "dyloteane"
	result = "dyloteane"
	required_reagents = list("anti_toxin" = 1, "tea" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/dyloteane/super
	name = "dyloteanesuper"
	id = "dyloteanesuper"
	result = "dyloteane"
	required_reagents = list("anti_toxin" = 1, "tea" = 1,"sugar" = 1)
	result_amount = 10 //by the powers of england for sugaring your tea you gain *10 result

/decl/chemical_reaction/instant/eden
	name = "eden"
	id = "eden"
	result = "eden"
	required_reagents = list("anti_toxin" = 60, "phoron" = 60)
	result_amount = 1

/decl/chemical_reaction/instant/eden/snake
	id = "eden_snake"
	result = "eden_snake"
	required_reagents = list("eden" = 1, "ethanol" = 1)

/decl/chemical_reaction/instant/tercozolam
	id = "tercozolam"
	result = "tercozolam"
	required_reagents = list("anti_toxin" = 1, "ethanol" = 1, "lithium" = 1)
	result_amount = 3

/decl/chemical_reaction/instant/peridaxon_ch
	name = "Peridaxon"
	id = "peridaxon_ch"
	result = "peridaxon"
	required_reagents = list("cordradaxon" = 1, "gastirodaxon" = 1, "hepanephrodaxon" = 1, "respirodaxon" = 1)
	result_amount = 12 //More phoron-efficient alternative recipe.

/decl/chemical_reaction/instant/sorbitol
	name = "Sorbitol"
	id = "sorbitol"
	result = "sorbitol"
	required_reagents = list("unsorbitol" = 1, "phoron" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/glucose
	name = "Glucose"
	result = "glucose"
	required_reagents = list("sodiumchloride" = 1, "water" = 1, "sugar" = 1)
	result_amount = 1
///SAP RECIPES//////

/decl/chemical_reaction/instant/myelamine_sap //This is the clotting agent used by clotting packs.
	name = "Myelamine"
	id = "myelamine"
	result = "myelamine"
	required_reagents = list("bicaridine" = 1, "iron" = 2, "kelotane" = 1, "bluesap" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/hannoa
	name = "Hannoa"
	id = "hannoa"
	result = "hannoa"
	required_reagents = list("purplesap" = 1, "iron" = 2, "kelotane" = 1, "carbon" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/bullvalene
	name = "Bullvalene"
	id = "bullvalene"
	result = "bullvalene"
	required_reagents = list("dermaline" = 1, "orangesap" = 1, "copper" = 1)
	result_amount = 1

/decl/chemical_reaction/instant/nutrient
	name = "Nutriment"
	id = "nutriment"
	result = "nutriment"
	required_reagents = list("purplesap" = 1, "orangesap" = 1, "bluesap" = 1)
	catalysts = list("water" = 5) //CHOMPedit: Catalyst added to prevent conflict with reagents reacting and nixxing each other in black sapbeans
	result_amount = 3

/////SERAZINE RECIPES//////

/decl/chemical_reaction/instant/alizene
	name = "Alizene"
	id = "alizene"
	result = "alizene"
	required_reagents = list("bicaridine" = 1, "serazine" = 1, "tungsten" = 1)
	result_amount = 3

// Frost oil reactions for material sheets
/decl/chemical_reaction/instant/solidification/aluminium
	name = "Solid Aluminium"
	id = "solidaluminium"
	required_reagents = list("frostoil" = 5, "aluminum" = REAGENTS_PER_SHEET)
	sheet_to_give = /obj/item/stack/material/aluminium

/decl/chemical_reaction/instant/solidification/copper
	name = "Solid Copper"
	id = "solidcopper"
	required_reagents = list("frostoil" = 5, "copper" = REAGENTS_PER_SHEET)
	sheet_to_give = /obj/item/stack/material/copper

//YW stuff
/decl/chemical_reaction/instant/benzilate
	name = "Benzilate"
	id = "benzilate"
	result = "benzilate"
	required_reagents = list("paracetamol" = 1, "mindbreaker" = 1)
	result_amount = 2

/decl/chemical_reaction/instant/phenethylamine
	name = "Phenethylamine"
	id = "phenethylamine"
	result = "phenethylamine"
	required_reagents = list("paroxetine" = 1, "benzilate" = 1)
	result_amount = 2

// Xenochem stuff
/decl/chemical_reaction/instant/xenolazarus // Moved here because upstream axed it and this file cannot conflict
	name = "Discount Lazarus"
	id = "discountlazarus"
	result = null
	required_reagents = list("monstertamer" = 5, "clonexadone" = 5)

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
