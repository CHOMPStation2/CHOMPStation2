#define BULLET_AP_DIVISOR 200
#define AP_DIVISOR 4152
#define ARMOR_Y_INTERCEPT 0.2
#define ARMOR_SLOPE 0.017
#define PENETRATION_PROBABILITY_EXP_BASE 2
#define PENETRATION_PROBABILITY_EXP_MULT 30

#define BULLET_DEFLECTED_PAIN_DIVISOR 5000
#define BULLET_DEFLECTED_BULLET_DIVISOR 70
#define BULLET_DEFLECTED_MELEE_DIVISOR 280
#define BULLET_DEFLECTED_PAIN_EXPONENT 1.5
#define BULLET_DEFLECTED_BRUISE_SUBTRACT 5

GLOBAL_VAR_INIT(SKIN_LOSS_COEFFICIENT,16)
GLOBAL_VAR_INIT(ARMOR_LOSS_COEFFICIENT,150)
GLOBAL_VAR_INIT(ARMOR_LOSS_MIN_MULT,0.5)
GLOBAL_VAR_INIT(ARMOR_LOSS_MIN_ARMOR,20)
GLOBAL_VAR_INIT(INTERNAL_LOSS_COEFFICIENT,195)
#define ORGAN_LOSS_COEFFICIENT 350
#define HIT_VITAL_ORGAN_CHANCE 35

#define BONE_HIT_CHANCE_UNENCASED 45
#define BONE_HIT_CHANCE_ENCASED 80
GLOBAL_VAR_INIT(BONE_JOULES_PERHP_AVG,2)
GLOBAL_VAR_INIT(BONE_JOULES_PERHP_DEV,1)
GLOBAL_VAR_INIT(BONE_JOULES_MIN,100)
#define BONE_HP_AVG 25

GLOBAL_VAR_INIT(HOLLOW_POINT_VELLOSS_BONUS,2.35)
GLOBAL_VAR_INIT(HOLLOW_POINT_CONVERSION_EFF,1.15)

#define PROB_LEAVE_EARLY_FIRST 20
#define PROB_LEAVE_EARLY_SECOND 40

GLOBAL_VAR_INIT(ENERGY_DAMAGE_FLESH_FACTOR,0.03)
GLOBAL_VAR_INIT(ENERGY_DAMAGE_ORGAN_FACTOR,0.035)

