/datum/event/anomaly
	startWhen = ANOMALY_START_HARMFUL_TIME
	announceWhen = ANOMALY_ANNOUNCE_HARMFUL_TIME
	var/area/impact_area
	var/datum/anomaly_placer = new()
	var/obj/effect/anomaly/anomaly_path = /obj/effect/anomaly/flux

/datum/event/anomaly/setup()
	impact_area = placer.findValidArea()

/datum/event/anomaly()
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	command_announcement.Announce("Energetic flux wave detected on [ANOMALY_ANNOUNCE_DANGEROUS_TEXT] [impact_area.name].", "Anomaly Alert")

/datum/event/anomaly/start()
	anomaly_turf = placer.findValidTurf(impact_area)

	var/newAnomaly
	if(anomaly_turf)
		newAnomaly = new anomaly_path(anomaly_turf)
	if(newAnomaly)
		apply_anomaly_properties(newAnomaly)

/datum/round_event/anomaly/proc/apply_anomaly_properties(obj/effect/anomaly/new_anomaly)
	return

// Bioscrambler
/datum/event/anomaly/bioscrambler
	startWhen = ANOMALY_START_MEDIUM_TIME
	announceWhen = ANOMALY_ANNOUNCE_MEDIUM_TIME
	anomaly_path = /obj/effect/anomaly/bioscrambler

/datum/event/anomaly/bioscrambler/announce()
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	command_announcement.Announce("Biologic trait swapping agent detected on [ANOMALY_ANNOUNCE_MEDIUM_TEXT] [impact_area.name].", "Anomaly Alert")

// Bluespace
/datum/event/anomaly/bluespace
	startWhen = ANOMALY_START_MEDIUM_TIME
	announceWhen = ANOMALY_ANNOUNCE_MEDIUM_TIME
	anomaly_path = /obj/effect/anomaly/bluespace

/datum/event/anomaly/bluespace
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	command_announcement.Announce("Bluespace instability detected on [ANOMALY_ANNOUNCE_MEDIUM_TEXT] [impact_area.name].", "Anomaly Alert")

// Dimensional
/datum/event/anomaly/dimensional
	startWhen = ANOMALY_START_MEDIUM_TIME
	announceWhen = ANOMALY_ANNOUNCE_MEDIUM_TIME
	anomaly_path = /obj/effect/anomaly/dimensional
	var/anomaly_theme

/datum/event/anomaly/dimensional/apply_anomaly_properties(obj/effect/anomaly/new_anomaly)
	if(!anomaly_theme)
		return
	new_anomaly.prepare_area(new_theme_path = anomaly_theme)

/datum/event/anomaly/dimensional/announce()
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	command_announcement.Announce("Dimensional instability detected on [ANOMALY_ANNOUNCE_MEDIUM_TEXT] [impact_area.name].", "Anomaly Alert")

// Flux

/datum/event/anomaly/flux
	startWhen = ANOMALY_START_DANGEROUS_TIME
	announceWhen = ANOMALY_ANNOUNCE_DANGEROUS_TIME
	anomaly_path = /obj/effect/anomaly/flux

/datum/event/anomaly/flux/announce()
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	command_announcement.Announce("Hyper-energetic flux wave detected on [ANOMALY_ANNOUNCE_DANGEROUS_TEXT] [impact_area.name].", "Anomaly Alert")

// Gravitational
/datum/event/anomaly/grav
	startWhen = ANOMALY_START_MEDIUM_TIME
	announceWhen = ANOMALY_ANNOUNCE_MEDIUM_TIME
	anomaly_path = /obj/effect/anomaly/grav

/datum/event/anomaly/grav/announce()
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	command_announcement.Announce("Gravitational anomaly detected on [ANOMALY_ANNOUNCE_HARMFUL_TEXT] [impact_area.name].", "Anomaly Alert")

// Hallucination
/datum/event/anomaly/hallucination
	startWhen = ANOMALY_START_MEDIUM_TIME
	announceWhen = ANOMALY_ANNOUNCE_MEDIUM_TIME
	anomaly_path = /obj/effect/anomaly/hallucination

/datum/event/anomaly/hallucination/announce()
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	command_announcement.Announce("Hallucinatory event detected on [ANOMALY_ANNOUNCE_MEDIUM_TEXT] [impact_area.name].", "Anomaly Alert")

// Pyroclastic
/datum/event/anomaly/pyro
	startWhen = ANOMALY_START_HARMFUL_TIME
	announceWhen = ANOMALY_ANNOUNCE_HARMFUL_TIME
	anomaly_path = /obj/effect/anomaly/pyro

/datum/event/anomaly/pyro/announce()
	if(isnull(impact_area))
		impact_area = placer.findValidArea()
	command_announcement.Announce("Pyroclastic anomaly detected on [ANOMALY_ANNOUNCE_HARMFUL_TEXT] [impact_area.name].", "Anomaly Alert")
