/obj/screen/proc/Click_vr(location, control, params)
	if(!usr)	return 1
	switch(name)
		if("shadekin status")
			var/turf/T = get_turf(usr)
			if(T)
				var/darkness = round(1 - T.get_lumcount(),0.1)
				to_chat(usr,span_notice(span_bold("Darkness:") + " [darkness]"))
			var/mob/living/H = usr
			if(ismob(H))
				var/datum/component/shadekin/SK = H.get_shadekin_component()
				if(SK)
					to_chat(usr,span_notice(span_bold("Energy:") + " [SK.shadekin_get_energy()]"))
		if("glamour")
			var/mob/living/carbon/human/H = usr
			if(istype(H))
				to_chat(usr,span_notice(span_bold("Energy:") + " [H.species.lleill_energy]/[H.species.lleill_energy_max]"))
		if("danger level")
			var/mob/living/carbon/human/H = usr
			var/datum/component/xenochimera/xc = H.get_xenochimera_component()
			if(xc)
				if(xc.feral > 50)
					to_chat(usr, span_warning("You are currently <b>completely feral.</b>"))
				else if(xc.feral > 10)
					to_chat(usr, span_warning("You are currently <b>crazed and confused.</b>"))
				else if(xc.feral > 0)
					to_chat(usr, span_warning("You are currently <b>acting on instinct.</b>"))
				else
					to_chat(usr, span_notice("You are currently <b>calm and collected.</b>"))
				if(xc.feral > 0)
					var/feral_passing = TRUE
					if(H.traumatic_shock > min(60, H.nutrition/10))
						to_chat(usr, span_warning("Your pain prevents you from regaining focus."))
						feral_passing = FALSE
					if(xc.feral + H.nutrition < 150)
						to_chat(usr, span_warning("Your hunger prevents you from regaining focus."))
						feral_passing = FALSE
					if(H.get_jittery() >= 100)
						to_chat(usr, span_warning("Your jitterness prevents you from regaining focus."))
						feral_passing = FALSE
					if(feral_passing)
						var/turf/T = get_turf(H)
						if(T.get_lumcount() <= 0.1)
							to_chat(usr, span_notice("You are slowly calming down in darkness' safety..."))
						else if(isbelly(H.loc)) // Safety message for if inside a belly.
							to_chat(usr, span_notice("You are slowly calming down within the darkness of something's belly, listening to their body as it moves around you. ...safe..."))
						else
							to_chat(usr, span_notice("You are slowly calming down... But safety of darkness is much preferred."))
				else
					if(H.nutrition < 150)
						to_chat(usr, span_warning("Your hunger is slowly making you unstable."))
		if("Reconstructing Form") // Allow Viewing Reconstruction Timer + Hatching for 'chimera
			var/mob/living/carbon/human/H = usr
			var/datum/component/xenochimera/xc = H.get_xenochimera_component()
			if(xc) // If you're somehow able to click this while not a chimera, this should prevent weird runtimes. Will need changing if regeneration is ever opened to non-chimera using the same alert.
				if(xc.revive_ready == REVIVING_NOW)
					to_chat(usr, span_notice("We are currently reviving, and will be done in [round((xc.revive_finished - world.time) / 10)] seconds, or [round(((xc.revive_finished - world.time) * 0.1) / 60)] minutes."))
				else if(xc.revive_ready == REVIVING_DONE)
					to_chat(usr, span_warning("You should have a notification + alert for this! Bug report that this is still here!"))

		if("Ready to Hatch") // Allow Viewing Reconstruction Timer + Hatching for 'chimera
			var/mob/living/carbon/human/H = usr
			var/datum/component/xenochimera/xc = H.get_xenochimera_component()
			if(xc) // If you're somehow able to click this while not a chimera, this should prevent weird runtimes. Will need changing if regeneration is ever opened to non-chimera using the same alert.
				if(xc.revive_ready == REVIVING_DONE) // Sanity check.
					H.hatch() // Hatch.

		else
			return 0

	return 1
