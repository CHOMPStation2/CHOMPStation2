#define BULLET_PENETRATED 1<<0
#define BULLET_BONECHECK1_TRUE 1<<1
#define BULLET_ORGANCHECK_TRUE 1<<2
#define BULLET_BONECHECK2_TRUE 1<<3
#define BULLET_PASSED_LEAVE_EARLY 1<<4
#define BULLET_PASSED_BONECHECK1 1<<5
#define BULLET_PASSED_ORGANCHECK 1<<6
#define BULLET_PASSED_INTERNALCHECK2 1<<7
#define BULLET_PASSED_BONECHECK2 1<<8
#define BULLET_PASSED_INTERNALCHECK3 1<<9
#define BULLET_TESTS 150

/mob/living/carbon/human/monkey/testerboyo
	name = "testerboyo"
	var/the_big_armor = 0

/mob/living/carbon/human/monkey/testerboyo/getarmor(var/def_zone,var/type)
	return the_big_armor

/proc/test_all_ballistics()
	var/mob/living/carbon/human/monkey/testerboyo/tester = new()
	var/obj/item/projectile/bullet/pistol/test1 = new()
	var/obj/item/projectile/bullet/pistol/ap/test2 = new()
	var/obj/item/projectile/bullet/pistol/hp/test3 = new()
	var/obj/item/projectile/bullet/pistol/medium/test4 = new()
	var/obj/item/projectile/bullet/pistol/medium/ap/test5 = new()
	var/obj/item/projectile/bullet/pistol/medium/hp/test6 = new()
	var/obj/item/projectile/bullet/pistol/strong/test7 = new()
	var/obj/item/projectile/bullet/shotgun/test8 = new()
	var/obj/item/projectile/bullet/shotgun/buckshot/test9 = new()
	var/obj/item/projectile/bullet/rifle/a762/test10 = new()
	var/obj/item/projectile/bullet/rifle/a762/ap/test11 = new()
	var/obj/item/projectile/bullet/rifle/a762/hp/test12 = new()
	var/obj/item/projectile/bullet/rifle/a545/test13 = new()
	var/obj/item/projectile/bullet/rifle/a545/ap/test14 = new()
	var/obj/item/projectile/bullet/rifle/a545/hp/test15 = new()
	var/obj/item/projectile/bullet/rifle/a145/test16 = new()
	var/obj/item/projectile/bullet/rifle/a145/highvel/test17 = new()
	var/obj/item/projectile/bullet/rifle/a44rifle/test18 = new()
	var/obj/item/projectile/bullet/rifle/a95/test19 = new()
	var/obj/item/projectile/bullet/rifle/a762/lmg/test20 = new()
	test_ballistics(test1,tester)
	test_ballistics(test2,tester)
	test_ballistics(test3,tester)
	test_ballistics(test4,tester)
	test_ballistics(test5,tester)
	test_ballistics(test6,tester)
	test_ballistics(test7,tester)
	test_ballistics(test8,tester)
	test_ballistics(test9,tester)
	test_ballistics(test10,tester)
	test_ballistics(test11,tester)
	test_ballistics(test12,tester)
	test_ballistics(test13,tester)
	test_ballistics(test14,tester)
	test_ballistics(test15,tester)
	test_ballistics(test16,tester)
	test_ballistics(test17,tester)
	test_ballistics(test18,tester)
	test_ballistics(test19,tester)
	test_ballistics(test20,tester)
	qdel(tester)
	qdel(test1)
	qdel(test2)
	qdel(test3)
	qdel(test4)
	qdel(test5)
	qdel(test6)
	qdel(test7)
	qdel(test8)
	qdel(test9)
	qdel(test10)
	qdel(test11)
	qdel(test12)
	qdel(test13)
	qdel(test14)
	qdel(test15)
	qdel(test16)
	qdel(test17)
	qdel(test18)
	qdel(test19)
	qdel(test20)


