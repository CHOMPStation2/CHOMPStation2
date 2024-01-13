//Code for bellies to spawn junk inside of them whenever they initalize
/obj/belly/proc/spawn_belly_junk(var/amount, var/datum/belly_loot/loottable) //Separate proc so that it can be admin proccalled or someth
	for(var/i = 1, i <= amount, i++)
		var/obj/item/gutjunk = loottable.pick_loot()
		new gutjunk

/datum/belly_loot
	var/name = "Trash"
	var/selectable_by_anyone = TRUE //If this shows up in the vore panel or not
	var/list/basicloot = list(
		//subtypesof(/obj/item/trash) //Byond is shitting itself because it's a very good program
	)

/datum/belly_loot/proc/pick_loot() //Override this with something more complicated if you want like... an exhaustive list or something
	return pick(basicloot)

/* //Oops I cant figure this out alone. If I remember too I'll fix this before PRing my schizoslop
/datum/belly_loot/exhaustive
	name = "Bones"
	basicloot = list(pick(
		prob(1);/obj/item/weapon/digestion_remains,
		prob(1);/obj/item/weapon/digestion_remains/variant1,
		prob(1);/obj/item/weapon/digestion_remains/variant2,
		prob(1);/obj/item/weapon/digestion_remains/variant3
	))
	var/list/exhaustiveloot = list(
		list(/obj/item/weapon/digestion_remains/ribcage, 1)
	)

/datum/belly_loot/exhaustive/pick_loot()
	if(prob(50))
		var/pick_success = FALSE
		while(pick_success == FALSE)
			var/loot = pick(exhaustiveloot)
			if(loot[2] > 0)
				loot[2] = loot[2] - 1
				return loot[1]
	return basicloot
*/
