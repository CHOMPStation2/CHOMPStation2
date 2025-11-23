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
