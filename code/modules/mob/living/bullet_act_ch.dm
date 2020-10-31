#define BULLET_AP_DIVISOR 200
#define AP_DIVISOR 4152
#define ARMOR_Y_INTERCEPT 0.2
#define ARMOR_SLOPE 0.017
#define PENETRATION_PROBABILITY_EXP_BASE 2
#define PENETRATION_PROBABILITY_EXP_MULT 30

#define BULLET_DEFLECTED_PAIN_DIVISOR 5000
#define BULLET_DEFLECTED_BULLET_DIVISOR 70
#define BULLET_DEFLECTED_MELEE_DIVISOR 280

#define SKIN_LOSS_COEFFICIENT 61
#define ARMOR_LOSS_COEFFICIENT 200
#define ARMOR_LOSS_MIN_MULT 0.5
#define ARMOR_LOSS_MIN_ARMOR 20
#define INTERNAL_LOSS_COEFFICIENT 250
#define ORGAN_LOSS_COEFFICIENT 350
#define ORGAN_LEAVE_EARLY list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot")
#define HIT_ORGAN_CHANCE_VITALS 90
#define HIT_VITAL_ORGAN_CHANCE 30

#define BONE_HIT_CHANCE list("torso" = 0.2, "groin" = 0.2, "l_foot" = 0.8, "r_foot" = 0.8, "l_leg" = 0.35, "r_leg" = 0.35, "l_arm" = 0.65, "r_arm" = 0.65, "l_hand" = 0.8, "r_hand" = 0.8)
#define BONE_HIT_CHANCE_UNENCASED 45
#define BONE_HIT_CHANCE_ENCASED 80
#define BONE_JOULES_PERHP_AVG 30
#define BONE_JOULES_PERHP_DEV 10
#define BONE_HP_AVG 25

#define PROB_LEAVE_EARLY_FIRST 20
#define PROB_LEAVE_EARLY_SECOND 40

#define GAUSSIAN_RANDOM(vars...)	((-2*log(rand()))**0.5 * cos(6.28318530718*rand()))

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////// CADYN'S BALLISTICS ////////////////////////////////////////////////////////////////////////// ORIGINAL FROM CHOMPSTATION ////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/mob/living/proc/handle_ballistics(var/obj/item/projectile/bullet/P, var/def_zone)
	var/ballistic_armor = getarmor(def_zone, "bullet")
	var/melee_armor = getarmor(def_zone, "melee")
	var/obj/item/organ/external/hit_organ
	var/mob/living/carbon/human/H = src
	if(istype(H))
		hit_organ = H.get_organ(def_zone)
	var/penetration_chance = armor_penetration_probability(ballistic_armor,P)
	if(!prob(penetration_chance))	//Boo-hoo we got deflected. Do boring agony/bruises stuff.
		var/pain_hit = hit_organ ? "into your [hit_organ]" : "into you"

		var/hurt_value = P.velocity * P.grains / (BULLET_DEFLECTED_PAIN_DIVISOR * (1 + ballistic_armor/70 + melee_armor/280)) //Better armor spreads out the energy better.
		var/hurt_value_pain = hurt_value ** 1.5
		var/hurt_value_bruise = max(0,hurt_value-5)

		var/absorber = ballistic_armor ? "armor" : "body"	//There is a super tiny chance that small rounds can get deflected without armor, so this is just incase.

		to_chat(src,"<span class='warning'>You feel the energy of the bullet painfully transfered [pain_hit] as your [absorber] deflects it!</span>")
		apply_damage(hurt_value_pain,HALLOSS,def_zone)
		if(hurt_value_bruise)
			apply_damage(hurt_value_bruise,BRUTE,def_zone)
		P.sub_velocity(P.velocity)
		return 2
	else	//Now the FUN begins
		var/area_over_mass = P.diam * P.diam / P.grains
		//Most of these calculations don't involve energies because I'm treating flesh and organic tissue as a fluid since it's squishy and stuff.
		//Since drag is proportional to velocity, we can do things on an m*v basis instead of an mv^2 basis.
		//Obviously bones are more solid, so we do actual energy calculations for that.
		var/energy_dumped_organic = 0
		var/vel_lost_armor = ballistic_armor >= ARMOR_LOSS_MIN_ARMOR ? ARMOR_LOSS_COEFFICIENT * area_over_mass * ((1 + ARMOR_LOSS_MIN_MULT) - penetration_chance) : 0
		P.sub_velocity(vel_lost_armor)

		var/energy_past = P.energy
		var/internal_loss = INTERNAL_LOSS_COEFFICIENT * area_over_mass
		var/vel_lost_skin = SKIN_LOSS_COEFFICIENT * area_over_mass
		P.sub_velocity(vel_lost_skin + internal_loss)
		energy_dumped_organic += (energy_past - P.energy)
		if(prob(PROB_LEAVE_EARLY_FIRST) || !P.velocity)
			energy_to_damage(energy_dumped_organic)
			return 1
		if(hit_organ)
			return organ_handle_ballistics(P,hit_organ,energy_dumped_organic,internal_loss,ballistic_armor)
		else
			return general_handle_ballistics(P,def_zone,energy_dumped_organic,internal_loss,ballistic_armor)

