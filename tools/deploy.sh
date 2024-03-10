#!/bin/bash

#Run this in the repo root after compiling
#First arg is path to where you want to deploy
#creates a work tree free of everything except what's necessary to run the game

#second arg is working directory if necessary
if [[ $# -eq 2 ]] ; then
  cd $2
fi

#mkdir -p \
#    $1/maps \
#    $1/icons/effects \
#    $1/icons/mob/clothing \
#    $1/icons/mob/inhands \
#    $1/icons/mob/simple \
#    $1/icons/obj \
#    $1/icons/runtime \
#    $1/sound/runtime \
#    $1/modular_chomp/strings \
#    $1/tgui/public \
#    $1/tgui/packages/tgfont/dist

mkdir -p \
		$1/config/names \
    $1/maps \
    $1/icons/effects \
		$1/icons/mob/vore \
		$1/icons/obj \
    $1/sound \
		$1/modular_chomp/strings \
		$1/modular_chomp/icons/effects \
		$1/modular_chomp/icons/mob/vore \
		$1/modular_chomp/icons/obj \
    $1/tgui/public \
    $1/tgui/packages/tgfont/dist

if [ -d ".git" ]; then
  mkdir -p $1/.git/logs
  cp -r .git/logs/* $1/.git/logs/
fi

cp vorestation.dmb vorestation.rsc $1/
cp -r config/example/* $1/config/
cp -r config/names/* $1/config/names/
cp -r maps/* $1/maps/
cp -r icons/effects/* $1/icons/effects/
#cp -r icons/mob/clothing/* $1/icons/mob/clothing/
#cp -r icons/mob/inhands/* $1/icons/mob/inhands/
#cp -r icons/mob/simple/* $1/icons/mob/simple/
cp -r icons/obj/* $1/icons/obj/
#cp -r icons/runtime/* $1/icons/runtime/
#cp -r sound/runtime/* $1/sound/runtime/
cp -r modular_chomp/icons/effects/* $1/modular_chomp/icons/effects/
cp -r modular_chomp/icons/mob/vore* $1/modular_chomp/icons/mob/vore/
cp -r modular_chomp/icons/obj/* $1/modular_chomp/icons/obj/
cp -r modular_chomp/strings/* $1/modular_chomp/strings/
cp -r icons/* $1/icons/
cp -r sound/* $1/sound/
cp -r tgui/public/* $1/tgui/public/
cp -r tgui/packages/tgfont/dist/* $1/tgui/packages/tgfont/dist/

#remove .dm files from maps

#this regrettably doesn't work with windows find
#find $1/maps -name "*.dm" -type f -delete

#dlls on windows
if [ "$(uname -o)" = "Msys" ]; then
	cp ./*.dll $1/
fi
