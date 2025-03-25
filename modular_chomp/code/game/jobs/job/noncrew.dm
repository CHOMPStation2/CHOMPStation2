/datum/job/noncrew
	title = JOB_OUTSIDER
	disallow_jobhop = TRUE
	total_positions = 6
	spawn_positions = 6
	supervisors = "nobody, but you fall under NanoTrasen's Unauthorized Personnel SOP while on NT property. Please read <a href='https://wiki.chompstation13.net/index.php/Rules#Outsiders_Guidelines'>the Outsider Guidelines</a> clearly before playing"

	flag = NONCREW
	departments = list(DEPARTMENT_NONCREW)
	department_flag = OTHER
	faction = "Station"
	assignable = FALSE
	account_allowed = 0
	offmap_spawn = TRUE

	outfit_type = /decl/hierarchy/outfit/noncrew
	job_description = {"Players taking a role of an outsider not employed by NT with no special mechanics. One superpose pod is provided.
		-----Server rules still apply to the fullest
		-----Outsiders are considered unauthorized personnel on Southern Cross.
		-----Outsiders are not allowed to take part in events and mini-event areas unless the EM says otherwise.
		-----Outsiders are not allowed to take station jobs.
		-----Outsiders are not allowed to know more than two department jobs.
		-----Outsiders are expected to behave in accordance with Unauthorized Personnel SOP regardless of their IC knowledge.
		-----Outsiders are not allowed to log-off with station key items (e.g. Captain's spare, station blueprints, nuclear authentication disk, bluespace harpoon, large quantities of station goods, etc). Please leave these items on station or with relevant crew.
		-----We encourage outsiders to take on exploration content as a group, staff will not help you for any hardships of solo play.
		-----Notice: The outsider role is relatively new; if you encounter bugs, please notify a staff member and avoid using exploits."}
	alt_titles = list("Spacefarer" = /datum/alt_title/spacefarer)

/datum/alt_title/spacefarer
	title = "Spacefarer"
	title_outfit = /decl/hierarchy/outfit/noncrew/spacefarer

/*seems to be a kin only thing?
/datum/job/noncrew/is_species_banned(species_name, brain_type)
	// Any species can join as non-crew, including shadekin.
	return FALSE
 */

/datum/job/shadekin
	title = JOB_ANOMALY
	disallow_jobhop = TRUE
	total_positions = 5
	spawn_positions = 5
	supervisors = "nobody, but you fall under NanoTrasen's Unauthorized Personnel SOP while on NT property. Please read <a href='https://wiki.chompstation13.net/index.php/Rules#Shadekin/%22Anomaly%22_Guidelines'>the Shadekin Guidelines</a> clearly before playing"

	flag = NONCREW
	departments = list(DEPARTMENT_NONCREW)
	department_flag = OTHER
	faction = "Station"
	assignable = FALSE
	account_allowed = 0
	offmap_spawn = TRUE
	camp_protection = TRUE //So far leave this for shadekin

	outfit_type = /decl/hierarchy/outfit/noncrew
	job_description = {"Players taking a role of an outsider not employed by NT with no special mechanics. One superpose pod is provided.
		-----Server rules still apply to the fullest
		-----Outsiders are considered unauthorized personnel on Southern Cross.
		-----Outsiders are not allowed to take part in events and mini-event areas unless the EM says otherwise.
		-----Outsiders are not allowed to take station jobs.
		-----Outsiders are not allowed to know more than two department jobs.
		-----Outsiders are expected to behave in accordance with Unauthorized Personnel SOP regardless of their IC knowledge.
		-----Outsiders are not allowed to log-off with station key items (e.g. Captain's spare, station blueprints, nuclear authentication disk, bluespace harpoon, large quantities of station goods, etc). Please leave these items on station or with relevant crew.
		-----We encourage outsiders to take on exploration content as a group, staff will not help you for any hardships of solo play.
		-----Notice: The outsider role is relatively new; if you encounter bugs, please notify a staff member and avoid using exploits."}

/datum/job/shadekin/is_species_banned(species_name, brain_type)
	if(species_name != SPECIES_SHADEKIN)
		return TRUE
	else
		return FALSE

/datum/job/shadekin/update_limit(var/comperator)
	var/current_limit = spawn_positions + round(comperator / 50)
	if(current_limit > total_positions)
		total_positions = current_limit
