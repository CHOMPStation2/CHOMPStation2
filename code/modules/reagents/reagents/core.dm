/datum/reagent/blood
	data = new/list("donor" = null, "viruses" = null, "species" = SPECIES_HUMAN, "blood_DNA" = null, "blood_type" = null, "blood_colour" = "#A10808", "resistances" = null, "trace_chem" = null, REAGENT_ID_ANTIBODIES = list())
	name = REAGENT_BLOOD
	id = REAGENT_ID_BLOOD
	description = "Blood."
	taste_description = REAGENT_ID_IRON
	taste_mult = 1.3
	reagent_state = LIQUID
	metabolism = REM * 5
	mrate_static = TRUE
	affects_dead = 1 //so you can pump blood into someone before defibbing them
	color = "#C80000"
	var/volume_mod = 1	// So if you add different subtypes of blood, you can affect how much vessel blood each unit of reagent adds

	glass_name = "tomato juice"
	glass_desc = "Are you sure this is tomato juice?"

	supply_conversion_value = REFINERYEXPORT_VALUE_COMMON
	industrial_use = REFINERYEXPORT_REASON_BIOHAZARD


/datum/reagent/blood/initialize_data(var/newdata)
	..()
	if(data && data["blood_colour"])
		color = data["blood_colour"]

	return

/datum/reagent/blood/get_data() // Just in case you have a reagent that handles data differently.
	var/t = data.Copy()
	if(t["viruses"])
		var/list/v = t["viruses"]
		t["viruses"] = v.Copy()
	return t

/datum/reagent/blood/touch_turf(var/turf/simulated/T)
	if(!istype(T) || volume < 3)
		return

	..()

	if(!data["donor"] || ishuman(data["donor"]))
		blood_splatter(T, src, 1)
	else if(istype(data["donor"], /mob/living/carbon/alien))
		var/mob/living/carbon/alien/A = data["donor"]
		var/obj/effect/decal/cleanable/blood/B = blood_splatter(T, src, 1)
		B.add_blooddna(A.dna,A)
	else
		var/obj/effect/decal/cleanable/blood/B = blood_splatter(T, src, 1)
		B.add_blooddna(null,null)

/datum/reagent/blood/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)

	var/effective_dose = dose
	if(issmall(M)) effective_dose *= 2

	var/is_vampire = FALSE //VOREStation Edit START
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.species.bloodsucker)
			H.adjust_nutrition(removed*30)
			is_vampire = TRUE //VOREStation Edit END
	if(alien == IS_SLIME)	// Treat it like nutriment for the jello, but not equivalent.
		if(data["species"] == M.species.name)	// Unless it's Promethean goo, then refill this one's goo.
			M.inject_blood(src, volume * volume_mod)
			remove_self(volume)
			return

		M.heal_organ_damage(0.2 * removed * volume_mod, 0)	// More 'effective' blood means more usable material.
		M.adjust_nutrition(20 * removed * volume_mod)
		M.add_chemical_effect(CE_BLOODRESTORE, 4 * removed)
		//M.adjustToxLoss(removed / 2)	// Still has some water in the form of plasma. | CHOMP EDIT - No. Soda does not kill a prommie, their own blood should not either.
		return

	if(effective_dose > 5)
		if(!is_vampire) //VOREStation Edit.
			M.adjustToxLoss(removed) //VOREStation Edit.
	if(effective_dose > 15)
		if(!is_vampire) //VOREStation Edit.
			M.adjustToxLoss(removed) //VOREStation Edit.
	if(data && data["viruses"])
		var/list/vlist = data["viruses"]
		if(vlist.len)
			for(var/ID in vlist)
				if(!ID)
					continue
				var/datum/disease/D = ID
				if((D.spread_flags & DISEASE_SPREAD_SPECIAL) || (D.spread_flags & DISEASE_SPREAD_NON_CONTAGIOUS))
					continue
				M.ContractDisease(D)

/datum/reagent/blood/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.isSynthetic())
			return
	if(alien == IS_SLIME)
		affect_ingest(M, alien, removed)
		return
	if(data && data["viruses"])
		var/list/vlist = data["viruses"]
		if(vlist.len)
			for(var/ID in vlist)
				var/datum/disease/D = ID
				if((D.spread_flags & DISEASE_SPREAD_SPECIAL) || (D.spread_flags & DISEASE_SPREAD_NON_CONTAGIOUS))
					continue
				M.ContractDisease(D)
	if(data && data["resistances"])
		M.AddResistances(data["resistances"])

