/datum/config_entry/flag/sql_enabled // for sql switching
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/string/address
	default = "localhost"
	protection = CONFIG_ENTRY_LOCKED | CONFIG_ENTRY_HIDDEN

/datum/config_entry/number/port
	default = 3306
	min_val = 0
	max_val = 65535
	protection = CONFIG_ENTRY_LOCKED | CONFIG_ENTRY_HIDDEN
