//Procedures in this file: Fracture repair surgery
//////////////////////////////////////////////////////////////////
//						BONE SURGERY							//
//////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////
// Bone Glue Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/glue_bone
	surgery_name = "Glue Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/bonegel = 100
	)

	allowed_procs = list(IS_SCREWDRIVER = 75)

	can_infect = 1
	blood_level = 1

	min_duration = 30 //CHOMPedit
	max_duration = 40 //CHOMPedit

/datum/surgery_step/glue_bone/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(coverage_check(user, target, affected, tool))
		return 0
	return affected && (affected.robotic < ORGAN_ROBOT) && affected.open >= 2 && affected.stage == 0

/datum/surgery_step/glue_bone/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if (affected.stage == 0)
		user.balloon_alert_visible("[user] starts applying medication to the damaged bones in [target]'s [affected.name] with \the [tool]." , \
		"You start applying medication to the damaged bones in [target]'s [affected.name] with \the [tool].") // CHOMPEdit - Ballon alert
	target.custom_pain("Something in your [affected.name] is causing you a lot of pain!", 50)
	..()

/datum/surgery_step/glue_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user] applies some [tool] to [target]'s bone in [affected.name]", \
		"You apply some [tool] to [target]'s bone in [affected.name] with \the [tool].") // CHOMPEdit - Ballon alert
	affected.stage = 1

/datum/surgery_step/glue_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user]'s hand slips, smearing [tool] in the incision in [target]'s [affected.name]!" , \
	"Your hand slips, smearing [tool] in the incision in [target]'s [affected.name]!") // CHOMPEdit - Ballon alert

///////////////////////////////////////////////////////////////
// Bone Setting Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/set_bone
	surgery_name = "Set Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/bonesetter = 100
	)

	allowed_procs = list(IS_WRENCH = 75)

	min_duration = 30 //CHOMPedit
	max_duration = 45 //CHOMPedit

/datum/surgery_step/set_bone/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(coverage_check(user, target, affected, tool))
		return 0
	return affected && affected.organ_tag != BP_HEAD && !(affected.robotic >= ORGAN_ROBOT) && affected.open >= 2 && affected.stage == 1

/datum/surgery_step/set_bone/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user] is beginning to set the bone in [target]'s [affected.name] in place with \the [tool]." , \
		"You are beginning to set the bone in [target]'s [affected.name] in place with \the [tool].") // CHOMPEdit - Ballon alert
	target.custom_pain("The pain in your [affected.name] is going to make you pass out!", 50)
	..()

/datum/surgery_step/set_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if (affected.status & ORGAN_BROKEN)
		user.balloon_alert_visible("[user] sets the bone in [target]'s [affected.name] in place with \the [tool].", \
			"You set the bone in [target]'s [affected.name] in place with \the [tool].") // CHOMPEdit - Ballon alert
		affected.stage = 2
	else
		user.balloon_alert_visible("[user] sets the bone in [target]'s [affected.name] in the WRONG place with \the [tool].", \
			"You set the bone in [target]'s [affected.name] in the WRONG place with \the [tool].") // CHOMPEdit - Ballon alert
		affected.fracture()

/datum/surgery_step/set_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user]'s hand slips, damaging the bone in [target]'s [affected.name] with \the [tool]!" , \
		"Your hand slips, damaging the bone in [target]'s [affected.name] with \the [tool]!") // CHOMPEdit - Ballon alert
	affected.createwound(BRUISE, 5)

///////////////////////////////////////////////////////////////
// Skull Mending Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/mend_skull
	surgery_name = "Mend Skull"
	allowed_tools = list(
		/obj/item/weapon/surgical/bonesetter = 100
	)

	allowed_procs = list(IS_WRENCH = 75)

	min_duration = 40 //CHOMPedit
	max_duration = 50 //CHOMPedit

/datum/surgery_step/mend_skull/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(coverage_check(user, target, affected, tool))
		return 0
	return affected && affected.organ_tag == BP_HEAD && (affected.robotic < ORGAN_ROBOT) && affected.open >= 2 && affected.stage == 1

