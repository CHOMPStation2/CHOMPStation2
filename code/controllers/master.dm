/**
 * StonedMC
 *
 * Designed to properly split up a given tick among subsystems
 * Note: if you read parts of this code and think "why is it doing it that way"
 * Odds are, there is a reason
 *
 **/

// See initialization order in /code/game/world.dm
GLOBAL_REAL(Master, /datum/controller/master) = new
/datum/controller/master
	name = "Master"

	/// Are we processing (higher values increase the processing delay by n ticks)
	var/processing = TRUE
	/// How many times have we ran
	var/iteration = 0
	/// Stack end detector to detect stack overflows that kill the mc's main loop
	var/datum/stack_end_detector/stack_end_detector

	/// world.time of last fire, for tracking lag outside of the mc
	var/last_run

	/// List of subsystems to process().
	var/list/subsystems

	// Vars for keeping track of tick drift.
	var/init_timeofday
	var/init_time
	var/tickdrift = 0
	/// Tickdrift as of last tick, w no averaging going on
	var/olddrift = 0

	/// How long is the MC sleeping between runs, read only (set by Loop() based off of anti-tick-contention heuristics)
	var/sleep_delta = 1

	/// Only run ticker subsystems for the next n ticks.
	var/skip_ticks = 0

	/// makes the mc main loop runtime
	var/make_runtime = FALSE

	var/initializations_finished_with_no_players_logged_in	//I wonder what this could be?

	/// The type of the last subsystem to be fire()'d.
	var/last_type_processed

	var/datum/controller/subsystem/queue_head //!Start of queue linked list
	var/datum/controller/subsystem/queue_tail //!End of queue linked list (used for appending to the list)
	var/queue_priority_count = 0 //Running total so that we don't have to loop thru the queue each run to split up the tick
	var/queue_priority_count_bg = 0 //Same, but for background subsystems
	var/map_loading = FALSE //!Are we loading in a new map?

	var/current_runlevel //!for scheduling different subsystems for different stages of the round

	/// During initialization, will be the instanced subsytem that is currently initializing.
	/// Outside of initialization, returns null.
	var/current_initializing_subsystem = null

	var/static/restart_clear = 0
	var/static/restart_timeout = 0
	var/static/restart_count = 0

	var/static/random_seed

	///current tick limit, assigned before running a subsystem.
	///used by CHECK_TICK as well so that the procs subsystems call can obey that SS's tick limits
	var/static/current_ticklimit

/datum/controller/master/New()
	// Highlander-style: there can only be one! Kill off the old and replace it with the new.

	if(!random_seed)
		#ifdef UNIT_TEST
		random_seed = 29051994 // How about 22475?
		#else
		random_seed = rand(1, 1e9)
		#endif
		rand_seed(random_seed)

	var/list/_subsystems = list()
	subsystems = _subsystems
	if (Master != src)
		if (istype(Master))
			Recover()
			qdel(Master)
		else
			var/list/subsytem_types = subtypesof(/datum/controller/subsystem)
			sortTim(subsytem_types, GLOBAL_PROC_REF(cmp_subsystem_init))
			for(var/I in subsytem_types)
				_subsystems += new I
		Master = src

	if(!GLOB)
		new /datum/controller/global_vars

/datum/controller/master/Destroy()
	..()
	// Tell qdel() to Del() this object.
	return QDEL_HINT_HARDDEL_NOW

/datum/controller/master/Shutdown()
	processing = FALSE
	sortTim(subsystems, GLOBAL_PROC_REF(cmp_subsystem_init))
	reverseRange(subsystems)
	for(var/datum/controller/subsystem/ss in subsystems)
		log_world("Shutting down [ss.name] subsystem...")
		if (ss.slept_count > 0)
			log_world("Warning: Subsystem `[ss.name]` slept [ss.slept_count] times.")
		ss.Shutdown()
	log_world("Shutdown complete")

