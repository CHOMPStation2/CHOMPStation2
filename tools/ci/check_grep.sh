#!/bin/bash
set -euo pipefail

#nb: must be bash to support shopt globstar
shopt -s globstar extglob

#ANSI Escape Codes for colors to increase contrast of errors
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
NC="\033[0m" # No Color

st=0

# check for ripgrep
if command -v rg >/dev/null 2>&1; then
	grep=rg
	pcre2_support=1
	if [ ! rg -P '' >/dev/null 2>&1 ] ; then
		pcre2_support=0
	fi
	code_files="code/**/**.dm"
	map_files="maps/**/**.dmm"
	code_x_515="code/**/!(__byond_version_compat).dm"
else
	pcre2_support=0
	grep=grep
	code_files="-r --include=code/**/**.dm"
	map_files="-r --include=maps/**/**.dmm"
	code_x_515="-r --include=code/**/!(__byond_version_compat).dm"
fi

echo -e "${BLUE}Using grep provider at $(which $grep)${NC}"

part=0
section() {
	echo -e "${BLUE}Checking for $1${NC}..."
	part=0
}

part() {
	part=$((part+1))
	padded=$(printf "%02d" $part)
	echo -e "${GREEN} $padded- $1${NC}"
}

section "map issues"

part "iconstate tags"
if $grep '^\ttag = "icon' $map_files;	then
	echo
    echo -e "${RED}ERROR: Tag vars from icon state generation detected in maps, please remove them.${NC}"
    st=1
fi;
part "invalid map procs"
if $grep '(new|newlist|icon|matrix|sound)\(.+\)' $map_files;	then
	echo
	echo -e "${RED}ERROR: Using unsupported procs in variables in a map file! Please remove all instances of this.${NC}"
	st=1
fi;
part "common spelling mistakes"
if $grep -i 'nanotransen' $map_files; then
	echo
    echo -e "${RED}ERROR: Misspelling(s) of Nanotrasen detected in maps, please remove the extra N(s).${NC}"
    st=1
fi;
if $grep -i'centcomm' $map_files; then
	echo
    echo -e "${RED}ERROR: Misspelling(s) of CentCom detected in maps, please remove the extra M(s).${NC}"
    st=1
fi;

#section "whitespace issues"
#part "space indentation"
#if $grep '(^ {2})|(^ [^ * ])|(^    +)' $code_files; then
#	echo
#    echo -e "${RED}ERROR: Space indentation detected, please use tab indentation.${NC}"
#    st=1
#fi;
#part "mixed indentation"
#if $grep '^\t+ [^ *]' $code_files; then
#	echo
#    echo -e "${RED}ERROR: Mixed <tab><space> indentation detected, please stick to tab indentation.${NC}"
#    st=1
#fi;

section "common mistakes"
part "src as a trait source" # ideally we'd lint / test for ANY datum reference as a trait source, but 'src' is the most common.
if $grep -i '(add_trait|remove_trait)\(.+,\s*.+,\s*src\)' $code_files; then
	echo
	echo -e "${RED}ERROR: Using 'src' as a trait source. Source must be a string key - dont't use references to datums as a source, perhaps use 'REF(src)'.${NC}"
	st=1
fi;
if $grep -i '(add_traits|remove_traits)\(.+,\s*src\)' $code_files; then
	echo
	echo -e "${RED}ERROR: Using 'src' as trait sources. Source must be a string key - dont't use references to datums as sources, perhaps use 'REF(src)'.${NC}"
	st=1
fi;

part "common spelling mistakes"
if $grep -i 'centcomm' $code_files; then
	echo
    echo -e "${RED}ERROR: Misspelling(s) of CentCom detected in code, please remove the extra M(s).${NC}"
    st=1
fi;
if $grep -ni 'nanotransen' $code_files; then
	echo
    echo -e "${RED}ERROR: Misspelling(s) of Nanotrasen detected in code, please remove the extra N(s).${NC}"
    st=1
fi;
#part "map json naming"
#if ls maps/*.json | $grep "[A-Z]"; then
#	echo
#    echo -e "${RED}ERROR: Uppercase in a map .JSON file detected, these must be all lowercase.${NC}"
#    st=1
#fi;
#part "map json sanity"
#for json in maps/*.json
#do
#    map_path=$(jq -r '.map_path' $json)
#    while read map_file; do
#        filename="maps/$map_path/$map_file"
#        if [ ! -f $filename ]
#        then
#			echo
#            echo -e "${RED}ERROR: Found an invalid file reference to $filename in maps/$json ${NC}"
#            st=1
#        fi
#    done < <(jq -r '[.map_file] | flatten | .[]' $json)
#done

section "515 Proc Syntax"
part "proc ref syntax"
if $grep '\.proc/' $code_x_515 ; then
    echo
    echo -e "${RED}ERROR: Outdated proc reference use detected in code, please use proc reference helpers.${NC}"
    st=1
fi;

if [ $st = 0 ]; then
    echo
    echo -e "${GREEN}No errors found using $grep!${NC}"
fi;

if [ $st = 1 ]; then
    echo
    echo -e "${RED}Errors found, please fix them and try again.${NC}"
fi;

exit $st