#ifndef GAUSSIAN_RANDOM
#define GAUSSIAN_RANDOM(vars...)	((-2*log(rand()))**0.5 * cos(6.28318530718*rand()))
#endif

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////// CADYN'S BALLISTICS ////////////////////////////////////////////////////////////////////////// ORIGINAL FROM CHOMPSTATION ////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/mob/living/proc/handle_ballistics(var/obj/item/projectile/bullet/P, var/def_zone)
	var/list/updated_organ_weight = list()
	var/ballistic_armor = getarmor(def_zone, "bullet")
	var/melee_armor = getarmor(def_zone, "melee")
	var/obj/item/organ/external/hit_organ
	var/mob/living/carbon/human/H = src
	if(istype(H))
		hit_organ = H.get_organ(def_zone)
		for(var/ext_organ in ballistic_variables["organ_hit_weight"])
			var/list/input = list()
			var/obj/item/organ/external/ref_ext_organ = H.get_organ(ext_organ)
			for(var/int_organ in ballistic_variables["organ_hit_weight"][ext_organ])
				var/ref_int_organ = H.internal_organs_by_name[int_organ]
				if(ref_ext_organ && ref_int_organ && (ref_int_organ in ref_ext_organ.internal_organs))
					input[ref_int_organ] = ballistic_variables["organ_hit_weight"][ext_organ][int_organ]
			if(input.len)
				updated_organ_weight[ref_ext_organ] = input
	//log_and_message_admins("Beginning handle_ballistics")
	var/penetration_chance = armor_penetration_probability(ballistic_armor,P)
	if(!prob(penetration_chance))	//Boo-hoo we got deflected. Do boring agony/bruises stuff.
		//log_and_message_admins("Bullet deflected")
		var/pain_hit = hit_organ ? "into your [hit_organ]" : "into you"

		var/hurt_value = P.velocity * P.grains / (BULLET_DEFLECTED_PAIN_DIVISOR * (1 + ballistic_armor/BULLET_DEFLECTED_BULLET_DIVISOR + melee_armor/BULLET_DEFLECTED_MELEE_DIVISOR)) //Better armor spreads out the energy better.
		var/hurt_value_pain = hurt_value ** BULLET_DEFLECTED_PAIN_EXPONENT
		var/hurt_value_bruise = max(0,hurt_value-BULLET_DEFLECTED_BRUISE_SUBTRACT)

		var/absorber = ballistic_armor ? "armor" : "body"	//There is a super tiny chance that small rounds can get deflected without armor, so this is just incase.

		to_chat(src,"<span class='warning'>You feel the energy of the bullet painfully transfered [pain_hit] as your [absorber] deflects it!</span>")
		apply_damage(hurt_value_pain,HALLOSS,def_zone)
		if(hurt_value_bruise)
			apply_damage(hurt_value_bruise,BRUTE,def_zone)
		P.sub_velocity(P.velocity)
		return 2
	else	//Now the FUN begins
		//log_and_message_admins("Bullet penetrated")
		var/area_over_mass = P.diam * P.diam / P.grains
		//Most of these calculations don't involve energies because I'm treating flesh and organic tissue as a fluid since it's squishy and stuff.
		//Since drag is proportional to velocity, we can do things on an m*v basis instead of an mv^2 basis.
		//Obviously bones are more solid, so we do actual energy calculations for that.
		var/conversion_efficiency = P.hollow_point ? GLOB.HOLLOW_POINT_CONVERSION_EFF : 1
		var/vel_loss_multiplier = P.hollow_point ? GLOB.HOLLOW_POINT_VELLOSS_BONUS : 1

		var/energy_dumped_organic = 0
		var/vel_lost_armor = ballistic_armor >= GLOB.ARMOR_LOSS_MIN_ARMOR ? GLOB.ARMOR_LOSS_COEFFICIENT * area_over_mass * ((1 + GLOB.ARMOR_LOSS_MIN_MULT) - penetration_chance/100) : 0
		P.sub_velocity(vel_lost_armor)

		var/energy_past = P.energy
		var/internal_loss = vel_loss_multiplier * GLOB.INTERNAL_LOSS_COEFFICIENT * area_over_mass
		var/vel_lost_skin = vel_loss_multiplier * GLOB.SKIN_LOSS_COEFFICIENT * area_over_mass
		P.sub_velocity(vel_lost_skin + internal_loss)
		energy_dumped_organic += (energy_past - P.energy)
		if(prob(PROB_LEAVE_EARLY_FIRST) || !P.velocity)
			energy_to_damage(energy_dumped_organic * conversion_efficiency,def_zone)
			return 1
		if(hit_organ)
			//log_and_message_admins("organ_handle_ballistics called. hit_organ = [hit_organ], energy_dumped_organic = [energy_dumped_organic], internal_loss = [internal_loss], ballistic_armor = [ballistic_armor], P.velocity = [P.velocity], P.energy = [P.energy]")
			return organ_handle_ballistics(P,hit_organ,energy_dumped_organic,internal_loss,ballistic_armor,updated_organ_weight)
		else
			//log_and_message_admins("general_handle_ballistics called.")
			return general_handle_ballistics(P,def_zone,energy_dumped_organic,internal_loss,ballistic_armor)

