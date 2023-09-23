/mob/living/simple_mob/vore/vampire
	name = "vampire"
	desc = "A large creature with a humanoid upperbody and more feral formed lower body, with four legs and two arms."

	icon_state = "count"
	icon = 'icons/mob/vore.dmi'

	harm_intent_damage = 8
	melee_damage_lower = 3
	melee_damage_upper = 7

	response_help = "caresses"
	response_disarm = "wafts"
	response_harm = "bites"

	attacktext = list("bites","sucks","drinks from")

	say_list_type = /datum/say_list/count
	ai_holder_type = /datum/ai_holder/simple_mob/vore

	var/random_skin = 1
	var/list/skins = list(
		"count",
		"countess",
		"countnude",
		"countessnude"
	)

	faction = "vampire"

/mob/living/simple_mob/vore/vampire/New()
	..()
	if(random_skin)
		icon_living = pick(skins)
		icon_rest = "[icon_living]asleep"
		icon_dead = "[icon_living]-dead"
		update_icon()

// Activate Noms!
/mob/living/simple_mob/vore/vampire
	vore_active = 1
	vore_bump_chance = 10
	vore_pounce_chance = 50
	vore_standing_too = 1
	vore_ignores_undigestable = 0
	vore_default_mode = DM_DRAIN
	vore_digest_chance = 25
	vore_icons = SA_ICON_LIVING | SA_ICON_REST

/datum/say_list/count
	speak = list("I vant to suck your-","I'm going to get a bite to drink.","All I have is time.","Your presence here is crypt-ic.","I like my coffee decoffinated.","There is bad blood between us.")
	emote_hear = list("laughs maniacally","croans","hisses")
	emote_see = list("wafts about","licks their lips","flaps a bit")

/mob/living/simple_mob/vore/vampire/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "Having been rapidly gulped up by the vampire, you find yourself tightly contained with a set of groaning, wrinkled walls. It seems that the beast has decided against draining your lifeforce through you blood, and instead taking a more direct approach as it saps your strength from all around you. Your attacker seems content to just take that essence for now, but it is a gut afterall and struggling may set it off."
	B.mode_flags = DM_FLAG_THICKBELLY
	B.belly_fullscreen = "yet_another_tumby"
	B.digest_brute = 3
	B.digest_burn = 0
	B.digest_oxy = 1
	B.digestchance = 25
	B.absorbchance = 0
	B.escapechance = 10
	B.selective_preference = DM_DRAIN
	B.escape_stun = 5

/mob/living/simple_mob/vore/vampire/count
	random_skin = 0
	icon_state = "count"

/mob/living/simple_mob/vore/vampire/countess
	random_skin = 0
	icon_state = "countess"

/mob/living/simple_mob/vore/vampire/count_nude
	random_skin = 0
	icon_state = "countnude"

/mob/living/simple_mob/vore/vampire/countess_nude
	random_skin = 0
	icon_state = "countessnude"
