/mob/living/silicon/ai/Life()
	if (src.stat == DEAD)
		return
	else //I'm not removing that shitton of tabs, unneeded as they are. -- Urist
		//Being dead doesn't mean your temperature never changes
		var/turf/T = get_turf(src)

		if (src.stat != CONSCIOUS)
			src.cameraFollow = null
			src.reset_view(null)
			disconnect_shell("Disconnecting from remote shell due to local system failure.")

		src.updatehealth()

		if (!hardware_integrity() || !backup_capacitor())
			death()
			return

		// If our powersupply object was destroyed somehow, create new one.
		if(!psupply)
			create_powersupply()


		// Handle power damage (oxy)
		if(aiRestorePowerRoutine != 0 && !APU_power)
			// Lose power
			adjustOxyLoss(1)
		else
			// Gain Power
			aiRestorePowerRoutine = 0 // Necessary if AI activated it's APU AFTER losing primary power.
			adjustOxyLoss(-1)

		handle_stunned()	// Handle EMP-stun
		lying = 0			// Handle lying down

		malf_process()

		if(APU_power && (hardware_integrity() < 50))
			to_chat(src, span_boldnotice("APU GENERATOR FAILURE! (System Damaged)"))
			stop_apu(1)

		var/blind = 0
		var/area/loc = null
		if (istype(T, /turf))
			loc = T.loc
			if (istype(loc, /area))
				if (!loc.power_equip && !istype(src.loc,/obj/item) && !APU_power)
					blind = 1

		if (!blind)
			src.sight |= SEE_TURFS
			src.sight |= SEE_MOBS
			src.sight |= SEE_OBJS
			src.see_in_dark = 8
			src.see_invisible = SEE_INVISIBLE_LIVING

			if (aiRestorePowerRoutine==2)
				to_chat(src, "Alert cancelled. Power has been restored without our assistance.")
				aiRestorePowerRoutine = 0
				clear_fullscreen("blind")
				update_icon()
				return
			else if (aiRestorePowerRoutine==3)
				to_chat(src, "Alert cancelled. Power has been restored.")
				aiRestorePowerRoutine = 0
				clear_fullscreen("blind")
				update_icon()
				return
			else if (APU_power)
				aiRestorePowerRoutine = 0
				clear_fullscreen("blind")
				update_icon()
				return
		else
			var/area/current_area = get_area(src)

			if (lacks_power())
				if (aiRestorePowerRoutine==0)
					aiRestorePowerRoutine = 1

					//Blind the AI
					update_icon()
					overlay_fullscreen("blind", /obj/screen/fullscreen/blind)
					src.sight = src.sight&~SEE_TURFS
					src.sight = src.sight&~SEE_MOBS
					src.sight = src.sight&~SEE_OBJS
					src.see_in_dark = 0
					src.see_invisible = SEE_INVISIBLE_LIVING

					//Now to tell the AI why they're blind and dying slowly.

					to_chat(src, "You've lost power!")
					disconnect_shell(message = "Disconnected from remote shell due to depowered networking interface.")

					spawn(20)
						to_chat(src, "Backup battery online. Scanners, camera, and radio interface offline. Beginning fault-detection.")
						end_multicam()
						sleep(50)
						if (loc.power_equip)
							if (!istype(T, /turf/space))
								to_chat(src, "Alert cancelled. Power has been restored without our assistance.")
								aiRestorePowerRoutine = 0
								clear_fullscreen("blind")
								return
						to_chat(src, "Fault confirmed: missing external power. Shutting down main control system to save power.")
						sleep(20)
						to_chat(src, "Emergency control system online. Verifying connection to power network.")
						sleep(50)
						if (istype(T, /turf/space))
							to_chat(src, "Unable to verify! No power connection detected!")
							aiRestorePowerRoutine = 2
							return
						to_chat(src, "Connection verified. Searching for APC in power network.")
						sleep(50)
						var/obj/machinery/power/apc/theAPC = null

						var/PRP
						for (PRP=1, PRP<=4, PRP++)
							for (var/obj/machinery/power/apc/APC in current_area)
								if (!(APC.stat & BROKEN))
									theAPC = APC
									break
							if (!theAPC)
								switch(PRP)
									if (1)
										to_chat(src, "Unable to locate APC!")
									else
										to_chat(src, "Lost connection with the APC!")
								src:aiRestorePowerRoutine = 2
								return
							if (loc.power_equip)
								if (!istype(T, /turf/space))
									to_chat(src, "Alert cancelled. Power has been restored without our assistance.")
									aiRestorePowerRoutine = 0
									clear_fullscreen("blind") //This, too, is a fix to issue 603
									return
							switch(PRP)
								if (1)
									to_chat(src, "APC located. Optimizing route to APC to avoid needless power waste.")
								if (2)
									to_chat(src, "Best route identified. Hacking offline APC power port.")
								if (3)
									to_chat(src, "Power port upload access confirmed. Loading control program into APC power port software.")
								if (4)
									to_chat(src, "Transfer complete. Forcing APC to execute program.")
									sleep(50)
									to_chat(src, "Receiving control information from APC.")
									sleep(2)
									theAPC.operating = 1
									theAPC.equipment = 3
									theAPC.update()
									aiRestorePowerRoutine = 3
									to_chat(src, "Here are your current laws:")
									show_laws()
									update_icon()
							sleep(50)
							theAPC = null

	process_queued_alarms()
	handle_regular_hud_updates()
	handle_vision()

/mob/living/silicon/ai/proc/lacks_power()
	if(APU_power)
		return 0
	var/turf/T = get_turf(src)
	var/area/A = get_area(src)
	return ((!A.power_equip) && A.requires_power == 1 || istype(T, /turf/space)) && !istype(src.loc,/obj/item)

/mob/living/silicon/ai/updatehealth()
	if(SEND_SIGNAL(src, COMSIG_UPDATE_HEALTH) & COMSIG_UPDATE_HEALTH_GOD_MODE)
		health = getMaxHealth()
		set_stat(CONSCIOUS)
		setOxyLoss(0)
	else
		health = getMaxHealth() - getFireLoss() - getBruteLoss() // Oxyloss is not part of health as it represents AIs backup power. AI is immune against ToxLoss as it is machine.
		if(health <= -getMaxHealth()) //die only once
			death()
			return

/mob/living/silicon/ai/rejuvenate()
	..()
	add_ai_verbs(src)
