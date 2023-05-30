//There is already a station file, but feels wrong to put zaddat balancing changes with the restriction file, and feels wrong to lump them in with a modular station_vr so hello station_ch file

/datum/species/zaddat
	toxins_mod =    0.5 //toxins rarely come into play, and zaddat just has negatives. Along with their parasite letting them survive in their polluted planet, this seems reasonable.

//So both of this are based off Fennec foxes I belivive. Those are desert critters, giving them more warm focused levels. And for variety giving them minor brute weakness and minor burn resistant
//I also want to make a dig because fennec foxes actually make burrows and such, but I can't figure out how to do it in a way that is both flavorful but not abuseable
/datum/species/hi_zoxxen //zorrens get wierd chemistry because of their past of expirementing on themselves. Check the cataloguer for deathclaws
	chemOD_threshold =		0.75
	radiation_mod = 0.5
	brute_mod = 1.1
	burn_mod = 0.9

	cold_level_1 = 270 //Default 260 - Lower is better
	cold_level_2 = 210 //Default 200
	cold_level_3 = 120 //Default 120

	breath_cold_level_1 = 250	//Default 240 - Lower is better
	breath_cold_level_2 = 190	//Default 180
	breath_cold_level_3 = 100	//Default 100

	heat_level_1 = 400 //Default 360 - Higher is better
	heat_level_2 = 460 //Default 400
	heat_level_3 = 1080 //Default 1000

	breath_heat_level_1 = 430	//Default 380 - Higher is better
	breath_heat_level_2 = 510	//Default 450
	breath_heat_level_3 = 1200	//Default 1250

/datum/species/fl_zorren
	item_slowdown_mod = 1.2
	slowdown = -0.2
	brute_mod = 1.1
	burn_mod = 0.9

	cold_level_1 = 270 //Default 260 - Lower is better
	cold_level_2 = 210 //Default 200
	cold_level_3 = 120 //Default 120

	breath_cold_level_1 = 250	//Default 240 - Lower is better
	breath_cold_level_2 = 190	//Default 180
	breath_cold_level_3 = 100	//Default 100

	heat_level_1 = 400 //Default 360 - Higher is better
	heat_level_2 = 460 //Default 400
	heat_level_3 = 1080 //Default 1000

	breath_heat_level_1 = 430	//Default 380 - Higher is better
	breath_heat_level_2 = 510	//Default 450
	breath_heat_level_3 = 1200	//Default 1250