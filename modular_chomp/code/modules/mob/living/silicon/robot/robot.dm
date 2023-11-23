/mob/living/silicon/robot/verb/purge_nutrition()
	set name = "Purge Nutrition"
	set category = "IC"
	set desc = "Allows you to clear out most of your nutrition if needed."

	if (stat != CONSCIOUS || nutrition <= 1000)
		return
	nutrition = 1000
	to_chat(src, "<span class='warning'>You have purged most of the nutrition lingering in your systems.</span>")
	return TRUE
