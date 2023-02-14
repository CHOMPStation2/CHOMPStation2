/datum/component/gargoyle
	var/energy = 100
	var/transformed = FALSE
	var/paused = FALSE
	var/cooldown
	var/paused_loc
	var/mob/living/carbon/human/gargoyle //easy reference

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
	if (!transformed && !paused && energy > 0)
		energy = max(0,energy-0.05)
	if (transformed)
		energy = min(energy+0.3, 100)
		H.adjustBruteLoss(-0.5)
		H.adjustFireLoss(-0.5)