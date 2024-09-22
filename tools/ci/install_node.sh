#!/bin/bash
set -euo pipefail

<<<<<<< HEAD
source _build_dependencies.sh

if [[ -e ~/.nvm/nvm.sh ]]; then
	source ~/.nvm/nvm.sh
	nvm install $NODE_VERSION
	nvm use $NODE_VERSION
=======
source dependencies.sh

if [[ -e ~/.nvm/nvm.sh ]]; then
	source ~/.nvm/nvm.sh
	nvm install $NODE_VERSION_COMPAT
	nvm use $NODE_VERSION_COMPAT
>>>>>>> c721de923f... Merge pull request #16325 from ShadowLarkens/cbt
fi
