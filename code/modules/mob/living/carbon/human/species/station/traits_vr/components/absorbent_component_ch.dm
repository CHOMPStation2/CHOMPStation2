//Component that handles cleaning tiles whenever we take a step
/datum/component/absorbent

/datum/component/absorbent/Initialize()
	if(!ismob(parent))
		return COMPONENT_INCOMPATIBLE
	. = ..()

/datum/component/absorbent/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, do_clean())

/datum/component/absorbent/proc/do_clean()
	var/turf/T = get_turf(parent)
	var/nut = 0
	if(T)
	var/mob/living/carbon/human/H = parent
		if(!(H.shoes || (H.wear_suit && (H.wear_suit.body_parts_covered & FEET))))
			for(var/obj/O in T)
				nut += O.clean_blood() * rand(5, 15)
			if (istype(T, /turf/simulated))
				var/turf/simulated/S = T
				nut += T.clean_blood() * rand(10, 20)
				if(S.dirt > 50)
					S.dirt = 0
					nut += rand(10, 20)
		nut += H.clean_blood(1) * rand(5, 15)
		if(H.r_hand)
			nut += H.r_hand.clean_blood() * rand(5, 15)
		if(H.l_hand)
			nut += H.l_hand.clean_blood() * rand(5, 15)

		if(H.head)
			if(H.head.clean_blood())
				H.update_inv_head(0)
				nut += rand(5, 15)
		if(H.wear_suit)
			if(H.wear_suit.clean_blood())
				H.update_inv_wear_suit(0)
				nut += rand(5, 15)
		if(H.w_uniform)
			if(H.w_uniform.clean_blood())
				H.update_inv_w_uniform(0)
				nut += rand(5, 15)
	H.adjust_nutrition(nut)
