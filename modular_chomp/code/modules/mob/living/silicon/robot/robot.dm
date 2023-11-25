/mob/living/silicon/robot
	var/sleeper_resting = FALSE //Enable resting belly sprites for dogborgs that have the sprites
	var/datum/matter_synth/water_res = null //Enable water for lick clean

/mob/living/silicon/robot/verb/purge_nutrition()
	set name = "Purge Nutrition"
	set category = "IC"
	set desc = "Allows you to clear out most of your nutrition if needed."

	if (stat != CONSCIOUS || nutrition <= 1000)
		return
	nutrition = 1000
	to_chat(src, "<span class='warning'>You have purged most of the nutrition lingering in your systems.</span>")
	return TRUE

/mob/living/silicon/robot/proc/ex_reserve_refill()
	set name = "Refill Extinguisher"
	set category = "Object"
	var/datum/matter_synth/water = water_res
	for(var/obj/item/weapon/extinguisher/E in module.modules)
		if(E.reagents.total_volume < E.max_water)
			if(water && water.energy > 0)
				var/amount = E.max_water - E.reagents.total_volume
				if(water.energy < amount)
					amount = water.energy
				water.use_charge(amount)
				E.reagents.add_reagent("water", amount)
				to_chat(src, "<span class='filter_notice'>You refill the extinguisher using your water reserves.</span>")
			else
				to_chat(src, "<span class='filter_notice'>Insufficient water reserves.</span>")
