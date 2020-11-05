// Consolidate all of the Science Jobs in one.

//////////////////////////////////
//			Scientist
//////////////////////////////////
/datum/job/scientist
	title = "Scientist"
	flag = SCIENTIST
	departments = list(DEPARTMENT_RESEARCH)
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	pto_type = PTO_SCIENCE
	supervisors = "the Research Director"
	selection_color = "#633D63"
	economic_modifier = 7
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_xenoarch, access_xenobotany, access_hydroponics,)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenoarch)

	minimal_player_age = 3

	outfit_type = /decl/hierarchy/outfit/job/science/scientist
	job_description = "A Scientist is a generalist working in the Research department, with general knowledge of the scientific process, as well as \
						the principles and requirements of Research and Development. They may also formulate experiments of their own devising, if \
						they find an appropriate topic."
	alt_titles = list("Xenoarchaeologist" = /datum/alt_title/xenoarch, "Anomalist" = /datum/alt_title/anomalist, \
						"Phoron Researcher" = /datum/alt_title/phoron_research, "Circuit Designer" = /datum/alt_title/circuit_designer, \
						"Xenobiologist" = /datum/alt_title/xenobiologist, "Xenobotanist" = /datum/alt_title/xenobotanist, \
						"Roboticist" = /datum/alt_title/roboticist, "Biomechanical Engineer" = /datum/alt_title/biomech, \
						"Mechatronic Engineer" = /datum/alt_title/mech_tech)

// Scientist Alt Titles
/datum/alt_title/xenoarch
	title = "Xenoarchaeologist"
	title_blurb = "A Xenoarchaeologist enters digsites in search of artifacts of alien origin. These digsites are frequently in vacuum or other inhospitable \
					locations, and as such a Xenoarchaeologist should be prepared to handle hostile evironmental conditions."

/datum/alt_title/anomalist
	title = "Anomalist"
	title_blurb = "An Anomalist is a Scientist whose expertise is analyzing alien artifacts. They are familar with the most common methods of testing artifact \
					function. They work closely with Xenoarchaeologists, or Miners, if either role is present."

/datum/alt_title/phoron_research
	title = "Phoron Researcher"
	title_blurb = "A Phoron Researcher is a specialist in the practical applications of phoron, and has knowledge of its practical uses and dangers. \
					Many Phoron Researchers are interested in the combustability and explosive properties of gaseous phoron, as well as the specific hazards \
					of working with the substance in that state."

/datum/alt_title/circuit_designer
	title = "Circuit Designer"
	title_blurb = "A Circuit Designer is a Scientist whose expertise is working with integrated circuits. They are familar with the workings and programming of those devices. \
				   They work to create various useful devices using the capabilities of integrated circuitry."

/datum/alt_title/xenobiologist
	title = "Xenobiologist"
	title_blurb = "A Xenobiologist studies esoteric lifeforms, usually in the relative safety of their lab. They attempt to find ways to benefit \
					from the byproducts of these lifeforms, and their main subject at present is the Giant Slime."
	title_outfit = /decl/hierarchy/outfit/job/science/xenobiologist

/datum/alt_title/xenobotanist
	title = "Xenobotanist"
	title_blurb = "A Xenobotanist grows and cares for a variety of abnormal, custom made, and frequently dangerous plant life. When the products of these plants \
					are both safe and beneficial to the station, they may choose to introduce it to the rest of the crew."
	title_outfit = /decl/hierarchy/outfit/job/science/xenobiologist

/datum/alt_title/roboticist
	title = "Roboticist"
	title_blurb = "A Roboticist maintains and repairs the station's synthetics, including crew with prosthetic limbs. \
						They can also assist the station by producing simple robots and even pilotable exosuits."
	title_outfit = /decl/hierarchy/outfit/job/science/roboticist

/datum/alt_title/biomech
	title = "Biomechanical Engineer"
	title_blurb = "A Biomechanical Engineer primarily works on prosthetics, and the organic parts attached to them. They may have some \
					knowledge of the relatively simple surgical procedures used in making cyborgs and attaching prosthesis."
	title_outfit = /decl/hierarchy/outfit/job/science/roboticist

/datum/alt_title/mech_tech
	title = "Mechatronic Engineer"
	title_blurb = "A Mechatronic Engineer focuses on the construction and maintenance of Exosuits, and should be well versed in their use. \
					They may also be called upon to work on synthetics and prosthetics, if needed."
	title_outfit = /decl/hierarchy/outfit/job/science/roboticist
