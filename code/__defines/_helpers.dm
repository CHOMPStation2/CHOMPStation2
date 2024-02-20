/// Takes a datum as input, returns its ref string
#define text_ref(datum) ref(datum)

// CHOMPEdit Start - VV Update
// Refs contain a type id within their string that can be used to identify byond types.
// Custom types that we define don't get a unique id, but this is useful for identifying
// types that don't normally have a way to run istype() on them.
#define TYPEID(thing) copytext(REF(thing), 4, 6)
// CHOMPEdit End
