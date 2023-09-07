/mob/living/carbon/human/ai_controlled/greytide/Initialize()
	to_wear_r_hand = pick(
		prob(20)
			/obj/item/weapon/storage/toolbox/electrical,
		prob(20)
			/obj/item/weapon/storage/toolbox/mechanical,
		prob(20)
			/obj/item/weapon/storage/toolbox/emergency,
		prob(50)
			/obj/item/weapon/melee/baton/cattleprod,
	)
	to_wear_mask = pick(
		prob(75)
			null,
		prob(25)
			/obj/item/clothing/mask/gas/wwii,
	)
	..()

/mob/living/carbon/human/ai_controlled/greytide
	name = "John Greytide" //theyll get a normal name on spawn
	to_wear_helmet = null
	to_wear_glasses = null
	//to_wear_mask = null ///obj/item/clothing/mask/gas
	to_wear_l_radio = /obj/item/device/radio/headset
	to_wear_r_radio = null
	to_wear_uniform = /obj/item/clothing/under/color/grey
	to_wear_suit = null
	to_wear_gloves = /obj/item/clothing/gloves/fyellow
	to_wear_shoes = /obj/item/clothing/shoes/black
	to_wear_belt = /obj/item/weapon/storage/belt/utility/full
	to_wear_l_pocket = /obj/item/weapon/soap
	to_wear_r_pocket = /obj/item/device/pda
	to_wear_back = /obj/item/weapon/storage/backpack
	to_wear_id_type = /obj/item/weapon/card/id
	to_wear_id_job = "Assistant"

	to_wear_l_hand = null
	//to_wear_r_hand = /obj/item/weapon/storage/toolbox/mechanical
	faction = "syndicate"
