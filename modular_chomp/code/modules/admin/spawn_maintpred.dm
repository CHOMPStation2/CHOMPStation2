/datum/admins/proc/spawn_maintpred()
	set category = "Admin.Game"
	set name = "Spawn Maint Predator"
	set desc = "Spawns a maintenence predator at your current position."

	if(!check_rights(R_SPAWN))	return
	var/mob/living/simple_mob/maintpred = new /mob/living/simple_mob/vore/gryphon(usr.loc)
	// So it can actually use ladders
	maintpred.has_hands = TRUE
	maintpred.ai_holder_type = /datum/ai_holder/simple_mob/vore/maintpred
	maintpred.initialize_ai_holder()
	log_and_message_admins("spawned [maintpred] at ([usr.x],[usr.y],[usr.z])")
	feedback_add_details("admin_verb","SMP")
