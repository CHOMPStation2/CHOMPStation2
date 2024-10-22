/mob/living/silicon/decoy/Life()
	if (src.stat == 2)
		return
	else
<<<<<<< HEAD
		if (src.health <= CONFIG_GET(number/health_threshold_dead) && src.stat != 2) // CHOMPEdit
=======
		if (src.health <= CONFIG_GET(number/health_threshold_dead) && src.stat != 2)
>>>>>>> 242fa3a66b (Ports over configuration controller (#16484))
			death()
			return


/mob/living/silicon/decoy/updatehealth()
	if(status_flags & GODMODE)
		health = 100
		set_stat(CONSCIOUS)
	else
		health = 100 - getOxyLoss() - getToxLoss() - getFireLoss() - getBruteLoss()
