//Moved from southern_cross_jobs.vr to fix a runtime
var/const/access_explorer = 43 //CHOMP explo keep
/datum/access/explorer //CHOMP explo keep
	id = access_explorer //CHOMP explo keep
	desc = "Explorer" //CHOMP explo keep
	region = ACCESS_REGION_GENERAL
 //CHOMP explo keep removed a wide comment field on this line
/var/const/access_pathfinder = 44
/datum/access/pathfinder
	id = access_pathfinder
	desc = "Pathfinder"
	region = ACCESS_REGION_GENERAL
 //CHOMP explo keep removed the closing wide comment field on this line. KEEP THE PATHFINDER
var/const/access_pilot = 67
/datum/access/pilot
	id = access_pilot
	desc = "Pilot"
	region = ACCESS_REGION_GENERAL

/var/const/access_talon = 301
/datum/access/talon
	id = access_talon
	desc = "Talon"
	access_type = ACCESS_TYPE_PRIVATE

/var/const/access_xenobotany = 77
/datum/access/xenobotany
	id = access_xenobotany
	desc = "Xenobotany Garden"
	region = ACCESS_REGION_RESEARCH

/var/const/access_entertainment = 72
/datum/access/entertainment
	id = access_entertainment
	desc = "Entertainment Backstage"
	region = ACCESS_REGION_GENERAL

/var/const/access_mime = 138
/datum/access/mime
	id = access_mime
	desc = "Mime Office"
	region = ACCESS_REGION_GENERAL

/var/const/access_clown = 136
/datum/access/clown
	id = access_clown
	desc = "Clown Office"
	region = ACCESS_REGION_GENERAL

/var/const/access_tomfoolery = 137
/datum/access/tomfoolery
	id = access_tomfoolery
	desc = "Tomfoolery Closet"
	region = ACCESS_REGION_GENERAL
