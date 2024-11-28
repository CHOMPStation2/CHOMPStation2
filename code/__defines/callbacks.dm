#define GLOBAL_PROC "some_magic_bullshit"
/// A shorthand for the callback datum, [documented here](datum/callback.html)
#define CALLBACK new /datum/callback

#define INVOKE_ASYNC world.ImmediateInvokeAsync

<<<<<<< HEAD
// CHOMPEdit Start
/// like CALLBACK but specifically for verb callbacks
#define VERB_CALLBACK new /datum/callback/verb_callback
// CHOMPEdit End
=======
/// like CALLBACK but specifically for verb callbacks
#define VERB_CALLBACK new /datum/callback/verb_callback
>>>>>>> 10de4fc09f (Merge pull request #16511 from VOREStation/verb-subsystem)
