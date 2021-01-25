/datum/surgery_status/
	var/dehusk = 0

/datum/surgery_step/dehusk/
	priority = 1
	can_infect = 0
	blood_level = 1

/datum/surgery_step/dehusk/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if (!affected || (affected.robotic >= ORGAN_ROBOT))
		return 0
	if(coverage_check(user,target,affected,tool))
		return 0
	return target_zone == BP_TORSO && (HUSK in target.mutations)

/datum/surgery_step/dehusk/structinitial
	allowed_tools = list(
		/obj/item/weapon/surgical/bioregen = 100
	)
	min_duration = 90
	max_duration = 120

/datum/surgery_step/dehusk/structinitial/can_use(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	return ..() && target.op_stage.dehusk == 0

/datum/surgery_step/dehusk/structinitial/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] begins to create a fleshy but rigid looking mesh over gaps in [target]'s flesh with \the [tool].</span>", \
	"<span class='notice'>You begin to create a fleshy but rigid looking mesh over gaps in [target]'s flesh with \the [tool].</span>")
	..()

/datum/surgery_step/dehusk/structinitial/end_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] creates a fleshy but rigid looking mesh over gaps in [target]'s flesh with \the [tool].</span>", \
	"<span class='notice'>You create a fleshy but rigid looking mesh over gaps in [target]'s flesh with \the [tool].</span>")
	target.op_stage.dehusk = 1
	..()

/datum/surgery_step/dehusk/structinitial/fail_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='danger'>[user]'s hand slips, and the mesh falls, with \the [tool] scraping [target]'s body.</span>", \
	"<span class='danger'>Your hand slips, and the mesh falls, with \the [tool] scraping [target]'s body.</span>")
	affected.createwound(CUT, 15)
	affected.createwound(BRUISE, 10)
	..()

/datum/surgery_step/dehusk/relocateflesh
	allowed_tools = list(
		/obj/item/weapon/surgical/hemostat = 100,	\
		/obj/item/stack/cable_coil = 75, 	\
		/obj/item/device/assembly/mousetrap = 20
	)
	min_duration = 90
	max_duration = 120

/datum/surgery_step/dehusk/relocateflesh/can_use(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	return ..() && target.op_stage.dehusk == 1

/datum/surgery_step/dehusk/relocateflesh/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] begins to relocate some of [target]'s flesh with \the [tool], using it to fill in gaps.</span>", \
	"<span class='notice'>You begin to relocate some of [target]'s flesh with \the [tool], using it to fill in gaps.</span>")
	..()

/datum/surgery_step/dehusk/relocateflesh/end_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] relocates some of [target]'s flesh with \the [tool], using it to fill in gaps.</span>", \
	"<span class='notice'>You relocate some of [target]'s flesh with \the [tool], using it to fill in gaps.</span>")
	target.op_stage.dehusk = 2
	..()

/datum/surgery_step/dehusk/relocateflesh/fail_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='danger'>[user] accidentally rips a massive chunk out of [target]'s flesh with \the [tool], causing massive damage.</span>", \
	"<span class='danger'>You accidentally rip a massive chunk out of [target]'s flesh with \the [tool], causing massive damage.</span>")
	affected.createwound(CUT, 25)
	affected.createwound(BRUISE, 10)
	..()

/datum/surgery_step/dehusk/structfinish
	allowed_tools = list(
		/obj/item/weapon/surgical/bioregen = 100, \
		/obj/item/weapon/surgical/FixOVein = 30
	)
	min_duration = 90
	max_duration = 120

/datum/surgery_step/dehusk/structfinish/can_use(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	return ..() && target.op_stage.dehusk == 2

/datum/surgery_step/dehusk/structfinish/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if(istype(tool,/obj/item/weapon/surgical/bioregen))
		user.visible_message("<span class='notice'>[user] begins to recreate blood vessels and fill in the gaps in [target]'s flesh with \the [tool].</span>", \
	"<span class='notice'>You begin to recreate blood vessels and fill in the gaps in [target]'s flesh with \the [tool].</span>")
	else if(istype(tool,/obj/item/weapon/surgical/FixOVein))
		user.visible_message("<span class='notice'>[user] attempts to recreate blood vessels and fill in the gaps in [target]'s flesh with \the [tool].</span>", \
	"<span class='notice'>You attempt to recreate blood vessels and fill in the gaps in [target]'s flesh with \the [tool].</span>")
	..()

/datum/surgery_step/dehusk/structfinish/end_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] finishes recreating the missing biological structures and filling in gaps in [target]'s flesh with \the [tool].</span>", \
	"<span class='notice'>You finish recreating the missing biological structures and filling in gaps in [target]'s flesh with \the [tool].</span>")
	target.op_stage.dehusk = 0
	target.mutations.Remove(HUSK)
	target.status_flags &= ~DISFIGURED
	target.update_icons_body()
	..()

