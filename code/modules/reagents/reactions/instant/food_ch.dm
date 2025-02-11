//////////////////////////////////////////////
////////////////C U B E S////////////////////
////////////////////////////////////////////
/decl/chemical_reaction/instant/cube/sagaru
	name = "Saguwu"
	id = "cubedsagaru"
	result = null
	required_reagents = list(REAGENT_ID_CHEESE = 1, REAGENT_ID_BLOOD = 1, REAGENT_ID_CLONEXADONE = 10,)
	result_amount = 1

/decl/chemical_reaction/instant/cube/sagaru/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/food/snacks/monkeycube/sarucube(location)
	return

/decl/chemical_reaction/instant/food/blondiemix
	name = REAGENT_BLONDIEMIX
	id = REAGENT_ID_BLONDIEMIX
	result = REAGENT_ID_BLONDIEMIX
	required_reagents = list(REAGENT_ID_FLOUR = 5, REAGENT_ID_VANILLA = 5, REAGENT_ID_SUGAR = 5)
	result_amount = 15
