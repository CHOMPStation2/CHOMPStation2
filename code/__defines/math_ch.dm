//Proc to check if a flag is active to use in universal math
/proc/global_flag_check(element, flag)
	if(element & flag)
		return 1
	else
		return 0
