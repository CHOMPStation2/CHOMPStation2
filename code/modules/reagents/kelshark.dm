datum
	reagent

		customchem
			name = "Odd Chemical"
			id = "customchem"
			description = "Weird thing."
			color = "#FFFF99"

		hornychem
			name = "Aphrodisiac"
			id = "hornychem"
			description = "You so horny."
			color = "#FF9999"
			data = list("count"=1)
			on_mob_life(var/mob/living/M as mob)
				if(!M) M = holder.my_atom
				if(data)
					switch(data["count"])
						if(1 to 30)
							if(prob(9)) M.emote("me",1,"blushes")
							if(prob(9)) M << "\red You feel so needy.."
						if (30 to INFINITY)
							if(prob(3)) M.emote("me",1,"blushes")
							if(prob(5)) M.say("!moans out lewdly!")
							if(prob(9)) M << "\red You can't help but want to touch yourself then and now!"
					data["count"]++
				holder.remove_reagent(src.id, 0.2)
				//..()
				return

/datum/chemical_reaction/customchem
	name = "Customchem"
	id = "customchem"
	result = "customchem"
	required_reagents = list("water" = 1, "tungsten" = 1)
	result_amount = 2

/datum/chemical_reaction/hornychem
	name = "Hornychem"
	id = "hornychem"
	result = "hornychem"
	required_reagents = list("water" = 1, "customchem" = 1)
	result_amount = 2