/mob/living/silicon/robot/verb/purge_nutrition()
	set name = "Purge Nutrition"
	set category = "IC"
	set desc = "Allows you to clear out your nutrition if needed."

	if (stat != CONSCIOUS)
		return
	nutrition = 0
	to_chat(src, "<span class='warning'>You have purged the nutrition lingering in your systems.</span>")
	return TRUE
