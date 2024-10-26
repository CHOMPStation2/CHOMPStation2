# Contributing to CHOMPStation

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following is a set of guidelines for contributing to Chomp Station, which is hosted in the [Chomp Station](https://github.com/CHOMPStation2/CHOMPStation2) on GitHub.
These are just guidelines, not rules, use your best judgment and feel free to propose changes to this document in a pull request.

#### Table Of Contents

[What should I know before I get started?](#what-should-i-know-before-i-get-started)
  * [Code of Conduct](#code-of-conduct)

[How Can I Contribute?](#how-can-i-contribute)
  * [Your First Code Contribution](#your-first-code-contribution)
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

* Our base map files are in [map/southern_cross/].
* Our stationary overmap location files are in [maps/southern_cross/overmap/].
* Our random overmap POI files are in [modular_chomp/code/modules/overmap/].
* Our surface POI map files (Wilderness, plains, ...) are in [modular_chomp/maps/submaps/surface_submaps/].
* Map changes must be in tgm format. See the [Mapmerge2 Readme] for details, or use [StrongDMM] which can automatically save maps as tgm.

### Chomp Station Coding Standards

Any code submissions that do not meet our coding standards are likely to be rejected, or at the very least, have a maintainer request changes on your PR. Save time and follow these standards from the start:

In an effort to make contributing easier to do, Black Major has started a modularity folder, https://github.com/CHOMPStation2/CHOMPStation2/tree/master/modular_chomp.
Ideally, any content that can be written that is wholelly independant of vorestation's content, should be
included in this modularity folder, and put into the associated folder that it would have appeared in among the standard files.

Ideally, the point of this is to make it slightly easier to differentiate chomp specific content from virgo content.

When should you use this?
Mostly for chomp exclusive stuff, otherwise if you need to modify a base file for any reason or if it is expected to be a part of upstream as well, write it in the base files with the following standards/policies/guidelines in the meantime:

* If it is something like a bugfix that VoreStation or Polaris would want (the codebases we use), code it in their code and make the PR to them. We regularly update from them. They would want any general gameplay bugfixes, and things that are obviously intended to work one way, but do not. They do not have any of our fluff species (vulp, akula, fenn, etc) so do not make PRs related to that, or any vore content to them.
* Never edit stock Polaris or Vore .DMI files. If you are confused about which .DMI files we have added and which were there originally, refer to their repository and and see if they exist (https://github.com/PolarisSS13/Polaris) (https://github.com/VOREStation/VOREStation). All PRs with edits to stock .DMI files might be rejected.
* When changing any code in any stock Polaris .DM file, you must mark your changes:
    * For single-line changes: //CHOMPEdit - "Explanation" (Edit can also be Add for new lines or Removal if you are commenting the line out)
    * For multi-line additions: //CHOMPEdit - "Explanation" and then at the bottom of your changes, //CHOMPEdit End
    * For multi-line removals: Use a block comment (/\* xxx \*/) to comment out the existing code block (do not modify whitespace more than necessary) and at the start, it should contain /\* CHOMP Removal - "Reason"
* If it is something like a bugfix that Polaris or Vorestation would want (the codebase we use), you may want to consider coding it there as well. They may want any general gameplay bugfixes, and things that are obviously intended to work one way, but do not. They do not have any of our fluff species (vulp, akula, fenn, etc) so do not make PRs related to that, or any vore content to them.
* Change whitespace as little as possible. Do not randomly add/remove whitespace.
* Any new files should preferrably go into the modular_chomp folder following the file structure of where it would be placed normally. The old method was to have "_ch" at the end. For example, "life_ch.dm".
* Do not make changes to base icon files. New icon files should go into modular_chomp and code should be changed to point to the new file.

The `attempt_ch()` proc has been added for your convienence. It allows a many-line change to become a single-line change in the existing Polaris files, preserving mergeability and allowing better code separation while preventing your new code from causing runtimes that stop the original code from running. If you are wanting to inject new procedures into an existing proc, called `update_atoms()` for example, you would create `update_atoms_ch()` in a nearby `_ch.dm` file, and then call to it from a single line in the original `update_atoms()` with `attempt_ch()`.

The syntax for `attempt_ch()` is: `attempt_ch(atom,"proc_name",list(arg1,arg2))`, where:
* `atom` should be replaced with what your extended proc is defined on (if you are in something like /obj/machine/scanner/proc/update_things() and you are calling your newly defined /obj/machine/scanner/proc/update_things_ch() you can just put `src` here)
* `proc_name` is a STRING that should be the name of your proc, such as "update_atoms_ch"
* `list(arg1,arg2)` should contain any args you wish to pass to the proc

As an example of something you can do with `attempt_ch()` in a single line, the grab and vore code is done with this in a single line. When a grab is clicked on someone, there is a line similar to:
`if(attempt_ch(src,"handle_grabs_ch",list(src,attacker))) return`

Then in our `handle_grabs_ch()` proc, if we want to avoid performing the stock game actions and have handled the vore stuff ourselves, we return true, and the original proc returns since attempt_ch returns true.

### Pull Requests

* Your submission must pass CI checking. The checks are important, prevent many common mistakes, and even experienced coders get caught by it sometimes. If you think there is a bug in CI, open an issue. (One known CI issue is comments in the middle of multi-line lists, just don't do it)
* Your PR should not have an excessive number of commits unless it is a large project or includes many separate remote commits (such as a pull from Polaris). If you need to keep tweaking your PR to pass CI or to satisfy a maintainer's requests and are making many commits, you should squash them in the end and update your PR accordingly so these commits don't clog up the history.
* You can create a WIP PR, and if so, please mark it with [WIP] in the title **and make it a draft pr** so it can be labeled appropriately. These can't sit forever, though.
* If your pull request has many no-conflict merge commits ('merge from master' into your PR branch), it cannot be merged. Squash and make a new PR/forcepush to your PR branch.

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

[Mapmerge2 Readme]: ../tools/mapmerge2/mapmerge tool readme.md
[StrongDMM]: ../tools/StrongDMM/README.md
