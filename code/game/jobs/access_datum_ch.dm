/var/const/access_blueshield = 52
/datum/access/blueshield
	id = access_blueshield
	desc = "Blueshield Guard"
	region = ACCESS_REGION_COMMAND

//special restricted access level, required for the secret locker and crates
//downside is you can't add/remove it via ID consoles, but I figure that's an acceptable tradeoff?
/var/const/access_blueshield_exclusive = 350
/datum/access/blueshield_exclusive
	id = access_blueshield_exclusive
	desc = "Blueshield Special Reserve"
	access_type = ACCESS_TYPE_CENTCOM 
//that last line is what makes it inaccessible: you can add a region but that only makes it appear in the list, and if it has this access_type not even a CD's ID can add/remove it