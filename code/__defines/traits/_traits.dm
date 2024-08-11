#define SIGNAL_ADDTRAIT(trait_ref) "addtrait [trait_ref]"
#define SIGNAL_REMOVETRAIT(trait_ref) "removetrait [trait_ref]"

// trait accessor defines
#define ADD_TRAIT(target, trait, source) \
	do { \
		var/list/_L; \
<<<<<<< HEAD
		if (!target.status_traits) { \
			target.status_traits = list(); \
			_L = target.status_traits; \
			_L[trait] = list(source); \
		} else { \
			_L = target.status_traits; \
=======
		if (!target._status_traits) { \
			target._status_traits = list(); \
			_L = target._status_traits; \
			_L[trait] = list(source); \
			SEND_SIGNAL(target, SIGNAL_ADDTRAIT(trait), trait); \
		} else { \
			_L = target._status_traits; \
>>>>>>> 7a7920f29e... TGUI Say (#16160)
			if (_L[trait]) { \
				_L[trait] |= list(source); \
			} else { \
				_L[trait] = list(source); \
<<<<<<< HEAD
=======
				SEND_SIGNAL(target, SIGNAL_ADDTRAIT(trait), trait); \
>>>>>>> 7a7920f29e... TGUI Say (#16160)
			} \
		} \
	} while (0)
#define REMOVE_TRAIT(target, trait, sources) \
	do { \
<<<<<<< HEAD
		var/list/_L = target.status_traits; \
=======
		var/list/_L = target._status_traits; \
>>>>>>> 7a7920f29e... TGUI Say (#16160)
		var/list/_S; \
		if (sources && !islist(sources)) { \
			_S = list(sources); \
		} else { \
			_S = sources\
		}; \
<<<<<<< HEAD
		if (_L && _L[trait]) { \
=======
		if (_L?[trait]) { \
>>>>>>> 7a7920f29e... TGUI Say (#16160)
			for (var/_T in _L[trait]) { \
				if ((!_S && (_T != ROUNDSTART_TRAIT)) || (_T in _S)) { \
					_L[trait] -= _T \
				} \
			};\
			if (!length(_L[trait])) { \
<<<<<<< HEAD
				_L -= trait \
			}; \
			if (!length(_L)) { \
				target.status_traits = null \
=======
				_L -= trait; \
				SEND_SIGNAL(target, SIGNAL_REMOVETRAIT(trait), trait); \
			}; \
			if (!length(_L)) { \
				target._status_traits = null \
			}; \
		} \
	} while (0)
#define REMOVE_TRAIT_NOT_FROM(target, trait, sources) \
	do { \
		var/list/_traits_list = target._status_traits; \
		var/list/_sources_list; \
		if (sources && !islist(sources)) { \
			_sources_list = list(sources); \
		} else { \
			_sources_list = sources\
		}; \
		if (_traits_list?[trait]) { \
			for (var/_trait_source in _traits_list[trait]) { \
				if (!(_trait_source in _sources_list)) { \
					_traits_list[trait] -= _trait_source \
				} \
			};\
			if (!length(_traits_list[trait])) { \
				_traits_list -= trait; \
				SEND_SIGNAL(target, SIGNAL_REMOVETRAIT(trait), trait); \
			}; \
			if (!length(_traits_list)) { \
				target._status_traits = null \
>>>>>>> 7a7920f29e... TGUI Say (#16160)
			}; \
		} \
	} while (0)
#define REMOVE_TRAITS_NOT_IN(target, sources) \
	do { \
<<<<<<< HEAD
		var/list/_L = target.status_traits; \
=======
		var/list/_L = target._status_traits; \
>>>>>>> 7a7920f29e... TGUI Say (#16160)
		var/list/_S = sources; \
		if (_L) { \
			for (var/_T in _L) { \
				_L[_T] &= _S;\
				if (!length(_L[_T])) { \
<<<<<<< HEAD
					_L -= _T } \
				};\
				if (!length(_L)) { \
					target.status_traits = null\
				};\
		}\
	} while (0)

#define HAS_TRAIT(target, trait) (target.status_traits ? (target.status_traits[trait] ? TRUE : FALSE) : FALSE)
#define HAS_TRAIT_FROM(target, trait, source) (target.status_traits ? (target.status_traits[trait] ? (source in target.status_traits[trait]) : FALSE) : FALSE)
#define HAS_TRAIT_FROM_ONLY(target, trait, source) (HAS_TRAIT(target, trait) && (source in target.status_traits[trait]) && (length(target.status_traits[trait]) == 1))
#define HAS_TRAIT_NOT_FROM(target, trait, source) (HAS_TRAIT(target, trait) && (length(target.status_traits[trait] - source) > 0))
=======
					_L -= _T; \
					SEND_SIGNAL(target, SIGNAL_REMOVETRAIT(_T), _T); \
					}; \
				};\
			if (!length(_L)) { \
				target._status_traits = null\
			};\
		}\
	} while (0)

#define REMOVE_TRAITS_IN(target, sources) \
	do { \
		var/list/_L = target._status_traits; \
		var/list/_S = sources; \
		if (sources && !islist(sources)) { \
			_S = list(sources); \
		} else { \
			_S = sources\
		}; \
		if (_L) { \
			for (var/_T in _L) { \
				_L[_T] -= _S;\
				if (!length(_L[_T])) { \
					_L -= _T; \
					SEND_SIGNAL(target, SIGNAL_REMOVETRAIT(_T)); \
					}; \
				};\
			if (!length(_L)) { \
				target._status_traits = null\
			};\
		}\
	} while (0)

#define HAS_TRAIT(target, trait) (target._status_traits?[trait] ? TRUE : FALSE)
#define HAS_TRAIT_FROM(target, trait, source) (HAS_TRAIT(target, trait) && (source in target._status_traits[trait]))
#define HAS_TRAIT_FROM_ONLY(target, trait, source) (HAS_TRAIT(target, trait) && (source in target._status_traits[trait]) && (length(target._status_traits[trait]) == 1))
#define HAS_TRAIT_NOT_FROM(target, trait, source) (HAS_TRAIT(target, trait) && (length(target._status_traits[trait] - source) > 0))
/// Returns a list of trait sources for this trait. Only useful for wacko cases and internal futzing
/// You should not be using this
#define GET_TRAIT_SOURCES(target, trait) (target._status_traits?[trait] || list())
/// Returns the amount of sources for a trait. useful if you don't want to have a "thing counter" stuck around all the time
#define COUNT_TRAIT_SOURCES(target, trait) length(GET_TRAIT_SOURCES(target, trait))
/// A simple helper for checking traits in a mob's mind
#define HAS_MIND_TRAIT(target, trait) (HAS_TRAIT(target, trait) || (target.mind ? HAS_TRAIT(target.mind, trait) : FALSE))
>>>>>>> 7a7920f29e... TGUI Say (#16160)
