/hook/startup/proc/modules_vr()
	robot_module_types += "Medihound"
	robot_module_types += "K9"
	robot_module_types += "Janihound"
	robot_module_types += "Sci-borg"
	robot_module_types += "Pupdozer"
	robot_module_types += "Servicehound" //YW changes
	robot_module_types += "BoozeHound" //YW changes
	return 1

var/list/shell_module_types = list(
	"Standard", "Engineering", "Surgeon",  "Crisis",
	"Miner", "Janitor", "Service", "Clerical",
	"Medihound", "Janihound",
	"Servicehound", "BoozeHound" //YW changes
)

var/list/eventdestinations = list() // List of scatter landmarks for VOREStation event portals

var/global/list/acceptable_fruit_types= list(
											"ambrosia",
											"apple",
											"banana",
											"berries",
											"cabbage",
											"carrot",
											"celery",
											"cherry",
											"chili",
											"cocoa",
											"corn",
											"durian",
											"eggplant",
											"grapes",
											"greengrapes",
											"harebells",
											"lavender",
											"lemon",
											"lettuce",
											"lime",
											"onion",
											"orange",
											"peanut",
											"poppies",
											"potato",
											"pumpkin",
											"rice",
											"rose",
											"rhubarb",
											"soybean",
											"spineapple",
											"sugarcane",
											"sunflowers",
											"tomato",
											"vanilla",
											"watermelon",
											"wheat",
											"whitebeet")
