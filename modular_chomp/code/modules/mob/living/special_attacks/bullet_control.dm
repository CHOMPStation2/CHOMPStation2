/datum/component/mob_bulletpattern
	var/mob/carbon/simple_mob

/datum/component/mob_bulletpattern/Initialize()
	RegisterSignal(MOB_BULLETPATTERN, TYPE_PROC_REF(do_special_attack))


/mob/living/simple_mob/mechanical/mecha/eclipse
	var/specialattackprojectile = /obj/item/projectile/energy/phase/bolt

/mob/living/simple_mob/mechanical/mecha/eclipse/do_special_attack(atom/A)
	LoadComponent(/datum/component/mob_bulletpattern, usr)
	SEND_SIGNAL(usr, MOB_BULLETPATTERN)

/datum/component/mob_bulletpattern/do_special_attack()