/mob/living/proc/organ_handle_ballistics(var/obj/item/projectile/bullet/P,var/obj/item/organ/external/hit_organ,var/energy_dumped_organic,var/internal_loss,var/ballistic_armor)
	var/energy_past
	var/area_over_mass = P.diam * P.diam / P.grains
	var/bone_chance = BONE_HIT_CHANCE_UNENCASED
	if(hit_organ.encased)
		bone_chance = BONE_HIT_CHANCE_ENCASED
	else
		bone_chance = BONE_HIT_CHANCE[hit_organ.organ_tag]
	if(prob(bone_chance))
		var/energy_to_fracture = max(300, hit_organ.min_broken_damage * (GAUSSIAN_RANDOM()*BONE_JOULES_PERHP_DEV + BONE_JOULES_PERHP_AVG))
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			energy_to_damage(energy_dumped_organic)
			return 2
		else
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += P.energy / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.
			if(!(hit_organ & ORGAN_BROKEN))
				hit_organ.fracture()

	if(hit_organ.internal_organs.len && P.velocity > area_over_mass*ORGAN_LOSS_COEFFICIENT && prob(90))
		energy_past = P.energy
		P.sub_velocity(internal_loss)
		damage_organ_energy(energy_past - P.energy, pick(hit_organ.internal_organs))
		if(!P.velocity)
			energy_to_damage(energy_dumped_organic)
			return 2
	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += P.energy
	if(!P.velocity || (hit_organ.organ_tag in ORGAN_LEAVE_EARLY) || prob(PROB_LEAVE_EARLY_SECOND))
		energy_to_damage(energy_dumped_organic)
		return P.velocity ? -1 : 2

	if(prob(bone_chance))
		var/energy_to_fracture = max(300, hit_organ.min_broken_damage * (GAUSSIAN_RANDOM()*BONE_JOULES_PERHP_DEV + BONE_JOULES_PERHP_AVG))
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			energy_to_damage(energy_dumped_organic)
			return 2
		else
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += P.energy / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.
			if(!(hit_organ & ORGAN_BROKEN))
				hit_organ.fracture()
	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += P.energy
	if(!P.velocity)
		energy_to_damage(energy_dumped_organic)
		return 2
	var/penetration_chance = armor_penetration_probability(ballistic_armor,P)
	if(prob(penetration_chance))
		energy_to_damage(energy_dumped_organic)
		return -1
	else
		return organ_handle_ballistics(P,hit_organ,energy_dumped_organic,internal_loss,ballistic_armor)

