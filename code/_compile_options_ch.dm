#ifdef CIBUILDING
#define UNIT_TESTS
#endif

#ifdef CITESTING
#define TESTING
#endif

#if defined(UNIT_TESTS)
//Hard del testing defines
#define REFERENCE_TRACKING
#define REFERENCE_TRACKING_DEBUG
#define FIND_REF_NO_CHECK_TICK
#define GC_FAILURE_HARD_LOOKUP
//Ensures all early assets can actually load early
#define DO_NOT_DEFER_ASSETS
//Test at full capacity, the extra cost doesn't matter
#define TIMER_DEBUG
#endif

#ifdef TGS
// TGS performs its own build of dm.exe, but includes a prepended TGS define.
#define CBT
#endif

#if !defined(CBT) && !defined(SPACEMAN_DMM)
#warn Building with Dream Maker is no longer supported and will result in errors.
#warn In order to build, run BUILD.bat in the root directory.
#warn Consider switching to VSCode editor instead, where you can press Ctrl+Shift+B to build.
#endif
