/var/const/access_secpilot = 51
/datum/access/secpilot
	id = access_secpilot
	desc = JOB_SECURITY_PILOT + " Access"
	region = ACCESS_REGION_SECURITY

/var/const/access_blueshield = 52
/datum/access/blueshield
	id = access_blueshield
	desc = JOB_BLUESHIELD_GUARD
	region = ACCESS_REGION_COMMAND

//special restricted access level, required for the secret locker and crates
//downside is you can't add/remove it via ID consoles, but I figure that's an acceptable tradeoff?
/var/const/access_blueshield_exclusive = 350
/datum/access/blueshield_exclusive
	id = access_blueshield_exclusive
	desc = "Blueshield Special Reserve"
	access_type = ACCESS_TYPE_CENTCOM
//that last line is what makes it inaccessible: you can add a region but that only makes it appear in the list, and if it has this access_type not even a CD's ID can add/remove it

var/const/access_fieldmedic = 68
/datum/access/fieldmedic
	id = access_fieldmedic
	desc = JOB_FIELD_MEDIC
	region = ACCESS_REGION_MEDBAY

var/const/access_pathfinder = 69
/datum/access/pathfinder
	id = access_pathfinder
	desc = JOB_PATHFINDER
	region = ACCESS_REGION_RESEARCH
