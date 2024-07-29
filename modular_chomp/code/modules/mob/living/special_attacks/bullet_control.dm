#define COMSIG_SPECIAL_ATTACK "special_attack"

/mob/living/simple_mob/do_special_attack()
	SEND_SIGNAL(src, COMSIG_SPECIAL_ATTACK)

/datum/component/mob_bulletpattern
	var/projectiletype
	var/target

/datum/component/mob_bulletpattern/Initialize()
	RegisterSignal(parent, COMSIG_SPECIAL_ATTACK, PROC_REF(do_special_attack))

/datum/component/mob_bulletpattern/proc/do_special_attack(src)
	var/obj/item/projectile/P = new projectiletype(get_turf(src))
	P.launch_projectile(target, BP_TORSO, src)

/*
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



/mob/living/simple_mob/mechanical/mecha/eclipse
	var/specialattackprojectile = /obj/item/projectile/energy/phase/bolt

/mob/living/simple_mob/mechanical/mecha/eclipse/Initialize()
	RegisterSignal(MOB_BULLETPATTERN, TYPE_PROC_REF(do_special_attack))
*/

