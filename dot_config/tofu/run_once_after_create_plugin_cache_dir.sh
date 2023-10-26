#!/bin/bash

if [ -d "$HOME/.local/cache/tofu/plugin-cache" ]; then
    exit;
else
    mkdir -p "$HOME/.local/cache/tofu/plugin-cache"
fi