/mob/living/proc/organ_handle_ballistics(var/obj/item/projectile/bullet/P,var/obj/item/organ/external/hit_organ,var/energy_dumped_organic,var/internal_loss,var/ballistic_armor,var/list/updated_organ_weight)
	var/conversion_efficiency = P.hollow_point ? GLOB.HOLLOW_POINT_CONVERSION_EFF : 1
	var/energy_past
	var/area_over_mass = P.diam * P.diam / P.grains
	var/bone_chance = BONE_HIT_CHANCE_UNENCASED
	if(hit_organ.encased)
		bone_chance = BONE_HIT_CHANCE_ENCASED
	else
		bone_chance = ballistic_variables["bone_chance_unencased"][hit_organ.organ_tag]
	//log_and_message_admins("Bone hit chance is [bone_chance], organ is [hit_organ]")
	if(prob(bone_chance))
		var/energy_to_fracture = max(GLOB.BONE_JOULES_MIN, hit_organ.min_broken_damage * (GAUSSIAN_RANDOM()*GLOB.BONE_JOULES_PERHP_DEV + GLOB.BONE_JOULES_PERHP_AVG))
		//log_and_message_admins("Bone hit, bone_chance1. energy_to_fracture = [energy_to_fracture]")
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			//log_and_message_admins("Insufficient projectile energy. Stopping projectile.")
			energy_to_damage(energy_dumped_organic * conversion_efficiency,hit_organ.organ_tag)
			return 2
		else
			//log_and_message_admins("Sufficient projectile energy to pass through bone.")
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += P.energy / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.
			if(!(hit_organ.status & ORGAN_BROKEN))
				//log_and_message_admins("Fracturing [hit_organ]")
				hit_organ.fracture()
	//log_and_message_admins("Bone checking done. hit_organ = [hit_organ], energy_dumped_organic = [energy_dumped_organic], internal_loss = [internal_loss], ballistic_armor = [ballistic_armor], P.velocity = [P.velocity], P.energy = [P.energy]")
	if(hit_organ.internal_organs.len && P.velocity > area_over_mass*ORGAN_LOSS_COEFFICIENT && prob(ballistic_variables["organ_hit_chance"][hit_organ.organ_tag]) && updated_organ_weight[hit_organ] && updated_organ_weight[hit_organ].len)
		//log_and_message_admins("Organ was hit by bullet.")
		energy_past = P.energy
		P.sub_velocity(internal_loss)
		damage_organ_energy((energy_past - P.energy) * conversion_efficiency, pickweight(updated_organ_weight[hit_organ]))
		if(!P.velocity)
			//log_and_message_admins("Organ stopped bullet.")
			energy_to_damage(energy_dumped_organic * conversion_efficiency,hit_organ.organ_tag)
			return 2
	//log_and_message_admins("Organ check done, hit_organ = [hit_organ], energy_dumped_organic = [energy_dumped_organic], internal_loss = [internal_loss], ballistic_armor = [ballistic_armor], P.velocity = [P.velocity], P.energy = [P.energy]")
	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += energy_past - P.energy
	if(!P.velocity || (hit_organ.organ_tag in ballistic_variables["organ_leave_early"]) || prob(PROB_LEAVE_EARLY_SECOND))
		energy_to_damage(energy_dumped_organic * conversion_efficiency,hit_organ.organ_tag)
		return P.velocity ? -1 : 2
		//log_and_message_admins("Internal_loss 2 stopped bullet")
	//log_and_message_admins("Internal_loss 2 completed, hit_organ = [hit_organ], energy_dumped_organic = [energy_dumped_organic], internal_loss = [internal_loss], ballistic_armor = [ballistic_armor], P.velocity = [P.velocity], P.energy = [P.energy]")
	if(prob(bone_chance))
		var/energy_to_fracture = max(GLOB.BONE_JOULES_MIN, hit_organ.min_broken_damage * (GAUSSIAN_RANDOM()*GLOB.BONE_JOULES_PERHP_DEV + GLOB.BONE_JOULES_PERHP_AVG))
		//log_and_message_admins("Bone hit, bone_chance1. energy_to_fracture = [energy_to_fracture]")
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			//log_and_message_admins("Insufficient projectile energy. Stopping projectile.")
			energy_to_damage(energy_dumped_organic * conversion_efficiency,hit_organ.organ_tag)
			return 2
		else
			//log_and_message_admins("Sufficient projectile energy to pass through bone.")
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += P.energy / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.
			if(!(hit_organ.status & ORGAN_BROKEN))
				//log_and_message_admins("Fracturing [hit_organ]")
				hit_organ.fracture()
	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += energy_past - P.energy
	if(!P.velocity)
		//log_and_message_admins("Internal_loss 3 stopped bullet")
		energy_to_damage(energy_dumped_organic * conversion_efficiency,hit_organ.organ_tag)
		return 2
	//log_and_message_admins("Internal_loss 3 completed. hit_organ = [hit_organ], energy_dumped_organic = [energy_dumped_organic], internal_loss = [internal_loss], ballistic_armor = [ballistic_armor], P.velocity = [P.velocity], P.energy = [P.energy]")
	var/penetration_chance = armor_penetration_probability(ballistic_armor,P)
	if(prob(penetration_chance))
		//log_and_message_admins("Projectile exiting.")
		energy_to_damage(energy_dumped_organic * conversion_efficiency,hit_organ.organ_tag)
		return -1
	else
		//log_and_message_admins("Projectile continuing inside body")
		energy_dumped_organic += P.energy / 3
		P.sub_velocity(P.velocity)
		energy_to_damage(energy_dumped_organic * conversion_efficiency,hit_organ.organ_tag)
		return 2

