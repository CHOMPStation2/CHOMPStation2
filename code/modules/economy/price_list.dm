// For convenience and easier comparing and maintaining of item prices,
// all these will be defined here and sorted in different sections.

// The item price in thalers. atom/movable so we can also assign a price to animals and other things.
/atom/movable/var/price_tag = null

// The proc that is called when the price is being asked for. Use this to refer to another object if necessary.
/atom/movable/proc/get_item_cost()
	return price_tag


//***************//
//---Beverages---//
//***************//

/datum/reagent/var/price_tag = 0


// Juices, soda and similar //

/datum/reagent/water
	price_tag = 2

/datum/reagent/drink/juice
	price_tag = 2

/datum/reagent/toxin/poisonberryjuice
	price_tag = 2

/datum/reagent/drink/milk
	price_tag = 2

/datum/reagent/drink/soda
	price_tag = 2

/datum/reagent/drink/doctor_delight
	price_tag = 2

/datum/reagent/drink/nothing
	price_tag = 2

/datum/reagent/drink/milkshake
	price_tag = 2

/datum/reagent/drink/roy_rogers
	price_tag = 2

/datum/reagent/drink/shirley_temple
	price_tag = 2

/datum/reagent/drink/arnold_palmer
	price_tag = 2

/datum/reagent/drink/collins_mix
	price_tag = 2


// Beer //

/datum/reagent/ethanol/ale
	price_tag = 2

/datum/reagent/ethanol/beer
	price_tag = 2


// Hot Drinks //

/datum/reagent/drink/rewriter
	price_tag = 3

/datum/reagent/drink/tea
	price_tag = 3

/datum/reagent/drink/coffee
	price_tag = 3

/datum/reagent/drink/hot_coco
	price_tag = 3

/obj/item/reagent_containers/food/drinks/coffee // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/drinks/tea // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/drinks/h_chocolate // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3


// Spirituous liquors //

/datum/reagent/ethanol/irish_cream
	price_tag = 5

/datum/reagent/ethanol/absinthe
	price_tag = 5

/datum/reagent/ethanol/bluecuracao
	price_tag = 5

/datum/reagent/ethanol/deadrum
	price_tag = 5

/datum/reagent/ethanol/gin
	price_tag = 5

/datum/reagent/ethanol/coffee/kahlua
	price_tag = 5

/datum/reagent/ethanol/melonliquor
	price_tag = 5

/datum/reagent/ethanol/rum
	price_tag = 5

/datum/reagent/ethanol/tequilla
	price_tag = 5

/datum/reagent/ethanol/thirteenloko
	price_tag = 5

/datum/reagent/ethanol/vodka
	price_tag = 5

/datum/reagent/ethanol/whiskey
	price_tag = 5

/datum/reagent/ethanol/specialwhiskey
	price_tag = 5

/datum/reagent/ethanol/patron
	price_tag = 5

/datum/reagent/ethanol/goldschlager
	price_tag = 5

/datum/reagent/ethanol/coffee/brave_bull // Not an original liquor in its own. But since it's a mix of purely Tequila
	price_tag = 5						 // and Kahlua, it's basically just another one and gets the same price.


// Wines //

/datum/reagent/ethanol/wine
	price_tag = 8

/datum/reagent/ethanol/cognac
	price_tag = 8

/datum/reagent/ethanol/sake
	price_tag = 8

/datum/reagent/ethanol/vermouth
	price_tag = 8

/datum/reagent/ethanol/pwine
	price_tag = 8


// Cocktails //

/datum/reagent/ethanol/acid_spit
	price_tag = 4

/datum/reagent/ethanol/alliescocktail
	price_tag = 4

/datum/reagent/ethanol/aloe
	price_tag = 4

/datum/reagent/ethanol/amasec
	price_tag = 4

/datum/reagent/ethanol/andalusia
	price_tag = 4

/datum/reagent/ethanol/antifreeze
	price_tag = 4

