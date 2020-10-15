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
	var/list/random_reagents = list("hydrogen","lithium","carbon","nitrogen","oxygen","fluorine", \
	"sodium","aluminum","silicon","phosphorus","sulfur","chlorine","potassium","iron", \
	"copper","mercury","radium","water","sugar","sacid","tungsten", "lube", "inaprovaline", "space_drugs", \
	"thermite", "tramadol", "cleaner", "kelotane", "dermaline", "anti_toxin", "synaptizine", \
	 "alkysine", "imidazoline", "hyperzine", "ammonia", "sodiumchloride", "sterilizine", "silicate", "mindbreaker", \
	 "impedrezene", "lipozine")
	var/list/reactions = list()

/datum/phororeactions/proc/set_up_reactions()
	reactions["tricordrazine"] = new/datum/phororeaction("tricordrazine", "bicordrazine", 1.5, 3)
	reactions["mutagen"] = new/datum/phororeaction("mutagen", "mutagen_x", 0.5, 5)
	reactions["ethylredoxrazine"] = new/datum/phororeaction("ethylredoxrazine", "expulsicol", 1, 2)
	reactions["hyronalin"] = new/datum/phororeaction("hyronalin", "rad_x", 1, 3)
	//reactions["pacid"] = new/datum/phororeaction("pacid", "phoronic_acid", 0.2, 4) removed
	reactions["phoron"] = new/datum/phororeaction("phoron", "energized_phoron", 1, 5)
	reactions["oxycodone"] = new/datum/phororeaction("oxycodone", "oxyphoromin", 0.5, 1)

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
