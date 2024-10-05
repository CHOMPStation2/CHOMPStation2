//TFF 7/1/20 - Add Chemistry access to Psychs. Backported from old Chompcode
/datum/job/psychiatrist
	access = list(access_medical, access_chemistry, access_medical_equip, access_morgue, access_psychiatrist)
	minimal_access = list(access_medical, access_chemistry, access_medical_equip, access_psychiatrist)

/datum/job/geneticist
	pto_type = PTO_MEDICAL
