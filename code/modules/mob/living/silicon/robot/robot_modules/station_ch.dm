//TFF 5/1/20 - Add Ore Scanner for mining drones
/obj/item/weapon/robot_module/drone/mining/New()
	..()
	src.modules += new /obj/item/weapon/mining_scanner(src)