/datum/reagent/ethanol/atomicbomb
	price_tag = 4

/datum/reagent/ethanol/coffee/b52
	price_tag = 4

/datum/reagent/ethanol/bahama_mama
	price_tag = 4

/datum/reagent/ethanol/barefoot
	price_tag = 4

/datum/reagent/ethanol/beepsky_smash
	price_tag = 4

/datum/reagent/ethanol/bilk
	price_tag = 4

/datum/reagent/ethanol/black_russian
	price_tag = 4

/datum/reagent/ethanol/bloody_mary
	price_tag = 4

/datum/reagent/ethanol/booger
	price_tag = 4

/datum/reagent/ethanol/brave_bull
	price_tag = 4

/datum/reagent/ethanol/changeling_sting
	price_tag = 4

/datum/reagent/ethanol/martini
	price_tag = 4

/datum/reagent/ethanol/cuba_libre
	price_tag = 4

/datum/reagent/ethanol/rum_and_cola
	price_tag = 4

/datum/reagent/ethanol/demonsblood
	price_tag = 4

/datum/reagent/ethanol/devilskiss
	price_tag = 4

/datum/reagent/ethanol/driestmartini
	price_tag = 4

/datum/reagent/ethanol/ginfizz
	price_tag = 4

/datum/reagent/ethanol/grog
	price_tag = 4

/datum/reagent/ethanol/erikasurprise
	price_tag = 4

/datum/reagent/ethanol/gargle_blaster
	price_tag = 4

/datum/reagent/ethanol/gintonic
	price_tag = 4

/datum/reagent/ethanol/hippies_delight
	price_tag = 4

/datum/reagent/ethanol/iced_beer
	price_tag = 4

/datum/reagent/ethanol/irishcarbomb
	price_tag = 4

/datum/reagent/ethanol/coffee/irishcoffee
	price_tag = 4

/datum/reagent/ethanol/longislandicedtea
	price_tag = 4

/datum/reagent/ethanol/manhattan
	price_tag = 4

/datum/reagent/ethanol/manhattan_proj
	price_tag = 4

/datum/reagent/ethanol/manly_dorf
	price_tag = 4

/datum/reagent/ethanol/margarita
	price_tag = 4

/datum/reagent/ethanol/mead
	price_tag = 4

/datum/reagent/ethanol/moonshine
	price_tag = 4

/datum/reagent/ethanol/neurotoxin
	price_tag = 4

/datum/reagent/ethanol/red_mead
	price_tag = 4

/datum/reagent/ethanol/sbiten
	price_tag = 4

/datum/reagent/ethanol/screwdrivercocktail
	price_tag = 4

/datum/reagent/ethanol/silencer
	price_tag = 4

/datum/reagent/ethanol/singulo
	price_tag = 4

/datum/reagent/ethanol/snowwhite
	price_tag = 4

/datum/reagent/ethanol/suidream
	price_tag = 4

/datum/reagent/ethanol/syndicatebomb
	price_tag = 4

/datum/reagent/ethanol/tequillasunrise
	price_tag = 4

/datum/reagent/ethanol/threemileisland
	price_tag = 4

/datum/reagent/ethanol/toxins_special
	price_tag = 4

/datum/reagent/ethanol/vodkamartini
	price_tag = 4

/datum/reagent/ethanol/vodkatonic
	price_tag = 4

/datum/reagent/ethanol/white_russian
	price_tag = 4

/datum/reagent/ethanol/whiskey_cola
	price_tag = 4

/datum/reagent/ethanol/whiskeysoda
	price_tag = 4

/datum/reagent/ethanol/binmanbliss
	price_tag = 4

/datum/reagent/ethanol/xanaducannon
	price_tag = 4

/datum/reagent/ethanol/balloon
	price_tag = 4

/datum/reagent/ethanol/coffee/elysiumfacepunch
	price_tag = 4

/datum/reagent/ethanol/saketini
	price_tag = 4

/datum/reagent/ethanol/tokyorose
	price_tag = 4

