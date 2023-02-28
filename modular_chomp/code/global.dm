
var/list/shell_module_blacklist = list(
	"Sci-borg", "Research"
	)
var/list/latejoin_gatewaystation = list()
var/list/latejoin_plainspath = list()

var/list/talk_sounds = list(
		"beep-boop",
		"goon speak 1",
		"goon speak 2",
		"goon speak 3",
		"goon speak 4",
		"goon speak blub",
		"goon speak bottalk",
		"goon speak buwoo",
		"goon speak cow",
		"goon speak lizard",
		"goon speak pug",
		"goon speak pugg",
		"goon speak roach",
		"goon speak skelly")

proc/get_talk_sound(var/voice_sound)
	switch(voice_sound)
		if("beep-boop")
			return talk_sound
		if("goon speak 1")
			return goon_speak_one_sound
		if("goon speak 2")
			return goon_speak_two_sound
		if("goon speak 3")
			return goon_speak_three_sound
		if("goon speak 4")
			return goon_speak_four_sound
		if("goon speak blub")
			return goon_speak_blub_sound
		if("goon speak bottalk")
			return goon_speak_bottalk_sound
		if("goon speak buwoo")
			return goon_speak_buwoo_sound
		if("goon speak cow")
			return goon_speak_cow_sound
		if("goon speak lizard")
			return goon_speak_lizard_sound
		if("goon speak pug")
			return goon_speak_pug_sound
		if("goon speak pugg")
			return goon_speak_pugg_sound
		if("goon speak roach")
			return goon_speak_roach_sound
		if("goon speak skelly")
			return goon_speak_skelly_sound
