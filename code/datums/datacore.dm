
/hook/startup/proc/createDatacore()
	data_core = new /datum/datacore()
	return 1

/datum/datacore
	var/name = "datacore"
	//For general station crew
	var/static/list/medical = list()
	var/static/list/general = list()
	var/static/list/security = list()
	//For offmap spawns so they can have records accessible by certain things
	var/static/list/hidden_medical = list()
	var/static/list/hidden_general = list()
	var/static/list/hidden_security = list()
	//This list tracks characters spawned in the world and cannot be modified in-game. Currently referenced by respawn_character().
	var/static/list/locked = list()

// CHOMPedit Start - Crew Manifest
/datum/datacore/proc/get_manifest(OOC)
	var/list/manifest_out = list(
		"Heads",
		"Security",
		"Engineering",
		"Medical",
		"Science",
		"Cargo",
		"Exploration",
		"Civillian",
		"Silicon"
	)

	var/list/departments = list(
		"Heads" = SSjob.get_job_titles_in_department(DEPARTMENT_COMMAND),
		"Security" = SSjob.get_job_titles_in_department(DEPARTMENT_SECURITY),
		"Engineering" = SSjob.get_job_titles_in_department(DEPARTMENT_ENGINEERING),
		"Medical" = SSjob.get_job_titles_in_department(DEPARTMENT_MEDICAL),
		"Science" = SSjob.get_job_titles_in_department(DEPARTMENT_RESEARCH),
		"Cargo" = SSjob.get_job_titles_in_department(DEPARTMENT_CARGO),
		"Exploration" = SSjob.get_job_titles_in_department(DEPARTMENT_PLANET),
		"Civillian" = SSjob.get_job_titles_in_department(DEPARTMENT_CIVILIAN),
		"Silicon" = SSjob.get_job_titles_in_department(DEPARTMENT_SYNTHETIC)
	)

	for(var/datum/data/record/t in data_core.general)
		var/name = t.fields["name"]
		var/rank = t.fields["rank"]
		var/real_rank = make_list_rank(t.fields["real_rank"])

		var/active = 0
		for(var/mob/M in player_list)
			if(M.real_name == name && M.client && M.client.inactivity <= 10 MINUTES)
				active = 1
				break

		var/has_department = FALSE
		for(var/department in departments)
			var/list/jobs = departments[department]
			if(real_rank in jobs)
				if(!manifest_out[department])
					manifest_out[department] = list()
				// Append to beginning of list if captain or department head
				if (real_rank == "Captain" || (department != "Command" && (SSjob.is_job_in_department(real_rank, DEPARTMENT_COMMAND))))
					manifest_out[department] = list(list(
						"name" = name,
						"rank" = rank,
						"active" = active ? "Active" : "Inactive"
					)) + manifest_out[department]
				else
					manifest_out[department] += list(list(
						"name" = name,
						"rank" = rank,
						"active" = active ? "Active" : "Inactive"
					))
				has_department = TRUE
		if(!has_department)
			if(!manifest_out["Misc"])
				manifest_out["Misc"] = list()
			manifest_out["Misc"] += list(list(
				"name" = name,
				"rank" = rank,
				"active" = active ? "Active" : "Inactive"
			))

	if(OOC)
		manifest_out += "Offmap Spawns"

		for(var/datum/data/record/t in hidden_general)
			var/name = t.fields["name"]
			var/rank = t.fields["rank"]
			var/real_rank = make_list_rank(t.fields["real_rank"])

			var/active = 0
			for(var/mob/M in player_list)
				if(M.real_name == name && M.client && M.client.inactivity <= 10 MINUTES)
					active = 1
					break

			var/datum/job/J = SSjob.get_job(real_rank)
			if(J?.offmap_spawn)
				manifest_out["Offmap Spawns"] += list(list(
					"name" = name,
					"rank" = rank,
					"active" = active ? "Active" : "Inactive"
				))

	// Synthetics don't have actual records, so we will pull them from here.
	for(var/mob/living/silicon/ai/ai in mob_list)
		manifest_out["Silicon"] += list(list(
			"name" = ai.name,
			"rank" = "Artificial Intelligence",
			//"active" = active ? "Active" : "Inactive"
			"active" = ""
		))

	for(var/mob/living/silicon/robot/robot in mob_list)
		// No combat/syndicate cyborgs, no drones, and no AI shells.
		if(!robot.scrambledcodes && !robot.shell && !(robot.module && robot.module.hide_on_manifest()))
			manifest_out["Silicon"] += list(list(
				"name" = robot.name,
				"rank" = "[robot.modtype] [robot.braintype]",
				//"active" = active ? "Active" : "Inactive"
				"active" = ""
			))

	for (var/department in departments)
		if (!manifest_out[department])
			manifest_out -= department
	return manifest_out

		/*
		if(OOC)
			var/active = 0
			for(var/mob/M in player_list)
				if(M.real_name == name && M.client && M.client.inactivity <= 10 MINUTES)
					active = 1
					break
			isactive[name] = active ? "Active" : "Inactive"
		else
			isactive[name] = t.fields["p_stat"]
			//to_world("[name]: [rank]")
			//cael - to prevent multiple appearances of a player/job combination, add a continue after each line
		var/department = 0
		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_COMMAND))
			heads[name] = rank
			department = 1
		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_SECURITY))
			sec[name] = rank
			department = 1
		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_ENGINEERING))
			eng[name] = rank
			department = 1
		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_MEDICAL))
			med[name] = rank
			department = 1
		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_RESEARCH))
			sci[name] = rank
			department = 1
		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_CARGO))
			car[name] = rank
			department = 1
		//VOREStation Add Begin
		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_PLANET))
			pla[name] = rank
			department = 1
		//VOREStation Add End
		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_CIVILIAN))
			civ[name] = rank
			department = 1
		if(!department && !(name in heads))
			misc[name] = rank

	//For the offmap spawns
	if(OOC)
		for(var/datum/data/record/t in hidden_general)
			var/name = t.fields["name"]
			var/rank = t.fields["rank"]
			var/real_rank = make_list_rank(t.fields["real_rank"])



			var/datum/job/J = SSjob.get_job(real_rank)
			if(J?.offmap_spawn)
				off[name] = rank

	// Synthetics don't have actual records, so we will pull them from here.
	for(var/mob/living/silicon/ai/ai in mob_list)
		bot[ai.name] = "Artificial Intelligence"

	for(var/mob/living/silicon/robot/robot in mob_list)
		// No combat/syndicate cyborgs, no drones, and no AI shells.
		if(!robot.scrambledcodes && !robot.shell && !(robot.module && robot.module.hide_on_manifest()))
			bot[robot.name] = "[robot.modtype] [robot.braintype]"

*/