/mob/living/proc/general_handle_ballistics(var/obj/item/projectile/bullet/P,var/def_zone,var/energy_dumped_organic,var/internal_loss,var/ballistic_armor)
	var/conversion_efficiency = P.hollow_point ? GLOB.HOLLOW_POINT_CONVERSION_EFF : 1
	var/energy_past
	var/area_over_mass = P.diam * P.diam / P.grains
	var/bone_chance = BONE_HIT_CHANCE_UNENCASED
	//if(def_zone in ballistic_variables["bone_chance_unencased"])
		//bone_chance = ballistic_variables["bone_chance_unencased"][def_zone]
	if(prob(bone_chance))
		var/energy_to_fracture = max(GLOB.BONE_JOULES_MIN, BONE_HP_AVG * (GAUSSIAN_RANDOM()*GLOB.BONE_JOULES_PERHP_DEV + GLOB.BONE_JOULES_PERHP_AVG))
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			energy_to_damage(energy_dumped_organic * conversion_efficiency,def_zone)
			return 2
		else
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += P.energy / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.

	if(P.velocity > area_over_mass * ORGAN_LOSS_COEFFICIENT && prob(HIT_VITAL_ORGAN_CHANCE))
		energy_past = P.energy
		P.sub_velocity(internal_loss)
		energy_dumped_organic += (energy_past - P.energy) * 1.5
		if(!P.velocity)
			energy_to_damage(energy_dumped_organic * conversion_efficiency,def_zone)
			return 2
	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += energy_past - P.energy
	if(!P.velocity || (def_zone in ballistic_variables["organ_leave_early"]) || prob(PROB_LEAVE_EARLY_SECOND))
		energy_to_damage(energy_dumped_organic * conversion_efficiency,def_zone)
		return P.velocity ? -1 : 2

	if(prob(bone_chance))
		var/energy_to_fracture = max(GLOB.BONE_JOULES_MIN, BONE_HP_AVG * (GAUSSIAN_RANDOM()*GLOB.BONE_JOULES_PERHP_DEV + GLOB.BONE_JOULES_PERHP_AVG))
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			energy_to_damage(energy_dumped_organic * conversion_efficiency,def_zone)
			return 2
		else
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += P.energy / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.

	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += energy_past - P.energy
	if(!P.velocity)
		energy_to_damage(energy_dumped_organic * conversion_efficiency,def_zone)
		return 2
	var/penetration_chance = armor_penetration_probability(ballistic_armor,P)
	if(prob(penetration_chance))
		energy_to_damage(energy_dumped_organic * conversion_efficiency,def_zone)
		return -1
	else
		energy_dumped_organic += P.energy / 3
		P.sub_velocity(P.velocity)
		energy_to_damage(energy_dumped_organic * conversion_efficiency,def_zone)
		return 2

/mob/living/proc/damage_organ_energy(var/energy,var/obj/item/organ/internal/target)
	var/damage = round(energy*GLOB.ENERGY_DAMAGE_ORGAN_FACTOR)
	//log_and_message_admins("damage_organ_energy([energy]) : [target].take_damage([damage])")
	target.take_damage(damage)
	return

/mob/living/proc/energy_to_damage(var/energy,var/def_zone)
	var/damage = round(energy*GLOB.ENERGY_DAMAGE_FLESH_FACTOR)
	//log_and_message_admins("energy_to_damage([energy]) : apply_damage([damage], BRUTE, [def_zone])")
	apply_damage(damage, BRUTE, def_zone)
	return

/mob/living/proc/armor_penetration_probability(var/armor, var/obj/item/projectile/bullet/P)
	var/bullet_ap_value = (1+((P.armor_penetration)/BULLET_AP_DIVISOR))
	var/ap_value = P.velocity * bullet_ap_value * (P.grains / P.diam)**(2/3) / AP_DIVISOR 
	var/armor_value = ARMOR_Y_INTERCEPT + ARMOR_SLOPE * armor
	var/penetration_chance = 100 / (1 + PENETRATION_PROBABILITY_EXP_BASE**(-PENETRATION_PROBABILITY_EXP_MULT*(ap_value - armor_value)))
	return penetration_chance

/mob/living/bullet_act(var/obj/item/projectile/P, var/def_zone)
	//log_and_message_admins("bullet_act_ch")
	var/obj/item/projectile/bullet/B = P
	if(P.check_armour == "bullet" && istype(B) && !B.old_bullet_act)
		//log_and_message_admins("is bullet")
		return handle_ballistics(P,def_zone)
	else
		//log_and_message_admins("is not bullet")
		return ..()

/mob/living
	var/list/ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 5, BP_TORSO = 20, BP_GROIN = 20, BP_L_FOOT = 80, BP_R_FOOT = 80, BP_L_LEG = 35, BP_R_LEG = 35, BP_L_ARM = 65, BP_R_ARM = 65, BP_L_HAND = 80, BP_R_HAND = 80), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 95, BP_TORSO = 90, BP_GROIN = 90) )

