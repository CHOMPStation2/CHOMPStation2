/mob/living/proc/toggle_selfsurgery()
	set name = "Allow Robotic Self Surgery"
	set desc = "Toggles the 'safeties' on self-surgery, allowing you to do so. This only works on robotic limbs."
	set category = "Object"

	allow_self_surgery = !allow_self_surgery

	to_chat(usr, "<span class='notice'>You will [allow_self_surgery ? "now" : "no longer"] attempt to operate upon yourself.</span>")
	log_admin("DEBUG \[[world.timeofday]\]: [src.ckey ? "[src.name]:([src.ckey])" : "[src.name]"] has [allow_self_surgery ? "Enabled" : "Disabled"] synthetic self surgery.")
