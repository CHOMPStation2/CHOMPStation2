
/client/New()
	..()
	dir = NORTH

/client/verb/spinleft()
	set name = "Spin View CCW"
<<<<<<< HEAD
	set category = "OOC.Game" //CHOMPEdit
=======
	set category = "OOC.Game"
>>>>>>> 4879a52633 (Server maint subsystem (#16518))
	dir = turn(dir, 90)

/client/verb/spinright()
	set name = "Spin View CW"
<<<<<<< HEAD
	set category = "OOC.Game" //CHOMPEdit
=======
	set category = "OOC.Game"
>>>>>>> 4879a52633 (Server maint subsystem (#16518))
	dir = turn(dir, -90)
