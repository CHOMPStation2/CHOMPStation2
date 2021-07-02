/hook/startup/proc/modules_vr()
	robot_module_types += "Medihound"
	robot_module_types += "K9"
	robot_module_types += "Janihound"
	robot_module_types += "Sci-borg"
	robot_module_types += "Pupdozer"
	robot_module_types += "Service-Hound"
	robot_module_types += "BoozeHound"
	robot_module_types += "KMine"
	robot_module_types += "UnityHound" // CH changes
	return 1
/* //ChompStation Removal
var/list/shell_module_types = list(
	"Standard", "Engineering", "Surgeon",  "Crisis",
	"Miner", "Janitor", "Service", "Clerical",
	"Medihound", "Janihound",
	"Servicehound", "BoozeHound" //YW changes
)
*/

var/list/awayabductors = list() // List of scatter landmarks for Abductors in Gateways
var/list/eventdestinations = list() // List of scatter landmarks for VOREStation event portals
var/list/eventabductors = list() // List of scatter landmarks for VOREStation abductor portals

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
											"grass", // CH changes
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
											"reishi", // CH changes
											"rice",
											"rose",
											"rhubarb",
											"shand", // CH changes
											"soybean",
											"spineapple",
											"sugarcane",
											"sunflowers",
											"tomato",
											"towercap", // CH changes
											"vanilla",
											"watermelon",
											"wheat",
											"whitebeet")
