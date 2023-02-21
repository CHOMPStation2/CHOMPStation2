/mob/living/carbon/human/update_fullness()
	var/previous_stomach_fullness = vore_fullness_ex["stomach"]
	var/previous_taur_fullness = vore_fullness_ex["taur belly"]
	//update_vore_tail_sprite()
	//update_vore_belly_sprite()
	. = ..()
	if(vore_fullness_ex["stomach"] != previous_stomach_fullness)
		update_vore_belly_sprite()
	if(vore_fullness_ex["taur belly"] != previous_taur_fullness)
		update_vore_tail_sprite()

/mob/living/carbon/human/vs_animate(var/belly_to_animate)
	if(belly_to_animate == "stomach")
		vore_belly_animation()
	else if(belly_to_animate == "taur belly")
		vore_tail_animation()
	else
		return

/mob/living/carbon/human/verb/hide_headset()
	set name = "Show/Hide Headset"
	set category = "IC"
	set desc = "Toggle headset worn icon visibility."
	hide_headset = !hide_headset
	update_inv_ears()

/mob/living/carbon/human/verb/hide_glasses()
	set name = "Show/Hide Glasses"
	set category = "IC"
	set desc = "Toggle glasses worn icon visibility."
	hide_glasses = !hide_glasses
	update_inv_glasses()