/obj/machinery/porta_turret
	health = 40				//the turret's health
	maxhealth = 40			//turrets maximal health.

/obj/machinery/porta_turret/ai_defense
	health = 125 // Since lasers do 40 each.
	maxhealth = 125

/obj/machinery/porta_turret/alien
	health = 125
	maxhealth = 125

/obj/machinery/porta_turret/industrial
	health = 100
	maxhealth = 100

/obj/machinery/porta_turret/industrial/teleport_defense
	name = "defense turret"
	desc = "This variant appears to be much more durable, with a rugged outer coating."
	req_one_access = list(access_heads)
	installation = /obj/item/weapon/gun/energy/gun/burst
	health = 125
	maxhealth = 125