#!/bin/bash
set -euo pipefail

source _build_dependencies.sh

source ~/.nvm/nvm.sh
nvm use $NODE_VERSION
cd tgui
chmod +x bin/tgui
<<<<<<< HEAD
bin/tgui --ci
=======
bin/tgui --lint
bin/tgui --test
yarn tgui:prettier
>>>>>>> b69bb5923c... Merge pull request #13233 from ItsSelis/patch-3
cd ..
