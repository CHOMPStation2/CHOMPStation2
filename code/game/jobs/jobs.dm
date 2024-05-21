
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

var/const/OTHER				=(1<<10) //CHOMPStation Add
var/const/NONCREW			=(1<<0) //CHOMPStation Add
var/const/ANOMALY			=(1<<0) //CHOMPstation Add
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
	"Site Manager",
	"Head of Personnel",
	"Head of Security",
	"Chief Engineer",
	"Research Director",
	"Chief Medical Officer",
	"Command Secretary",
	"Blueshield Guard" // YW Edit
)


var/list/engineering_positions = list(
	"Chief Engineer",
	"Station Engineer",
	"Atmospheric Technician"
)


var/list/medical_positions = list(
	"Chief Medical Officer",
	"Medical Doctor",
	"Geneticist",
	"Psychiatrist",
	"Chemist",
	"Paramedic"
)


var/list/science_positions = list(
	"Research Director",
	"Scientist",
	"Geneticist",	//Part of both medical and science
	"Roboticist",
	"Xenobiologist"
)

//BS12 EDIT
var/list/cargo_positions = list(
	"Quartermaster",
	"Cargo Technician",
	"Shaft Miner"
)

var/list/civilian_positions = list(
	"Head of Personnel",
	"Bartender",
	"Botanist",
	"Chef",
	"Janitor",
	"Librarian",
	"Lawyer",
	"Chaplain",
	USELESS_JOB, //VOREStation Edit - Visitor not Assistant
	"Intern" //VOREStation Edit - Intern
)


var/list/security_positions = list(
	"Head of Security",
	"Warden",
	"Detective",
	"Security Officer"
)


var/list/planet_positions = list(
	"Pathfinder", // VOREStation Edit - Added Pathfinder
	"Explorer",
	"Pilot",
	"Field Medic" // VOREStation Edit - Field Medic
)


var/list/nonhuman_positions = list(
	"AI",
	"Cyborg",
	"pAI"
)

var/list/whitelisted_positions = list(
	"Site Manager",
	"Head of Personnel",
	"Head of Security",
	"Chief Engineer",
	"Research Director",
	"Chief Medical Officer",
	"Internal Affairs Agent",
	"AI"
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