/proc/test_ballistics(var/obj/item/projectile/bullet/P,var/mob/living/carbon/human/monkey/testerboyo/tester)
	var/list/data = list()
	for(var/armor_level in list(0,5,10,20,50,80))
		data["[armor_level]"] = list()
		data["[armor_level]"]["average"] = list()
		tester.the_big_armor = armor_level
		var/bp_num = 0
		for(var/body_part in list(BP_TORSO,BP_HEAD,BP_R_LEG,BP_R_ARM,BP_R_HAND))
			bp_num++
			data["[armor_level]"][body_part] = list()
			for(var/i = 0,i<BULLET_TESTS,i++)
				P.velocity = initial(P.velocity)
				P.sub_velocity(0)
				var/out = tester.handle_ballistics(P,body_part)
				for(var/x = 0,x<10,x++)
					var/input = (out["chex"] & (1<<x)) ? 1 : 0
					data["[armor_level]"][body_part]["[x]"] += input
					data["[armor_level]"]["average"]["[x]"] += input
				data["[armor_level]"][body_part]["10"] += out["energy"]
			data["[armor_level]"][body_part]["10"] /= BULLET_TESTS
			data["[armor_level]"]["average"]["10"] += data["[armor_level]"][body_part]["10"]
		for(var/x = 0,x<11,x++)
			data["[armor_level]"]["average"]["[x]"] /= bp_num
		for(var/entry in data["[armor_level]"])
			var/string_to_send = "[P.type]: Armor level [armor_level]: [entry]:"
			for(var/x = 0,x<11,x++)
				string_to_send += " [x]:[data["[armor_level]"][entry]["[x]"]]"
			log_and_message_admins(string_to_send)




/proc/lazy_return_testing(var/chex,var/energy)
	return list("chex" = chex, "energy" = energy)

/mob/living/carbon/human/monkey/testerboyo/handle_ballistics(var/obj/item/projectile/bullet/P, var/def_zone)
	var/chex = 0
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
	var/penetration_chance = armor_penetration_probability(ballistic_armor,P)
	if(!prob(penetration_chance))	//Boo-hoo we got deflected. Do boring agony/bruises stuff.
		var/pain_hit = hit_organ ? "into your [hit_organ]" : "into you"

		var/hurt_value = P.velocity * P.grains / (BULLET_DEFLECTED_PAIN_DIVISOR * (1 + ballistic_armor/BULLET_DEFLECTED_BULLET_DIVISOR + melee_armor/BULLET_DEFLECTED_MELEE_DIVISOR)) //Better armor spreads out the energy better.
		var/hurt_value_pain = hurt_value ** BULLET_DEFLECTED_PAIN_EXPONENT
		var/hurt_value_bruise = max(0,hurt_value-BULLET_DEFLECTED_BRUISE_SUBTRACT)

		var/absorber = ballistic_armor ? "armor" : "body"	//There is a super tiny chance that small rounds can get deflected without armor, so this is just incase.

		to_chat(src,span_warning("You feel the energy of the bullet painfully transfered [pain_hit] as your [absorber] deflects it!"))
		apply_damage(hurt_value_pain,HALLOSS,def_zone)
		if(hurt_value_bruise)
			apply_damage(hurt_value_bruise,BRUTE,def_zone)
		P.sub_velocity(P.velocity)
		return lazy_return_testing(chex,0)
	else	//Now the FUN begins
		chex |= BULLET_PENETRATED
		var/area_over_mass = P.diam * P.diam / P.grains
		//Most of these calculations don't involve energies because I'm treating flesh and organic tissue as a fluid since it's squishy and stuff.
		//Since drag is proportional to velocity, we can do things on an m*v basis instead of an mv^2 basis.
		//Obviously bones are more solid, so we do actual energy calculations for that.
		//var/conversion_efficiency = P.hollow_point ? 0.925 : 1
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
			return lazy_return_testing(chex,energy_dumped_organic)
		if(hit_organ)
			chex |= BULLET_PASSED_LEAVE_EARLY
			return organ_handle_ballistics(P,hit_organ,energy_dumped_organic,internal_loss,ballistic_armor,updated_organ_weight,chex)
		else
			return general_handle_ballistics(P,def_zone,energy_dumped_organic,internal_loss,ballistic_armor)

