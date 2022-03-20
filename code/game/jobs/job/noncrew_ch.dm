/datum/job/noncrew
    title = "Non crew"
    disallow_jobhop = TRUE
    total_positions = -1
    spawn_positions = 6
    supervisors = "no one."

    flag = NONCREW
    departments = list(DEPARTMENT_NONCREW)
    department_flag = OTHER
    faction = "Station"
    assignable = FALSE
    account_allowed = 0
    offmap_spawn = TRUE

    outfit_type = /decl/hierarchy/outfit/job/noncrew
    job_description = "Not a crew member."

/datum/job/noncrew/is_species_banned(species_name, brain_type)
    // Any species can join as non-crew, including shadekin.
    return FALSE