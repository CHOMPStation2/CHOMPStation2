/**
 * Startup hook.
 * Called in world.dm when the server starts.
 */
/hook/startup

/**
 * Roundstart hook.
 * Called in gameticker.dm when a round starts.
 */
/hook/roundstart

/**
 * Roundend hook.
 * Called in gameticker.dm when a round ends.
 */
/hook/roundend

/**
 * Death hook.
 * Called in death.dm when someone dies.
 * Parameters: var/mob/living/carbon/human, var/gibbed
 */
/hook/death

/**
 * Cloning hook.
 * Called in cloning.dm when someone is brought back by the wonders of modern science.
 * Parameters: var/mob/living/carbon/human
 */
/hook/clone

/**
 * Supply Shuttle sold hook.
 * Called in supplyshuttle.dm when the shuttle contents are sold.
 * This hook is called _before_ the crates are processed for normal
 * phoron/metal sale (and before the sell_crate hooks)
 * Parameters: var/area/area_shuttle
 */
/hook/sell_shuttle