/datum/surgery_step/mend_skull/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.balloon_alert_visible("[user] is beginning to piece together [target]'s skull with \the [tool]."  , \
		"You are beginning to piece together [target]'s skull with \the [tool].") // CHOMPEdit - Ballon alert
	..()

/datum/surgery_step/mend_skull/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user] sets [target]'s skull with \the [tool]." , \
		"You set [target]'s skull with \the [tool].") // CHOMPEdit - Ballon alert
	affected.stage = 2

/datum/surgery_step/mend_skull/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("[user]'s hand slips, damaging [target]'s face with \the [tool]!"  , \
		"Your hand slips, damaging [target]'s face with \the [tool]!") // CHOMPEdit - Ballon alert
	var/obj/item/organ/external/head/h = affected
	h.createwound(BRUISE, 10)
	h.disfigured = 1

///////////////////////////////////////////////////////////////
// Bone Fixing Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/finish_bone
	surgery_name = "Finish Mending Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/bonegel = 100
	)

	allowed_procs = list(IS_SCREWDRIVER = 75)

	can_infect = 1
	blood_level = 1

	min_duration = 30 //CHOMPedit
	max_duration = 30 //CHOMPedit

/datum/surgery_step/finish_bone/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(coverage_check(user, target, affected, tool))
		return 0
	return affected && affected.open >= 2 && !(affected.robotic >= ORGAN_ROBOT) && affected.stage == 2

/datum/surgery_step/finish_bone/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user] starts to finish mending the damaged bones in [target]'s [affected.name] with \the [tool].", \
	"You start to finish mending the damaged bones in [target]'s [affected.name] with \the [tool].") // CHOMPEdit - Ballon alert
	..()

/datum/surgery_step/finish_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user] has mended the damaged bones in [target]'s [affected.name] with \the [tool]."  , \
		"You have mended the damaged bones in [target]'s [affected.name] with \the [tool]." ) // CHOMPEdit - Ballon alert
	affected.status &= ~ORGAN_BROKEN
	affected.stage = 0

/datum/surgery_step/finish_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user]'s hand slips, smearing [tool] in the incision in [target]'s [affected.name]!" , \
	"Your hand slips, smearing [tool] in the incision in [target]'s [affected.name]!") // CHOMPEdit - Ballon alert

///////////////////////////////////////////////////////////////
// Bone Clamp Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/clamp_bone
	surgery_name = "Clamp Bone"
	allowed_tools = list(
		/obj/item/weapon/surgical/bone_clamp = 100
		)

	can_infect = 1
	blood_level = 1

	min_duration = 45 //CHOMPedit
	max_duration = 55 //CHOMPedit

/datum/surgery_step/clamp_bone/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(coverage_check(user, target, affected, tool))
		return 0
	return affected && (affected.robotic < ORGAN_ROBOT) && affected.open >= 2 && affected.stage == 0

/datum/surgery_step/clamp_bone/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if (affected.stage == 0)
		user.balloon_alert_visible("[user] starts repairing the damaged bones in [target]'s [affected.name] with \the [tool]." , \
		"You starts repairing the damaged bones in [target]'s [affected.name] with \the [tool].") // CHOMPEdit - Ballon alert
	target.custom_pain("Something in your [affected.name] is causing you a lot of pain!", 50)
	..()

/datum/surgery_step/clamp_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user] sets the bone in [target]'s [affected.name] with \the [tool].", \
		"You sets [target]'s bone in [affected.name] with \the [tool].") // CHOMPEdit - Ballon alert
	affected.status &= ~ORGAN_BROKEN

/datum/surgery_step/clamp_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.balloon_alert_visible("[user]'s hand slips, damaging the bone in [target]'s [affected.name] with \the [tool]!" , \
		"Your hand slips, damaging the bone in [target]'s [affected.name] with \the [tool]!") // CHOMPEdit - Ballon alert
	affected.createwound(BRUISE, 5)
