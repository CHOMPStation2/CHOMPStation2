//Procedures in this file: Generic ribcage opening steps, Removing alien embryo, Fixing internal organs.
//////////////////////////////////////////////////////////////////
//				GENERIC	RIBCAGE SURGERY							//
//////////////////////////////////////////////////////////////////
/datum/surgery_step/open_encased
	surgery_name = "Open Encased"
	priority = 2
	can_infect = 1
	blood_level = 1

/datum/surgery_step/open_encased/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0

	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(coverage_check(user, target, affected, tool))
		return 0
	return affected && !(affected.robotic >= ORGAN_ROBOT) && affected.encased && affected.open >= 2

///////////////////////////////////////////////////////////////
// Rib Sawing Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/open_encased/saw
	surgery_name = "Cut Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/circular_saw = 100, \
		/obj/item/weapon/material/knife/machete/hatchet = 75
	)

	min_duration = 50 //CHOMPedit
	max_duration = 50 //CHOMPedit

/datum/surgery_step/open_encased/saw/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return ..() && affected && affected.open == 2

/datum/surgery_step/open_encased/saw/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	user.balloon_alert_visible("[user] begins to cut through [target]'s [affected.encased] with \the [tool].", \
	"Cutting through [target]'s [affected.encased] with \the [tool].") // CHOMPEdit - Ballon alert
	target.custom_pain("Something hurts horribly in your [affected.name]!", 60)
	..()

/datum/surgery_step/open_encased/saw/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	user.balloon_alert_visible("[user] has cut [target]'s [affected.encased] open with \the [tool].", \
	"Cuttng [target]'s [affected.encased] open with \the [tool].") // CHOMPEdit - Ballon alert
	affected.open = 2.5

/datum/surgery_step/open_encased/saw/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	user.balloon_alert_visible("[user]'s hand slips, cracking [target]'s [affected.encased] with \the [tool]!" , \
	"Your hand slips, cracking [target]'s [affected.encased] with \the [tool]!") // CHOMPEdit - Ballon alert

	affected.createwound(CUT, 20)
	affected.fracture()

///////////////////////////////////////////////////////////////
// Bone Opening Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/open_encased/retract
	surgery_name = "Retract Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/retractor = 100
	)

	allowed_procs = list(IS_CROWBAR = 75)

	min_duration = 30 //CHOMPedit
	max_duration = 30 //CHOMPedit

/datum/surgery_step/open_encased/retract/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return ..() && affected && affected.open == 2.5

/datum/surgery_step/open_encased/retract/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	var/msg = "[user] starts to force open the [affected.encased] in [target]'s [affected.name] with \the [tool]." // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='filter_notice'>Forcing open the [affected.encased] in [target]'s [affected.name] with \the [tool].</span>"
	user.balloon_alert_visible(msg, self_msg) // CHOMPEdit - Ballon alert
	target.custom_pain("Something hurts horribly in your [affected.name]!", 40)
	..()

/datum/surgery_step/open_encased/retract/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	var/msg = "[user] forces open [target]'s [affected.encased] with \the [tool]." // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='notice'>[target]'s [affected.encased] forced open with \the [tool].</span>"
	user.balloon_alert_visible(msg, self_msg) // CHOMPEdit - Ballon alert

	affected.open = 3

/datum/surgery_step/open_encased/retract/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	var/msg = "[user]'s hand slips, cracking [target]'s [affected.encased]!" // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='danger'>Your hand slips, cracking [target]'s  [affected.encased]!</span>"
	user.balloon_alert_visible(msg, self_msg) // CHOMPEdit - Ballon alert

	affected.createwound(BRUISE, 20)
	affected.fracture()

///////////////////////////////////////////////////////////////
// Retracted Bone Closing Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/open_encased/close
	surgery_name = "Close Retracted Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/retractor = 100,
	)

	allowed_procs = list(IS_CROWBAR = 75)

	min_duration = 20
	max_duration = 30 //CHOMPedit

/datum/surgery_step/open_encased/close/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return (..() && affected && affected.open == 3)

/datum/surgery_step/open_encased/close/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	var/msg = "[user] starts bending [target]'s [affected.encased] back into place with \the [tool]." // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='filter_notice'>Bending [target]'s [affected.encased] back into place with \the [tool].</span>"
	user.balloon_alert_visible(msg, self_msg) // CHOMPEdit - Ballon alert
	target.custom_pain("Something hurts horribly in your [affected.name]!", 100)
	..()

/datum/surgery_step/open_encased/close/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	var/msg = "[user] bends [target]'s [affected.encased] back into place with \the [tool]." // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='notice'>[target]'s [affected.encased] bend back into place with \the [tool].</span>"
	user.balloon_alert_visible(msg, self_msg) // CHOMPEdit - Ballon alert

	affected.open = 2.5