// Returns 1 if we created a new mc, 0 if we couldn't due to a recent restart,
//	-1 if we encountered a runtime trying to recreate it
/proc/Recreate_MC()
	. = -1 //so if we runtime, things know we failed
	if (world.time < Master.restart_timeout)
		return 0
	if (world.time < Master.restart_clear)
		Master.restart_count *= 0.5

	var/delay = 50 * ++Master.restart_count
	Master.restart_timeout = world.time + delay
	Master.restart_clear = world.time + (delay * 2)
	Master.processing = FALSE //stop ticking this one
	try
		new/datum/controller/master()
	catch
		return -1
	return 1


/datum/controller/master/Recover()
	var/msg = "## DEBUG: [time2text(world.timeofday)] MC restarted. Reports:\n"
	for (var/varname in Master.vars)
		switch (varname)
			if("name", "tag", "bestF", "type", "parent_type", "vars", "statclick") // Built-in junk.
				continue
			else
				var/varval = Master.vars[varname]
				if (istype(varval, /datum)) // Check if it has a type var.
					var/datum/D = varval
					msg += "\t [varname] = [D]([D.type])\n"
				else
					msg += "\t [varname] = [varval]\n"
	log_world(msg)

	var/datum/controller/subsystem/BadBoy = Master.last_type_processed
	var/FireHim = FALSE
	if(istype(BadBoy))
		msg = null
		LAZYINITLIST(BadBoy.failure_strikes)
		switch(++BadBoy.failure_strikes[BadBoy.type])
			if(2)
				msg = "MC Notice: The [BadBoy.name] subsystem was the last to fire for 2 controller restarts. It will be recovered now and disabled if it happens again."
				FireHim = TRUE
				BadBoy.fail()
			if(3)
				msg = "MC Notice: The [BadBoy.name] subsystem seems to be destabilizing the MC and will be offlined."
				BadBoy.flags |= SS_NO_FIRE
				BadBoy.critfail()
		if(msg)
			log_game(msg)
			message_admins(span_boldannounce("[msg]"))
			log_world(msg)

	if (istype(Master.subsystems))
		if(FireHim)
			Master.subsystems += new BadBoy.type	//NEW_SS_GLOBAL will remove the old one

		subsystems = Master.subsystems
		current_runlevel = Master.current_runlevel
		StartProcessing(10)
	else
		to_world(span_boldannounce("The Master Controller is having some issues, we will need to re-initialize EVERYTHING"))
		Initialize(20, TRUE)


// Please don't stuff random bullshit here,
// 	Make a subsystem, give it the SS_NO_FIRE flag, and do your work in it's Initialize()
/datum/controller/master/Initialize(delay, init_sss, tgs_prime)
	set waitfor = 0

	if(delay)
		sleep(delay)

	if(tgs_prime)
		world.TgsInitializationComplete()

	if(init_sss)
		init_subtypes(/datum/controller/subsystem, subsystems)

	to_chat(world, span_boldannounce("MC: Initializing subsystems..."))

	// Sort subsystems by init_order, so they initialize in the correct order.
	sortTim(subsystems, GLOBAL_PROC_REF(cmp_subsystem_init))

	var/start_timeofday = REALTIMEOFDAY
	// Initialize subsystems.
	current_ticklimit = CONFIG_GET(number/tick_limit_mc_init)
	for (var/datum/controller/subsystem/SS in subsystems)
		if (SS.flags & SS_NO_INIT)
			continue
		init_subsystem(SS)
		CHECK_TICK
	current_initializing_subsystem = null
	current_ticklimit = TICK_LIMIT_RUNNING
	var/time = (REALTIMEOFDAY - start_timeofday) / 10

	var/msg = "MC: Initializations complete within [time] second[time == 1 ? "" : "s"]!"
	to_chat(world, span_boldannounce("[msg]"))
	log_world(msg)


	// FIXME: TGS <-> Discord communication; sending message to a TGS chat channel
	send2chat("Server Initialization completed! - Took [time] second[time == 1 ? "" : "s"].", "bot announce") // CHOMPEnable

	if (!current_runlevel)
		SetRunLevel(RUNLEVEL_LOBBY)

	// GLOB.revdata = new // It can load revdata now, from tgs or .git or whatever

	// Sort subsystems by display setting for easy access.
	sortTim(subsystems, GLOBAL_PROC_REF(cmp_subsystem_display))
	// Set world options.
	#ifdef UNIT_TEST
	world.sleep_offline = 0
	#else
	world.sleep_offline = 1
	#endif
	world.change_fps(CONFIG_GET(number/fps))
	var/initialized_tod = REALTIMEOFDAY
	sleep(1)
	initializations_finished_with_no_players_logged_in = initialized_tod < REALTIMEOFDAY - 10
	// Loop.
	Master.StartProcessing(0)

