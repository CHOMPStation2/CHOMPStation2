/*
/datum/symptom/infect_synthetics
    name = "Synthetic Infection"
    stealth = 1
    resistance = 2
    stage_speed = 0
    transmittable = 1
    level = 2
    severity = 3
    id = "synthetic_infection"

    /datum/symptom/infect_synthetics/proc/Activate(datum/disease/advance/A)
        A.properties["infect_synthetics"] = 1
        ..()
*/
