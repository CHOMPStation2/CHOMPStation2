/datum/job/entertainer
	alt_titles = list("Performer" = /datum/alt_title/performer, "Musician" = /datum/alt_title/musician, "Stagehand" = /datum/alt_title/stagehand,
						"Actor" = /datum/alt_title/actor, "Dancer" = /datum/alt_title/dancer, "Singer" = /datum/alt_title/singer,
						"Magician" = /datum/alt_title/magician, "Comedian" = /datum/alt_title/comedian, "Tragedian" = /datum/alt_title/tragedian,
						"Clown" = /datum/alt_title/clown, "Jester" = /datum/alt_title/clown/jester,"Fool" = /datum/alt_title/clown/fool,
						"Mime"= /datum/alt_title/mime,"Poseur"= /datum/alt_title/mime/poseur, "Fitness Instructor" = /datum/alt_title/fitness)  //CHOMPEDIT: Adding clown + mime and their alts as alts of entertainer, as well as fitness instructor

/datum/alt_title/fitness
	title = "Fitness Instructor"
	title_blurb = "A Fitness Instructor's goal is to keep the station in shape. Get the crew shaving up those built up pounds and get them to eat something other than chocolate bars and burgers for once"

//Below, well sort off, these are the clown and mime returning! as entertainer alts
//They even get their respective outfits.
/datum/alt_title/clown
	title = "Clown"
	title_blurb = "A Clown is there to entertain the crew and keep high morale using various harmless pranks and ridiculous jokes!"
	title_outfit = /decl/hierarchy/outfit/job/clown

/datum/alt_title/clown/jester
	title = "Jester"

/datum/alt_title/clown/fool
	title = "Fool"

/datum/alt_title/mime
	title = "Mime"
	title_blurb = "A Mime is there to entertain the crew and keep high morale using unbelievable performances and acting skills!"
	title_outfit = /decl/hierarchy/outfit/job/mime

/datum/alt_title/mime/poseur
	title = "Poseur"