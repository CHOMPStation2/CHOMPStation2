#!/bin/bash
set -euo pipefail

MAP=$1

echo Testing $MAP

tools/deploy.sh ci_test
#mkdir ci_test/config currently created in deploy
mkdir ci_test/data

#test config
#cp tools/ci/ci_config.txt ci_test/config/config.txt not compatible at the moment

#set the map
cp maps/$MAP.json ci_test/data/next_map.json

cd ci_test

DreamDaemon vorestation.dmb -close -trusted -invisible -verbose -params "log-directory=ci"

cd ..

#mkdir -p data/screenshots_new
#cp -r ci_test/data/screenshots_new data/screenshots_new

cat ci_test/data/logs/ci/clean_run.lk
