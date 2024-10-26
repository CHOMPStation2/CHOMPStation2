#ifdef MAP_TEST
#include "bloodcit.dmm"
#include "unfinishedoutpost.dmm"
#include "eclipseprison.dmm"
#include "thehive.dmm"
#endif

/datum/map_template/surface/valley/end
	name = "Surface Content - Valley's End"
	desc = "The end of the line"

/datum/map_template/surface/valley/end/bloodcitadal
	name = "Blood Citadal"
	desc = "A base brimming with fire and cultists"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valleyend/bloodcit.dmm"
	cost = 200

/datum/map_template/surface/valley/end/unfinishedoutpost
	name = "Unfinished Outpost"
	desc = "An outpost yet to be finished, and doom to never be complete"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valleyend/unfinishedoutpost.dmm"
	cost = 200

/datum/map_template/surface/valley/end/eclipseprison
	name = "Eclipse Prison"
	desc = "An eclipse mining facility, with a strange and heavly guarded portal"
	mappath = "modular_chomp/maps/submaps/surface_submaps/valleyend/eclipseprison.dmm"
	cost = 200

/datum/map_template/surface/valley/end/thehive
	name = "The Hive"
	desc = "Oh more xenomoprhs, fun."
	mappath = "modular_chomp/maps/submaps/surface_submaps/valleyend/thehive.dmm"
	cost = 200