/datum/surgery_step/open_encased/close/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	var/msg = "[user]'s hand slips, bending [target]'s [affected.encased] the wrong way!" // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='danger'>Your hand slips, bending [target]'s [affected.encased] the wrong way!</span>"
	user.balloon_alert_visible(msg, self_msg) // CHOMPEdit - Ballon alert

	affected.createwound(BRUISE, 20)
	affected.fracture()

	/*if (prob(40)) //TODO: ORGAN REMOVAL UPDATE.
		user.visible_message("<span class='danger'> A rib pierces the lung!</span>")
		target.rupture_lung()*/

///////////////////////////////////////////////////////////////
// Retracted Bone Mending Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/open_encased/mend
	surgery_name = "Mend Retracted Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/bonegel = 100
	)

	allowed_procs = list(IS_SCREWDRIVER = 75)

	min_duration = 20
	max_duration = 20 //CHOMPedit

/datum/surgery_step/open_encased/mend/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return ..() && affected && affected.open == 2.5

/datum/surgery_step/open_encased/mend/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	var/msg = "[user] starts applying \the [tool] to [target]'s [affected.encased]." // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='filter_notice'>Applying \the [tool] to [target]'s [affected.encased].</span>"
	user.balloon_alert_visible(msg, self_msg) // CHOMPEdit - Ballon alert
	target.custom_pain("Something hurts horribly in your [affected.name]!", 100)
	..()

/datum/surgery_step/open_encased/mend/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	var/msg = "[user] applied \the [tool] to [target]'s [affected.encased]." // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='notice'>Applied \the [tool] to [target]'s [affected.encased].</span>"
	user.balloon_alert_visible(msg, self_msg) // CHOMPEdit - Ballon alert

	affected.open = 2

///////////////////////////////////////////////////////////////
// Saw/Retractor/Gel Combi-open and close.
///////////////////////////////////////////////////////////////
/datum/surgery_step/open_encased/advancedsaw_open
	surgery_name = "Advanced Cut Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/circular_saw/manager = 100
	)

	priority = 3

	min_duration = 30 //CHOMPedit
	max_duration = 35 //CHOMPedit
	excludes_steps = list(/datum/surgery_step/open_encased/saw)

/datum/surgery_step/open_encased/advancedsaw_open/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return ..() && affected && affected.open >= 2 && affected.open < 3

/datum/surgery_step/open_encased/advancedsaw_open/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	user.balloon_alert_visible("[user] begins to open [target]'s [affected.encased] with \the [tool].", \
	"Opening [target]'s [affected.encased] with \the [tool].") // CHOMPEdit - Ballon alert
	target.custom_pain("Something hurts horribly in your [affected.name]!", 60)
	..()

/datum/surgery_step/open_encased/advancedsaw_open/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	user.balloon_alert_visible("[user] has cut [target]'s [affected.encased] wide open with \the [tool].", \
	"[target]'s [affected.encased] cut wide open with \the [tool].") // CHOMPEdit - Ballon alert
	affected.open = 3

/datum/surgery_step/open_encased/advancedsaw_open/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	user.balloon_alert_visible("[user]'s hand slips, searing [target]'s [affected.encased] with \the [tool]!" , \
	"Your hand slips, searing [target]'s [affected.encased] with \the [tool]!" ) // CHOMPEdit - Ballon alert

	affected.createwound(CUT, 20)
	affected.createwound(BURN, 15)
	if(prob(affected.damage))
		affected.fracture()


/datum/surgery_step/open_encased/advancedsaw_mend
	surgery_name = "Advanced Mend Retracted Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/circular_saw/manager = 100
	)

	priority = 3

	min_duration = 30 //CHOMPedit
	max_duration = 30 //CHOMPedit

/datum/surgery_step/open_encased/advancedsaw_mend/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return (..() && affected && affected.open == 3)

/datum/surgery_step/open_encased/advancedsaw_mend/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	var/msg = "[user] starts sealing \the [target]'s [affected.encased] with \the [tool]." // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='filter_notice'>Sealing \the [target]'s [affected.encased] with \the [tool].</span>"
	user.balloon_alert_visible(msg, self_msg)
	target.custom_pain("Something hurts horribly in your [affected.name]!", 100)
	..()

/datum/surgery_step/open_encased/advancedsaw_mend/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	var/msg = "[user] sealed \the [target]'s [affected.encased] with \the [tool]." // CHOMPEdit - Ballon alert
	var/self_msg = "<span class='notice'>Sealed \the [target]'s [affected.encased] with \the [tool].</span>"
	user.balloon_alert_visible(msg, self_msg) // CHOMPEdit - Ballon alert

	affected.open = 2
