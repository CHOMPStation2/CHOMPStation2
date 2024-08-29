
/obj/item/reagent_containers/glass/bottle/robot // CHOMPEdit - Removal of obj/item/weapon
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30,50,100)
	flags = OPENCONTAINER
	volume = 60
	var/reagent = ""


/obj/item/reagent_containers/glass/bottle/robot/inaprovaline // CHOMPEdit - Removal of obj/item/weapon
	name = "internal inaprovaline bottle"
	desc = "A small bottle. Contains inaprovaline - used to stabilize patients."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"
	reagent = "inaprovaline"
	prefill = list("inaprovaline" = 60)


/obj/item/reagent_containers/glass/bottle/robot/antitoxin // CHOMPEdit - Removal of obj/item/weapon
	name = "internal anti-toxin bottle"
	desc = "A small bottle of Anti-toxins. Counters poisons, and repairs damage, a wonder drug."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"
	reagent = "anti_toxin"
	prefill = list("anti_toxin" = 60)
