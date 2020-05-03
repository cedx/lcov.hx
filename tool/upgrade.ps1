#!/usr/bin/env pwsh
git reset --hard
git fetch --all --prune
git pull --rebase
composer update --no-interaction
haxelib update
npm install --ignore-scripts
npm update --dev
