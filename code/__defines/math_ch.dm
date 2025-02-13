//Proc to check if a flag is active to use in universal math
/proc/global_flag_check(element, flag)
	if(element & flag)
		return 1
	else
		return 0

#define GAUSSIAN_RANDOM(vars...)	((-2*log(rand()))**0.5 * cos(6.28318530718*rand()))
