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
 * Debrained hook.
 * Called in brain_item.dm when someone gets debrained.
 * Parameters: var/obj/item/organ/brain
 */
/hook/debrain

/**
 * Borged hook.
 * Called in robot_parts.dm when someone gets turned into a cyborg.
 * Parameters: var/mob/living/silicon/robot
 */
/hook/borgify

/**
 * Payroll revoked hook.
 * Called in Accounts_DB.dm when someone's payroll is stolen at the Accounts terminal.
 * Parameters: var/datum/money_account
 */
/hook/revoke_payroll

/**
 * Account suspension hook.
 * Called in Accounts_DB.dm when someone's account is suspended or unsuspended at the Accounts terminal.
 * Parameters: var/datum/money_account
 */
/hook/change_account_status

/**
 * Employee reassignment hook.
 * Called in card.dm when someone's card is reassigned at the HoP's desk.
 * Parameters: var/obj/item/card/id
 */
/hook/reassign_employee

/**
 * Employee terminated hook.
 * Called in card.dm when someone's card is terminated at the HoP's desk.
 * Parameters: var/obj/item/card/id
 */
/hook/terminate_employee

/**
 * Crate sold hook.
 * Called in supplyshuttle.dm when a crate is sold on the shuttle.
 * Parameters: var/obj/structure/closet/crate/sold, var/area/shuttle
 */
/hook/sell_crate

/**
 * Supply Shuttle sold hook.
 * Called in supplyshuttle.dm when the shuttle contents are sold.
 * This hook is called _before_ the crates are processed for normal
 * phoron/metal sale (and before the sell_crate hooks)
 * Parameters: var/area/area_shuttle
 */
/hook/sell_shuttle