/datum/surgery_step/dehusk/structfinish/fail_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(istype(tool,/obj/item/weapon/surgical/bioregen))
		user.visible_message("<span class='danger'>[user]'s hand slips, causing \the [tool] to scrape [target]'s body.</span>", \
	"<span class='danger'>Your hand slips, causing \the [tool] to scrape [target]'s body.</span>")
	else if(istype(tool,/obj/item/weapon/surgical/FixOVein))
		user.visible_message("<span class='danger'>[user] fails to finish the structure over the gaps in [target]'s flesh, doing more damage than good.</span>", \
	"<span class='danger'>You fail to finish the structure over the gaps in [target]'s flesh, doing more damage than good.</span>")
	affected.createwound(CUT, 15)
	affected.createwound(BRUISE, 10)
	..()

/datum/surgery_step/internal/detoxify
	blood_level = 1
	allowed_tools = list(/obj/item/weapon/surgical/bioregen=100)
	min_duration = 90
	max_duration = 120

/datum/surgery_step/internal/detoxify/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	return ..() && target_zone == BP_TORSO && (target.toxloss > 25 || target.oxyloss > 25)

/datum/surgery_step/internal/detoxify/begin_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] begins to pull toxins from, and restore oxygen to [target]'s musculature and organs with \the [tool].</span>", \
	"<span class='notice'>You begin to pull toxins from, and restore oxygen to [target]'s musculature and organs with \the [tool].</span>")
	..()

/datum/surgery_step/internal/detoxify/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] finishes pulling toxins from, and restoring oxygen to [target]'s musculature and organs with \the [tool].</span>", \
	"<span class='notice'>You finish pulling toxins from, and restoring oxygen to [target]'s musculature and organs with \the [tool].</span>")
	if(target.toxloss>25)
		target.adjustToxLoss(-20)
	if(target.oxyloss>25)
		target.adjustOxyLoss(-20)
	..()

/datum/surgery_step/internal/detoxify/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='danger'>[user]'s hand slips, failing to finish the surgery, and damaging [target] with \the [tool].</span>", \
	"<span class='danger'>Your hand slips, failing to finish the surgery, and damaging [target] with \the [tool].</span>")
	affected.createwound(CUT, 15)
	affected.createwound(BRUISE, 10)
	..()

/datum/surgery_step/internal/brain_revive
	blood_level = 0
	allowed_tools = list(/obj/item/weapon/surgical/bioregen=100)
	min_duration = 120
	max_duration = 150

/datum/surgery_step/internal/brain_revive/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/internal/brain/brain = target.internal_organs_by_name[O_BRAIN]
	return ..() && target_zone == BP_HEAD && istype(brain) && (brain.status & ORGAN_DEAD || brain.defib_timer == 0)

/datum/surgery_step/internal/brain_revive/begin_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] begins to use \the [tool] to reverse the decay on and revatilize [target]'s brain.</span>", \
		"<span class='notice'>You begin to use \the [tool] to reverse the decay on and revatilize [target]'s brain.</span>")
	..()

/datum/surgery_step/internal/brain_revive/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] finishes reversing the decay on and revatalizing [target]'s brain.</span>", \
		"<span class='notice'>You finish reversing the decay on and revatalizing [target]'s brain.</span>")
	var/obj/item/organ/internal/brain/brain = target.internal_organs_by_name[O_BRAIN]
	brain.damage = max(0,brain.damage - 10)
	brain.status &= ~ORGAN_DEAD
	brain.handle_organ_mod_special()
	brain.defib_timer = (config.defib_timer MINUTES) / 20
	START_PROCESSING(SSobj, brain)
	..()

/datum/surgery_step/internal/brain_revive/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='danger'>[user]'s hand slips, failing to finish the surgery, and damaging [target] with \the [tool].</span>", \
		"<span class='danger'>Your hand slips, failing to finish the surgery, and damaging [target] with \the [tool].</span>")
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	affected.createwound(CUT, 15)
	affected.createwound(BRUISE, 10)
	..()