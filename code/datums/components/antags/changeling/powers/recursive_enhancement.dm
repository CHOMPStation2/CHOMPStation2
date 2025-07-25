//Updated
/datum/power/changeling/recursive_enhancement
	name = "Recursive Enhancement"
	desc = "We cause our abilities to have increased or additional effects."
	helptext = "To check the effects for each ability, check the blue text underneath the ability in the evolution menu."
	ability_icon_state = "ling_recursive_enhancement"
	genomecost = 3
	verbpath = /mob/proc/changeling_recursive_enhancement

//Increases macimum chemical storage
/mob/proc/changeling_recursive_enhancement()
	set category = "Changeling"
	set name = "Recursive Enhancement"
	set desc = "Empowers our abilities."
	var/datum/component/antag/changeling/changeling = changeling_power(0,0,100,UNCONSCIOUS)
	if(!changeling)
		return FALSE
	if(changeling.recursive_enhancement)
		to_chat(src, span_warning("We will no longer empower our abilities."))
		changeling.recursive_enhancement = FALSE
		return FALSE
	to_chat(src, span_notice("We empower ourselves. Our abilities will now be extra potent."))
	changeling.recursive_enhancement = TRUE
	feedback_add_details("changeling_powers","RE")
	return TRUE
