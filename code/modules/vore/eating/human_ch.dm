/*
init_vore() was moved to only be called when vore organs are needed. This is also responsible for loading vore prefs.
This file is here to make vore prefs default to off so that someone who hasn't opened their vore panel during a round
won't accidentally be prefbroken.

Also, these should've been defaulted to off in the first place.
*/
/mob/living/carbon/human
	digestable = FALSE
	devourable = FALSE
	feeding = FALSE
	absorbable = FALSE
	digest_leave_remains = FALSE
	allowmobvore = FALSE
	showvoreprefs = FALSE
	permit_healbelly = FALSE
	can_be_drop_prey = FALSE
	can_be_drop_pred = FALSE
	show_vore_fx = FALSE