/**
 * Initialize a given subsystem and handle the results.
 *
 * Arguments:
 * * subsystem - the subsystem to initialize.
 */
/datum/controller/master/proc/init_subsystem(datum/controller/subsystem/subsystem)
	var/static/list/valid_results = list(
		SS_INIT_FAILURE,
		SS_INIT_NONE,
		SS_INIT_SUCCESS,
		SS_INIT_NO_NEED,
	)

	if (subsystem.subsystem_initialized) //Don't init if they already are initialized
		return

	if (subsystem.flags & SS_NO_INIT)
		subsystem.subsystem_initialized = TRUE
		return

	current_initializing_subsystem = subsystem
	rustg_time_reset(SS_INIT_TIMER_KEY)

	var/result = subsystem.Initialize()

	// Capture end time
	var/time = rustg_time_milliseconds(SS_INIT_TIMER_KEY)
	var/seconds = round(time / 1000, 0.01)

	// Always update the blackbox tally regardless.
	// SSblackbox.record_feedback("tally", "subsystem_initialize", time, subsystem.name)
	feedback_set_details("subsystem_initialize", "[time] [subsystem.name]")

	// Gave invalid return value.
	if(result && !(result in valid_results))
		warning("[subsystem.name] subsystem initialized, returning invalid result [result]. This is a bug.")

	// just returned ..() or didn't implement Initialize() at all
	if(result == SS_INIT_NONE)
		warning("[subsystem.name] subsystem does not implement Initialize() or it returns ..(). If the former is true, the SS_NO_INIT flag should be set for this subsystem.")

	if(result != SS_INIT_FAILURE)
		// Some form of success, implicit failure, or the SS in unused.
		subsystem.subsystem_initialized = TRUE

		SEND_SIGNAL(subsystem, COMSIG_SUBSYSTEM_POST_INITIALIZE)
	else
		// The subsystem officially reports that it failed to init and wishes to be treated as such.
		subsystem.subsystem_initialized = FALSE
		subsystem.can_fire = FALSE

	// The rest of this proc is printing the world log and chat message.
	var/message_prefix

	// If true, print the chat message with boldwarning text.
	var/chat_warning = FALSE

	switch(result)
		if(SS_INIT_FAILURE)
			message_prefix = "Failed to initialize [subsystem.name] subsystem after"
			chat_warning = TRUE
		if(SS_INIT_SUCCESS)
			message_prefix = "Initialized [subsystem.name] subsystem within"
		if(SS_INIT_NO_NEED)
			// This SS is disabled or is otherwise shy.
			return
		else
			// SS_INIT_NONE or an invalid value.
			message_prefix = "Initialized [subsystem.name] subsystem with errors within"
			chat_warning = TRUE

	var/message = "[message_prefix] [seconds] second[seconds == 1 ? "" : "s"]!"
	var/chat_message = chat_warning ? span_boldwarning(message) : span_boldannounce(message)

	to_chat(world, chat_message)
	log_world(message)

/datum/controller/master/proc/SetRunLevel(new_runlevel)
	var/old_runlevel = isnull(current_runlevel) ? "NULL" : GLOB.runlevel_flags[current_runlevel]
	testing("MC: Runlevel changed from [old_runlevel] to [new_runlevel]")
	current_runlevel = RUNLEVEL_FLAG_TO_INDEX(new_runlevel)
	if(current_runlevel < 1)
		CRASH("Attempted to set invalid runlevel: [new_runlevel]")

