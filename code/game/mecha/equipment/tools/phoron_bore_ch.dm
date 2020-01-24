//CHOMPedit, cool tunneling device is cool
/obj/item/mecha_parts/mecha_equipment/weapon/phoron_bore
	auto_rearm = 1
	equip_cooldown = 15 // half of drill
	name = "\improper PB-23 \"Phobos\" Phoron Bore"
	desc = "A design for a large, mecha-mounted Phoron bore, stolen driectly from Grayson Manufactories Ltd. and reproducted by NT. It makes use a specialized compressed phoron crystal. The bolt it fires travels for 6 tiles before dissapaiting, breaking rocks and extracting minerals."
	icon = 'icons/mecha/mecha_equipment_ch.dmi'
	icon_state = "mecha_pbore"
	energy_drain = 200
	projectile = /obj/item/projectile/bullet/magnetic/bore
	fire_sound = 'sound/weapons/railgun.ogg'

	equip_type = EQUIP_UTILITY

	origin_tech = list(TECH_MATERIAL = 5, TECH_PHORON = 5, TECH_POWER = 5)
