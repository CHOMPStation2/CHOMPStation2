/turf/simulated/floor/outdoors/grass
	var/animals = "base"
	var/grass = "base"

/turf/simulated/floor/outdoors/grass/sif
	animals = "sif"
	grass = "sif"

/turf/simulated/floor/outdoors/grass/sif/forest
	grass = "sifforest"

GLOBAL_LIST_INIT(grass_animals,list(
	"base" = list(
		/mob/living/simple_mob/animal/passive/tindalos = 1
		),
	"sif" = list(
		/mob/living/simple_mob/animal/sif/diyaab = 7,
		/mob/living/simple_mob/animal/sif/glitterfly = 2,
		/mob/living/simple_mob/animal/sif/duck = 2,
		/mob/living/simple_mob/animal/sif/shantak/retaliate = 2,
		/mob/living/simple_mob/animal/passive/gaslamp/snow = 1,
		/obj/random/mob/multiple/sifmobs = 1
		),
	"valley" = list(
		/mob/living/simple_mob/animal/sif/diyaab = 24,
		/mob/living/simple_mob/animal/sif/glitterfly = 24,
		/mob/living/simple_mob/animal/sif/duck = 24,
		/obj/random/mob/multiple/sifmobs = 6,
		/mob/living/simple_mob/humanoid/cultist/tesh = 2,
		/mob/living/simple_mob/humanoid/eclipse/solar/froststalker = 2,
		/mob/living/simple_mob/humanoid/eclipse/lunar = 1,
		/mob/living/simple_mob/humanoid/merc/ranged/laser = 2,
		/mob/living/simple_mob/humanoid/cultist/magus/rift = 0.05
		),
	"valleyedge" = list(
		/mob/living/simple_mob/animal/sif/diyaab = 12,
		/mob/living/simple_mob/animal/sif/glitterfly = 12,
		/mob/living/simple_mob/animal/sif/duck = 12,
		/mob/living/simple_mob/animal/giant_spider/tunneler = 12,
		/mob/living/simple_mob/animal/giant_spider/nurse = 12,
		/mob/living/simple_mob/animal/giant_spider/phorogenic = 12
		),
	"sifcave" = list(
		/mob/living/simple_mob/animal/giant_spider/tunneler = 12,
		/mob/living/simple_mob/animal/giant_spider/nurse = 12,
		/mob/living/simple_mob/animal/giant_spider/phorogenic = 12,
		/mob/living/simple_mob/animal/giant_spider/electric = 12,
		/mob/living/simple_mob/animal/space/mouse_army/operative = 6,
		/mob/living/simple_mob/animal/space/mouse_army/pyro = 6,
		/mob/living/simple_mob/animal/space/mouse_army/ammo = 6,
		/mob/living/simple_mob/mechanical/mecha/mouse_tank/livewire = 2,
		/mob/living/simple_mob/humanoid/eclipse/lunar = 6
		),
	"seasonalspring" = list(
		/mob/living/simple_mob/vore/alienanimals/teppi = 10, //CHOMP Edit
		/mob/living/simple_mob/vore/alienanimals/teppi/mutant = 1, //CHOMP Edit
		/mob/living/simple_mob/vore/redpanda = 40,
		/mob/living/simple_mob/vore/redpanda/fae = 2, //CHOMP Edit
		/mob/living/simple_mob/vore/sheep = 20,
		/mob/living/simple_mob/vore/rabbit/black = 20,
		/mob/living/simple_mob/vore/rabbit/white = 20,
		/mob/living/simple_mob/vore/rabbit/brown = 20,
		/mob/living/simple_mob/vore/leopardmander = 2,
		/mob/living/simple_mob/vore/horse/big = 10,
		/mob/living/simple_mob/vore/bigdragon/friendly = 1,
		/mob/living/simple_mob/vore/alienanimals/dustjumper = 20,
		/mob/living/simple_mob/vore/bee = 20,
		/mob/living/simple_mob/vore/horse/big = 5,
		/mob/living/simple_mob/vore/wolf = 5,
		/mob/living/simple_mob/vore/wolf/direwolf = 1,
		/mob/living/simple_mob/vore/wolf/direwolf/dog = 1,
		/mob/living/simple_mob/vore/squirrel = 20
		),
	"seasonalsummer" = list(
		/mob/living/simple_mob/vore/alienanimals/teppi = 10,
		/mob/living/simple_mob/vore/alienanimals/teppi/mutant = 1,
		/mob/living/simple_mob/vore/redpanda = 40, //CHOMP Edit
		/mob/living/simple_mob/vore/redpanda/fae = 2, //CHOMP Edit
		/mob/living/simple_mob/vore/sheep = 20,
		/mob/living/simple_mob/vore/rabbit/black = 20,
		/mob/living/simple_mob/vore/rabbit/white = 20,
		/mob/living/simple_mob/vore/rabbit/brown = 20,
		/mob/living/simple_mob/vore/leopardmander = 2,
		/mob/living/simple_mob/vore/horse/big = 10,
		/mob/living/simple_mob/vore/bigdragon/friendly = 1,
		/mob/living/simple_mob/vore/alienanimals/dustjumper = 20,
		/mob/living/simple_mob/vore/bee = 5,
		/mob/living/simple_mob/vore/horse/big = 5,
		/mob/living/simple_mob/vore/pakkun = 2,
		/mob/living/simple_mob/vore/fennix = 1,
		/mob/living/simple_mob/vore/wolf/direwolf/dog = 1,
		/mob/living/simple_mob/animal/passive/bird/parrot = 1,
		/mob/living/simple_mob/vore/squirrel = 20
		),
	"seasonalautumn" = list(
		/mob/living/simple_mob/vore/alienanimals/teppi = 10,
		/mob/living/simple_mob/vore/alienanimals/teppi/mutant = 1,
		/mob/living/simple_mob/vore/redpanda = 40,
		/mob/living/simple_mob/vore/redpanda/fae = 2,
		/mob/living/simple_mob/vore/sheep = 20,
		/mob/living/simple_mob/vore/rabbit/black = 20,
		/mob/living/simple_mob/vore/rabbit/white = 20,
		/mob/living/simple_mob/vore/rabbit/brown = 20,
		/mob/living/simple_mob/vore/horse/big = 10,
		/mob/living/simple_mob/vore/alienanimals/dustjumper = 20,
		/mob/living/simple_mob/vore/horse/big = 1,
		/mob/living/simple_mob/vore/wolf = 1,
		/mob/living/simple_mob/vore/wolf/direwolf = 1,
		/mob/living/simple_mob/vore/wolf/direwolf/dog = 1,
		/mob/living/simple_mob/vore/squirrel = 20
		),
	"seasonalwinter" = list(
		/mob/living/simple_mob/vore/rabbit/white = 40,
		/mob/living/simple_mob/vore/alienanimals/teppi = 10,
		/mob/living/simple_mob/vore/alienanimals/teppi/mutant = 1,
		/mob/living/simple_mob/vore/redpanda = 10,
		/mob/living/simple_mob/vore/wolf = 10,
		/mob/living/simple_mob/vore/wolf/direwolf = 1,
		/mob/living/simple_mob/vore/wolf/direwolf/dog = 1,
		/mob/living/simple_mob/vore/otie/friendly = 2,
		/mob/living/simple_mob/vore/otie/friendly/chubby = 1,
		/mob/living/simple_mob/vore/otie/red/friendly = 1,
		/mob/living/simple_mob/vore/otie/red/chubby = 1,
		/mob/living/simple_mob/vore/squirrel = 20
		),
	"smokestar" = list(
		/mob/living/simple_mob/vore/smokestar/drider = 1
		),
	"thor_real" = list(
		/mob/living/simple_mob/animal/passive/crab = 10,
		/mob/living/simple_mob/animal/passive/tindalos = 10,
		/mob/living/simple_mob/animal/passive/yithian = 10,
		/mob/living/simple_mob/animal/passive/cockroach = 10,
		// /mob/living/simple_mob/animal/passive/lizard = 6, // If we ever get komodo dragons or tegu or some lizard with a less shitty sprite, put them in here.
		/mob/living/simple_mob/vore/aggressive/frog = 10,
		/mob/living/simple_mob/animal/passive/chicken = 10, // Did you know chickens come from South-East Asia? In the jungle? Bet they'd thrive here as an invasive species.
		/mob/living/simple_mob/animal/passive/mouse = 10,
		/mob/living/simple_mob/animal/passive/snake/python = 10,
		// /mob/living/simple_mob/vore/pitcher = 7, // Inactive until the jank on these is fixed by Virgo.
		/mob/living/simple_mob/vore/pitcher_plant = 7,
		/mob/living/simple_mob/vore/mantrap = 7,
		/mob/living/simple_mob/animal/passive/bird/parrot = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/eclectus = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/grey_parrot = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/white_caique = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/budgerigar = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/cockatiel = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/white_cockatoo = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/pink_cockatoo = 6,
		/mob/living/simple_mob/vore/seagull = 6,
		/mob/living/simple_mob/vore/redpanda = 6,
		/mob/living/simple_mob/vore/meowl = 6,
		/mob/living/simple_mob/vore/fennec = 2,
		/mob/living/simple_mob/vore/lamia = 2, // Sure I could just use the 'random' version, but I want them all to be naked in the wilderness.
		/mob/living/simple_mob/vore/lamia/cobra = 2,
		/mob/living/simple_mob/vore/lamia/copper = 2,
		/mob/living/simple_mob/vore/lamia/green = 2,
		/mob/living/simple_mob/vore/lamia/zebra = 2,
		/mob/living/simple_mob/vore/lamia/albino = 2,
		/mob/living/simple_mob/vore/aggressive/rat = 1,
		/mob/living/simple_mob/vore/aggressive/giant_snake = 1,
		/mob/living/simple_mob/tomato = 1, // just a silly lil' guy, hanging out
		/mob/living/simple_mob/vore/gryphon = 1
		),
	"thor_safe" = list( // No aggressive mobs, meant for placement close to the resort and landing sites.
		/mob/living/simple_mob/animal/passive/crab = 10,
		/mob/living/simple_mob/animal/passive/tindalos = 10,
		/mob/living/simple_mob/animal/passive/yithian = 10,
		/mob/living/simple_mob/animal/passive/cockroach = 10,
		// /mob/living/simple_mob/animal/passive/lizard = 6, // If we ever get komodo dragons or tegu or some lizard with a less shitty sprite, put them in here.
		// /mob/living/simple_mob/vore/aggressive/frog = 10, // Weirdly, these don't attack anyone, but I'm pretty sure that's a bug so...
		/mob/living/simple_mob/animal/passive/chicken = 10,
		/mob/living/simple_mob/animal/passive/mouse = 10,
		/mob/living/simple_mob/animal/passive/snake/python = 10,
		// /mob/living/simple_mob/vore/pitcher = 7, // Inactive until the jank on these is fixed by Virgo.
		/mob/living/simple_mob/vore/pitcher_plant = 7,
		/mob/living/simple_mob/vore/mantrap = 7,
		/mob/living/simple_mob/animal/passive/bird/parrot = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/eclectus = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/grey_parrot = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/white_caique = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/budgerigar = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/cockatiel = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/white_cockatoo = 6,
		/mob/living/simple_mob/animal/passive/bird/parrot/pink_cockatoo = 6,
		/mob/living/simple_mob/vore/seagull = 6,
		/mob/living/simple_mob/vore/redpanda = 6,
		/mob/living/simple_mob/vore/meowl = 6,
		/mob/living/simple_mob/vore/fennec = 2,
		/mob/living/simple_mob/vore/lamia/random = 4, // More civilized, so they wear clothes.
		/mob/living/simple_mob/tomato = 1
		)
))

