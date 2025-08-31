//TFF 7/1/20 - Add Chemistry access to Psychs. Backported from old Chompcode
/datum/job/psychiatrist
	access = list(ACCESS_MEDICAL, ACCESS_CHEMISTRY, ACCESS_MEDICAL_EQUIP, ACCESS_MORGUE, ACCESS_PSYCHIATRIST)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_CHEMISTRY, ACCESS_MEDICAL_EQUIP, ACCESS_PSYCHIATRIST)

/datum/job/geneticist
	pto_type = PTO_MEDICAL
