//CHOMPEDIT Start: edit the file human/update_icons.dm in the modular_chomp folder as well, if you update these (and clothing/clothing.dm line 789, the hardcoded layer there in /obj/item/clothing/suit/make_worn_icon)
#define MUTATIONS_LAYER			1		//Mutations like fat, and lasereyes
#define TAIL_LOWER_LAYER		2		//Tail as viewed from the south //CHOMPStation edit - underneath bodyparts
#define WING_LOWER_LAYER		3		//Wings as viewed from the south //CHOMPStation edit - underneath bodyparts
#define BODYPARTS_LAYER			4		//Bodyparts layer - CHOMPStation edit
#define SKIN_LAYER				5		//Skin things added by a call on species
#define BLOOD_LAYER				6		//Bloodied hands/feet/anything else
#define MOB_DAM_LAYER			7		//Injury overlay sprites like open wounds
#define SURGERY_LAYER			8		//Overlays for open surgical sites
#define UNDERWEAR_LAYER  		9		//Underwear/bras/etc
#define SHOES_LAYER_ALT			10		//Shoe-slot item (when set to be under uniform via verb)
#define UNIFORM_LAYER			11		//Uniform-slot item
#define ID_LAYER				12		//ID-slot item
#define SHOES_LAYER				13		//Shoe-slot item
#define GLOVES_LAYER			14		//Glove-slot item
#define BELT_LAYER				15		//Belt-slot item
#define SUIT_LAYER				16		//Suit-slot item
#define TAIL_UPPER_LAYER		17	//Some species have tails to render (As viewed from the N, E, or W)
#define GLASSES_LAYER			18		//Eye-slot item
#define BELT_LAYER_ALT			19		//Belt-slot item (when set to be above suit via verb)
#define SUIT_STORE_LAYER		20		//Suit storage-slot item
#define BACK_LAYER				21		//Back-slot item
#define HAIR_LAYER				22		//The human's hair
#define HAIR_ACCESSORY_LAYER	23		//VOREStation edit. Simply move this up a number if things are added.
#define EARS_LAYER				24		//Both ear-slot items (combined image)
#define EYES_LAYER				25		//Mob's eyes (used for glowing eyes)
#define FACEMASK_LAYER			26		//Mask-slot item
#define GLASSES_LAYER_ALT		27		//So some glasses can appear on top of hair and things
#define HEAD_LAYER				28		//Head-slot item
#define HANDCUFF_LAYER			29		//Handcuffs, if the human is handcuffed, in a secret inv slot
#define LEGCUFF_LAYER			30		//Same as handcuffs, for legcuffs
#define L_HAND_LAYER			31		//Left-hand item
#define R_HAND_LAYER			32		//Right-hand item
#define WING_LAYER				33		//Wings or protrusions over the suit.
#define VORE_BELLY_LAYER		34		//CHOMPStation edit - Move this and everything after up if things are added.
#define VORE_TAIL_LAYER			35		//CHOMPStation edit - Move this and everything after up if things are added.
#define TAIL_UPPER_LAYER_ALT	36		//Modified tail-sprite layer. Tend to be larger.
#define MODIFIER_EFFECTS_LAYER	37		//Effects drawn by modifiers
#define FIRE_LAYER				38		//'Mob on fire' overlay layer
#define MOB_WATER_LAYER			39		//'Mob submerged' overlay layer
#define TARGETED_LAYER			40		//'Aimed at' overlay layer
#define TOTAL_LAYERS			40		//CHOMPStation edit. <---- KEEP THIS UPDATED, should always equal the highest number here, used to initialize a list.
//CHOMPEdit End
