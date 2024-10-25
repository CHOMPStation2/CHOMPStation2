//Proc to check if a flag is active to use in universal math
/proc/global_flag_check(element, flag)
	if(element & flag)
		return 1
	else
		return 0

// sqrt, but if you give it a negative number, you get 0 instead of a runtime
/proc/sqrtor0(num)
	if(num < 0)
		return 0
	return sqrt(num)
