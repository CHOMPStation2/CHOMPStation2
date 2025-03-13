//This file is so i can make upates to shadekin and easily push to vorestation, just a main override file

/datum/species/shadekin/handle_environment_special(var/mob/living/carbon/human/H)
	handle_shade(H)
	handle_phased(H)

//Slippery fingers, if we ever make some update that makes all held items non useable for kins we can remove this.
/datum/species/shadekin/proc/handle_phased(var/mob/living/carbon/human/shadekin/H)
	if(H.ability_flags & AB_PHASE_SHIFTED)
		if(H.l_hand)
			H.drop_l_hand()

		if(H.r_hand)
			H.drop_r_hand()

		return 1 //we are phased and applied all handling

	else
		return 0 //we aren't phased ignore all