/datum/reagent/ethanol/ginzamary
	price_tag = 4

/datum/reagent/ethanol/tamagozake
	price_tag = 4

/datum/reagent/ethanol/sakebomb
	price_tag = 4

/datum/reagent/ethanol/erebusmoonrise
	price_tag = 4

// The Cheap Shit //

/datum/reagent/ethanol/hooch
	price_tag = 2

/datum/reagent/ethanol/debugger
	price_tag = 2

/datum/reagent/ethanol/spacersbrew
	price_tag = 2

/datum/reagent/ethanol/natunabrandy
	price_tag = 2

// Cocktails without alcohol //

/datum/reagent/ethanol/bananahonk
	price_tag = 3

// From the machine //

/obj/item/reagent_containers/food/drinks/cans/cola // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/dr_gibb // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/starkist // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/waterbottle // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/drinks/cans/space_up // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/iced_tea // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/grape_juice // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/drinks/cans/gingerale // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

//***************//
//----Bottles----//
//***************//

// Juices, soda and similar //

/obj/item/reagent_containers/food/drinks/bottle/cola // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 6

/obj/item/reagent_containers/food/drinks/bottle/space_up // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 6

/obj/item/reagent_containers/food/drinks/bottle/space_mountain_wind // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 6

/obj/item/reagent_containers/food/drinks/bottle/orangejuice // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 6

/obj/item/reagent_containers/food/drinks/bottle/applejuice // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 6

/obj/item/reagent_containers/food/drinks/bottle/cream // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 6

/obj/item/reagent_containers/food/drinks/bottle/tomatojuice // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 6

/obj/item/reagent_containers/food/drinks/bottle/limejuice // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 6


// Beer //

/obj/item/reagent_containers/food/drinks/bottle/small/beer // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/drinks/bottle/small/ale // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3


// Spirituous Liquors //

/obj/item/reagent_containers/food/drinks/bottle/absinthe // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/bluecuracao // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/gin // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/kahlua // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/melonliquor // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/rum // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/tequilla // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/vodka // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/whiskey // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/specialwhiskey // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/patron // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/goldschlager // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/reagent_containers/food/drinks/bottle/grenadine // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15


// Wines //

/obj/item/reagent_containers/food/drinks/bottle/wine // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 25

/obj/item/reagent_containers/food/drinks/bottle/cognac // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 25

/obj/item/reagent_containers/food/drinks/bottle/vermouth // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 25

/obj/item/reagent_containers/food/drinks/bottle/pwine // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 25

/obj/item/reagent_containers/food/drinks/bottle/sake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 25

/obj/item/reagent_containers/food/drinks/bottle/jager // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 25

//***************//
//---Foodstuff---//
//***************//

// Snacks //

/obj/item/reagent_containers/food/snacks/candy // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sosjerky // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/unajerky // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 12

/obj/item/reagent_containers/food/snacks/cheesiehonkers // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/tastybread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/no_raisin // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/packaged/spacetwinkie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/skrellsnacks // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 4

/obj/item/reagent_containers/food/snacks/chips // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/drinks/dry_ramen // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5


// Burger //

/obj/item/reagent_containers/food/snacks/brainburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/ghostburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/human/burger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/cheeseburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/monkeyburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/fishburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/tofuburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/roburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/roburgerbig // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/xenoburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/clownburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/mimeburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/spellburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/jellyburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/bigbiteburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 4

/obj/item/reagent_containers/food/snacks/superbiteburger // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 8


// Sandwiches //

/obj/item/reagent_containers/food/snacks/sandwich // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/toastedsandwich // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/grilledcheese // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/jellysandwich // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3


// Cookies and Candies //

/obj/item/reagent_containers/food/snacks/cookie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/chocolatebar // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/chocolateegg // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/candy_corn // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/donut // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/donut/chaos // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/popcorn // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/fortunecookie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/candiedapple // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/chawanmushi // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/cracker // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1


