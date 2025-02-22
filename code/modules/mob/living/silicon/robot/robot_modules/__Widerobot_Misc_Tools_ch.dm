//This file is where we define modules we made but where we did not make the borg
//as an example, Medihound has some new additions from us but upstream defines its additions
//This file is offset in compilation to run before any of the station files.

//TFF 5/1/20 - Add Ore Scanner for mining drones
/obj/item/robot_module/drone/mining/create_equipment()
	..()
	src.modules |= new /obj/item/mining_scanner(src)
