// Passive mobs can't attack things, and will run away instead.
// They can also be displaced by all mobs.
/mob/living/simple_mob/animal/passive
	ai_holder_type = /datum/ai_holder/simple_mob/passive
	mob_bump_flag = 0
<<<<<<< HEAD
	allow_mind_transfer = TRUE //CHOMPAdd
=======
	allow_mind_transfer = TRUE
>>>>>>> 10637da2f4... ports mind transfer pref from chomp (#16225)
