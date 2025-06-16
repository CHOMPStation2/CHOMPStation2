//These are intended to be placed via buildmode for rapid deployment of explosions.

/obj/effect/instantboom //Parent is more like a welder bomb
	var/devastation = 0
	var/heavyboom = 1
	var/lightboom = 2
	var/flash = 3
	icon = null

/obj/effect/instantboom/small //Small and will somewhat harm people without causing severe hull damage.
	devastation = 0
	heavyboom = 0
	lightboom = 3
	flash = 0

/obj/effect/instantboom/small/wide
	lightboom = 5

/obj/effect/instantboom/medium //Will cause hull damage and severely harm people at the epicenter. No gib
	devastation = 0
	heavyboom = 3
	lightboom = 5
	flash = 6

/obj/effect/instantboom/large //Like getting hit directly with artillery
	devastation = 2
	heavyboom = 4
	lightboom = 6
	flash = 8

/obj/effect/instantboom/large/concentrated //heavyboom damage in smaller area, perfect 5x5 size
	devastation = 1
	heavyboom = 3
	lightboom = 3
	flash = 3

/obj/effect/instantboom/large/wide //Same as large but more collateral
	lightboom = 9
	flash = 10

/obj/effect/instantboom/maxcap //Will delete departments, spam at your own risk
	devastation = 4
	heavyboom = 7
	lightboom = 14
	flash = 14

/obj/effect/instantboom/mininuke //lol
	devastation = 5
	heavyboom = 10
	lightboom = 20
	flash = 25

/obj/effect/instantboom/harmless //Just the noise
	devastation = 0
	heavyboom = 0
	lightboom = 0
	flash = 0

/obj/effect/instantboom/bluespace_atrillery //Fuck that one person in paticular
	devastation = 1
	heavyboom = 0
	lightboom = 0
	flash = 0

/obj/effect/instantboom/Initialize(mapload)
	..()
	var/turf/T = get_turf(src)
	explosion(T,devastation,heavyboom,lightboom,flash)
	return INITIALIZE_HINT_QDEL
