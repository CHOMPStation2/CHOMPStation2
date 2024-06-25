//Ammo flags
#define AMMO_FLAG_AP 1
#define AMMO_FLAG_HP 2
#define AMMO_FLAG_RUBBER 4
#define AMMO_FLAG_FLASH 8
#define AMMO_FLAG_PRACTICE 16
#define AMMO_FLAG_HUNTER 32
#define AMMO_FLAG_EMP 64
#define AMMO_FLAG_MEDIUM 128
#define AMMO_FLAG_LARGE 256

//Change these values for balance
#define AMMO_AP_DAMAGE_MULT 0.8 //20% reduction for AP damage
#define AMMO_ARMORPEN_SMALL 25 //Armor penetration for AP small ammo
#define AMMO_ARMORPEN_MEDIUM 50 //Armor penetration for AP medium ammo
#define AMMO_ARMORPEN_LARGE 80 //Armor penetration for AP large ammo

#define AMMO_HP_DAMAGE_MULT 1.3 //30% increase for HP damage
#define AMMO_HP_ARMORPEN -50 //Negative armorpen to balance it out

#define AMMO_RUBBER_AGONY_MULT 2 //Multiply a projectile's damage by this to get the agony for it's rubber counterpart
#define AMMO_RUBBER_DAMAGE_MULT 0.25 //Rubber bullets still do some regular damage. This is the multiplier for their damage amount.

#define AMMO_HUNTER_SA_DAMAGE_MULT 1.2 //Multiply by original projectile damage to get SA_bonus_damage
#define AMMO_HUNTER_DAMAGE_MULT 0.2 //Damage multiplier for hunter rounds, SA bonus makes up for it
