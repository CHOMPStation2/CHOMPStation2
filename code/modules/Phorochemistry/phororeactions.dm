#define PHORONICS_TESTING 1

/datum/phororeaction
	var/reactant_id = ""
	var/result_id = ""
	var/conversion_rate = 1
	var/intensity = 1

/datum/phororeaction/New(var/input, var/output, var/rate = 1, var/level = 1)
	#if PHORONICS_TESTING
	testing("[input]: [output], [level]")
	#endif
	reactant_id = input
	result_id = output
	conversion_rate = rate
	intensity = level

/datum/phororeaction/proc/get_result(var/level) //requires that only ONE reagent be tested at at time
	if(level == intensity)
		return "Reaction successful"

	var/difference = abs(level - intensity)
	if(difference > 1) //ensure multiple tests required
		return "No significant reaction detected"

	if(level < intensity)
		return "Slight reaction detected, it is recommended to raise intensity"

	if(level > intensity)
		return "Reaction highly unstable, it is recommended to lower intensity"

/datum/phororeactions
	var/list/random_reagents = list(REAGENT_ID_HYDROGEN,REAGENT_ID_LITHIUM,REAGENT_ID_CARBON,REAGENT_ID_NITROGEN,REAGENT_ID_OXYGEN,REAGENT_ID_FLUORINE, \
	REAGENT_ID_SODIUM,REAGENT_ID_ALUMINIUM,REAGENT_ID_SILICON,REAGENT_ID_PHOSPHORUS,REAGENT_ID_SULFUR,REAGENT_ID_CHLORINE,REAGENT_ID_POTASSIUM,REAGENT_ID_IRON, \
	REAGENT_ID_COPPER,REAGENT_ID_MERCURY,REAGENT_ID_RADIUM,REAGENT_ID_WATER,REAGENT_ID_SUGAR,REAGENT_ID_SACID,REAGENT_ID_TUNGSTEN, REAGENT_ID_LUBE, REAGENT_ID_INAPROVALINE, REAGENT_ID_BLISS, \
	REAGENT_ID_THERMITE, REAGENT_ID_TRAMADOL, REAGENT_ID_CLEANER, REAGENT_ID_KELOTANE, REAGENT_ID_DERMALINE, REAGENT_ID_ANTITOXIN, REAGENT_ID_SYNAPTIZINE, \
	REAGENT_ID_ALKYSINE, REAGENT_ID_IMIDAZOLINE, REAGENT_ID_HYPERZINE, REAGENT_ID_AMMONIA, REAGENT_ID_SODIUMCHLORIDE, REAGENT_ID_STERILIZINE, REAGENT_ID_SILICATE, REAGENT_ID_MINDBREAKER, \
	REAGENT_ID_IMPEDREZENE, REAGENT_ID_LIPOZINE)
	var/list/reactions = list()

/datum/phororeactions/proc/set_up_reactions()
	reactions[REAGENT_ID_TRICORDRAZINE] = new/datum/phororeaction(REAGENT_ID_TRICORDRAZINE, REAGENT_ID_BICORDRAZINE, 1.5, 3)
	reactions[REAGENT_ID_MUTAGEN] = new/datum/phororeaction(REAGENT_ID_MUTAGEN, REAGENT_ID_MUTAGENX, 0.5, 5)
	reactions[REAGENT_ID_ETHYLREDOXRAZINE] = new/datum/phororeaction(REAGENT_ID_ETHYLREDOXRAZINE, REAGENT_ID_EXPULSICOL, 1, 2)
	reactions[REAGENT_ID_HYRONALIN] = new/datum/phororeaction(REAGENT_ID_HYRONALIN, REAGENT_ID_RADX, 1, 3)
	//reactions[REAGENT_ID_PACID] = new/datum/phororeaction(REAGENT_ID_PACID, REAGENT_ID_PHORONICACID, 0.2, 4) removed
	reactions[REAGENT_ID_PHORON] = new/datum/phororeaction(REAGENT_ID_PHORON, REAGENT_ID_ENERGIZEDPHORON, 1, 5)
	reactions[REAGENT_ID_OXYCODONE] = new/datum/phororeaction(REAGENT_ID_OXYCODONE, REAGENT_ID_OXYPHOROMIN, 0.5, 1)

	var/list/results = typesof(/datum/reagent/phororeagent) - /datum/reagent/phororeagent - /datum/reagent/phororeagent/gaseous

	var/list/reactants = list()
	for(var/R in reactions)
		var/datum/phororeaction/reaction = reactions[R]
		reactants[reaction.result_id] = 1 //reaction found

	for(var/path in results)
		var/datum/reagent/phororeagent/P = new path()
		if(reactants[P.id]) //recipe found
			continue
		else
			var/id = pick(random_reagents)
			random_reagents.Remove(id)
			var/intens = rand(1, 5)
			reactions[id] = new/datum/phororeaction(id, P.id, 1, intens)


		//garbage collection should deal with reagents

#undef PHORONICS_TESTING
