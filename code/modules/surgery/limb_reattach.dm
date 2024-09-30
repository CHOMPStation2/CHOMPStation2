//Procedures in this file: Robotic limbs attachment, meat limbs attachment
//////////////////////////////////////////////////////////////////
//						LIMB SURGERY							//
//////////////////////////////////////////////////////////////////

/datum/surgery_step/limb/
	surgery_name = "Limb"
	priority = 3 // Must be higher than /datum/surgery_step/internal
	req_open = 0
	can_infect = 0

/datum/surgery_step/limb/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if (affected)
		return 0
	var/list/organ_data = target.species.has_limbs["[target_zone]"]
	return !isnull(organ_data)

///////////////////////////////////////////////////////////////
// Limb Attachment Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/limb/attach
	surgery_name = "Attach Limb"
	allowed_tools = list(/obj/item/organ/external = 100)

	min_duration = 50
	max_duration = 50 //CHOMPedit

/datum/surgery_step/limb/attach/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if(!istype(tool))
		return 0
	var/obj/item/organ/external/E = tool
	var/obj/item/organ/external/P = target.organs_by_name[E.parent_organ]
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if (affected)
		to_chat(user, "<span class='warning'>Something is in the way! You can't attach [E] here!</span>")
		user.balloon_alert(user, "Something is in the way!") // CHOMPEdit
		return 0
	if(!P)
		to_chat(user, "<span class='warning'>There's nothing to attach [E] to!</span>")
		user.balloon_alert(user, "There's nothing to attach [E] to!") // CHOMPEdit
		return 0
	else if((P.robotic >= ORGAN_ROBOT) && (E.robotic < ORGAN_ROBOT))
		to_chat(user, "<span class='warning'>Attaching [E] to [P] wouldn't work well.</span>")
		user.balloon_alert(user, "Attaching [E] to [P] wouldn't work well") // CHOMPEdit
		return 0
	else if(istype(E, /obj/item/organ/external/head) && E.robotic >= ORGAN_ROBOT && P.robotic < ORGAN_ROBOT)
		to_chat(user, "<span class='warning'>Attaching [E] to [P] might break [E].</span>")
		user.balloon_alert(user, "Attaching [E] to [P] might break [E]") // CHOMPEdit
		return 0
	else
		return 1

/datum/surgery_step/limb/attach/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/E = tool
	user.visible_message("<span class='filter_notice'>[user] starts attaching [E.name] to [target]'s [E.amputation_point].</span>", \
	"<span class='filter_notice'>You start attaching [E.name] to [target]'s [E.amputation_point].</span>")
	user.balloon_alert_visible("Starts attaching [E.name] to [target]'s [E.amputation_point]", "Attaching [E.name] to [E.amputation_point]") // CHOMPEdit

/datum/surgery_step/limb/attach/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/E = tool
	user.visible_message("<span class='notice'>[user] has attached [target]'s [E.name] to the [E.amputation_point].</span>",	\
	"<span class='notice'>You have attached [target]'s [E.name] to the [E.amputation_point].</span>")
	user.balloon_alert_visible("Attaches [target]'s [E.name] to \the [E.amputation_point]", "Attached \the [E.name] to the [E.amputation_point]") // CHOMPEdit
	user.drop_from_inventory(E)
	E.replaced(target)

	// Modular bodyparts (like prosthetics) do not need to be reconnected.
	if(E.get_modular_limb_category() != MODULAR_BODYPART_INVALID)
		E.status &= ~ORGAN_CUT_AWAY
		for(var/obj/item/organ/external/child in E.children)
			child.status &= ~ORGAN_CUT_AWAY

	target.update_icons_body(FALSE)
	target.updatehealth()
	target.UpdateDamageIcon()

/datum/surgery_step/limb/attach/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/E = tool
	user.visible_message("<span class='warning'> [user]'s hand slips, damaging [target]'s [E.amputation_point]!</span>", \
	"<span class='warning'> Your hand slips, damaging [target]'s [E.amputation_point]!</span>")
	user.balloon_alert_visible("Slips, damaging [target]'s [E.amputation_point]", "Your hand slips, damaging [E.amputation_point]") // CHOMPEdit
	target.apply_damage(10, BRUTE, null, sharp = TRUE)

