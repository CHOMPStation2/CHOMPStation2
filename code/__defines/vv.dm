#define VV_NUM "Number"
#define VV_TEXT "Text"
#define VV_MESSAGE "Multiline Text" // CHOMPEdit - New datum defines
#define VV_COLOR "Color" // CHOMPEdit - New datum defines
#define VV_COLOR_MATRIX "Color Matrix" // CHOMPEdit - New datum defines
#define VV_ICON "Icon"
#define VV_ATOM_REFERENCE "Atom Reference"
#define VV_DATUM_REFERENCE "Datum Reference"
#define VV_MOB_REFERENCE "Mob Reference"
#define VV_CLIENT "Client"
#define VV_ATOM_TYPE "Atom Typepath"
#define VV_DATUM_TYPE "Datum Typepath"
#define VV_TYPE "Custom Typepath"
#define VV_FILE "File"
#define VV_LIST "List"
#define VV_NEW_ATOM "New Atom"
#define VV_NEW_DATUM "New Datum"
#define VV_NEW_TYPE "New Custom Typepath"
#define VV_NEW_LIST "New List"
#define VV_NULL "NULL"
#define VV_INFINITY "Infinity" // CHOMPEdit - New datum defines
#define VV_RESTORE_DEFAULT "Restore to Default"
#define VV_MARKED_DATUM "Marked Datum"
#define VV_TAGGED_DATUM "Tagged Datum" // CHOMPEdit - New datum defines
#define VV_BITFIELD "Bitfield"
#define VV_TEXT_LOCATE "Custom Reference Locate" // CHOMPEdit - New datum defines
#define VV_PROCCALL_RETVAL "Return Value of Proccall" // CHOMPEdit - New datum defines
#define VV_WEAKREF "Weak Reference Datum" // CHOMPEdit - New datum defines

#define VV_MSG_MARKED "<br><font size='1' color='red'><b>Marked Object</b></font>"
#define VV_MSG_TAGGED(num) "<br><font size='1' color='red'><b>Tagged Datum #[num]</b></font>" // CHOMPEdit - Tagged datum msg
#define VV_MSG_EDITED "<br><font size='1' color='red'><b>Var Edited</b></font>"
#define VV_MSG_DELETED "<br><font size='1' color='red'><b>Deleted</b></font>"

#define VV_NORMAL_LIST_NO_EXPAND_THRESHOLD 50
#define VV_SPECIAL_LIST_NO_EXPAND_THRESHOLD 150

#define IS_VALID_ASSOC_KEY(V) (!isnum(V))

// CHOMPEdit Begin - Added VV helpers
//General helpers
#define VV_HREF_TARGET_INTERNAL(target, href_key) "?_src_=vars;[HrefToken()];[href_key]=TRUE;[VV_HK_TARGET]=[REF(target)]"
#define VV_HREF_TARGETREF_INTERNAL(targetref, href_key) "?_src_=vars;[HrefToken()];[href_key]=TRUE;[VV_HK_TARGET]=[targetref]"
#define VV_HREF_TARGET(target, href_key, text) "<a href='[VV_HREF_TARGET_INTERNAL(target, href_key)]'>[text]</a>"
#define VV_HREF_TARGETREF(targetref, href_key, text) "<a href='[VV_HREF_TARGETREF_INTERNAL(targetref, href_key)]'>[text]</a>"
#define VV_HREF_TARGET_1V(target, href_key, text, varname) "<a href='[VV_HREF_TARGET_INTERNAL(target, href_key)];[VV_HK_VARNAME]=[varname]'>[text]</a>" //for stuff like basic varedits, one variable
#define VV_HREF_TARGETREF_1V(targetref, href_key, text, varname) "<a href='[VV_HREF_TARGETREF_INTERNAL(targetref, href_key)];[VV_HK_VARNAME]=[varname]'>[text]</a>"
// CHOMPEdit End

//Helpers for vv_get_dropdown()
#define VV_DROPDOWN_OPTION(href_key, name) . += "<option value='?_src_=vars;[href_key]=TRUE;target=\ref[src]'>[name]</option>"

//Helpers for vv_do_topic(list/href_list)
#define IF_VV_OPTION(href_key) if(href_list[href_key])

// CHOMPEdit Begin - Added VV helpers
// VV HREF KEYS
#define VV_HK_TARGET "target"
#define VV_HK_VARNAME "targetvar" //name or index of var for 1 variable targeting hrefs.
// CHOMPEdit End

// vv_do_list() keys
#define VV_HK_LIST_ADD "listadd"
#define VV_HK_LIST_EDIT "listedit"
#define VV_HK_LIST_CHANGE "listchange"
#define VV_HK_LIST_REMOVE "listremove"
#define VV_HK_LIST_ERASE_NULLS "listnulls"
#define VV_HK_LIST_ERASE_DUPES "listdupes"
#define VV_HK_LIST_SHUFFLE "listshuffle"
#define VV_HK_LIST_SET_LENGTH "listlen"

// /datum
#define VV_HK_DELETE "delete"
#define VV_HK_EXPOSE "expose"
#define VV_HK_CALLPROC "proc_call"
#define VV_HK_MARK "mark"
#define VV_HK_ADDCOMPONENT "addcomponent"

// /atom
#define VV_HK_ATOM_EXPLODE "turf_explode"
#define VV_HK_ATOM_EMP "turf_emp"

#define VV_HK_WEAKREF_RESOLVE "weakref_resolve"

// CHOMPEdit Start - VV Update
// Flags for debug_variable() that do little things to what we end up rendering

/// ALWAYS render a reduced list, useful for fuckoff big datums that need to be condensed for the sake of client load
#define VV_ALWAYS_CONTRACT_LIST (1<<0)
// CHOMPEdit End