/datum/reagent/blood/mix_data(newdata, newamount)
	if(!data || !newdata)
		return

	if(data["viruses"] || newdata["viruses"])
		var/list/mix1 = data["viruses"]
		var/list/mix2 = newdata["viruses"]

		var/list/to_mix = list()
		var/list/preserve = list()

		for(var/datum/disease/advance/AD in mix1)
			to_mix += AD
		for(var/datum/disease/advance/AD in mix2)
			to_mix += AD

		var/datum/disease/advance/mixed_AD = Advance_Mix(to_mix)

		if(mixed_AD)
			preserve += mixed_AD

		for(var/datum/disease/D1 in mix1)
			if(!istype(D1, /datum/disease/advance))
				var/keep = TRUE
				for(var/datum/disease/D2 in preserve)
					if(D1.IsSame(D2))
						keep = FALSE
						break
				if(keep)
					preserve += D1

		for(var/datum/disease/D1 in mix2)
			if(!istype(D1, /datum/disease/advance))
				var/keep = TRUE
				for(var/datum/disease/D2 in preserve)
					if(D1.IsSame(D2))
						keep = FALSE
						break
				if(keep)
					preserve += D1

		data["viruses"] = preserve

/datum/reagent/blood/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_SLIME)	//They don't have blood, so it seems weird that they would instantly 'process' the chemical like another species does.
		affect_ingest(M, alien, removed)
		return

	if(M.isSynthetic())
		return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M

		var/datum/reagent/blood/recipient = H.get_blood(H.vessel)

		if(recipient && blood_incompatible(data["blood_type"], recipient.data["blood_type"], data["species"], recipient.data["species"]))
			H.inject_blood(src, removed * volume_mod)

			if(!H.isSynthetic() && data["species"] == "synthetic")	// Remember not to inject oil into your veins, it's bad for you.
				H.reagents.add_reagent(REAGENT_ID_TOXIN, removed * 1.5)

			return

	M.inject_blood(src, volume * volume_mod)
	remove_self(volume)

/datum/reagent/blood/proc/get_diseases()
	. = list()
	if(data && data["viruses"])
		for(var/thing in data["viruses"])
			var/datum/disease/D = thing
			. += D

/datum/reagent/blood/synthblood
	name = REAGENT_SYNTHBLOOD
	description = "Synthetic Blood"
	id = REAGENT_ID_SYNTHBLOOD
	color = "#999966"
	volume_mod = 2

/datum/reagent/blood/synthblood/initialize_data(var/newdata)
	..()
	if(data && !data["blood_type"])
		data["blood_type"] = "O-"
	if(data && data["species"])
		data["species"] = null
	return

/datum/reagent/blood/synthblood/dilute
	name = REAGENT_SYNTHBLOOD_DILUTE
	id = REAGENT_ID_SYNTHBLOOD_DILUTE
	color = "#cacaaf"
	volume_mod = 1.2

// pure concentrated antibodies
/datum/reagent/antibodies
	data = list(REAGENT_ID_ANTIBODIES=list())
	name = REAGENT_ANTIBODIES
	description = "Antibodies against some type of virus."
	taste_description = "slime"
	id = REAGENT_ID_ANTIBODIES
	reagent_state = LIQUID
	color = "#0050F0"
	mrate_static = TRUE

	supply_conversion_value = REFINERYEXPORT_VALUE_RARE
	industrial_use = REFINERYEXPORT_REASON_MEDSCI

/datum/reagent/antibodies/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(src.data)
		M.antibodies |= src.data[REAGENT_ID_ANTIBODIES]
	..()

#define WATER_LATENT_HEAT 19000 // How much heat is removed when applied to a hot turf, in J/unit (19000 makes 120 u of water roughly equivalent to 4L)

/datum/reagent/water
	name = REAGENT_WATER
	id = REAGENT_ID_WATER
	taste_description = REAGENT_ID_WATER
	description = "A ubiquitous chemical substance that is composed of hydrogen and oxygen."
	reagent_state = LIQUID
	color = "#0064C877"
	metabolism = REM * 10

	glass_name = REAGENT_ID_WATER
	glass_desc = "The father of all refreshments."

	supply_conversion_value = REFINERYEXPORT_VALUE_NO
	industrial_use = REFINERYEXPORT_REASON_RAW

