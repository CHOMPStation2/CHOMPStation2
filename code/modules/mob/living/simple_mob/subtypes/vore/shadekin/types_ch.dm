/////////////////////////////////////////////////////////////////CHOMPEDIT Custom shadekin mini tutorial
//Proto shadekin; AKA; Basic how to make your own shadekin; -Shark

//Step 1; sprites;
//File for body = icons/mob/vore_shadekin.dmi
//File for tail = icons/mob/vore_shadekin64.dmi
//Sprites can be either made inside of DM or you can use a Program of your choice and save the files as PNG and then import them
//If you need help learning how to use DMs interface to import/export sprites and make states you can always ask in the discord.

//Step 2; Code
//Now this depends on what type of eye colour you want
//For a red we use
///mob/living/simple_animal/shadekin/red
//then we simply add our shadekins name at the end (unless its used already)
/mob/living/simple_mob/shadekin/red/proto
	name ="Proto"
	//This here will be our shadekins name

	desc = "An invisible entity not meant for use."
	//here goes a lil tidbit people can see when examining the shadekin. Multiple lines works just as on the vore part

	icon_state = "proto"
	//this will most likely also be your shadekins name, it corresponds to the name you gave the tail and body state in the DMIs
	//so if you named the body state "proto" and "proto-1" then icon_state should be called "proto"

	vore_stomach_flavor = "You stared into the void,\
	the void decided you look tasty,\
	now you are in the void, pretty wet"
	//This is what people see when they drop into your gut! the backslashes at the end of the sentence indicate the next text will be on its own line!


	player_msg = "Proto is you, Proto shouldn't exist"
	//This message pops up when you are put into your shadekin
	//I recommend you use it as a way to remind yourself of how you want to act generally as your shadekin.

//Step 3; PR
// Assuming you already have a Fork of chompstation, make sure you got your files in order
// and then simply make a new pull request to our github.

//Now once you pushed the new DMIs with your added sprites to our github.
//And you finished writing this code section for your shadekin and pushed that too. You are done.
//If this is your first time I recommend getting someone to look over your work.

/////////////////////////////////////////////////////////////////CHOMP TUTORIAL END



//"Hunger." - Rakshasa
/mob/living/simple_mob/shadekin/red/rakshasa
	name ="Rakshasa"
	desc = "A scary, black shadekin? Their body oozes like goop."
	icon_state = "rakshasa"
	vore_stomach_flavor = "You're floating in a warm, viscous goop, too dark to see. \
	Your efforts to find light have failed. Darkness consumes you. \
	Rakshasa's gelatenous body squeezes over your form, leaving no inch unmolested. \
	The hot goop you float in makes it hard to breathe; all consuming of space and light.  \
	Your body feels hot, growing weaker, more tired. Draining. Darkness coming. \
	You struggle to stay awake while floating helplessly in the goo."
	player_msg = "You are Rakshasa. You are not to directly harm crew, only consume. You never speak a language."
	energy_adminbuse = TRUE
	maxHealth = 999999999999
	health = 999999999999
	eye_state = "BLUE EYES"
	eye_icon_state = "e_rakshasa"

/mob/living/simple_mob/shadekin/blue/luna
	name = "Luna"
	desc = "She appears to be a fuzzy critter of some sort. Her eyes shimmer a dark blue, glancing around curiously."
	icon_state = "luna"
	eye_desc = "blue eyes"
	vore_stomach_flavor = "Dark blue flesh fills your vision as you slip past the Shadekin's tongue and into the darkness \
	of her gullet. The flesh around you seems squishy and pliable and malleable to say the least, warmth rolling up \
	your body as the humid air rises across the deeper you slide into the darkness of her stomach. As you splash \
	inside, you curl up comfortably inside the walls that churn and squeeze around you, any fidgeting quickly \
	subdued by the strength of the walls, and any movement of your predator seems to coax a light sway from \
	your current prison. The slime inside stuck fairly well, though harmless - your aches and pains slowly soothing \
	up and fading away."
	player_msg = "You are a shadekin that goes by the name of Luna. Curious, you have tasked yourself and yourself alone \
	with studying this foreign world. Learn their language. Learn their culture. Adapt. Everything is wonderful and new, \
	and your mind is set on retaining knowledge of these odd planescape."

//"All your chickens are belong to me!" - Zylas
/mob/living/simple_mob/shadekin/purple/zylas
	name ="Zylas"
	desc = "He's a chubby looking creature, black and grey fur accompanied by purple eyes and a large hoody."
	icon_state = "zylashoody"
	eye_desc = "purple eyes"
	vore_stomach_flavor = "You are trapped in a cramped tight space. The color purple seems to dominate your vision. \
	His walls rolled over your form as you lay trapped in his depths. There wasnt a drop of fluid in sight inside that	\
	stomach. Instead, you could feel your energy slowly draining away over time, like... he was leeching off you."
	player_msg = "You are Zylas. You enjoy scaring the local population and eating every chicken you find."

