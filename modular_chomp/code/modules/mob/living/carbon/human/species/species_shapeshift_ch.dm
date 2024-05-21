/mob/living/carbon/human/proc/shapeshifter_reassemble()

	set name = "Complete Reform"
	set category = "Abilities.Shapeshift"

	if(stat || world.time < last_special)
		return

	last_special = world.time + 50

	if (tgui_alert(src, "Are you sure you want to reform yourself? This will reset you to what you look like in your current preferences slot.", "Reform", list("Yes","Cancel")) != "Yes")
		return

	var/input = tgui_alert(src,{"Include Flavourtext?"},"Reformation",list("Yes","No","Cancel"))
	if(input == "Cancel" || !input)
		return
	var/flavour = 0
	if(input == "Yes")
		flavour = 1
	input = tgui_alert(src,{"Include OOC notes?"},"Reformation",list("Yes","No","Cancel"))
	if(input == "Cancel" || !input)
		return
	var/oocnotes = 0
	if(input == "Yes")
		oocnotes = 1
	to_chat(src, "<span class='notify'>You begin to reform. You will need to remain still.</span>")
	visible_message("<span class='notify'>[src] rapidly contorts and shifts!</span>", "<span class='danger'>You begin to reform.</span>")
	if (do_after(src, 40,exclusive = TASK_ALL_EXCLUSIVE))
		if (client?.prefs)
			client.prefs.vanity_copy_to(src, FALSE, flavour, oocnotes, FALSE)
			visible_message("<span class='notify'>[src] adopts a new form!</span>", "<span class='danger'>You have reformed.</span>")
