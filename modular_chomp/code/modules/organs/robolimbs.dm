var/const/YR3_monitor_styles = "blank=YR3_blank;\
	foureyes=YR3_foureyes;\
	bigeyes=YR3_bigeyes;\
	bluescreen=YR3_bsod;\
	interrogative=YR3_interrogative;\
	alarm=YR3_danger;\
	checkmark=YR3_safe;\
	surprise=YR3_surprise;\
	heart=YR3_heart;\
	query=YR3_query;\
	loading=YR3_computing;\
	smiley=YR3_smiley;\
	sadface=YR3_sadface;\
	skull=YR3_skull;\
	dangerskull=skulldanger;\
	pskull=YR3_pskull"

/datum/robolimb/enviroshell/original
	company = "YR3 Enviroshell"
	desc = "A limb with oddly high internal pressure tolerance."
	icon = 'modular_chomp/icons/mob/human_races/cyberlimbs/YR3/YR3_enviroshell.dmi'
	monitor_icon = 'modular_chomp/icons/mob/monitor_icons.dmi'
	monitor_styles = YR3_monitor_styles

/datum/robolimb/enviroshell/original
	company = "YR3 Enviroshell- Original Xenochimera Model"
	desc = "A limb with oddly high internal pressure tolerance. In a somewhat macrabe manner, it uses the blood of its wearer, in place of hydraulic fluids."
	species_cannot_use = list(SPECIES_TESHARI, SPECIES_PROMETHEAN, SPECIES_TAJ, SPECIES_HUMAN, SPECIES_VOX, SPECIES_HUMAN_VATBORN, SPECIES_UNATHI, SPECIES_SKRELL, SPECIES_ZADDAT, SPECIES_DIONA)
	blood_name = "blood"
	blood_color = "#ba0b0b"
