/obj/item/healthanalyzer/verb/toggle_guide()
	set name = "Toggle Guidance"
	set desc = "Toggles whether or not \the [src] will provide guidance and instruction in addition to scanning."
	set category = "Object"
	guide = !guide
	to_chat(usr, span_notice("You toggle \the [src]'s guidance system [guide ? "on" : "off"]."))


/obj/item/healthanalyzer/guide
	name = "Instructional health analyzer"
	desc = "A hand-held body scanner able to distinguish vital signs of the subject. It shows extra information to medical personnel!"
	guide = TRUE
	icon_state = "health-g"

/obj/item/healthanalyzer/proc/guide(var/mob/living/carbon/human/M, mob/living/user)

/* CHOMPedit remove: Anyone can get this info. *

	var/obj/item/card/id/ourid = user?.GetIdCard()
	if(!ourid)
		return
	if(access_change_ids in ourid.GetAccess())
		playsound(src, 'sound/machines/defib_failed.ogg', 50, 0)
		return
	if(access_medical in ourid.GetAccess())
		playsound(src, 'sound/effects/pop.ogg', 50, FALSE)
	else
		playsound(src, 'sound/machines/defib_failed.ogg', 50, 0)
		return
	if(!ishuman(M))
		return

* CHOMPedit end. */

	var/dat = ""

	var/bleeding_external = FALSE
	var/bleeding_internal = FALSE
	var/infection = FALSE
	var/organ = FALSE
	var/bone = FALSE
	var/bloodloss = FALSE
	var/robotparts = FALSE

	for(var/obj/item/organ/external/org in M.organs)
		if(!istype(org))		//how?
			continue
		if(org.robotic >= ORGAN_ROBOT)
			robotparts = TRUE
			continue
		for(var/datum/wound/W in org.wounds)
			if(W.internal)
				bleeding_internal = TRUE
				break
		if(org.status & ORGAN_BLEEDING)
			bleeding_external = TRUE
		if(org.status & ORGAN_BROKEN && (!org.splinted))
			bone = TRUE
		if(org.has_infected_wound())
			infection = TRUE


	for(var/obj/item/organ/org in M.internal_organs)
		if(!istype(org))		//how?
			continue
		if(org.robotic >= ORGAN_ROBOT)
			robotparts = TRUE
			continue
		if(org.status & ORGAN_BLEEDING)
			bleeding_internal = TRUE
		if(org.damage >= 1 && !istype(org, /obj/item/organ/internal/brain))
			organ = TRUE

	var/blood_volume = M.vessel.get_reagent_amount("blood")
	if(blood_volume <= M.species.blood_volume*M.species.blood_level_safe)
		bloodloss = TRUE

 //CHOMPedit start: Wording
	if(bleeding_external)
<<<<<<< HEAD
		dat += "<b>Surface Bleeding</b> - Apply bandages or administer Bicaridine.<br>"
	if(bleeding_internal)
		dat += "<b>Internal Bleeding</b> - Commence an internal vein repair operation or administer coagulants, such as Myelamine.<br>"
	if(M.getOxyLoss())
		dat += "<b>Suffocation</b> - Administer Dexalin or Dexalin Plus. Check for heart or lung damage.<br>"
	if(infection)
		dat += "<b>Infection</b> - Administer Spaceacillin. If severe, use Corophizine or overdose on Spaceacillin and monitor until well.<br>"
	if(M.getBrainLoss() >= 1)
		dat += "<b>Traumatic Brain Injury</b> - Commence brain repair surgery Administer Alkysine or universal organ-repair chemicals such as Peridaxon.<br>"
	if(M.radiation || M.accumulated_rads)
		dat += "<b>Radiation Exposure</b> - Administer Hyronalin or Arithrazine. Monitor for genetic damage.<br>"
	if(organ)
		dat += "<b>Organ Damage</b> - Administer Peridaxon. Perform a full body scan for targeted organ repair surgery.<br>"
