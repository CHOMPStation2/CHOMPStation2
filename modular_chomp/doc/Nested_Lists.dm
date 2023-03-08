/*
Nested lists are lists within lists, now this was probably obvious, i wouldnt waste your time with this.
What we are going to be talking about is Nested lists with key value pairs and how to access them as well as generate key lists

These are incrdeibly nice for merging multiple lists with a similiar purpose. this example here will write a fake implementation to unify the Robot_module list.
*/

/var/list/nested_robots_example = list(	"Normal" = list(	"Honk-Hound" = /obj/item/weapon/robot_module/robot/clerical/honkborg,
															),
										"Whitelisted" = list(	"Unity-Hound" = /obj/item/weapon/robot_module/robot/chound,
															),
										"AI" = list(	"Explore-Hound" = /obj/item/weapon/robot_module/robot/exploration,
															)
                                        )
//Now once we define the above list we can access it as follows

//Access the normal robots list
//nested_robots_example["Normal"]

//Access a specific type inside the list
//nested_robots_example["Normal"]["Honk-Hound"]

//Generate a list of the keys inside the normal list (so we can fill a UI with them)
/proc/list_robots(var/type) //Type here is either "Normal" , "Whitelisted", or "AI"
	var/list/nested_robots_keys = list()
	for(var/element in nested_robots_example[type])
		nested_robots_keys |= nested_robots_example[type][element] //This returns the key from our not nested list at the lowest level //Thank you BM.
