//////////////////////////////////////////////
////////////////C U B E S////////////////////
////////////////////////////////////////////
/decl/chemical_reaction/instant/cube/sagaru
	name = "Saguwu"
	id = "cubedsagaru"
	result = null
	required_reagents = list("cheese" = 1, "blood" = 1, "clonexadone" = 10,)
	result_amount = 1

/decl/chemical_reaction/instant/cube/sagaru/on_reaction(var/datum/reagents/holder, var/created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/food/snacks/monkeycube/sarucube(location)
	return

/decl/chemical_reaction/instant/food/blondiemix
	name = "Blondie Mix"
	id = "blondiemix"
	result = "blondiemix"
	required_reagents = list("flour" = 5, "vanilla" = 5, "sugar" = 5)
	result_amount = 15
