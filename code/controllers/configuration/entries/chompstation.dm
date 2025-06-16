// FIXME: Unused
///datum/config_entry/flag/discord_restriction
//	default = FALSE

/datum/config_entry/flag/use_jobwhitelist
	default = TRUE

// FIXME: Unused
///datum/config_entry/flag/emojis
//	default = FALSE

/// So, nodebot is a supplement to the TGS discord bot pretty much. For things likes faxes and the manifest it's very helpful because it's able to render html into an image and post it.
/datum/config_entry/flag/nodebot_enabled
	default = FALSE

/// We need to print the manifest to this location so nodebot can render it to chat.
/// NOTE: TO BE REPLACED BY BETTER CODE FOR FETCHING MANIFEST
/datum/config_entry/string/nodebot_location

/// These are for tgs4 channels, for discord chatbots used in TGS.
/datum/config_entry/string/ahelp_channel_tag

/datum/config_entry/string/fax_channel_tag

/datum/config_entry/string/role_request_channel_tag

/// These are for the role request TGS discord bot. Role IDs to ping.
/datum/config_entry/string/role_request_id_command

/datum/config_entry/string/role_request_id_security

/datum/config_entry/string/role_request_id_engineering

/datum/config_entry/string/role_request_id_medical

/datum/config_entry/string/role_request_id_research

/datum/config_entry/string/role_request_id_supply

/datum/config_entry/string/role_request_id_service

/datum/config_entry/string/role_request_id_expedition

/datum/config_entry/string/role_request_id_silicon

/// Only turn this on if you're not using the nodebot.
/datum/config_entry/flag/discord_faxes_autoprint
	default = FALSE

/// Turn this off if you don't want the TGS bot sending you messages whenever a fax is sent to central.
/datum/config_entry/flag/discord_faxes_disabled
	default = FALSE

/// Turn this off if you don't want the TGS bot sending you messages whenever an ahelp ticket is created.
/datum/config_entry/flag/discord_ahelps_disabled
	default = FALSE

/// Turn this on if you want all admin-PMs to go to be sent to discord, and not only the first message of a ticket.
/datum/config_entry/flag/discord_ahelps_all
	default = FALSE

/datum/config_entry/str_list/ip_whitelist
	protection = CONFIG_ENTRY_LOCKED | CONFIG_ENTRY_HIDDEN

/datum/config_entry/number/job_camp_time_limit
	default = 10 MINUTES
