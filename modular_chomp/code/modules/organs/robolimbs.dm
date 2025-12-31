var/const/YR3_monitor_styles = "blank=YR3_blank;\
	eyes=YR3_eyes;\
	foureyes=YR3_foureyes;\
	slanteyes=YR3_evileyes;\
	bigeyes=YR3_bigeyes;\
	talleyes=YR3_talleyes;\
	sliteyes=YR3_sliteyes;\
	monoeye=YR3_monoeye;\
	blindeye=YR3_blindeye;\
	protodefault=cyber_default;\
	protofrown=cyber_unhapp;\
	protosad=cyber_sad;\
	proto^w^=cyber_nwn;\
	protoOwO=yr3cyber_owo;\
	protoUwU=cyber_uwu;\
	pokerface=cyber_flat;\
	smiley=cyber_happ;\
	question=cyber_question;\
	query=YR3_query-colored;\
	interrogative=YR3_interrogative-colored;\
	heart=cyber_heart;\
	X=cyber_cross;\
	exclamation=cyber_alert;\
	alarmed=YR3_danger-colored;\
	surprised=YR3_surprise-colored;\
	checkmark=YR3_safe-colored;\
	heart=YR3_heart-colored;\
	idle=cyber_idle;\
	loading=YR3_loading;\
	hypno=YR3_hypno;\
	static=yr3cyber_static;\
	lowpower=cyber_lowpower;\
	bluescreen=YR3_bsod-colored;\
	cracked=YR3_cracked-colored;\
	broken=YR3_broken-colored;\
	endo=YR3_safebar-colored;\
	processing1=YR3_processing-colored;\
	processing2=YR3_assimilating-colored;\
	processed=YR3_processed-colored;\
	containmentbreach=YR3_crackedopenbloody-colored"

/datum/robolimb/enviroshell
	company = "YR3 Enviroshell"
	desc = "A limb with oddly high internal pressure tolerance."
	icon = 'modular_chomp/icons/mob/human_races/cyberlimbs/YR3/YR3_enviroshell.dmi'
	monitor_icon = 'modular_chomp/icons/mob/monitor_icons.dmi'
	monitor_styles = YR3_monitor_styles

/datum/robolimb/enviroshell/original
	company = "YR3 Enviroshell- Original Xenochimera Model"
	desc = "A limb with oddly high internal pressure tolerance. In a somewhat macrabe manner, it uses the blood of its wearer, in place of hydraulic fluids."
	species_cannot_use = list(SPECIES_TESHARI, SPECIES_PROMETHEAN, SPECIES_TAJARAN, SPECIES_HUMAN, SPECIES_VOX, SPECIES_HUMAN_VATBORN, SPECIES_UNATHI, SPECIES_SKRELL, SPECIES_ZADDAT, SPECIES_DIONA)
	blood_name = "blood"
	blood_color = "#ba0b0b"

/datum/robolimb/enviroshell/colorable
	company = "YR3 Enviroshell-Colorable"
	icon = 'modular_chomp/icons/mob/human_races/cyberlimbs/YR3/YR3_enviroshell_colorable.dmi'
	lifelike = 1
	skin_tone = 1

/datum/robolimb/enviroshell/original/colorable
	company = "YR3 Enviroshell- Colorable Xenochimera Model"
	icon = 'modular_chomp/icons/mob/human_races/cyberlimbs/YR3/YR3_enviroshell_colorable.dmi'
	lifelike = 1
	skin_tone = 1

/datum/robolimb/enviroshell/sleek
	company = "YR3 Slimline"
	desc = "A limb which sacrifices the YR3 Enviroshell's containment capabilities, replacing the intended occupant with a mesh of deceptively simple nanite pseudomuscle"
	blood_name = "motor nanites"
	blood_color = "#0e1213"
	icon = 'modular_chomp/icons/mob/human_races/cyberlimbs/YR3/YR3_sleek.dmi'
	lifelike = TRUE