=======
		dat += span_bold("Surface bleeding") + " - Bandage immediately or apply brute-damage fixing chemicals (i.e. Bicaridine) if no bandages available.<br>"
	if(bleeding_internal)
		dat += span_bold("Internal bleeding") + " - Commence internal vein repair surgery or apply clotting chemicals (i.e. Myelamine).<br>"
	if(M.getOxyLoss())
		dat += span_bold("Suffociation") + " - Give Dexalin or Dexalin Plus. Check for heart or lung damage.<br>"
	if(infection)
		dat += span_bold("Infection") + " - Give Spaceacillin. If severe, use Corophizine or overdose on Spaceacillin and monitor until well.<br>"
	if(M.getBrainLoss() >= 1)
		dat += span_bold("Brain damage") + " - Commence brain repair surgery, apply Alkysine, or universal organ-repair chemicals. (i.e. Peridaxon).<br>"
	if(M.radiation || M.accumulated_rads)
		dat += span_bold("Radiation") + " - Give Hyronalin or Arithrazine. Monitor for genetic damage.<br>"
	if(organ)
		dat += span_bold("Organ damage") + " - Give Peridaxon. Perform full body scan for targeted organ repair surgery.<br>"
>>>>>>> b594520a74... next set of spans (#16434)
	if(bloodloss)
		dat += span_bold("Low blood volume") + " - Commence blood transfusion via IV drip or provide blood-restorative chemicals (e.g.: Copper for zorren and skrell, iron for the rest)."
	if(M.getToxLoss())
<<<<<<< HEAD
		dat += "<b>Toxin Buildup</b> - Inject Dylovene or Carthatoline. Monitor for damage to the liver or kidneys.<br>"
	if(M.getBruteLoss())
		dat += "<b>Physical Trauma</b> - Bandage the wounded body part. Administer Bicaridine or Vermicetol depending on the severity.<br>"
	if(M.getFireLoss())
		dat += "<b>Burn Wounds</b> - Salve the wounded body part in ointment. Administer Kelotane or Dermaline. Check for infections.<br>"
	if(M.getCloneLoss())
		dat += "<b>Genetic Damage</b> - Utilize cryogenic pod with appropriate chemicals (i.e. Cryoxadone) and below 70 K, or give Rezadone.<br>"
	if(bone)
		dat += "<b>Bone Fracture</b> - Splint the fractured limb. Commence a bone repair operation or administer Osteodaxon after treating the physical trauma.<br>"
	if(M.virus2.len)
		dat += "<b>Viral Infection</b> - Inform a Virologist or the Chief Medical Officer and administer antiviral chemicals such as Corophizine and Spaceacilin. Limit exposure to other personnel.<br>"
	if(robotparts)
		dat += "<b>Robotic Body Parts</b> - Inform the Robotics department."

	var/peeb
	if(dat)
		peeb += span_notice("<b>GUIDANCE SYSTEM BEGIN</b>")
		peeb += "<br>"
=======
		dat += span_bold("Toxins") + " - Give Dylovene or Carthatoline. Vomitting is normal and helpful. Tends to be a symptom of larger issues, such as infection.<br>"
	if(M.getBruteLoss())
		dat += span_bold("Brute trauma") + " - Bandage wounded body part. Give Bicaridine or Vermicetol.<br>"
	if(M.getFireLoss())
		dat += span_bold("Surface burn") + " - Salve wounded body part in ointment. Give Kelotane or Dermaline. Check for infections.<br>"
	if(M.getCloneLoss())
		dat += span_bold("Genetic damage") + " - Utilize cryogenic pod with appropriate chemicals (i.e. Cryoxadone) and below 70 K, or give Rezadone.<br>"
	if(bone)
		dat += span_bold("Bone fracture") + " - Splint damaged area. Treat with bone repair surgery or Osteodaxon after treating brute damage.<br>"
	if(M.virus2.len)
		dat += span_bold("Viral infection") + " - Proceed with virology pathogen curing procedures or apply antiviral chemicals (i.e. Corophizine).<br>"
	if(robotparts)
		dat += span_bold("Robotic body parts") + " - Should not be repaired by medical personnel, refer to robotics if damaged."

	var/peeb
	if(dat)
		peeb += span_boldnotice("GUIDANCE SYSTEM BEGIN")
		peeb +="<br>"
>>>>>>> b594520a74... next set of spans (#16434)
		peeb += dat
		peeb += span_notice("For more detailed information on the patient's condition, utilize a body scanner at the closest medical bay.")

	user.show_message(peeb, 1)
//CHOMPedit end.
