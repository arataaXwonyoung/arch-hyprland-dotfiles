#!/bin/bash

CONFIG_DIR="$HOME/.config"

echo "Installing dotfiles..."

cp -r hypr "$CONFIG_DIR"
cp -r kitty "$CONFIG_DIR"
cp -r fish "$CONFIG_DIR"
cp -r foot "$CONFIG_DIR"
cp -r fuzzel "$CONFIG_DIR"
cp -r matugen "$CONFIG_DIR"
cp -r Kvantum "$CONFIG_DIR"
cp -r wlogout "$CONFIG_DIR"
cp starship.toml "$CONFIG_DIR"

echo "Done."
