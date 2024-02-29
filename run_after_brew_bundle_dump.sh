#!/bin/bash

set -e

HOMEBREWDUMP_FILEPATH="$HOME/tech/github.com/alewkinr/dotfiles/Brewfile"

if [ -f "$HOMEBREWDUMP_FILEPATH" ]; then
  rm "$HOMEBREWDUMP_FILEPATH"
fi;

brew bundle dump --file=$HOMEBREWDUMP_FILEPATH