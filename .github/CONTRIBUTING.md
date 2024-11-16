# Contributing to CHOMPStation

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following is a set of guidelines for contributing to Chomp Station, which is hosted in the [Chomp Station](https://github.com/CHOMPStation2/CHOMPStation2) on GitHub.
These are just guidelines, not rules, use your best judgment and feel free to propose changes to this document in a pull request.

#### Table Of Contents

[What should I know before I get started?](#what-should-i-know-before-i-get-started)
  * [Code of Conduct](#code-of-conduct)

[How Can I Contribute?](#how-can-i-contribute)
  * [Your First Code Contribution](#your-first-code-contribution)
  * [Chomp Station Map Edits](#chomp-station-map-edits)
  * [Chomp Station Coding Standards](#chomp-station-coding-standards)
  * [Pull Requests](#pull-requests)
  * [Git Commit Messages](#git-commit-messages)

[Licensing](#Licensing)


## What should I know before I get started?

### Code of Conduct

This project adheres to the Contributor Covenant [code of conduct](code_of_conduct.md).
By participating, you are expected to uphold this code.

## How Can I Contribute?

### Your First Code Contribution

Unsure where to begin contributing to Chomp Station? You can start by looking through the issues tab.

### Chomp Station Map Edits

* Our base map files are in [modular_chomp/maps/].
* Our stationary overmap location files are in [modular_chomp/maps/southern_cross/overmap/].
* Our random overmap POI files are in [modular_chomp/maps/overmap/].
* Our surface POI map files (Wilderness, plains, ...) are in [modular_chomp/maps/submaps/surface_submaps/].
* Map changes must be in tgm format. See the [Mapmerge2 Readme](../tools/mapmerge2/readme.md) for details, or use [StrongDMM](../tools/StrongDMM/README.md) which can automatically save maps as tgm.
* PoIs or map templates placed during generation (Mining, plains, wilderness, space...) are generally fair game for editing or creating anew.
* Maps that are placed permanently (Station, planetary locations) must be subject to discussion. To prevent wasted time, discuss these with the community and staff
    * There is a limited budget of RAM available for permanent maps. This must be carefully rationed. 
* Entire new station designs MUST be discussed with the community and the staff. Post a floor plan or basic design before committing effort in discord to prevent wasted time. 
* For new atmospherics settings, subtypes of turfs for all turfs can be created with the [turfpacks](../modular_chomp/maps/~turfpacks/turfpacks.dm) system quickly and easily.

## Chomp Station Coding Standards

### General
* **DO NOT** create joke or meme PRs. The Github is intended to be a sterile location for reviewing technical content.
* We **DO NOT** allow any kind of CKEY/personally locked content on this codebase. Anything created must be available to all or none.
    * Our upstream does allow this, and ckey-locked content from them does exist in our code. We try to comment it out where possible. Please report anything missing.
    * If you have ckey locked content from our upstream and would like to make it available to all here, please contact us.
* we **DO NOT** allow any 'naming' in our coded content. this includes shoutouts, naming a player as an owner or otherwise. All descriptions, names, lore-texts must be free of an individual's name. NPC naming is permitted.

### Codewriting
* Where possible, add changes to the modular_chomp/ subdirectory.
* For edits to upstream code (Code not inside /modular_chomp)
    * For single line edits, add "//ChompEDIT - description" at the end of the line.
    * For block edits, encapsulate your edit with "//ChompEDIT START - explanation" and "//ChompEDIT END".
    * For removals, comment out the upstream code and append "//ChompEDIT REMOVE - explanation"
    * For block removals, use "/\*" and "\*/" with "//ChompEDIT REMOVE - explanations"
* **DO NOT** edit upstream .dmi (icon) files. Add icon changes in a new file in the /modular_chomp folder and override the object's "icon" and "icon_state" variables. 
* **DO NOT** edit anything in the upstream /maps folder 
* Avoid the use of the 'usr' variable where possible. Use src or have the proc chain give the user's reference.
* Use defines where they exist, e.g. string names of jobs, factions, ect. 
* Where possible and applicable, send bugfixes to Virgo (Our upstream) to fix at the source. this is not enforced, however.

### Scene devices
* A scene device or tool is considered any object or coded mechanic designed primarily to service roleplay scenes in-game. Usually, but not limited to roleplay of a private nature.
* Scene devices **MUST** avoid giving a purely mechanical/gameplay advantage of any kind 
* Scene devices **MUST** respect OOC consent where applicable.
* Scene devices **MUST** react to the 'OOC Escape' command where possible. 

### TGUI
* **DO NOT** edit upstream TGUI files. Small changes should be passed to upstream. Large edits require the file to be copied/rewritten in the chompstation subdirectory.
* **ALL** TGUI files require typescript with properly defined types.


### Pull Requests

* Your submission must pass CI checking. The checks are important, prevent many common mistakes, and even experienced coders get caught by it sometimes. If you think there is a bug in CI, open an issue. (One known CI issue is comments in the middle of multi-line lists, just don't do it)
* You can create a WIP PR, and if so, please mark it with [WIP] in the title **and make it a draft pr** so it can be labeled appropriately. These can't sit forever, though.
* If your pull request has many no-conflict merge commits ('merge from master' into your PR branch), it cannot be merged. Squash and make a new PR/forcepush to your PR branch.
* PRs here are squash-merged into a single commit onto Master

### Git Commit Messages

* Limit the first line to 72 characters or less, otherwise it truncates the title with '...', wrapping the rest into the description.
* Reference issues and pull requests liberally.
* Use the GitHub magic words "Fixed/Fixes/Fix, Resolved/Resolves/Resolve, Closed/Closes/Close", as in, "Closes #1928", as this will automatically close that issue when the PR is merged if it is a fix for that issue.

### Early porting

* You may earlyport.
* Follow standard chompcomments incase upstream ends up closing their PR for any reason.
* If it does get merged upstream and the mirror appears on our repo, you are responsible for unfucking the comments situation, because it'll have to say VORE edits instead of CHOMP edits.

## Licensing
CHOMPStation is licensed under the GNU Affero General Public License version 3, which can be found in full in LICENSE-AGPL3.txt.

Commits with a git authorship date prior to `1420675200 +0000` (2015/01/08 00:00) are licensed under the GNU General Public License version 3, which can be found in full in LICENSE-GPL3.txt.

All commits whose authorship dates are not prior to `1420675200 +0000` are assumed to be licensed under AGPL v3, if you wish to license under GPL v3 please make this clear in the commit message and any added files.
