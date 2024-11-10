/mob/living/carbon/human/ai_controlled/greytide/Initialize()
	to_wear_r_hand = pick(
		prob(20); /obj/item/storage/toolbox/electrical,
		prob(20); /obj/item/storage/toolbox/mechanical,
		prob(20); /obj/item/storage/toolbox/emergency,
		prob(50); /obj/item/melee/baton/cattleprod,
	)
	if(prob(50))
		to_wear_mask = /obj/item/clothing/mask/gas
	else
		to_wear_mask = null
	if(prob(5))
		to_wear_helmet = /obj/item/clothing/head/cone //Hehe funny cone
	else
		to_wear_helmet = null
	if(prob(70))
		to_wear_gloves = pick(
			prob(20); /obj/item/clothing/gloves/fyellow,
			prob(1); /obj/item/clothing/gloves/yellow //Sometimes they get real glubs
		)
	else
		to_wear_gloves = null
	..()

/mob/living/carbon/human/ai_controlled/greytide
	name = "John Greytide" //theyll get a normal name on spawn
	//to_wear_helmet = null
	to_wear_glasses = null
	//to_wear_mask =
	to_wear_l_radio = /obj/item/radio/headset
	to_wear_r_radio = null
	to_wear_uniform = /obj/item/clothing/under/color/grey
	to_wear_suit = null
	//to_wear_gloves = /obj/item/clothing/gloves/fyellow
	to_wear_shoes = /obj/item/clothing/shoes/black
	to_wear_belt = /obj/item/storage/belt/utility/full
	to_wear_l_pocket = /obj/item/soap
	to_wear_r_pocket = /obj/item/pda
	to_wear_back = /obj/item/storage/backpack
	to_wear_id_type = /obj/item/card/id
	to_wear_id_job = "Assistant"

	to_wear_l_hand = null
	//to_wear_r_hand = /obj/item/storage/toolbox/mechanical
	faction = "syndicate"