// Starts the mc, and sticks around to restart it if the loop ever ends.
/datum/controller/master/proc/StartProcessing(delay)
	set waitfor = 0
	if(delay)
		sleep(delay)
	var/rtn = Loop()
	if (rtn > 0 || processing < 0)
		return //this was suppose to happen.
	//loop ended, restart the mc
	log_and_message_admins("MC Notice: MC crashed or runtimed, self-restarting (\ref[src])")
	var/rtn2 = Recreate_MC()
	switch(rtn2)
		if(-1)
			log_and_message_admins("MC Warning: Failed to self-recreate MC (Return code: [rtn2]), it's up to the failsafe now (\ref[src])")
			Failsafe.defcon = 2
		if(0)
			log_and_message_admins("MC Warning: Too soon for MC self-restart (Return code: [rtn2]), going to let failsafe handle it (\ref[src])")
			Failsafe.defcon = 2
		if(1)
			log_and_message_admins("MC Notice: MC self-recreated, old MC departing (Return code: [rtn2]) (\ref[src])")

// Main loop.
/datum/controller/master/proc/Loop()
	. = -1
	//Prep the loop (most of this is because we want MC restarts to reset as much state as we can, and because
	//	local vars rock

	//all this shit is here so that flag edits can be refreshed by restarting the MC. (and for speed)
	var/list/tickersubsystems = list()
	var/list/runlevel_sorted_subsystems = list(list())	//ensure we always have at least one runlevel
	var/timer = world.time
	for (var/datum/controller/subsystem/SS as anything in subsystems)
		if (SS.flags & SS_NO_FIRE)
			continue
		SS.queued_time = 0
		SS.queue_next = null
		SS.queue_prev = null
		SS.state = SS_IDLE
		if (SS.flags & SS_TICKER)
			tickersubsystems += SS
			timer += world.tick_lag * rand(0,1)
			SS.next_fire = timer
			continue

		var/ss_runlevels = SS.runlevels
		var/added_to_any = FALSE
		for(var/I in 1 to GLOB.runlevel_flags.len)
			if(ss_runlevels & GLOB.runlevel_flags[I])
				while(runlevel_sorted_subsystems.len < I)
					runlevel_sorted_subsystems += list(list())
				runlevel_sorted_subsystems[I] += SS
				added_to_any = TRUE
		if(!added_to_any)
			WARNING("[SS.name] subsystem is not SS_NO_FIRE but also does not have any runlevels set!")

	queue_head = null
	queue_tail = null
	//these sort by lower priorities first to reduce the number of loops needed to add subsequent SS's to the queue
	//(higher subsystems will be sooner in the queue, adding them later in the loop means we don't have to loop thru them next queue add)
	sortTim(tickersubsystems, GLOBAL_PROC_REF(cmp_subsystem_priority))
	for(var/I in runlevel_sorted_subsystems)
		sortTim(I, GLOBAL_PROC_REF(cmp_subsystem_priority))
		I += tickersubsystems

	var/cached_runlevel = current_runlevel
	var/list/current_runlevel_subsystems = runlevel_sorted_subsystems[cached_runlevel]

	init_timeofday = REALTIMEOFDAY
	init_time = world.time

	iteration = 1
	var/error_level = 0
	var/sleep_delta = 1
	var/list/subsystems_to_check

	//setup the stack overflow detector
	stack_end_detector = new()
	var/datum/stack_canary/canary = stack_end_detector.prime_canary()
	canary.use_variable()
	//the actual loop.
	while (1)
		tickdrift = max(0, MC_AVERAGE_FAST(tickdrift, (((REALTIMEOFDAY - init_timeofday) - (world.time - init_time)) / world.tick_lag)))
		var/starting_tick_usage = TICK_USAGE
		if (processing <= 0)
			current_ticklimit = TICK_LIMIT_RUNNING
			sleep(10)
			continue

		//Anti-tick-contention heuristics:
		//if there are mutiple sleeping procs running before us hogging the cpu, we have to run later.
		//	(because sleeps are processed in the order received, longer sleeps are more likely to run first)
		if (starting_tick_usage > TICK_LIMIT_MC) //if there isn't enough time to bother doing anything this tick, sleep a bit.
			sleep_delta *= 2
			current_ticklimit = TICK_LIMIT_RUNNING * 0.5
			sleep(world.tick_lag * (processing * sleep_delta))
			continue

		//Byond resumed us late. assume it might have to do the same next tick
		if (last_run + CEILING(world.tick_lag * (processing * sleep_delta), world.tick_lag) < world.time)
			sleep_delta += 1

		sleep_delta = MC_AVERAGE_FAST(sleep_delta, 1) //decay sleep_delta

		if (starting_tick_usage > (TICK_LIMIT_MC*0.75)) //we ran 3/4 of the way into the tick
			sleep_delta += 1

		//debug
		if (make_runtime)
			var/datum/controller/subsystem/SS
			SS.can_fire = 0

		if (!Failsafe || (Failsafe.processing_interval > 0 && (Failsafe.lasttick+(Failsafe.processing_interval*5)) < world.time))
			new/datum/controller/failsafe() // (re)Start the failsafe.

		//now do the actual stuff
		if (!queue_head || !(iteration % 3))
			var/checking_runlevel = current_runlevel
			if(cached_runlevel != checking_runlevel)
				//resechedule subsystems
				var/list/old_subsystems = current_runlevel_subsystems
				cached_runlevel = checking_runlevel
				current_runlevel_subsystems = runlevel_sorted_subsystems[cached_runlevel]

				//now we'll go through all the subsystems we want to offset and give them a next_fire
				for(var/datum/controller/subsystem/SS as anything in current_runlevel_subsystems)
					//we only want to offset it if it's new and also behind
					if(SS.next_fire > world.time || (SS in old_subsystems))
						continue
					SS.next_fire = world.time + world.tick_lag * rand(0, DS2TICKS(min(SS.wait, 2 SECONDS)))

			subsystems_to_check = current_runlevel_subsystems
		else
			subsystems_to_check = tickersubsystems

		if (CheckQueue(subsystems_to_check) <= 0)
			log_world("MC: CheckQueue(subsystems_to_check) exited uncleanly, SoftReset (error_level=[error_level]")
			if (!SoftReset(tickersubsystems, runlevel_sorted_subsystems))
				log_world("MC: SoftReset() failed, crashing")
				return
			if (!error_level)
				iteration++
			error_level++
			current_ticklimit = TICK_LIMIT_RUNNING
			sleep(10)
			continue

		if (queue_head)
			if (RunQueue() <= 0)
				log_world("MC: RunQueue() exited uncleanly, running SoftReset (error_level=[error_level]")
				if (!SoftReset(tickersubsystems, runlevel_sorted_subsystems))
					log_world("MC: SoftReset() failed, crashing")
					return
				if (!error_level)
					iteration++
				error_level++
				current_ticklimit = TICK_LIMIT_RUNNING
				sleep(10)
				continue
		error_level--
		if (!queue_head) //reset the counts if the queue is empty, in the off chance they get out of sync
			queue_priority_count = 0
			queue_priority_count_bg = 0

		iteration++
		last_run = world.time
		src.sleep_delta = MC_AVERAGE_FAST(src.sleep_delta, sleep_delta)
		current_ticklimit = TICK_LIMIT_RUNNING
		if (processing * sleep_delta <= world.tick_lag)
			current_ticklimit -= (TICK_LIMIT_RUNNING * 0.25) //reserve the tail 1/4 of the next tick for the mc if we plan on running next tick
		sleep(world.tick_lag * (processing * sleep_delta))




