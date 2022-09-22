/datum/job/noncrew
    title = "Non-Crew"
    disallow_jobhop = TRUE
    total_positions = 5
    spawn_positions = 6
    supervisors = "no one."

    flag = NONCREW
    departments = list(DEPARTMENT_NONCREW)
    department_flag = OTHER
    faction = "Station"
    assignable = FALSE
    account_allowed = 0
    offmap_spawn = TRUE

    outfit_type = /decl/hierarchy/outfit/noncrew
    job_description = {"Players taking a role of a visitor outside of NT property with no special mechanics or items outside of the item loadout. Excluding one superpose pod.
		-----Goes without saying, server rules still apply to the fullest
		-----Neutral-crew are considered unauthorized personnel on SouthernCross.
		-----Neutral-crew are not allowed to take part in events and mini-event areas unless the EM says otherwise.
		-----Neutral-crew are not allowed to take station jobs.
		-----Neutral-crew are not allowed to know more than two department jobs.
		-----Neutral-crew are expected to behave and respect station SOP and Corp.Reg regardless of their IC knowledge.
		-----Neutral-crew are not allowed to log-off with station key items.  (Captain spare, Station Blueprints, Nuke-key, Bluespace harpoon, any valuable or large amount of materials, chems, guns, etc. . .). Please discard these items on station or crew with relevant job roles.
		-----Limit of 5 Neutral crew per round.
		-----We encourage Neutral-crew to take on exploration content as a group, staff will not help you for any hardships of solo play.
		-----Notice: Not all of "Neutral-crew play" bugs have been fixed but we are aware of some of them that still need fixing, if you do encounter one that can be abused mechanically, please notify the staff member and be mindful of the exploit itself."}

/datum/job/noncrew/is_species_banned(species_name, brain_type)
    // Any species can join as non-crew, including shadekin.
    return FALSE