// Full meals //

/obj/item/reagent_containers/food/snacks/friedegg // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/tofurkey // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/carpmeat // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/fishfingers // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/omelette // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/berryclafoutis // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/waffles // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/eggplantparm // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/soylentgreen // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/soylenviridians // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/wingfangchu // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/monkeykabob // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/tofukabob // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/cubancarp // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/loadedbakedpotato // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/fries // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/spagetti // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/cheesyfries // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/enchiladas // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/taco // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/monkeysdelight // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/fishandchips // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/rofflewaffles // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/stew // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/stewedsoymeat // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/boiledspagetti // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/boiledrice // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/ricepudding // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/pastatomato // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/meatballspagetti // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/spesslaw // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/carrotfries // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/appletart // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/sliceable/pizza // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/margherita // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/slice/meatpizza // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/slice/mushroompizza // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/slice/vegetablepizza // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/ // CHOMPEdit - Removal of obj/item/weapon


// Baked Goods //

/obj/item/reagent_containers/food/snacks/poppypretzel // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/baguette // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/jelliedtoast // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/twobread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/sliceable/meatbread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/meatbread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/xenomeatbread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/xenomeatbread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/bananabread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/bananabread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/tofubread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/tofubread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/bread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/bread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/creamcheesebread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/creamcheesebread // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1


// Soups //

/obj/item/reagent_containers/food/snacks/meatballsoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/slimesoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/bloodsoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/clownstears // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/vegetablesoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/nettlesoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/mysterysoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/wishsoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/hotchili // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/coldchili // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/tomatosoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/milosoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/mushroomsoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3

/obj/item/reagent_containers/food/snacks/beetsoup // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 3


// Pies //

/obj/item/reagent_containers/food/snacks/pie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 4

/obj/item/reagent_containers/food/snacks/meatpie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 4

/obj/item/reagent_containers/food/snacks/tofupie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 4

/obj/item/reagent_containers/food/snacks/plump_pie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 4

/obj/item/reagent_containers/food/snacks/xemeatpie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 4

/obj/item/reagent_containers/food/snacks/applepie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 4

/obj/item/reagent_containers/food/snacks/cherrypie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 4


// Cakes //

/obj/item/reagent_containers/food/snacks/sliceable/carrotcake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/carrotcake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/braincake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/braincake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/cheesecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/cheesecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/plaincake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/plaincake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/orangecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/orangecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/limecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/limecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/lemoncake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/lemoncake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/chocolatecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/chocolatecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/birthdaycake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/birthdaycake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/applecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/applecake // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sliceable/pumpkinpie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

/obj/item/reagent_containers/food/snacks/slice/pumpkinpie // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1


// Misc //

/obj/item/reagent_containers/food/snacks/boiledegg // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/donkpocket // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/reagent_containers/food/snacks/sausage // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/muffin // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/tossedsalad // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/validsalad // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/reagent_containers/food/snacks/dionaroast // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 25

/obj/item/pizzabox/get_item_cost()
	return get_item_cost(pizza)


//***************//
//----Smokes-----//
//***************//

/obj/item/storage/fancy/cigarettes // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 15

/obj/item/storage/fancy/cigarettes/luckystars // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 17

/obj/item/storage/fancy/cigarettes/jerichos // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 22

/obj/item/storage/fancy/cigarettes/menthols // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 18

/obj/item/storage/fancy/cigar // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 27

/obj/item/storage/fancy/cigarettes/carcinomas // CHOMPEdit - Removal of obj/item/weapon
	price_tag  = 23

/obj/item/storage/fancy/cigarettes/professionals // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 25

/obj/item/storage/box/matches // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 1

/obj/item/flame/lighter // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 2

/obj/item/flame/lighter/zippo // CHOMPEdit - Removal of obj/item/weapon
	price_tag = 5

//******************************//
//|IN THIS MOMENT I AM EUPHORIC|//
//******************************//

/datum/reagent/ethanol/euphoria
	price_tag = 30