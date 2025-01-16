/obj/random/organ
	name = "Random Organ"
	desc = "An amalgamate of meaty things"
	icon_state = "brain"

/obj/random/organ/item_to_spawn()
	return pick(prob(1500);/obj/random/meat,
				prob(20);/obj/item/organ/internal/brain,
				prob(20);/obj/item/organ/internal/brain/unathi,
				prob(20);/obj/item/organ/internal/brain/xeno,
				prob(20);/obj/item/organ/internal/eyes,
				prob(20);/obj/item/organ/internal/appendix,
				prob(20);/obj/item/organ/internal/heart,
				prob(20);/obj/item/organ/internal/intestine,
				prob(20);/obj/item/organ/internal/intestine/xeno,
				prob(20);/obj/item/organ/internal/kidneys,
				prob(20);/obj/item/organ/internal/kidneys/vox,
				prob(20);/obj/item/organ/internal/liver,
				prob(20);/obj/item/organ/internal/liver/unathi,
				prob(20);/obj/item/organ/internal/liver/vox,
				prob(20);/obj/item/organ/internal/lungs,
				prob(20);/obj/item/organ/internal/lungs/unathi,
				prob(20);/obj/item/organ/internal/lungs/vox,
				prob(20);/obj/item/organ/internal/spleen,
				prob(20);/obj/item/organ/internal/spleen/skrell,
				prob(20);/obj/item/organ/internal/stomach,
				prob(20);/obj/item/organ/internal/stomach/unathi,
				prob(20);/obj/item/organ/internal/stomach/xeno,
				prob(20);/obj/item/organ/internal/voicebox,
				prob(20);/obj/item/organ/internal/voicebox/skrell,
				prob(10);/obj/item/organ/internal/brain/replicant,
				prob(10);/obj/item/organ/internal/eyes/replicant,
				prob(10);/obj/item/organ/internal/heart/replicant,
				prob(10);/obj/item/organ/internal/kidneys/replicant,
				prob(10);/obj/item/organ/internal/liver/replicant,
				prob(10);/obj/item/organ/internal/lungs/replicant,
				prob(10);/obj/item/organ/internal/voicebox/replicant,
				prob(10);/obj/item/organ/internal/xenos/plasmavessel/replicant,
				prob(5);/obj/item/organ/internal/xenos/acidgland/replicant,
				prob(5);/obj/item/organ/internal/xenos/resinspinner/replicant,
				prob(5);/obj/item/organ/internal/immunehub/replicant,
				prob(5);/obj/item/organ/internal/metamorphgland/replicant,
				prob(5);/obj/item/organ/internal/heart/replicant/rage,
				prob(5);/obj/item/organ/internal/lungs/replicant/mending)

/obj/random/vendorsnack
	name = "random snack vending machine"
	desc = "This is a random snack vending machine"
	icon = 'icons/obj/vending.dmi'
	icon_state = "generic"

/obj/random/vendorsnack/item_to_spawn()
	return pick(/obj/random/vendordrink,
				/obj/random/vendorfood,
				/obj/machinery/vending/hotfood,
				/obj/machinery/vending/sovietvend,
				/obj/machinery/vending/fooddessert,
				/obj/machinery/vending/radren)