/mob/living/carbon/human/monkey/testerboyo/organ_handle_ballistics(var/obj/item/projectile/bullet/P,var/obj/item/organ/external/hit_organ,var/energy_dumped_organic,var/internal_loss,var/ballistic_armor,var/list/updated_organ_weight,var/chex)
	//var/conversion_efficiency = P.hollow_point ? 0.8 : 1
	var/energy_past
	var/area_over_mass = P.diam * P.diam / P.grains
	var/bone_chance = BONE_HIT_CHANCE_UNENCASED
	if(hit_organ.encased)
		bone_chance = BONE_HIT_CHANCE_ENCASED
	else
		bone_chance = ballistic_variables["bone_chance_unencased"][hit_organ.organ_tag]
	if(prob(bone_chance))
		chex |= BULLET_BONECHECK1_TRUE
		var/energy_to_fracture = max(GLOB.BONE_JOULES_MIN, hit_organ.min_broken_damage * (GAUSSIAN_RANDOM()*GLOB.BONE_JOULES_PERHP_DEV + GLOB.BONE_JOULES_PERHP_AVG))
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			return lazy_return_testing(chex,energy_dumped_organic)
		else
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += energy_to_fracture / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.
	chex |= BULLET_PASSED_BONECHECK1
	if(hit_organ.internal_organs.len && P.velocity > area_over_mass*ORGAN_LOSS_COEFFICIENT && prob(ballistic_variables["organ_hit_chance"][hit_organ.organ_tag]) && updated_organ_weight[hit_organ] && updated_organ_weight[hit_organ].len)
		chex |= BULLET_ORGANCHECK_TRUE
		energy_past = P.energy
		P.sub_velocity(internal_loss)
		if(!P.velocity)
			return lazy_return_testing(chex,energy_dumped_organic)
	chex |= BULLET_PASSED_ORGANCHECK
	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += energy_past - P.energy
	if(!P.velocity || (hit_organ.organ_tag in ballistic_variables["organ_leave_early"]) || prob(PROB_LEAVE_EARLY_SECOND))
		return lazy_return_testing(chex,energy_dumped_organic)
	chex |= BULLET_PASSED_INTERNALCHECK2
	if(prob(bone_chance))
		chex |= BULLET_BONECHECK2_TRUE
		var/energy_to_fracture = max(GLOB.BONE_JOULES_MIN, hit_organ.min_broken_damage * (GAUSSIAN_RANDOM()*GLOB.BONE_JOULES_PERHP_DEV + GLOB.BONE_JOULES_PERHP_AVG))
		if(energy_to_fracture>=P.energy) //We don't have enough energy to get through the bone. This is the end for us!
			energy_dumped_organic += P.energy/2 //About half of our remaining energy will go into fucking up this boi, the rest is absorbed by the bone
			P.sub_velocity(P.velocity)
			return lazy_return_testing(chex,energy_dumped_organic)
		else
			P.sub_energy(energy_to_fracture)
			energy_dumped_organic += energy_to_fracture / 3 //About a third of the energy that goes into fracturing the bone also goes into fucking up tissues.
	chex |= BULLET_PASSED_BONECHECK2
	energy_past = P.energy
	P.sub_velocity(internal_loss)
	energy_dumped_organic += energy_past - P.energy
	if(!P.velocity)
		return lazy_return_testing(chex,energy_dumped_organic)
	chex |= BULLET_PASSED_INTERNALCHECK3
	var/penetration_chance = armor_penetration_probability(ballistic_armor,P)
	if(prob(penetration_chance))
		return lazy_return_testing(chex,energy_dumped_organic)
	else
		energy_dumped_organic += P.energy / 3
		P.sub_velocity(P.velocity)
		return lazy_return_testing(chex,energy_dumped_organic)
