/datum/unarmed_attack/punch/chimera //special feral attack that gets stronger as they get angrier. YR3 strain deals slightly more damage, but doesn't cause bleeding
	damage = 3

/datum/unarmed_attack/punch/chimera/get_unarmed_damage(var/mob/living/carbon/human/user)
	return damage + user.species.unarmed_bonus + (user.get_feralness() / 5)

/datum/unarmed_attack/punch/chimera/apply_effects(var/mob/living/carbon/human/user,var/mob/living/carbon/human/target,var/armour,var/attack_damage,var/zone)
	..()
	if(user.get_feralness() && !(target == user))
		var/selfdamage = ((user.get_feralness() / 10)- 15)
		if(selfdamage > 0)
			var/selfdamagezone = null
			if (user.hand)
				selfdamagezone = pick(BP_L_ARM, BP_L_HAND)
			else
				selfdamagezone = pick(BP_R_ARM, BP_R_HAND)
			user.apply_damage(selfdamage, BRUTE, selfdamagezone, 0, 0, sharp=FALSE, edge=FALSE)
