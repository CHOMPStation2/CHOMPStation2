
//Reagent Vore belly Sounds
var/global/list/vore_reagent_sounds = list(
		'sound/vore/walkslosh1.ogg',
		'sound/vore/walkslosh2.ogg',
		'sound/vore/walkslosh3.ogg',
		'sound/vore/walkslosh4.ogg',
		'sound/vore/walkslosh5.ogg',
		'sound/vore/walkslosh6.ogg',
		'sound/vore/walkslosh7.ogg',
		'sound/vore/walkslosh8.ogg',
		'sound/vore/walkslosh9.ogg',
		'sound/vore/walkslosh10.ogg',
		"None" = null)

var/global/list/item_tf_spawnpoints = list() // Global variable tracking which items are item tf spawnpoints

/var/global/list/existing_metroids = list() //Global variable for tracking metroids for the event announcement. Needs to go here for load order.

//stuff that only synths can eat
var/global/list/edible_tech = list(/obj/item/weapon/cell,
				/obj/item/weapon/circuitboard,
				/obj/item/integrated_circuit,
				/obj/item/broken_device,
				/obj/item/brokenbug,
				)

var/global/list/item_digestion_blacklist = list(
		/obj/item/weapon/hand_tele,
		/obj/item/weapon/card/id,
		/obj/item/weapon/gun,
		/obj/item/weapon/pinpointer,
		/obj/item/clothing/shoes/magboots,
		/obj/item/areaeditor/blueprints,
		/obj/item/weapon/disk/nuclear,
		/obj/item/device/perfect_tele_beacon,
		/obj/item/organ/internal/brain/slime,
		/obj/item/device/mmi/digital/posibrain,
		/obj/item/weapon/rig/protean)

// Options for transforming into a different mob in virtual reality.
var/global/list/vr_mob_tf_options = list(
	"Borg" = /mob/living/silicon/robot,
	"Cortical borer" = /mob/living/simple_mob/animal/borer/non_antag,
	"Hyena" = /mob/living/simple_mob/animal/hyena,
	"Giant spider" = /mob/living/simple_mob/animal/giant_spider/thermic,
	"Armadillo" = /mob/living/simple_mob/animal/passive/armadillo,
	"Parrot" = /mob/living/simple_mob/animal/passive/bird/parrot,
	"Cat" = /mob/living/simple_mob/animal/passive/cat,
	"Corgi" = /mob/living/simple_mob/animal/passive/dog/corgi,
	"Fox" = /mob/living/simple_mob/animal/passive/fox,
	"Racoon" = /mob/living/simple_mob/animal/passive/raccoon_ch,
	"Shantak" = /mob/living/simple_mob/animal/sif/shantak,
	"Goose" = /mob/living/simple_mob/animal/space/goose,
	"Space shark" = /mob/living/simple_mob/animal/space/shark,
	"Synx" = /mob/living/simple_mob/animal/synx,
	"Dire wolf" = /mob/living/simple_mob/animal/wolf/direwolf,
	"Construct Artificer" = /mob/living/simple_mob/construct/artificer,
	"Tech golem" = /mob/living/simple_mob/mechanical/technomancer_golem,
	"Metroid" = /mob/living/simple_mob/metroid/juvenile/baby,
	"Otie" = /mob/living/simple_mob/vore/otie/cotie/chubby,
	"Shadekin" = /mob/living/simple_mob/shadekin,
	"Slime" = /mob/living/simple_mob/slime/xenobio/metal,
	"Corrupt hound" = /mob/living/simple_mob/vore/aggressive/corrupthound,
	"Deathclaw" = /mob/living/simple_mob/vore/aggressive/deathclaw/den,
	"Mimic" = /mob/living/simple_mob/vore/aggressive/mimic/floor/plating,
	"Giant rat" = /mob/living/simple_mob/vore/aggressive/rat,
	"Catslug" = /mob/living/simple_mob/vore/alienanimals/catslug,
	"Dust jumper" = /mob/living/simple_mob/vore/alienanimals/dustjumper,
	"Space ghost" = /mob/living/simple_mob/vore/alienanimals/spooky_ghost,
	"Teppi" = /mob/living/simple_mob/vore/alienanimals/teppi,
	"Bee" = /mob/living/simple_mob/vore/bee,
	//"Dragon" = /mob/living/simple_mob/vore/bigdragon/friendly, //Currently adds 12 bellies to the user when transformed into. Do not uncomment without fixing this.
	"Riftwalker" = /mob/living/simple_mob/vore/demon/wendigo,
	"Horse" = /mob/living/simple_mob/vore/horse/big,
	"Morph" = /mob/living/simple_mob/vore/morph,
	"Leopardmander" = /mob/living/simple_mob/vore/leopardmander,
	"Rabbit" = /mob/living/simple_mob/vore/rabbit,
	"Red panda" = /mob/living/simple_mob/vore/redpanda,
	"Sect drone" = /mob/living/simple_mob/vore/sect_drone,
	"Armalis vox" = /mob/living/simple_mob/vox/armalis,
	"Xeno hunter" = /mob/living/simple_mob/xeno_ch/hunter,
	"Xeno queen" = /mob/living/simple_mob/xeno_ch/queen/maid,
	"Xeno sentinel" = /mob/living/simple_mob/xeno_ch/sentinel)
