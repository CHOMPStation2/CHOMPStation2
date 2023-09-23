//CHOMP belly modes



//Belly Reagents mode flags
#define DM_FLAG_REAGENTSNUTRI	0x1
#define DM_FLAG_REAGENTSDIGEST	0x2
#define DM_FLAG_REAGENTSABSORB	0x4
#define DM_FLAG_REAGENTSDRAIN	0x8

//Vore Sprite Flags
#define DM_FLAG_VORESPRITE_BELLY    0x1
#define DM_FLAG_VORESPRITE_TAIL     0x2
#define DM_FLAG_VORESPRITE_MARKING  0x4
#define DM_FLAG_VORESPRITE_ARTICLE	0x8

//For belly fullscreen shennanigans outside of bellies, due to Life() clearing belly fullscreens outside of bellies.
#define ATOM_BELLY_FULLSCREEN "belly_atom_vfx"

//Auto-transfer flags
#define AT_FLAG_CREATURES		0x1
#define AT_FLAG_ABSORBED		0x2
#define AT_FLAG_ANIMALS			0x4
#define AT_FLAG_MICE			0x8
#define AT_FLAG_CARBON			0x10
#define AT_FLAG_DEAD			0x20
#define AT_FLAG_ITEMS			0x100
#define AT_FLAG_TRASH			0x200
#define AT_FLAG_EGGS			0x400
#define AT_FLAG_INDIGESTIBLE	0x800
