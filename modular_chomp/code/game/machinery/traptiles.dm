/obj/machinery/traptile
	icon = 'modular_chomp/icons/obj/machines/defense.dmi'
	icon_state = "traptile"
	anchored = 1
	use_power = USE_POWER_IDLE
	idle_power_usage = 200

/obj/machinery/traptile/proc/attack_mob(mob/living/L)
	var/target_zone
	if(L.lying)
		target_zone = ran_zone()
	else
		target_zone = pick("l_foot", "r_foot", "l_leg", "r_leg")

	//armour
	var/blocked = L.run_armor_check(target_zone, "melee")
	var/soaked = L.get_armor_soak(target_zone, "melee")

	if(blocked >= 100)
		return

	if(soaked >= 30)
		return

	if(L.buckled) //wheelchairs, office chairs, rollerbeds
		return

	if(!L.apply_damage(30, BURN, target_zone, blocked, soaked, used_weapon=src))
		return 0

	shock(L, 100, target_zone)

	L.add_modifier(/datum/modifier/entangled, 3 SECONDS)
