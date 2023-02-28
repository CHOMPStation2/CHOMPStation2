
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
var/list/talk_sound_map = list(
		"beep-boop" = talk_sound,
		"goon speak 1" = goon_speak_one_sound,
		"goon speak 2" = goon_speak_two_sound,
		"goon speak 3"=goon_speak_three_sound,
		"goon speak 4"=goon_speak_four_sound,
		"goon speak blub"=goon_speak_blub_sound,
		"goon speak bottalk"=goon_speak_bottalk_sound,
		"goon speak buwoo"=goon_speak_buwoo_sound,
		"goon speak cow"=goon_speak_cow_sound,
		"goon speak lizard"=goon_speak_lizard_sound,
		"goon speak pug"=goon_speak_pug_sound,
		"goon speak pugg"=goon_speak_pugg_sound,
		"goon speak roach"=goon_speak_roach_sound,
		"goon speak skelly"=goon_speak_skelly_sound,)

proc/get_talk_sound(var/voice_sound)
	return talk_sound_map[voice_sound]