//"Two scarves. No more, No Less." -Muninn
/mob/living/simple_mob/shadekin/blue/muninn
	name ="Muninn"
	desc = "A gray furred shadekin, a little on the hefty side. Rocks two scarves, one on the neck, one on the tail. \
	He seems eager to take in the various sights and sounds of the station"
	icon_state = "muninn"
	eye_desc = "blue eyes"
	vore_stomach_flavor = "You're stuck in a warm, tight stomach. \
	A blue glow, as soft as the walls surrounding you, illuminates the cramped chamber. \
	Muninn's walls gently squeeze over your form, like a tight, yet comfortable hug. \
	The gut itself was relatively dry, only slightly damp. \
	As Muninn ambles along, you'd gently sway within. It's quite the nice place to stay for a while."
	player_msg = "You are Muninn. Today you feel... Curious."

//"Here's a little lesson in the trickeries" -Muninn
/mob/living/simple_mob/shadekin/purple/muninn
	name ="Muninn"
	desc = "A gray furred shadekin, a little on the hefty side. Rocks two scarves, one on the neck, one on the tail.\
	He seems a little mischevious... better keep an eye on him."
	icon_state = "muninn"
	eye_desc = "purple eyes"
	vore_stomach_flavor = "You're stuck in a warm, tight stomach. \
	A purple glow, as soft as the walls surrounding you, illuminates the cramped chamber. \
	Muninn's walls gently squeeze over your form, like a tight hug. \
	The gut itself was relatively dry, only slightly damp.  \
	It didn't seem that Muninn was digesting you. More like... sapping your energy and making you feel tired. \
	A nap in this comfortable chamber wouldn't be the worst thing, would it?"
	player_msg = "You are Muninn. Today you feel... Mischevious."

//Whealty's shadekin anno!
/mob/living/simple_mob/shadekin/purple/anno
	name ="Anno"
	desc = "A white furred shadekin with a chubby form. His ears seem to be close to even in length and his snout seems longer than the usual.\
	He seems energetic and playful."
	icon_state = "anno"
	eye_desc = "purple eyes"
	vore_stomach_flavor = "You're stuck in a warm, tight stomach. \
	A purple glow, as soft as the walls surrounding you, illuminates the cramped chamber. \
	Anno's stomach walls squeeze and hug over your form somewhat tightly. \
	The gut itself was wetish and slightly slick.  \
	The gut seemed somewhat inviting with the warmth and softness, yet there was an ominous feeling to it with all the noises it made.\
	You'll probably be safe in here. Probably."
	player_msg = "You are Anno, you are energetic and playful"

/mob/living/simple_mob/shadekin/blue/roti
	name ="Roti"
	desc = "Roti is a shadekin with blue eyes, is chubby since he has eaten others before hand. He enjoys chocolate, the taste of it, the smell of it, he just wants anything sweet and chocolately to be in his belly. So be careful around him this is also a way to summon him by laying around chocolate and calling him out."
	icon_state = "roti"
	eye_desc = "blue eyes"
	vore_stomach_flavor = "You stare into Roti's maw as he moves it towards your head, putting it in and tasting your sweet delicious chocolately flavor. \
	Wet saliva covers your head as he pushes you inward, gulping down your head and shoulders into his pulsating throat. It pulses and eases you downward towards your destination \
	cramming your torso into his maw and taking wet SCHLURP, GLUK, to get it down and up to your waist. Roti continues to taste you all over wanting that succulent flavor \
	to himself. Another loud wet swallow and down goes your waist into his hungry maw, lifting up the legs high into the sky while allowing gravity and his gulps \
	to send you packing away into his chubby gut that now expands to fit you inside of the wet chamber. At least you were safe for now that is."
	player_msg = "You are Roti, a curious shadekin that wishes to learn from the station and eventually speak with them."

//kcin2001's soft shadekin
/mob/living/simple_mob/shadekin/green/soft
	name = "Softpatch"
	desc = "A green eyed brown shadekin, looks fluffy and a bit chubby around the middle underneath his well worn cloak \
	He seems curious but ready to flee"
	icon_state = "soft"
	eye_desc = "soft green eyes"
//	vore_stomach_flavor = ""
	player_msg = "You are Softpatch, you like things that are soft and are curious about the beings in realspace"

//"Marr marr marr-marr maaarr marr?~ (Ever had your ass eaten by a shadekin before?~)" - Yrmir (Shadowfire117)
/mob/living/simple_mob/shadekin/orange/yrmir
	name = "Green and black shadekin" //Name is Yrmir and known only to other shadekins he talks to, he doesn't speak common to any degree so far
	desc = "An orange eyed shadekin, this one has a very dark coat with several spots with faintly glowing green patches of fur. \
	Said fur looks quite soft and warm with it filling out a bit, a closer look tells its a slim upper body while rump, hips and thighs are nice and filled out well. \
	While he may have a more padded out builed below, the masculine part of them is quite visible as a large fat furred sack and sheath rests comfortably between his thighs and on his crotch. \
	From the way he looks at you, you get the feeling he is possibly scheming something fun, at least for himself."
	icon_state = "yrmir"
	eye_desc = "glimmering orange eyes"
//	vore_stomach_flavor = ""
	player_msg = "You are Yrmir, an orange shadekin with interest in revelry, trickery and pleasures. Mostly for you but to a degree to the willing and unwilling that interest you."