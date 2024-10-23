#ifndef CITESTING

/*********************/
/* MAP SELECTION     */
/* FOR LIVE SERVER   */
/*********************/

#define USE_MAP_SOUTHERN_CROSS
// #define USE_MAP_SOLUNA_NEXUS

// Debug
// #define USE_MAP_MINITEST

/*********************/
/* End Map Selection */
/*********************/

#endif

// Southern Cross
#ifdef USE_MAP_SOUTHERN_CROSS
#include "../southern_cross/southern_cross.dm"
#endif

// Soluna Nexus
#ifdef USE_MAP_SOLUNA_NEXUS
#include "../soluna_nexus/soluna_nexus.dm"
#endif

#ifdef USE_MAP_MINITEST
#include "../virgo_minitest/virgo_minitest.dm"
#endif
