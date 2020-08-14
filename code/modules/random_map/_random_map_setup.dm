/*
	This module is used to generate the debris fields/distribution maps/procedural stations.
	-This controls the amount of sand turf it will create in the caves, I assume it controls the amount of minerals and undeground minerals aswell
*/

#define MIN_SURFACE_COUNT 75
#define MIN_RARE_COUNT 50
#define MIN_DEEP_COUNT 25
#define RESOURCE_HIGH_MAX 3
#define RESOURCE_HIGH_MIN 2
#define RESOURCE_MID_MAX 2
#define RESOURCE_MID_MIN 0.5
#define RESOURCE_LOW_MAX 0.5
#define RESOURCE_LOW_MIN 0

#define FLOOR_CHAR 0
#define WALL_CHAR 1
#define DOOR_CHAR 2
#define EMPTY_CHAR 3
#define ROOM_TEMP_CHAR 4
#define MONSTER_CHAR 5
#define ARTIFACT_TURF_CHAR 6
#define ARTIFACT_CHAR 7