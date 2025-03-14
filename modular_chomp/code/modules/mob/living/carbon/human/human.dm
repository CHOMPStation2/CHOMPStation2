/mob/living/carbon/human/verb/hide_headset()
	set name = "Show/Hide Headset"
	set category = "IC.Settings"
	set desc = "Toggle headset worn icon visibility."
	hide_headset = !hide_headset
	update_inv_ears()

/mob/living/carbon/human/verb/hide_glasses()
	set name = "Show/Hide Glasses"
	set category = "IC.Settings"
	set desc = "Toggle glasses worn icon visibility."
	hide_glasses = !hide_glasses
	update_inv_glasses()

/mob/living/carbon/human/proc/synth_reag_toggle()
	set name = "Toggle Reagent Processing"
	set category = "Abilities.Vore"
	set desc = "Toggle reagent processing as synth."
	synth_reag_processing = !synth_reag_processing

//Formally used from a paper, gave this to everyone.
/mob/living/carbon/human/verb/create_area()
	set name = "Create Area"
	set desc = "Create an area in a enclosed space, making it able to be powered by an APC."
	set category = "IC.Game"

	if(stat || world.time < last_special)
		to_chat(usr, span_warning("You recently tried to create an area. Wait a while before using it again."))
		return

	last_special = world.time + 2 SECONDS // Antispam.
	create_new_area(usr)
	return
