/hook/startup/proc/modules_vr()
	robot_module_types += "Medihound"
	robot_module_types += "K9"
	robot_module_types += "Janihound"
	robot_module_types += "Sci-borg"
	robot_module_types += "Pupdozer"
	robot_module_types += "Service-Hound"
	robot_module_types += "KMine"
	robot_module_types += "BoozeHound" //YW changes
	robot_module_types += "UnityHound" // CH changes
	return 1
/* //ChompStation Removal
var/list/shell_module_types = list(
	"Standard", "Engineering", "Surgeon",  "Crisis",
	"Miner", "Janitor", "Service", "Clerical",
	"Medihound", "Janihound",
	"Servicehound", "BoozeHound" //YW changes
)
<<<<<<< HEAD
*/
||||||| parent of f030a055e9... Merge pull request #9478 from Novacat/nova-basicfixes

=======

var/list/awayabductors = list() // List of scatter landmarks for Abductors in Gateways
>>>>>>> f030a055e9... Merge pull request #9478 from Novacat/nova-basicfixes
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
