/mob/living/simple_mob/animal/space/carp/station
	name = "distant space carp"
	health = 50
	maxHealth = 50

	faction = "station"

	var/body_color

/mob/living/simple_mob/animal/space/carp/station/Initialize(mapload)
	.=..()

	body_color = pick(list("green","red","orange","yellow","blue"))
	if(body_color == "green")
		color = "#660066"
	if(body_color == "red")
		color = "#FF0000"
	if(body_color == "orange")
		color = "#FF6600"
	if(body_color == "yellow")
		color = "#00FF00"
	if(body_color == "blue")
		color = "#0099CC"
