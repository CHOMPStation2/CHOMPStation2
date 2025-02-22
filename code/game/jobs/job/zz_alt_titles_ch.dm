/datum/job/entertainer
	alt_titles = list(JOB_ALT_PERFORMER = /datum/alt_title/performer, JOB_ALT_MUSICIAN = /datum/alt_title/musician, JOB_ALT_STAGEHAND = /datum/alt_title/stagehand,
						JOB_ALT_ACTOR = /datum/alt_title/actor, JOB_ALT_DANCER = /datum/alt_title/dancer, JOB_ALT_SINGER = /datum/alt_title/singer,
						JOB_ALT_MAGICIAN = /datum/alt_title/magician, JOB_ALT_COMEDIAN = /datum/alt_title/comedian, JOB_ALT_TRAGEDIAN = /datum/alt_title/tragedian,
						JOB_CLOWN = /datum/alt_title/clown, JOB_ALT_JESTER = /datum/alt_title/clown/jester,JOB_ALT_FOOL = /datum/alt_title/clown/fool,
						JOB_MIME= /datum/alt_title/mime,JOB_ALT_PASEUR= /datum/alt_title/mime/poseur, JOB_ALT_FITNESS_INSTRUCTOR = /datum/alt_title/fitness)  //CHOMPEDIT: Adding clown + mime and their alts as alts of entertainer, as well as fitness instructor

/datum/alt_title/fitness
	title = JOB_ALT_FITNESS_INSTRUCTOR
	title_blurb = "A " + JOB_ALT_FITNESS_INSTRUCTOR + "'s goal is to keep the station in shape. Get the crew shaving up those built up pounds and get them to eat something other than chocolate bars and burgers for once"

//Below, well sort off, these are the clown and mime returning! as entertainer alts
//They even get their respective outfits.
/datum/alt_title/clown
	title = JOB_CLOWN
	title_blurb = "A " + JOB_CLOWN + " is there to entertain the crew and keep high morale using various harmless pranks and ridiculous jokes!"
	title_outfit = /decl/hierarchy/outfit/job/clown

/datum/alt_title/clown/jester
	title = JOB_ALT_JESTER

/datum/alt_title/clown/fool
	title = JOB_ALT_FOOL

/datum/alt_title/mime
	title = JOB_MIME
	title_blurb = "A " + JOB_MIME + " is there to entertain the crew and keep high morale using unbelievable performances and acting skills!"
	title_outfit = /decl/hierarchy/outfit/job/mime

/datum/alt_title/mime/poseur
	title = JOB_ALT_PASEUR