/datum/reagent/water/touch_turf(var/turf/simulated/T)
	if(!istype(T))
		return

	..()

	var/datum/gas_mixture/environment = T.return_air()
	var/min_temperature = T0C + 100 // 100C, the boiling point of water

	var/hotspot = (locate(/obj/fire) in T)
	if(hotspot && !istype(T, /turf/space))
		var/datum/gas_mixture/lowertemp = T.remove_air(T:air:total_moles)
		lowertemp.temperature = max(min(lowertemp.temperature-2000, lowertemp.temperature / 2), 0)
		lowertemp.react()
		T.assume_air(lowertemp)
		qdel(hotspot)

	if (environment && environment.temperature > min_temperature) // Abstracted as steam or something
		var/removed_heat = between(0, volume * WATER_LATENT_HEAT, -environment.get_thermal_energy_change(min_temperature))
		environment.add_thermal_energy(-removed_heat)
		if (prob(5))
			T.visible_message(span_warning("The water sizzles as it lands on \the [T]!"))

	else if(volume >= 10)
		T.wet_floor(1)

	T.apply_fire_protection() // CHOMPAdd - Apply fire protection so fires can actually be put out.

/datum/reagent/water/touch_obj(var/obj/O, var/amount)
	..()
	if(istype(O, /obj/item/reagent_containers/food/snacks/monkeycube))
		var/obj/item/reagent_containers/food/snacks/monkeycube/cube = O
		if(!cube.wrapped)
			cube.Expand()
	else if(istype(O, /obj/item/reagent_containers/food/snacks/cube))
		var/obj/item/reagent_containers/food/snacks/cube/cube = O
		cube.Expand()
	else
		O.water_act(amount / 5)

/datum/reagent/water/touch_mob(var/mob/living/L, var/amount)
	..()
	if(istype(L))
		// First, kill slimes.
		if(istype(L, /mob/living/simple_mob/slime))
			var/mob/living/simple_mob/slime/S = L
			S.adjustToxLoss(15 * amount)
			S.visible_message(span_warning("[S]'s flesh sizzles where the water touches it!"), span_danger("Your flesh burns in the water!"))

		// Then extinguish people on fire.
		var/needed = max(0,L.fire_stacks) * 5
		if(amount > needed)
			L.ExtinguishMob()
		L.water_act(amount / 25) // Div by 25, as water_act multiplies it by 5 in order to calculate firestack modification.
		remove_self(needed)
		// Put out cigarettes if splashed.
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.wear_mask)
				if(istype(H.wear_mask, /obj/item/clothing/mask/smokable))
					var/obj/item/clothing/mask/smokable/S = H.wear_mask
					if(S.lit)
						S.quench()
						H.visible_message(span_notice("[H]\'s [S.name] is put out."))

//YWedit start, readds promethean damage that was removed by vorestation.
/datum/reagent/water/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_SLIME)
		M.adjustToxLoss(6 * removed)
	else
		..()

/datum/reagent/water/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_SLIME)
		M.adjustToxLoss(6 * removed)
	else
		..()

/datum/reagent/water/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_SLIME && prob(10))
		M.visible_message(span_warning("[M]'s flesh sizzles where the water touches it!"), span_danger("Your flesh burns in the water!"))
	..()
//VOREStation Edit End,

#undef WATER_LATENT_HEAT

/datum/reagent/fuel
	name = REAGENT_FUEL
	id = REAGENT_ID_FUEL
	description = "Required for welders. Flamable."
	taste_description = "gross metal"
	reagent_state = LIQUID
	color = "#660000"

	glass_name = "welder fuel"
	glass_desc = "Unless you are an industrial tool, this is probably not safe for consumption."

	supply_conversion_value = REFINERYEXPORT_VALUE_PROCESSED
	industrial_use = REFINERYEXPORT_REASON_RAW

/datum/reagent/fuel/touch_turf(var/turf/T, var/amount)
	..()
	new /obj/effect/decal/cleanable/liquid_fuel(T, amount, FALSE)
	remove_self(amount)
	return

/datum/reagent/fuel/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(issmall(M)) removed *= 2
	M.adjustToxLoss(4 * removed)

/datum/reagent/fuel/touch_mob(var/mob/living/L, var/amount)
	..()
	if(istype(L))
		L.adjust_fire_stacks(amount / 10) // Splashing people with welding fuel to make them easy to ignite!
