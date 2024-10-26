/datum/gear/eyes/arglasses/sec
	display_name = "AR-S Security glasses"
	path = /obj/item/clothing/glasses/omnihud/sec
	allowed_roles = list(JOB_SECURITY_OFFICER,JOB_HEAD_OF_SECURITY,JOB_WARDEN,JOB_DETECTIVE,JOB_BLUESHIELD_GUARD,JOB_SECURITY_PILOT)

/datum/gear/eyes/arglasses/eng
	display_name = "AR-E Engineering glasses"
	path = /obj/item/clothing/glasses/omnihud/eng
	allowed_roles = list(JOB_ENGINEER,JOB_CHIEF_ENGINEER,JOB_ATMOSPHERIC_TECHNICIAN) // CHOMPedit: Allows AR-E Glasses to actually be used.

/datum/gear/eyes/arglasses/med
	display_name = "AR-M Medical glasses"
	path = /obj/item/clothing/glasses/omnihud/med
	allowed_roles = list(JOB_MEDICAL_DOCTOR,JOB_CHIEF_MEDICAL_OFFICER,JOB_CHEMIST,JOB_PARAMEDIC,JOB_GENETICIST, JOB_PSYCHIATRIST, JOB_FIELD_MEDIC)

/datum/gear/eyes/arglasses/all
	display_name = "AR-B Command glasses"
	path = /obj/item/clothing/glasses/omnihud/all
	cost = 2
	allowed_roles = list(JOB_SITE_MANAGER,JOB_HEAD_OF_PERSONNEL,JOB_BLUESHIELD_GUARD)