// This is what decides if something should run.
/datum/controller/master/proc/CheckQueue(list/subsystemstocheck)
	. = 0 //so the mc knows if we runtimed

	//we create our variables outside of the loops to save on overhead
	var/datum/controller/subsystem/SS
	var/SS_flags

	for (var/thing in subsystemstocheck)
		if (!thing)
			subsystemstocheck -= thing
		SS = thing
		if (SS.state != SS_IDLE)
			continue
		if (SS.can_fire <= 0)
			continue
		if (SS.next_fire > world.time)
			continue
		SS_flags = SS.flags
		if (SS_flags & SS_NO_FIRE)
			subsystemstocheck -= SS
			continue
		if ((SS_flags & (SS_TICKER|SS_KEEP_TIMING)) == SS_KEEP_TIMING && SS.last_fire + (SS.wait * 0.75) > world.time)
			continue
		SS.enqueue()
	. = 1


// Run thru the queue of subsystems to run, running them while balancing out their allocated tick precentage
/datum/controller/master/proc/RunQueue()
	. = 0
	var/datum/controller/subsystem/queue_node
	var/queue_node_flags
	var/queue_node_priority
	var/queue_node_paused

	var/current_tick_budget
	var/tick_precentage
	var/tick_remaining
	var/ran = TRUE //this is right
	var/ran_non_ticker = FALSE
	var/bg_calc //have we swtiched current_tick_budget to background mode yet?
	var/tick_usage

	//keep running while we have stuff to run and we haven't gone over a tick
	//	this is so subsystems paused eariler can use tick time that later subsystems never used
	while (ran && queue_head && TICK_USAGE < TICK_LIMIT_MC)
		ran = FALSE
		bg_calc = FALSE
		current_tick_budget = queue_priority_count
		queue_node = queue_head
		while (queue_node)
			if (ran && TICK_USAGE > TICK_LIMIT_RUNNING)
				break

			queue_node_flags = queue_node.flags
			queue_node_priority = queue_node.queued_priority

			//super special case, subsystems where we can't make them pause mid way through
			//if we can't run them this tick (without going over a tick)
			//we bump up their priority and attempt to run them next tick
			//(unless we haven't even ran anything this tick, since its unlikely they will ever be able run
			//	in those cases, so we just let them run)
			if (queue_node_flags & SS_NO_TICK_CHECK)
				if (queue_node.tick_usage > TICK_LIMIT_RUNNING - TICK_USAGE && ran_non_ticker)
					queue_node.queued_priority += queue_priority_count * 0.1
					queue_priority_count -= queue_node_priority
					queue_priority_count += queue_node.queued_priority
					current_tick_budget -= queue_node_priority
					queue_node = queue_node.queue_next
					continue

			if ((queue_node_flags & SS_BACKGROUND) && !bg_calc)
				current_tick_budget = queue_priority_count_bg
				bg_calc = TRUE

			tick_remaining = TICK_LIMIT_RUNNING - TICK_USAGE

			if (current_tick_budget > 0 && queue_node_priority > 0)
				tick_precentage = tick_remaining / (current_tick_budget / queue_node_priority)
			else
				tick_precentage = tick_remaining

			// Reduce tick allocation for subsystems that overran on their last tick.
			tick_precentage = max(tick_precentage*0.5, tick_precentage-queue_node.tick_overrun)

			current_ticklimit = round(TICK_USAGE + tick_precentage)

			if (!(queue_node_flags & SS_TICKER))
				ran_non_ticker = TRUE
			ran = TRUE

			queue_node_paused = (queue_node.state == SS_PAUSED || queue_node.state == SS_PAUSING)
			last_type_processed = queue_node

			queue_node.state = SS_RUNNING

			tick_usage = TICK_USAGE
			var/state = queue_node.ignite(queue_node_paused)
			tick_usage = TICK_USAGE - tick_usage

			if (state == SS_RUNNING)
				state = SS_IDLE
			current_tick_budget -= queue_node_priority


			if (tick_usage < 0)
				tick_usage = 0
			queue_node.tick_overrun = max(0, MC_AVG_FAST_UP_SLOW_DOWN(queue_node.tick_overrun, tick_usage-tick_precentage))
			queue_node.state = state

			if (state == SS_PAUSED)
				queue_node.paused_ticks++
				queue_node.paused_tick_usage += tick_usage
				queue_node = queue_node.queue_next
				continue

			queue_node.ticks = MC_AVERAGE(queue_node.ticks, queue_node.paused_ticks)
			tick_usage += queue_node.paused_tick_usage

			queue_node.tick_usage = MC_AVERAGE_FAST(queue_node.tick_usage, tick_usage)

			queue_node.cost = MC_AVERAGE_FAST(queue_node.cost, TICK_DELTA_TO_MS(tick_usage))
			queue_node.paused_ticks = 0
			queue_node.paused_tick_usage = 0

			if (queue_node_flags & SS_BACKGROUND) //update our running total
				queue_priority_count_bg -= queue_node_priority
			else
				queue_priority_count -= queue_node_priority

			queue_node.last_fire = world.time
			queue_node.times_fired++

			if (queue_node_flags & SS_TICKER)
				queue_node.next_fire = world.time + (world.tick_lag * queue_node.wait)
			else if (queue_node_flags & SS_POST_FIRE_TIMING)
				queue_node.next_fire = world.time + queue_node.wait + (world.tick_lag * (queue_node.tick_overrun/100))
			else if (queue_node_flags & SS_KEEP_TIMING)
				queue_node.next_fire += queue_node.wait
			else
				queue_node.next_fire = queue_node.queued_time + queue_node.wait + (world.tick_lag * (queue_node.tick_overrun/100))

			queue_node.queued_time = 0

			//remove from queue
			queue_node.dequeue()

			queue_node = queue_node.queue_next

	. = 1

