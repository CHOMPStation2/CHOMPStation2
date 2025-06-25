var/const/YR3_monitor_styles = "blank=YR3_blank;\
	foureyes=YR3_foureyes;\
	bigeyes=YR3_bigeyes\
	monoeye=YR3_monoeye;\
	foureyes=YR3_eyes;\
	monoeyenopupil=YR3_blindeye;\
	bluescreen=YR3_bsod;\
	interrogative=YR3_interrogative;\
	alarm=YR3_danger;\
	checkmark=YR3_safe;\
	surprise=YR3_surprise;\
	heart=YR3_heart;\
	query=YR3_query;\
	loading=YR3_loading;\
	endo=YR3_safebar;\
	processing1=YR3_processing;\
	processing2=YR3_assimilating;\
	processed=YR3_processed;\
	cracked=YR3_cracked;\
	broken = YR3_broken;\
	containmentbreach = YR3_crackedopenbloody"

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
