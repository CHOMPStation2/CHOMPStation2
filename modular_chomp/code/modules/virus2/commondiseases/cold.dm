/datum/disease2/disease/cold
	spreadtype = "Airborne"
	effects = list(
	/datum/disease2/effect/cough,
	/datum/disease2/effect/sneeze,
	/datum/disease2/effect/gunck,
	/datum/disease2/effect/headache
	)

/datum/disease2/disease/cold/New()
	uniqueID = rand(0,10000)
	..()

/datum/disease2/disease/cold/makerandom(var/severity=1)
	. = ..()
