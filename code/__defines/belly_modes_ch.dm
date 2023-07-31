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
