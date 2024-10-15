	/*
		To make a custom disease, make a list with 4 symptoms, give it the severity and a name if you wish.
		This is mostly useful for mapping, events or some mobs.
		Example custom virus:

		var/datum/disease2/disease/virus = new

		virus.makedisease(list(
			/datum/disease2/effect/invisible,
			/datum/disease2/effect/invisible,
			/datum/disease2/effect/invisible,
			/datum/disease2/effect/invisible
		), 2, "Invis")

		var/obj/effect/decal/cleanable/mucus/mapped/M
		M.virus2[1] = virus.getcopy()

		This will create a disease without effects, mildly infectious and with "Invis" as name,
		then added to some mucus on the ground for out dear explo team to step on it and get infected.

	*/
/datum/disease2/disease/proc/makedisease(symptom, severity, dname)
	for(var/i in 1 to 4)
		var/datum/disease2/effectholder/holder = new /datum/disease2/effectholder
		var/Etype = symptom[i]
		holder.stage = i
		holder.effect = new Etype()
		holder.effect.generate()
		holder.chance = rand(0,holder.effect.chance_maxm)
		holder.multiplier = rand(1,holder.effect.maxm)
		effects += holder

	if(dname)
		name = "[dname]"

	uniqueID = rand(0,10000)

	switch(severity)
		if(1)
			infectionchance = 1
		if(2)
			infectionchance = rand(15,25)
		else
			infectionchance = rand(60,90)

	antigen = list(pick(ALL_ANTIGENS))
	antigen |= pick(ALL_ANTIGENS)
	spreadtype = prob(70) ? "Airborne" : "Contact"
	resistance = rand(15,70)

	if(severity >= 2 && prob(33))
		resistance += 10

	if(GLOB.all_species.len)
		affected_species = get_all_infectable_species()

/proc/get_all_infectable_species()
	var/list/meat = list()
	for (var/specie in GLOB.all_species)
		var/datum/species/S = GLOB.all_species[specie]
		if(!S.get_virus_immune())
			meat += S
	return meat
