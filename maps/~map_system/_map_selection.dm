#ifndef CITESTING

/*********************/
/* MAP SELECTION     */
/* FOR LIVE SERVER   */
/*********************/

<<<<<<< HEAD
// #define USE_MAP_TETHER
#define USE_MAP_STELLARDELIGHT
// #define USE_MAP_GROUNDBASE
=======
#define USE_MAP_TETHER
//#define USE_MAP_STELLARDELIGHT
//#define USE_MAP_GROUNDBASE
>>>>>>> 9cd756bf49 (Merge pull request #16750 from VOREStation/Map-Swap)

// Debug
// #define USE_MAP_MINITEST

/*********************/
/* End Map Selection */
/*********************/

#endif

// Tether
#ifdef USE_MAP_TETHER
#include "../tether/tether.dm"
#endif

// Stellar Delight
#ifdef USE_MAP_STELLARDELIGHT
#include "../stellar_delight/stellar_delight.dm"
#endif

// Groundbase
#ifdef USE_MAP_GROUNDBASE
#include "../groundbase/groundbase.dm"
#endif

#ifdef USE_MAP_MINITEST
#include "../virgo_minitest/virgo_minitest.dm"
#endif
