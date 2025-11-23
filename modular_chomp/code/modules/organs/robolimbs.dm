var/const/YR3_monitor_styles = "blank=YR3_blank;\
	IF_ICON_COLOR_IS_WRONG_TURN_YOUR_EYE_COLOR_TO_BLACK=YR3_blank;\
	whitefoureyes=YR3_foureyes_white;\
	whitebigeyes=YR3_bigeyes_white;\
	whiteeyes=YR3_eyes_white;\
	whiteloading=YR3_loading_white;\
	orangefoureyes=YR3_foureyes_orange;\
	orangebigeyes=YR3_bigeyes_orange;\
	orangeeyes=YR3_eyes_orange;\
	orangeloading=YR3_loading_orange;\
	greenfoureyes=YR3_foureyes_green;\
	greenbigeyes=YR3_bigeyes_green;\
	greeneyes=YR3_eyes_green;\
	greenloading=YR3_loading_green;\
	cyanfoureyes=YR3_foureyes_cyan;\
	cyanbigeyes=YR3_bigeyes_cyan;\
	cyaneyes=YR3_eyes_cyan;\
	cyanloading=YR3_loading_cyan;\
	pinkfoureyes=YR3_foureyes_pink;\
	pinkbigeyes=YR3_bigeyes_pink;\
	pinkeyes=YR3_eyes_pink;\
	pinkloading=YR3_loading_pink;\
	redfoureyes=YR3_foureyes_red;\
	redbigeyes=YR3_bigeyes_red;\
	redeyes=YR3_eyes_red;\
	redloading=YR3_loading_red;\
	bluescreen=YR3_bsod;\
	interrogative=YR3_interrogative;\
	alarm=YR3_danger;\
	checkmark=YR3_safe;\
	surprise=YR3_surprise;\
	heart=YR3_heart;\
	query=YR3_query;\
	endo=YR3_safebar;\
	processing1=YR3_processing;\
	processing2=YR3_assimilating;\
	processed=YR3_processed;\
	cracked=YR3_cracked;\
	broken=YR3_broken;\
	containmentbreach=YR3_crackedopenbloody"

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