//resets the queue, and all subsystems, while filtering out the subsystem lists
//	called if any mc's queue procs runtime or exit improperly.
/datum/controller/master/proc/SoftReset(list/ticker_SS, list/runlevel_SS)
	. = 0
	log_world("MC: SoftReset called, resetting MC queue state.")
	if (!istype(subsystems) || !istype(ticker_SS) || !istype(runlevel_SS))
		log_world("MC: SoftReset: Bad list contents: '[subsystems]' '[ticker_SS]' '[runlevel_SS]'")
		return
	var/subsystemstocheck = subsystems + ticker_SS
	for(var/I in runlevel_SS)
		subsystemstocheck |= I

	for (var/datum/controller/subsystem/SS as anything in subsystemstocheck)
		if (!SS || !istype(SS))
			//list(SS) is so if a list makes it in the subsystem list, we remove the list, not the contents
			subsystems -= list(SS)
			ticker_SS -= list(SS)
			for(var/I in runlevel_SS)
				I -= list(SS)
			log_world("MC: SoftReset: Found bad entry in subsystem list, '[SS]'")
			continue
		if (SS.queue_next && !istype(SS.queue_next))
			log_world("MC: SoftReset: Found bad data in subsystem queue, queue_next = '[SS.queue_next]'")
		SS.queue_next = null
		if (SS.queue_prev && !istype(SS.queue_prev))
			log_world("MC: SoftReset: Found bad data in subsystem queue, queue_prev = '[SS.queue_prev]'")
		SS.queue_prev = null
		SS.queued_priority = 0
		SS.queued_time = 0
		SS.state = SS_IDLE
	if (queue_head && !istype(queue_head))
		log_world("MC: SoftReset: Found bad data in subsystem queue, queue_head = '[queue_head]'")
	queue_head = null
	if (queue_tail && !istype(queue_tail))
		log_world("MC: SoftReset: Found bad data in subsystem queue, queue_tail = '[queue_tail]'")
	queue_tail = null
	queue_priority_count = 0
	queue_priority_count_bg = 0
	log_world("MC: SoftReset: Finished.")
	. = 1



