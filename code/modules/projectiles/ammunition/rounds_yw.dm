/************************************************************************/
/*
#    An explaination of the naming format for guns and ammo:
#
#    a = Ammo, as in individual rounds of ammunition.
#    b = Box, intended to have ammo taken out one at a time by hand.
#    c = Clips, intended to reload magazines or guns quickly.
#    m = Magazine, intended to hold rounds of ammo.
#    s = Speedloaders, intended to reload guns quickly.
#
#    Use this format, followed by the caliber. For example, a shotgun's caliber
#    variable is "12g" as a result. Ergo, a shotgun round's path would have "a12g",
#    or a magazine with shotgun shells would be "m12g" instead. To avoid confusion
#    for developers and in-game admins spawning these items, stick to this format.
#    Likewise, when creating new rounds, the caliber variable should match whatever
#    the name says.
#
#    This comment is copied in magazines.dm as well.
*/
/************************************************************************/

///////// 7.92x57mm Mauser /////////

/obj/item/ammo_casing/a792x57m
	desc = "A 7.92x57mm Mauser casing."
	icon_state = "rifle-casing"
	caliber = "mauser"
	projectile_type = /obj/item/projectile/bullet/rifle/a762/lmg

/obj/item/projectile/bullet/rifle/a762/lmg
	icon_state = "bullet_alt"
