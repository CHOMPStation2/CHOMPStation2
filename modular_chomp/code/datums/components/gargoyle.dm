/datum/component/gargoyle
	var/energy = 100
	var/transformed = FALSE
	var/paused = FALSE
	var/paused_loc
	var/cooldown

	var/mob/living/carbon/human/gargoyle //easy reference
	var/obj/structure/gargoyle/statue //another easy ref

	var/fireloss
	var/bruteloss
	var/sleeping
	var/paralysis
	var/blinded

/datum/component/gargoyle/Initialize()
	if (!ishuman(parent))
		return COMPONENT_INCOMPATIBLE
	var/mob/living/carbon/human/gargoyle = parent
	START_PROCESSING(SSprocessing, src)

/datum/component/gargoyle/process()
	if (!gargoyle)
		return
	if (paused && gargoyle.loc != paused_loc)
		paused = FALSE
		energy -= 20
	if (energy > 0)
		if (!transformed && !paused)
			energy = max(0,energy-0.05)
		else
			paused = 0

	if (transformed)
		if (!statue)
			transformed = FALSE
		statue.health = min(gargoyle.max_health + 100, statue.health + 0.5)
		energy = min(energy+0.3, 100)
		fireloss = max(fireloss - 0.5, 0)
		bruteloss = max(bruteloss - 0.5, 0)

/mob/living/carbon/human/verb/gargoyle_transformation()
	set name = "Gargoyle Petrification"
	set category = "Abilities"
	set desc = "Turn yourself into (or out of) being a gargoyle."

	if (stat == DEAD)
		return

	var/datum/component/gargoyle/comp = GetComponent(/datum/component/gargoyle)
	if (comp?.cooldown > world.time)
		var/time_to_wait = (comp.cooldown - world.time) / (1 SECONDS)
		to_chat(src, "<span class='warning'>You can't activate that ability right now! Wait for another [round(time_to_wait,0.1)] seconds!</span>")

	if (istype(loc, /obj/structure/gargoyle))
		var/obj/structure/gargoyle/statue = loc
		statue.unpetrify()
	else if (isturf(loc))
		var/obj/structure/gargoyle/statue = new(loc, src)