GLOBAL_LIST_INIT(grass_grass,list(
	"base" = list(
		/obj/structure/flora/ausbushes/sparsegrass,
		/obj/structure/flora/ausbushes/fullgrass
		),
	"sif" = list(
		/obj/structure/flora/sif/eyes = 1,
		/obj/structure/flora/sif/tendrils = 5,
		/obj/structure/flora/bush = 5
		),
	"sifforest" = list(
		/obj/structure/flora/sif/frostbelle = 1,
		/obj/structure/flora/sif/eyes = 5,
		/obj/structure/flora/sif/tendrils = 20,
		/obj/structure/flora/bush = 10
		),
	"valley" = list(
		/obj/structure/flora/sif/eyes = 20,
		/obj/structure/flora/sif/tendrils = 20,
		/obj/structure/flora/mushroom = 20,
		/obj/structure/flora/sif/subterranean = 20,
		/obj/structure/flora/sif/tendrils = 20,
		/obj/structure/flora/sif/frostbelle = 20
		),
	"valleyedge" = list(
		/obj/structure/flora/sif/eyes = 20,
		/obj/structure/flora/sif/tendrils = 20,
		/obj/structure/flora/mushroom = 20,
		/obj/structure/flora/sif/subterranean = 20,
		/obj/structure/flora/sif/tendrils = 20,
		/obj/structure/flora/sif/frostbelle = 20
		),
	"sifcave" = list(
		/obj/structure/flora/mushroom = 1,
		/obj/structure/flora/sif/subterranean = 1,
		/obj/structure/outcrop/phoron = 1,
		/obj/structure/outcrop/diamond = 1,
		/obj/structure/outcrop/uranium = 1,
		/obj/structure/outcrop = 1,
		/obj/structure/boulder = 1
		),
	"seasonalspring" = list(
		/obj/structure/flora/ausbushes/sparsegrass,
		/obj/structure/flora/ausbushes/fullgrass,
		/obj/structure/flora/ausbushes/brflowers,
		/obj/structure/flora/ausbushes/genericbush,
		/obj/structure/flora/ausbushes/lavendergrass,
		/obj/structure/flora/ausbushes/leafybush,
		/obj/structure/flora/ausbushes/ppflowers,
		/obj/structure/flora/ausbushes/sunnybush,
		/obj/structure/flora/ausbushes/ywflowers,
		/obj/structure/flora/mushroom
		),
	"seasonalsummer" = list(
		/obj/structure/flora/ausbushes/sparsegrass,
		/obj/structure/flora/ausbushes/fullgrass
		),
	"seasonalautumn" = list(
		/obj/structure/flora/ausbushes/sparsegrass,
		/obj/structure/flora/pumpkin,
		/obj/structure/flora/ausbushes
		),
	"seasonalwinter" = list(
		/obj/structure/flora/grass/both,
		/obj/structure/flora/grass/brown,
		/obj/structure/flora/grass/green,
		/obj/structure/flora/bush
		),
	"smokestar" = list(
		/obj/structure/flora/opalflowers,
		/obj/structure/flora/weepinggrass,
		/obj/random/outcrop
		),
	"thor" = list(
		/obj/structure/flora/ausbushes/fullgrass = 40,
		/obj/structure/flora/ausbushes/sparsegrass = 40,
		/obj/structure/prop/desert_planet64x64/palmuria = 10,
		/obj/structure/prop/desert_planet64x64/palmuria1 = 10
		),
	"heavy" = list(
		/obj/structure/flora/ausbushes/sparsegrass,
		/obj/structure/flora/ausbushes/fullgrass
		),
	"thor_real" = list(
		/obj/structure/flora/ausbushes/sparsegrass,
		/obj/structure/flora/ausbushes/fullgrass,
		/obj/structure/flora/ausbushes/lavendergrass,
		/obj/structure/flora/ausbushes/genericbush,
		/obj/structure/flora/ausbushes/grassybush,
		/obj/structure/flora/ausbushes/sunnybush,
		/obj/structure/flora/ausbushes/brflowers,
		/obj/structure/flora/ausbushes/ppflowers,
		/obj/structure/flora/ausbushes/ywflowers,
		/obj/structure/flora/tree/jungle_small,
		/obj/structure/flora/tree/jungle,
		/obj/structure/flora/ausbushes/leafybush,
		)
))

GLOBAL_LIST_INIT(grass_trees, list(
	"seasonalspring" = list(
		/obj/structure/flora/tree/bigtree,
		/obj/structure/flora/tree/jungle_small,
		/obj/structure/flora/tree/jungle
		),
	"seasonalsummer" = list(
		/obj/structure/flora/tree/bigtree,
		/obj/structure/flora/tree/jungle_small,
		/obj/structure/flora/tree/jungle
		),
	"seasonalautumn" = list(
		/obj/structure/flora/tree/bigtree
		),
	"seasonalwinter" = list(
		/obj/structure/flora/tree/dead,
		/obj/structure/flora/tree/pine
		),
))
