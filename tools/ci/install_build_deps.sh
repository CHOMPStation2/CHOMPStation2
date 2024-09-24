#!/bin/bash
set -euo pipefail

source dependencies.sh

source ~/.nvm/nvm.sh
nvm install $NODE_VERSION_LTS
nvm use $NODE_VERSION_LTS
npm install --location=global yarn

pip install --user PyYaml -q
pip install --user beautifulsoup4 -q
