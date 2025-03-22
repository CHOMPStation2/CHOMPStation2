
var/const/ENGSEC			=(1<<0)

var/const/CAPTAIN			=(1<<0)
var/const/HOS				=(1<<1)
var/const/WARDEN			=(1<<2)
var/const/DETECTIVE			=(1<<3)
var/const/OFFICER			=(1<<4)
var/const/CHIEF				=(1<<5)
var/const/ENGINEER			=(1<<6)
var/const/ATMOSTECH			=(1<<7)
var/const/AI				=(1<<8)
var/const/CYBORG			=(1<<9)
var/const/BRIGPHYS 			=(1<<10) // CHOMPAdd - Brig Physician
var/const/CLOWN				=(1<<13)
var/const/MIME				=(1<<14)
var/const/INTERN			=(1<<15)

var/const/MEDSCI			=(1<<1)

var/const/RD				=(1<<0)
var/const/SCIENTIST			=(1<<1)
var/const/CHEMIST			=(1<<2)
var/const/CMO				=(1<<3)
var/const/DOCTOR			=(1<<4)
var/const/GENETICIST		=(1<<5)
var/const/VIROLOGIST		=(1<<6)
var/const/PSYCHIATRIST		=(1<<7)
var/const/ROBOTICIST		=(1<<8)
var/const/XENOBIOLOGIST		=(1<<9)
var/const/PARAMEDIC			=(1<<10)
var/const/PATHFINDER 		=(1<<11)
var/const/EXPLORER 			=(1<<12)
var/const/SAR 				=(1<<13)
var/const/XENOBOTANIST		=(1<<14)
var/const/PILOT 			=(1<<15) //ChompEDIT - ours is with the other explo jobs.

var/const/CIVILIAN			=(1<<2)

var/const/HOP				=(1<<0)
var/const/BARTENDER			=(1<<1)
var/const/BOTANIST			=(1<<2)
var/const/CHEF				=(1<<3)
var/const/JANITOR			=(1<<4)
var/const/LIBRARIAN			=(1<<5)
var/const/QUARTERMASTER		=(1<<6)
var/const/CARGOTECH			=(1<<7)
var/const/MINER				=(1<<8)
var/const/LAWYER			=(1<<9)
var/const/CHAPLAIN			=(1<<10)
var/const/ASSISTANT			=(1<<11)
var/const/BRIDGE			=(1<<12)
//var/const/PILOT 			=(1<<13) //ChompEDIT - ours is with the other explo jobs.
var/const/ENTERTAINER		=(1<<14)
var/const/ENTREPRENEUR		=(1<<15)

var/const/OTHER				=(1<<10) //VOREStation Note: Unused on VS. Used downstream.
var/const/NONCREW			=(1<<0)
var/const/ANOMALY			=(1<<0) //VOREStation Note: Unused on VS. Used downstream.
/* // CHOMPedit: Comment out Talon positions, we don't have that here.
//VOREStation Add
var/const/TALON				=(1<<3)

var/const/TALCAP			=(1<<0)
var/const/TALPIL			=(1<<1)
var/const/TALDOC			=(1<<2)
var/const/TALSEC			=(1<<3)
var/const/TALENG			=(1<<4)
var/const/TALMIN			=(1<<5)
//VOREStation Add End
*/

//CHOMPedit start: next chunk doesn't exist upstream, not sure what it's actually used for.
var/list/assistant_occupations = list(
)


var/list/command_positions = list(
	JOB_SITE_MANAGER,
	JOB_HEAD_OF_PERSONNEL,
	JOB_HEAD_OF_SECURITY,
	JOB_CHIEF_ENGINEER,
	JOB_RESEARCH_DIRECTOR,
	JOB_CHIEF_MEDICAL_OFFICER,
	JOB_COMMAND_SECRETARY,
	JOB_BLUESHIELD_GUARD // YW Edit
)


var/list/engineering_positions = list(
	JOB_CHIEF_ENGINEER,
	JOB_ENGINEER,
	JOB_ATMOSPHERIC_TECHNICIAN
)


var/list/medical_positions = list(
	JOB_CHIEF_MEDICAL_OFFICER,
	JOB_MEDICAL_DOCTOR,
	JOB_GENETICIST,
	JOB_PSYCHIATRIST,
	JOB_CHEMIST,
	JOB_PARAMEDIC
)


var/list/science_positions = list(
	JOB_RESEARCH_DIRECTOR,
	JOB_SCIENTIST,
	JOB_GENETICIST,	//Part of both medical and science
	JOB_ROBOTICIST,
	JOB_XENOBIOLOGIST
)

//BS12 EDIT
var/list/cargo_positions = list(
	JOB_QUARTERMASTER,
	JOB_CARGO_TECHNICIAN,
	JOB_SHAFT_MINER
)

var/list/civilian_positions = list(
	JOB_HEAD_OF_PERSONNEL,
	JOB_BARTENDER,
	JOB_BOTANIST,
	JOB_CHEF,
	JOB_JANITOR,
	JOB_LIBRARIAN,
	JOB_ENTREPRENEUR,
	JOB_CHAPLAIN,
	JOB_ALT_VISITOR, //VOREStation Edit - Visitor not Assistant
	JOB_INTERN //VOREStation Edit - Intern
)


var/list/security_positions = list(
	JOB_HEAD_OF_SECURITY,
	JOB_WARDEN,
	JOB_DETECTIVE,
	JOB_SECURITY_OFFICER
)


var/list/planet_positions = list(
	JOB_PATHFINDER, // VOREStation Edit - Added Pathfinder
	JOB_EXPLORER,
	JOB_PILOT,
	JOB_FIELD_MEDIC // VOREStation Edit - Field Medic
)


var/list/nonhuman_positions = list(
	JOB_AI,
	JOB_CYBORG,
	JOB_PAI
)

var/list/whitelisted_positions = list(
	JOB_SITE_MANAGER,
	JOB_HEAD_OF_PERSONNEL,
	JOB_HEAD_OF_SECURITY,
	JOB_CHIEF_ENGINEER,
	JOB_RESEARCH_DIRECTOR,
	JOB_CHIEF_MEDICAL_OFFICER,
	JOB_INTERNAL_AFFAIRS_AGENT,
	JOB_AI
) //CHOMPEdit: end

/proc/guest_jobbans(var/job)
	return // ((job in whitelisted_positions)) // CHOMPedit: spaghetti that is our whitelist system means this prevents use of config/jobswhitelist.txt

/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)	continue
		occupations += job

	return occupations

/proc/get_alternate_titles(var/job)
	var/list/jobs = get_job_datums()
	var/list/titles = list()

	for(var/datum/job/J in jobs)
		if(J.title == job)
			titles = J.alt_titles

	return titles