///////////////////////////////////////////////////////////////
// Limb Connection Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/limb/connect
	surgery_name = "Connect Limb"
	allowed_tools = list(
	/obj/item/surgical/hemostat = 100,	\
	/obj/item/stack/cable_coil = 75, 	\
	/obj/item/assembly/mousetrap = 20
	)
	can_infect = 1

	min_duration = 70 //CHOMPedit Keeping this one on the longer side
	max_duration = 70 //CHOMPedit

/datum/surgery_step/limb/connect/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/E = target.get_organ(target_zone)
	return E && !E.is_stump() && (E.status & ORGAN_CUT_AWAY)

/datum/surgery_step/limb/connect/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/E = target.get_organ(target_zone)
	user.visible_message("<span class='filter_notice'>[user] starts connecting tendons and muscles in [target]'s [E.amputation_point] with [tool].</span>", \
	"<span class='filter_notice'>You start connecting tendons and muscle in [target]'s [E.amputation_point].</span>")
	user.balloon_alert_visible("Starts connecting tendons and muscles in [target]'s [E.amputation_point]", "Connecting tendons and muscle in \the [E.amputation_point]") // CHOMPEdit

/datum/surgery_step/limb/connect/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/E = target.get_organ(target_zone)
	user.visible_message("<span class='notice'>[user] has connected tendons and muscles in [target]'s [E.amputation_point] with [tool].</span>",	\
	"<span class='notice'>You have connected tendons and muscles in [target]'s [E.amputation_point] with [tool].</span>")
	user.balloon_alert_visible("Connected tendons and muscles in [target]'s [E.amputation_point]", "Connected tendons and muscles in \the [E.amputation_point]") // CHOMPEdit
	E.status &= ~ORGAN_CUT_AWAY
	target.update_icons_body()
	target.updatehealth()
	target.UpdateDamageIcon()

/datum/surgery_step/limb/connect/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/E = tool
	user.visible_message("<span class='warning'> [user]'s hand slips, damaging [target]'s [E.amputation_point]!</span>", \
	"<span class='warning'> Your hand slips, damaging [target]'s [E.amputation_point]!</span>")
	user.balloon_alert_visible("Slips, damaging [target]'s [E.amputation_point]", "Your hand slips, damaging \the [E.amputation_point]") // CHOMPEdit
	target.apply_damage(10, BRUTE, null, sharp = TRUE)

///////////////////////////////////////////////////////////////
// Robolimb Attachment Surgery
///////////////////////////////////////////////////////////////

/datum/surgery_step/limb/mechanize
	surgery_name = "Mechanize Limb"
	allowed_tools = list(/obj/item/robot_parts = 100)

	min_duration = 80
	max_duration = 100

/datum/surgery_step/limb/mechanize/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if(..() && istype(tool))
		var/obj/item/robot_parts/p = tool
		if (p.part)
			if (!(target_zone in p.part))
				return 0
		return isnull(target.get_organ(target_zone))

/datum/surgery_step/limb/mechanize/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='filter_notice'>[user] starts attaching \the [tool] to [target].</span>", \
	"<span class='filter_notice'>You start attaching \the [tool] to [target].</span>")
	user.balloon_alert_visible("Starts attaching \the [tool] to [target]", "Attachng \the [tool]") // CHOMPEdit

/datum/surgery_step/limb/mechanize/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/robot_parts/L = tool
	user.visible_message("<span class='notice'>[user] has attached \the [tool] to [target].</span>",	\
	"<span class='notice'>You have attached \the [tool] to [target].</span>")
	user.balloon_alert_visible("Attaches \the [tool] to  [target]", "Attached \the [tool]") // CHOMPEdit

	if(L.part)
		for(var/part_name in L.part)
			if(!isnull(target.get_organ(part_name)))
				continue
			var/list/organ_data = target.species.has_limbs["[part_name]"]
			if(!organ_data)
				continue
			var/new_limb_type = organ_data["path"]
			var/obj/item/organ/external/new_limb = new new_limb_type(target)
			new_limb.robotize(L.model_info)
			if(L.sabotaged)
				new_limb.sabotaged = 1

	target.update_icons_body(FALSE)
	target.updatehealth()
	target.UpdateDamageIcon()

	qdel(tool)

/datum/surgery_step/limb/mechanize/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='warning'> [user]'s hand slips, damaging [target]'s flesh!</span>", \
	"<span class='warning'> Your hand slips, damaging [target]'s flesh!</span>")
	user.balloon_alert_visible("Slips, damaging [target]'s flesh", "Your hand slips, damaging the flesh") // CHOMPEdit
	target.apply_damage(10, BRUTE, null, sharp = TRUE)
