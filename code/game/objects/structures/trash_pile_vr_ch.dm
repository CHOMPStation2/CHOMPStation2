//Snowflake customizable trashpules, these can be map eddited to be unique TM or you can just make new sub objects that change the vars -shark
//They are called sharkpiles because i cant think of another name, but do feel free to make them actually spawn sharks.
/obj/structure/trash_pile/sharkpile
	var/destroychance = 0 //People too used to static pilespawns? Add randomness to it.

	//Lists use better weights that add together so in the below example the sum of weight sis 6 so a 3 is 50% and a 1 is 16%
	var/overridechancealpha = 90 //how likely the piles is to give its unique objects for alpha spawns
	var/list/alphapicks = list(
		/obj/item/storage/pill_bottle/happy = 1,
		/obj/item/storage/pill_bottle/zoom = 2,
		/obj/item/storage/pill_bottle/paracetamol = 3,
	) //override pick list alpha

	var/overridechancebeta = 90 //how likely the piles is to give its unique objects for beta spawns
	var/list/betapicks = list(
		/obj/item/storage/pill_bottle/happy = 3,
		/obj/item/storage/pill_bottle/zoom = 2,
		/obj/item/storage/pill_bottle/paracetamol = 1,
	) //override pick list beta

	var/overridechancegamma = 90 //how likely the piles is to give its unique objects for gamma spawns
	var/list/gammapicks = list(
		/obj/item/storage/pill_bottle/happy = 3,
		/obj/item/storage/pill_bottle/zoom = 2,
		/obj/item/storage/pill_bottle/paracetamol = 1,
	) //override pick list gamma
	
	var/gammaunique = 1
	

/obj/structure/trash_pile/sharkpile/Initialize()
	..()
	if(prob(destroychance))
		qdel(src)

//^X% chance to use our own list, otherwise default pool.
//Here we could also add a % chance to spawn a mob for trash pandas or such,
/obj/structure/trash_pile/sharkpile/produce_alpha_item()
	if(prob(overridechancealpha))
		var/path = pick(alphapicks)
		var/obj/item/I = new path()
		return I
	return ..()

/obj/structure/trash_pile/sharkpile/produce_beta_item()
	if(prob(overridechancebeta))
		var/path = pick(betapicks)
		var/obj/item/I = new path()
		return I
	return ..()

/obj/structure/trash_pile/sharkpile/produce_gamma_item()
	if(prob(overridechancegamma)&& gammaunique!=2)
		var/path = pick(gammapicks)
		var/obj/item/I = new path()
		if(gammaunique!=0)
			gammaunique++
		return I
	return ..()