/mob/living/proc/general_handle_ballistics(var/obj/item/projectile/bullet/P,var/def_zone,var/energy_dumped_organic,var/internal_loss,var/ballistic_armor)
	var/energy_past
	var/area_over_mass = P.diam * P.diam / P.grains
	var/bone_chance = BONE_HIT_CHANCE_UNENCASED
	if(prob(bone_chance))
		var/energy_to_fracture = max(300, BONE_HP_AVG * (GAUSSIAN_RANDOM()*BONE_JOULES_PERHP_DEV + BONE_JOULES_PERHP_AVG))
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			energy_to_damage(energy_dumped_organic)
			return 2
		else
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += P.energy / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.

	if(P.velocity > area_over_mass * ORGAN_LOSS_COEFFICIENT && prob(HIT_VITAL_ORGAN_CHANCE))
		energy_past = P.energy
		P.sub_velocity(internal_loss)
		energy_dumped_organic += (energy_past - P.energy) * 2
		if(!P.velocity)
			energy_to_damage(energy_dumped_organic)
			return 2
	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += P.energy
	if(!P.velocity || (def_zone in ORGAN_LEAVE_EARLY) || prob(PROB_LEAVE_EARLY_SECOND))
		energy_to_damage(energy_dumped_organic)
		return P.velocity ? -1 : 2

	if(prob(bone_chance))
		var/energy_to_fracture = max(300, BONE_HP_AVG * (GAUSSIAN_RANDOM()*BONE_JOULES_PERHP_DEV + BONE_JOULES_PERHP_AVG))
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			energy_to_damage(energy_dumped_organic)
			return 2
		else
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += P.energy / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.

	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += P.energy
	if(!P.velocity)
		energy_to_damage(energy_dumped_organic)
		return 2
	var/penetration_chance = armor_penetration_probability(ballistic_armor,P)
	if(prob(penetration_chance))
		energy_to_damage(energy_dumped_organic)
		return -1
	else
		return general_handle_ballistics(P,def_zone,energy_dumped_organic,internal_loss,ballistic_armor)

/mob/living/proc/damage_organ_energy(var/energy,var/obj/item/organ/internal/target)
	log_and_message_admins("damage_organ_energy([energy])")
	return

/mob/living/proc/energy_to_damage(var/energy)
	log_and_message_admins("energy_to_damage([energy])")
	return

/mob/living/proc/armor_penetration_probability(var/armor, var/obj/item/projectile/bullet/P)
	var/bullet_ap_value = (1+((P.armor_penetration)/BULLET_AP_DIVISOR))
	var/ap_value = P.velocity * bullet_ap_value * (P.grains / P.diam)**(2/3) / AP_DIVISOR 
	var/armor_value = ARMOR_Y_INTERCEPT + ARMOR_SLOPE * armor
	var/penetration_chance = 100 / (1 + PENETRATION_PROBABILITY_EXP_BASE**(-PENETRATION_PROBABILITY_EXP_MULT*(ap_value - armor_value)))
	return penetration_chance

/mob/living/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(P.check_armour == "bullet")
		return handle_ballistics(P,def_zone)
	else
		return ..()

#undef BULLET_AP_DIVISOR
#undef AP_DIVISOR
#undef ARMOR_Y_INTERCEPT
#undef ARMOR_SLOPE
#undef PENETRATION_PROBABILITY_EXP_BASE
#undef PENETRATION_PROBABILITY_EXP_MULT

#undef BULLET_DEFLECTED_PAIN_DIVISOR
#undef BULLET_DEFLECTED_BULLET_DIVISOR
#undef BULLET_DEFLECTED_MELEE_DIVISOR

#undef SKIN_LOSS_COEFFICIENT
#undef ARMOR_LOSS_COEFFICIENT
#undef ARMOR_LOSS_MIN_MULT
#undef ARMOR_LOSS_MIN_ARMOR
#undef INTERNAL_LOSS_COEFFICIENT
#undef ORGAN_LOSS_COEFFICIENT
#undef ORGAN_LEAVE_EARLY
#undef HIT_ORGAN_CHANCE_VITALS
#undef HIT_VITAL_ORGAN_CHANCE

#undef BONE_HIT_CHANCE
#undef BONE_HIT_CHANCE_UNENCASED
#undef BONE_HIT_CHANCE_ENCASED
#undef BONE_JOULES_PERHP_AVG
#undef BONE_JOULES_PERHP_DEV
#undef BONE_HP_AVG

#undef PROB_LEAVE_EARLY_FIRST
#undef PROB_LEAVE_EARLY_SECOND