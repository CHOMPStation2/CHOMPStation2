SUBSYSTEM_DEF(assets)
	name = "Assets"
	init_order = INIT_ORDER_ASSETS
	flags = SS_NO_FIRE
	var/list/cache = list()
	var/list/preload = list()

/datum/controller/subsystem/assets/Initialize(timeofday)
<<<<<<< HEAD
	for(var/type in typesof(/datum/asset))
		var/datum/asset/A = type
		if (type != initial(A._abstract))
			get_asset_datum(type)

||||||| parent of 70cccc775a... Merge pull request #11192 from VOREStation/Arokha/hmm
	for(var/datum/asset/A as anything in typesof(/datum/asset))
		if (type != initial(A._abstract))
			get_asset_datum(type)

=======
	for(var/typepath in typesof(/datum/asset))
		var/datum/asset/A = typepath
		if (typepath != initial(A._abstract))
			get_asset_datum(typepath)
>>>>>>> 70cccc775a... Merge pull request #11192 from VOREStation/Arokha/hmm

	preload = cache.Copy() //don't preload assets generated during the round

	for(var/client/C in GLOB.clients)
		addtimer(CALLBACK(GLOBAL_PROC, .proc/getFilesSlow, C, preload, FALSE), 10)
	return ..()