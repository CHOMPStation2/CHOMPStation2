//CHOMP belly modes



//Belly Reagents mode flags
#define DM_FLAG_REAGENTSNUTRI	0x1
#define DM_FLAG_REAGENTSDIGEST	0x2
#define DM_FLAG_REAGENTSABSORB	0x4
#define DM_FLAG_REAGENTSDRAIN	0x8

//For belly fullscreen shennanigans outside of bellies, due to Life() clearing belly fullscreens outside of bellies.
#define ATOM_BELLY_FULLSCREEN "belly_atom_vfx"

//Auto-transfer mob flags
#define AT_FLAG_CREATURES		0x1
#define AT_FLAG_ABSORBED		0x2
#define AT_FLAG_CARBON			0x4
#define AT_FLAG_SILICON			0x8
#define AT_FLAG_MOBS			0x10
#define AT_FLAG_ANIMALS			0x20
#define AT_FLAG_MICE			0x40
#define AT_FLAG_DEAD			0x80
#define AT_FLAG_CANDIGEST		0x100
#define AT_FLAG_CANABSORB		0x200
#define AT_FLAG_HEALTHY			0x400

//Auto-transfer item flags
#define AT_FLAG_ITEMS			0x1
#define AT_FLAG_TRASH			0x2
#define AT_FLAG_EGGS			0x4
#define AT_FLAG_REMAINS			0x8
#define AT_FLAG_INDIGESTIBLE	0x10
#define AT_FLAG_RECYCLABLE		0x20
#define AT_FLAG_ORES			0x40
#define AT_FLAG_CLOTHES			0x80
#define AT_FLAG_FOOD			0x100

//Vorespawn flags
#define VS_FLAG_ABSORB_YES		0x1
#define VS_FLAG_ABSORB_PREY		0x2
