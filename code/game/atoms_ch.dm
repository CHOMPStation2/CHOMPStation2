/atom/proc/contains(var/atom/location)
	if(!location)
		return 0
	if(location == src)
		return 1

	return contains(location.loc)
