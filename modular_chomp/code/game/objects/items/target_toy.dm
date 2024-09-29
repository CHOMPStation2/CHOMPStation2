/obj/item/weapon/storage/briefcase/target_toy
	starts_with = list(
	/obj/item/weapon/paper/target,
	/obj/item/weapon/gun/projectile/revolver/toy/big_iron,
	/obj/item/weapon/grenade/confetti = 2
	)

/obj/item/weapon/paper/target
	name = "target notice"

/obj/item/weapon/paper/target/New()
	info = {"Your target is <b>[random_name(pick(MALE,FEMALE))]</b>. Make sure they don't get out of there alive."}
