//
//Patching some things in R-UST for Yawn Wider - Gozulio
//


/obj/machinery/computer/fusion_core_control/emp_act(severity)
	..()
	timedEmp()

/obj/machinery/computer/fusion_fuel_control/emp_act(severity)
	..()
	timedEmp()

/obj/machinery/computer/gyrotron_control/emp_act(severity)
	..()
	timedEmp()

/obj/machinery/computer/proc/timedEmp()
	var/emptime = rand(10)
	sleep(emptime)
	stat &= ~BROKEN
	update_icon()