/datum/controller/master/stat_entry(msg)
	if(!statclick)
		statclick = new/obj/effect/statclick/debug(null, "Initializing...", src)

	msg = "Byond: (FPS:[world.fps]) (TickCount:[world.time/world.tick_lag]) (TickDrift:[round(Master.tickdrift,1)]([round((Master.tickdrift/(world.time/world.tick_lag))*100,0.1)]%))"
	msg += "Master Controller: [statclick.update("(TickRate:[Master.processing]) (Iteration:[Master.iteration])")]"

	return msg

/datum/controller/master/StartLoadingMap(var/quiet = TRUE)
	if(map_loading)
		admin_notice(span_danger("Another map is attempting to be loaded before first map released lock.  Delaying."), R_DEBUG)
	else if(!quiet)
		admin_notice(span_danger("Map is now being built.  Locking."), R_DEBUG)

	//disallow more than one map to load at once, multithreading it will just cause race conditions
	while(map_loading)
		stoplag()
	for(var/datum/controller/subsystem/SS as anything in subsystems)
		SS.StartLoadingMap()

	map_loading = TRUE

/datum/controller/master/StopLoadingMap(var/quiet = TRUE)
	if(!quiet)
		admin_notice(span_danger("Map is finished.  Unlocking."), R_DEBUG)
	map_loading = FALSE
	for(var/datum/controller/subsystem/SS as anything in subsystems)
		SS.StopLoadingMap()

/datum/controller/master/proc/OnConfigLoad()
	for (var/thing in subsystems)
		var/datum/controller/subsystem/SS = thing
		SS.OnConfigLoad()
