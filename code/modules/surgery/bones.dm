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
		/obj/item/surgical/bonegel = 100
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
		user.visible_message(span_notice("[user] starts applying medication to the damaged bones in [target]'s [affected.name] with \the [tool].") , \
		span_notice("You start applying medication to the damaged bones in [target]'s [affected.name] with \the [tool]."))
<<<<<<< HEAD
		user.balloon_alert_visible("applies medication to the damaged bones.", "applying medication to the damaged bones.") // CHOMPEdit
=======
		user.balloon_alert_visible("applies medication to the damaged bones.", "applying medication to the damaged bones.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	target.custom_pain("Something in your [affected.name] is causing you a lot of pain!", 50)
	..()

/datum/surgery_step/glue_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(span_notice("[user] applies some [tool] to [target]'s bone in [affected.name]"), \
		span_notice("You apply some [tool] to [target]'s bone in [affected.name] with \the [tool]."))
<<<<<<< HEAD
	user.balloon_alert_visible("applies [tool] to [target]'s bone.", "applying [tool] to [target]'s bone.") // CHOMPEdit
=======
	user.balloon_alert_visible("applies [tool] to [target]'s bone.", "applying [tool] to [target]'s bone.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	affected.stage = 1

/datum/surgery_step/glue_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(span_danger("[user]'s hand slips, smearing [tool] in the incision in [target]'s [affected.name]!") , \
	span_danger("Your hand slips, smearing [tool] in the incision in [target]'s [affected.name]!"))
<<<<<<< HEAD
	user.balloon_alert_visible("slips, damaging [target]'s [affected.name]", "your hand slips.") // CHOMPEdit
=======
	user.balloon_alert_visible("slips, damaging [target]'s [affected.name]", "your hand slips.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))

///////////////////////////////////////////////////////////////
// Bone Setting Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/set_bone
	surgery_name = "Set Bone"
	allowed_tools = list(
		/obj/item/surgical/bonesetter = 100
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
	user.visible_message(span_notice("[user] is beginning to set the bone in [target]'s [affected.name] in place with \the [tool].") , \
		span_notice("You are beginning to set the bone in [target]'s [affected.name] in place with \the [tool]."))
<<<<<<< HEAD
	user.balloon_alert_visible("begins to set the bone in place.", "setting the bone in place.") // CHOMPEdit - Balloon alert
=======
	user.balloon_alert_visible("begins to set the bone in place.", "setting the bone in place.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	target.custom_pain("The pain in your [affected.name] is going to make you pass out!", 50)
	..()

/datum/surgery_step/set_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if (affected.status & ORGAN_BROKEN)
		user.visible_message(span_notice("[user] sets the bone in [target]'s [affected.name] in place with \the [tool]."), \
			span_notice("You set the bone in [target]'s [affected.name] in place with \the [tool]."))
<<<<<<< HEAD
		user.balloon_alert_visible("sets the bone in place.", "bone set in place.") // CHOMPEdit - Balloon alert
=======
		user.balloon_alert_visible("sets the bone in place.", "bone set in place.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
		affected.stage = 2
	else
		user.visible_message("[user] sets the bone in [target]'s [affected.name] " + span_danger("in the WRONG place with \the [tool]."), \
			"You set the bone in [target]'s [affected.name] " + span_danger("in the WRONG place with \the [tool]."))
<<<<<<< HEAD
		user.balloon_alert_visible("sets the bone in the WRONG place.", "bone set in the WRONG place.") // CHOMPEdit - Balloon alert
=======
		user.balloon_alert_visible("sets the bone in the WRONG place.", "bone set in the WRONG place.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
		affected.fracture()

/datum/surgery_step/set_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(span_danger("[user]'s hand slips, damaging the bone in [target]'s [affected.name] with \the [tool]!") , \
		span_danger("Your hand slips, damaging the bone in [target]'s [affected.name] with \the [tool]!"))
<<<<<<< HEAD
	user.balloon_alert_visible("slips, damaging the bone.", "your hand slips, damaging the bone") // CHOMPEdit - Balloon alert
=======
	user.balloon_alert_visible("slips, damaging the bone.", "your hand slips, damaging the bone")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	affected.createwound(BRUISE, 5)

///////////////////////////////////////////////////////////////
// Skull Mending Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/mend_skull
	surgery_name = "Mend Skull"
	allowed_tools = list(
		/obj/item/surgical/bonesetter = 100
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
	user.visible_message(span_notice("[user] is beginning to piece together [target]'s skull with \the [tool].")  , \
		span_notice("You are beginning to piece together [target]'s skull with \the [tool]."))
<<<<<<< HEAD
	user.balloon_alert_visible("pieces the skull together", "piecing skull together.") // CHOMPEdit
=======
	user.balloon_alert_visible("pieces the skull together", "piecing skull together.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	..()

/datum/surgery_step/mend_skull/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(span_notice("[user] sets [target]'s skull with \the [tool].") , \
		span_notice("You set [target]'s skull with \the [tool]."))
<<<<<<< HEAD
	user.balloon_alert_visible("sets the skull back.", "skull set back.") // CHOMPEdit
=======
	user.balloon_alert_visible("sets the skull back.", "skull set back.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	affected.stage = 2

/datum/surgery_step/mend_skull/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(span_danger("[user]'s hand slips, damaging [target]'s face with \the [tool]!")  , \
		span_danger("Your hand slips, damaging [target]'s face with \the [tool]!"))
<<<<<<< HEAD
	user.balloon_alert_visible("slips, damaging [target]'s face", "your hand slips, damaging [target]'s face") // CHOMPEdit
=======
	user.balloon_alert_visible("slips, damaging [target]'s face", "your hand slips, damaging [target]'s face")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	var/obj/item/organ/external/head/h = affected
	h.createwound(BRUISE, 10)
	h.disfigured = 1

///////////////////////////////////////////////////////////////
// Bone Fixing Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/finish_bone
	surgery_name = "Finish Mending Bone"
	allowed_tools = list(
		/obj/item/surgical/bonegel = 100
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
	user.visible_message(span_notice("[user] starts to finish mending the damaged bones in [target]'s [affected.name] with \the [tool]."), \
	span_notice("You start to finish mending the damaged bones in [target]'s [affected.name] with \the [tool]."))
<<<<<<< HEAD
	user.balloon_alert_visible("begins mending damaged bones.", "mending damaged bones.") // CHOMPEdit
=======
	user.balloon_alert_visible("begins mending damaged bones.", "mending damaged bones.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	..()

/datum/surgery_step/finish_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(span_notice("[user] has mended the damaged bones in [target]'s [affected.name] with \the [tool].")  , \
		span_notice("You have mended the damaged bones in [target]'s [affected.name] with \the [tool].") )
<<<<<<< HEAD
	user.balloon_alert_visible("mends damaged bones.", "mended damaged bones.") // CHOMPEdit
=======
	user.balloon_alert_visible("mends damaged bones.", "mended damaged bones.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	affected.status &= ~ORGAN_BROKEN
	affected.stage = 0

/datum/surgery_step/finish_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(span_danger("[user]'s hand slips, smearing [tool] in the incision in [target]'s [affected.name]!") , \
	span_danger("Your hand slips, smearing [tool] in the incision in [target]'s [affected.name]!"))
<<<<<<< HEAD
	user.balloon_alert_visible("slips, smearing [tool] in the incision.", "your hand slips, smearing [tool].") // CHOMPEdit
=======
	user.balloon_alert_visible("slips, smearing [tool] in the incision.", "your hand slips, smearing [tool].")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))

///////////////////////////////////////////////////////////////
// Bone Clamp Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/clamp_bone
	surgery_name = "Clamp Bone"
	allowed_tools = list(
		/obj/item/surgical/bone_clamp = 100
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
		user.visible_message(span_notice("[user] starts repairing the damaged bones in [target]'s [affected.name] with \the [tool].") , \
		span_notice("You starts repairing the damaged bones in [target]'s [affected.name] with \the [tool]."))
<<<<<<< HEAD
		user.balloon_alert_visible("begins repairing damaged bones.", "repairing damaged bones.") // CHOMPEdit
=======
		user.balloon_alert_visible("begins repairing damaged bones.", "repairing damaged bones.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	target.custom_pain("Something in your [affected.name] is causing you a lot of pain!", 50)
	..()

/datum/surgery_step/clamp_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(span_notice("[user] sets the bone in [target]'s [affected.name] with \the [tool]."), \
		span_notice("You sets [target]'s bone in [affected.name] with \the [tool]."))
<<<<<<< HEAD
	user.balloon_alert_visible("sets the bone back in.", "bone set in.") // CHOMPEdit
=======
	user.balloon_alert_visible("sets the bone back in.", "bone set in.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	affected.status &= ~ORGAN_BROKEN

/datum/surgery_step/clamp_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(span_danger("[user]'s hand slips, damaging the bone in [target]'s [affected.name] with \the [tool]!") , \
		span_danger("Your hand slips, damaging the bone in [target]'s [affected.name] with \the [tool]!"))
<<<<<<< HEAD
	user.balloon_alert_visible("slips, damaging [target]'s [affected.name]", "your hand slips, damaging the bone.") // CHOMPEdit
=======
	user.balloon_alert_visible("slips, damaging [target]'s [affected.name]", "your hand slips, damaging the bone.")
>>>>>>> 78c71907e9 (Balloon Alerts (#17540))
	affected.createwound(BRUISE, 5)
