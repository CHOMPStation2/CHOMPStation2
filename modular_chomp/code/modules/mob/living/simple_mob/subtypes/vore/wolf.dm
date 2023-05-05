/mob/living/simple_mob/animal/wolf/direwolf/Initialize()
    . = ..()
    verbs += /mob/living/simple_mob/proc/pick_color

/mob/living/simple_mob/animal/wolf/direwolf
	maxHealth = 100
	health = 100