/datum/datacore/proc/get_manifest_html(monochrome = FALSE, OOC, snowflake = FALSE)
	var/list/manifest = get_manifest()
	var/dat = {"
	<head><style>
		.manifest {border-collapse:collapse;}
		.manifest td, th {border:1px solid [monochrome?"black":"[OOC?"black; background-color:#272727; color:white":"#DEF; background-color:white; color:black"]"]; padding:.25em}
		.manifest th {height: 2em; [monochrome?"border-top-width: 3px":"background-color: [OOC?"#40628A":"#48C"]; color:white"]}
		.manifest tr.head th { [monochrome?"border-top-width: 1px":"background-color: [OOC?"#013D3B;":"#488;"]"] }
		.manifest td:first-child {text-align:right}
		.manifest tr.alt td {[monochrome?"border-top-width: 2px":"background-color: [OOC?"#373737; color:white":"#DEF"]"]}
	</style></head>
	<table class="manifest" width='350px'>
	[snowflake?"<tr><th colspan=3 style = \"background-color: #026e6a\"><b>Online players:</b> [TGS_CLIENT_COUNT]</th></tr><tr><th colspan=3 style = \"background-color: #027a76\"><b>Crew members:</b> [data_core.general.len]</th></tr><tr class='head'>":""]
	<tr class='head'><th>Name</th><th>Rank</th><th>Activity</th></tr>
	"} //Also a chompstation edit with the snowflake stuff on line 43

	for(var/department in manifest)
		var/list/entries = manifest[department]
		dat += "<tr><th colspan=3>[department]</th></tr>"
		//JUST
		var/even = 0
		for(var/entry in entries)
			var/list/entry_list = entry
			dat += "<tr[even ? " class='alt'" : ""]><td>[entry_list["name"]]</td><td>[entry_list["rank"]]</td><td>[entry_list["active"]]</td></tr>"
			even = !even

	dat += "</table>"
	dat = replacetext(dat, "\n", "") // so it can be placed on paper correctly
	dat = replacetext(dat, "\t", "")
	return dat
// CHOMPEdit End

/*
We can't just insert in HTML into the nanoUI so we need the raw data to play with.
Instead of creating this list over and over when someone leaves their PDA open to the page
we'll only update it when it changes.  The PDA_Manifest global list is zeroed out upon any change
using /datum/datacore/proc/manifest_inject( ), or manifest_insert( )
*/

var/global/list/PDA_Manifest = list()

/datum/datacore/proc/get_manifest_list()
	if(PDA_Manifest.len)
		return
	/* CHOMPedit Start - Crew Manifest
	var/list/heads = list()
	var/list/sec = list()
	var/list/eng = list()
	var/list/med = list()
	var/list/sci = list()
	var/list/car = list()
	var/list/pla = list() // Planetside crew: Explorers, Pilots, S&S
	var/list/civ = list()
	var/list/bot = list()
	var/list/misc = list()
	for(var/datum/data/record/t in data_core.general)
		var/name = sanitize(t.fields["name"])
		var/rank = sanitize(t.fields["rank"])
		var/real_rank = make_list_rank(t.fields["real_rank"])

		var/isactive = t.fields["p_stat"]
		var/department = 0
		var/depthead = 0 			// Department Heads will be placed at the top of their lists.
		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_COMMAND))
			heads[++heads.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			depthead = 1
			if(rank=="Site Manager" && heads.len != 1)
				heads.Swap(1,heads.len)

		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_SECURITY))
			sec[++sec.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && sec.len != 1)
				sec.Swap(1,sec.len)

		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_ENGINEERING))
			eng[++eng.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && eng.len != 1)
				eng.Swap(1,eng.len)

		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_MEDICAL))
			med[++med.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && med.len != 1)
				med.Swap(1,med.len)

		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_RESEARCH))
			sci[++sci.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && sci.len != 1)
				sci.Swap(1,sci.len)

		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_PLANET))
			pla[++pla.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1

		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_CARGO))
			car[++car.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && car.len != 1)
				car.Swap(1,car.len)

		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_CIVILIAN))
			civ[++civ.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && civ.len != 1)
				civ.Swap(1,civ.len)

		if(SSjob.is_job_in_department(real_rank, DEPARTMENT_SYNTHETIC))
			bot[++bot.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1

		if(!department && !(name in heads))
			misc[++misc.len] = list("name" = name, "rank" = rank, "active" = isactive)

	// Synthetics don't have actual records, so we will pull them from here.
	// Synths don't have records, which is the means by which isactive is retrieved, so I'm hardcoding it to active, don't really have any better means
	for(var/mob/living/silicon/ai/ai in mob_list)
		bot[++bot.len] = list("name" = ai.real_name, "rank" = "Artificial Intelligence", "active" = "Active")

	for(var/mob/living/silicon/robot/robot in mob_list)
		// No combat/syndicate cyborgs, no drones, and no AI shells.
		if(robot.scrambledcodes || robot.shell || (robot.module && robot.module.hide_on_manifest()))
			continue

		bot[++bot.len] = list("name" = robot.real_name, "rank" = "[robot.modtype] [robot.braintype]", "active" = "Active")


	PDA_Manifest = list(
		list("cat" = "Command", "elems" = heads),
		list("cat" = "Security", "elems" = sec),
		list("cat" = "Engineering", "elems" = eng),
		list("cat" = "Medical", "elems" = med),
		list("cat" = "Science", "elems" = sci),
		list("cat" = "Cargo", "elems" = car),
		list("cat" = "Exploration", "elems" = pla), // VOREStation Edit
		list("cat" = "Civilian", "elems" = civ),
		list("cat" = "Silicon", "elems" = bot),
		list("cat" = "Miscellaneous", "elems" = misc)
		)
	*/ // CHOMPedit End
	PDA_Manifest = get_manifest()
	return

/datum/datacore/proc/manifest()
	spawn()
		for(var/mob/living/carbon/human/H in player_list)
			manifest_inject(H)
		return

/datum/datacore/proc/manifest_modify(var/name, var/assignment, var/rank)
	ResetPDAManifest()
	var/datum/data/record/foundrecord
	var/real_title = assignment

	for(var/datum/data/record/t in data_core.general)
		if (t)
			if(t.fields["name"] == name)
				foundrecord = t
				break

	var/list/all_jobs = get_job_datums()

	for(var/datum/job/J in all_jobs)
		if(J.title == rank)					//If we have a rank, just default to using that.
			real_title = rank
			break
		else if(J.title == assignment)
			real_title = assignment
			break
		else
			var/list/alttitles = get_alternate_titles(J.title)
			if(assignment in alttitles)
				real_title = J.title
				break

	if(foundrecord)
		foundrecord.fields["rank"] = assignment
		foundrecord.fields["real_rank"] = real_title

/datum/datacore/proc/manifest_inject(var/mob/living/carbon/human/H)
	if(H.mind && !player_is_antag(H.mind, only_offstation_roles = 1))
		var/assignment = GetAssignment(H)
		var/hidden
		var/datum/job/J = SSjob.get_job(H.mind.assigned_role)
		hidden = J?.offmap_spawn

		H.ImmediateOverlayUpdate()

		var/id = generate_record_id()
		//General Record
		var/datum/data/record/G = CreateGeneralRecord(H, id, hidden)
		G.fields["name"]		= H.real_name
		G.fields["real_rank"]	= H.mind.assigned_role
		G.fields["rank"]		= assignment
		G.fields["age"]			= H.age
		G.fields["languages"] = list2text(H.languages,", ")
		if(H.get_FBP_type())
			G.fields["brain_type"] = H.get_FBP_type()
		else
			G.fields["brain_type"] = "Organic"
		G.fields["fingerprint"]	= md5(H.dna.uni_identity)
		G.fields["p_stat"]		= "Active"
		G.fields["m_stat"]		= "Stable"
		G.fields["sex"]			= gender2text(H.gender)
		G.fields["species"]		= "[H.custom_species ? "[H.custom_species] ([H.species.name])" : H.species.name]" //VOREStation Edit
		G.fields["home_system"]	= H.home_system
		G.fields["birthplace"]	= H.birthplace
		G.fields["citizenship"]	= H.citizenship
		G.fields["faction"]		= H.personal_faction
		G.fields["religion"]	= H.religion
		if(H.gen_record && !jobban_isbanned(H, "Records"))
			G.fields["notes"] = H.gen_record

		//Medical Record
		var/datum/data/record/M = CreateMedicalRecord(H.real_name, id, hidden)
		M.fields["species"]		= "[H.custom_species ? "[H.custom_species] ([H.species.name])" : H.species.name]" //VOREStation Edit
		M.fields["b_type"]		= H.b_type
		M.fields["blood_reagent"]	= H.species.blood_reagents
		M.fields["b_dna"]		= H.dna.unique_enzymes
		M.fields["id_gender"]	= gender2text(H.identifying_gender)
		if(H.get_FBP_type())
			M.fields["brain_type"] = H.get_FBP_type()
		else
			M.fields["brain_type"] = "Organic"
		if(H.med_record && !jobban_isbanned(H, "Records"))
			M.fields["notes"] = H.med_record

		//Security Record
		var/datum/data/record/S = CreateSecurityRecord(H.real_name, id, hidden)
		S.fields["species"]		= "[H.custom_species ? "[H.custom_species] ([H.species.name])" : H.species.name]" //VOREStation Edit
		if(H.get_FBP_type())
			S.fields["brain_type"] = H.get_FBP_type()
		else
			S.fields["brain_type"] = "Organic"
		if(H.sec_record && !jobban_isbanned(H, "Records"))
			S.fields["notes"] = H.sec_record

		//Locked Record
		var/datum/data/record/L = new()
		L.fields["id"]			= md5("[H.real_name][H.mind.assigned_role]")
		L.fields["name"]		= H.real_name
		L.fields["rank"] 		= H.mind.assigned_role
		L.fields["age"]			= H.age
		L.fields["languages"] = list2text(H.languages,", ")
		L.fields["fingerprint"]	= md5(H.dna.uni_identity)
		L.fields["sex"]			= gender2text(H.gender)
		L.fields["id_gender"]	= gender2text(H.identifying_gender)
		if(H.get_FBP_type())
			L.fields["brain_type"] = H.get_FBP_type()
		else
			L.fields["brain_type"] = "Organic"
		L.fields["b_type"]		= H.b_type
		L.fields["b_dna"]		= H.dna.unique_enzymes
		L.fields["enzymes"]		= H.dna.SE // Used in respawning
		L.fields["identity"]	= H.dna.UI // "
		L.fields["species"]		= "[H.custom_species ? "[H.custom_species] ([H.species.name])" : H.species.name]" //VOREStation Edit
		L.fields["home_system"]	= H.home_system
		L.fields["birthplace"]	= H.birthplace
		L.fields["citizenship"]	= H.citizenship
		L.fields["faction"]		= H.personal_faction
		L.fields["religion"]	= H.religion
		L.fields["image"]		= icon(cached_character_icon(H), dir = SOUTH)
		L.fields["antagfac"]	= H.antag_faction
		L.fields["antagvis"]	= H.antag_vis
		L.fields["offmap"]      = hidden
		if(H.exploit_record && !jobban_isbanned(H, "Records"))
			L.fields["exploit_record"] = H.exploit_record
		else
			L.fields["exploit_record"] = "No additional information acquired."
		locked += L
	return

/proc/generate_record_id()
	return add_zero(num2hex(rand(1, 65535)), 4)	//no point generating higher numbers because of the limitations of num2hex

/datum/datacore/proc/CreateGeneralRecord(var/mob/living/carbon/human/H, var/id, var/hidden)
	ResetPDAManifest()
	var/icon/front
	var/icon/side
	if(H)
		var/icon/charicon = cached_character_icon(H)
		front = icon(charicon, dir = SOUTH, frame = 1)
		side = icon(charicon, dir = WEST, frame = 1)
	else // Sending null things through browse_rsc() makes a runtime and breaks the console trying to view the record.
		front = icon('html/images/no_image32.png')
		side = icon('html/images/no_image32.png')

	if(!id)
		id = text("[]", add_zero(num2hex(rand(1, 65536)), 4))
	var/datum/data/record/G = new /datum/data/record()
	G.name = "Employee Record #[id]"
	G.fields["name"] = "New Record"
	G.fields["id"] = id
	G.fields["rank"] = "Unassigned"
	G.fields["real_rank"] = "Unassigned"
	G.fields["sex"] = "Unknown"
	G.fields["age"] = "Unknown"
	G.fields["languages"] = "Unknown"
	G.fields["brain_type"] = "Unknown"
	G.fields["fingerprint"] = "Unknown"
	G.fields["p_stat"] = "Active"
	G.fields["m_stat"] = "Stable"
	G.fields["species"] = SPECIES_HUMAN
	G.fields["home_system"]	= "Unknown"
	G.fields["birthplace"]	= "Unknown"
	G.fields["citizenship"]	= "Unknown"
	G.fields["faction"]		= "Unknown"
	G.fields["religion"]	= "Unknown"
	G.fields["photo_front"]	= front
	G.fields["photo_side"]	= side
	G.fields["photo-south"] = "'data:image/png;base64,[icon2base64(front)]'"
	G.fields["photo-west"] = "'data:image/png;base64,[icon2base64(side)]'"
	G.fields["notes"] = "No notes found."
	if(hidden)
		hidden_general += G
	else
		general += G

	return G

/datum/datacore/proc/CreateSecurityRecord(var/name, var/id, var/hidden)
	ResetPDAManifest()
	var/datum/data/record/R = new /datum/data/record()
	R.name = "Security Record #[id]"
	R.fields["name"] = name
	R.fields["species"] = SPECIES_HUMAN
	R.fields["id"] = id
	R.fields["brain_type"] = "Unknown"
	R.fields["criminal"]	= "None"
	R.fields["mi_crim"]		= "None"
	R.fields["mi_crim_d"]	= "No minor crime convictions."
	R.fields["ma_crim"]		= "None"
	R.fields["ma_crim_d"]	= "No major crime convictions."
	R.fields["notes"]		= "No notes."
	R.fields["notes"] = "No notes."
	if(hidden)
		hidden_security += R
	else
		security += R

	return R

/datum/datacore/proc/CreateMedicalRecord(var/name, var/id, var/hidden)
	ResetPDAManifest()
	var/datum/data/record/M = new()
	M.name = "Medical Record #[id]"
	M.fields["id"]			= id
	M.fields["name"]		= name
	M.fields["species"]		= SPECIES_HUMAN
	M.fields["b_type"]		= "AB+"
	M.fields["b_dna"]		= md5(name)
	M.fields["id_gender"]	= "Unknown"
	M.fields["brain_type"]	= "Unknown"
	M.fields["mi_dis"]		= "None"
	M.fields["mi_dis_d"]	= "No minor disabilities have been declared."
	M.fields["ma_dis"]		= "None"
	M.fields["ma_dis_d"]	= "No major disabilities have been diagnosed."
	M.fields["alg"]			= "None"
	M.fields["alg_d"]		= "No allergies have been detected in this patient."
	M.fields["cdi"]			= "None"
	M.fields["cdi_d"]		= "No diseases have been diagnosed at the moment."
	M.fields["notes"] = "No notes found."
	if(hidden)
		hidden_medical += M
	else
		medical += M

	return M

/datum/datacore/proc/ResetPDAManifest()
	if(PDA_Manifest.len)
		PDA_Manifest.Cut()

/proc/find_general_record(field, value)
	return find_record(field, value, data_core.general)

/proc/find_medical_record(field, value)
	return find_record(field, value, data_core.medical)

/proc/find_security_record(field, value)
	return find_record(field, value, data_core.security)

/proc/find_record(field, value, list/L)
	for(var/datum/data/record/R in L)
		if(R.fields[field] == value)
			return R

/proc/GetAssignment(var/mob/living/carbon/human/H)
	if(H.mind.role_alt_title)
		return H.mind.role_alt_title
	else if(H.mind.assigned_role)
		return H.mind.assigned_role
	else if(H.job)
		return H.job
	else
		return "Unassigned"
