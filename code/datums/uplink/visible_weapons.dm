/***************************************
* Highly Visible and Dangerous Weapons *
***************************************/
/datum/uplink_item/item/visible_weapons
	category = /datum/uplink_category/visible_weapons

/datum/uplink_item/item/visible_weapons/tactknife
	name = "Tactical Knife"
	item_cost = 10
	path = /obj/item/material/knife/tacknife // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/combatknife
	name = "Combat Knife"
	item_cost = 20
	path = /obj/item/material/knife/tacknife/combatknife // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/energy_sword
	name = "Energy Sword, Colorable"
	item_cost = 40
	path = /obj/item/melee/energy/sword // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/energy_sword_pirate
	name = "Energy Cutlass, Colorable"
	item_cost = 40
	path = /obj/item/melee/energy/sword/pirate // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/energy_spear
	name = "Energy Spear, Colorable"
	item_cost = 50
	path = /obj/item/melee/energy/spear // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/claymore
	name = "Claymore"
	item_cost = 40
	path = /obj/item/material/sword // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/chainsaw
	name = "Chainsaw"
	item_cost = 40
	path = /obj/item/chainsaw // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/katana
	name = "Katana"
	item_cost = 40
	path = /obj/item/material/sword/katana // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/dartgun
	name = "Dart Gun"
	item_cost = 30
	path = /obj/item/gun/projectile/dartgun // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/crossbow
	name = "Energy Crossbow"
	item_cost = 40
	path = /obj/item/gun/energy/crossbow // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/silenced_45
	name = "Silenced .45"
	item_cost = 40
	path = /obj/item/gun/projectile/silenced // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/riggedlaser
	name = "Exosuit Rigged Laser"
	item_cost = 30
	path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser

/datum/uplink_item/item/visible_weapons/revolver
	name = "Revolver"
	item_cost = 70
	path = /obj/item/gun/projectile/revolver // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/mateba
	name = "Mateba"
	item_cost = 70
	path = /obj/item/gun/projectile/revolver/mateba // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/judge
	name = "Judge"
	item_cost = 70
	path = /obj/item/gun/projectile/revolver/judge // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/pistol_standard_capacity
	name = "9mm Pistol"
	item_cost = 40
	path = /obj/item/gun/projectile/p92x // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/pistol_large_capacity
	name = "9mm Pistol (with large capacity magazine)"
	item_cost = 70
	path = /obj/item/gun/projectile/p92x/large // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/lemat
	name = "Mako Revolver"
	item_cost = 60
	path = /obj/item/gun/projectile/revolver/lemat // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/Derringer
	name = ".357 Derringer Pistol"
	item_cost = 40
	path = /obj/item/gun/projectile/derringer // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/heavysnipermerc
	name = "Anti-Materiel Rifle (14.5mm)"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	path = /obj/item/gun/projectile/heavysniper // CHOMPEdit - Removal of obj/item/weapon
	antag_roles = list("mercenary", "ert") //VOREStation Edit

/datum/uplink_item/item/visible_weapons/heavysnipertraitor
	name = "Anti-Materiel Rifle (14.5mm)"
	desc = "A convenient collapsible rifle for covert assassination. Comes with 4 shots and its own secure carrying case."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	path = /obj/item/storage/secure/briefcase/rifle // CHOMPEdit - Removal of obj/item/weapon
	antag_roles = list("traitor", "autotraitor", "infiltrator")

/datum/uplink_item/item/visible_weapons/fuelrodcannon
	name = "Fuel-Rod Cannon"
	desc = "An incredibly bulky weapon whose devastating firepower is only matched by its severe need for expensive, and rare, ammunition. This device will likely require extra preparation to use, you are warned."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	path = /obj/item/storage/secure/briefcase/fuelrod // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/tommygun
	name = "Tommy Gun (.45)" // We're keeping this because it's CLASSY. -Spades
	item_cost = 60
	path = /obj/item/gun/projectile/automatic/tommygun // CHOMPEdit - Removal of obj/item/weapon

//These are for traitors (or other antags, perhaps) to have the option of purchasing some merc gear.
/datum/uplink_item/item/visible_weapons/submachinegun
	name = "Submachine Gun (10mm)"
	item_cost = 60
	path = /obj/item/gun/projectile/automatic/c20r // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/assaultrifle
	name = "Assault Rifle (5.45mm)"
	item_cost = 75
	path = /obj/item/gun/projectile/automatic/sts35 // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/combatshotgun
	name = "Combat Shotgun"
	item_cost = 75
	path = /obj/item/gun/projectile/shotgun/pump/combat // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/semishotgun
	name = "Semi-Automatic Shotgun"
	item_cost = 100
	path = /obj/item/gun/projectile/shotgun/semi // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/leveraction
	name = "Lever Action Rifle"
	item_cost = 50
	path = /obj/item/gun/projectile/shotgun/pump/rifle/lever // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/egun
	name = "Compact Energy Gun"
	item_cost = 30
	path = /obj/item/gun/energy/gun/compact // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/lasercannon
	name = "Laser Cannon"
	item_cost = 60
	path = /obj/item/gun/energy/lasercannon // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/lasercarbine
	name = "Laser Carbine"
	item_cost = 75
	path = /obj/item/gun/energy/laser // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/ionrifle
	name = "Ion Rifle"
	item_cost = 40
	path = /obj/item/gun/energy/ionrifle // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/ionpistol
	name = "Ion Pistol"
	item_cost = 25
	path = /obj/item/gun/energy/ionrifle/pistol // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/xray
	name = "Xray Gun"
	item_cost = 60
	path = /obj/item/gun/energy/xray // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/flamethrower
	name = "Heavy Flamethrower"
	desc = "A large flamethrower that runs on pressurized, gaseous phoron and electric charge."
	item_cost = 60
	path = /obj/item/storage/secure/briefcase/flamer // CHOMPEdit - Removal of obj/item/weapon

/datum/uplink_item/item/visible_weapons/concussion_grenades
	name = "Concussion Grenades (8)"
	desc = "A box of eight concussion grenades."
	item_cost = 30
	path = /obj/item/storage/box/syndie_kit/concussion_grenade // CHOMPEdit - Removal of obj/item/weapon
