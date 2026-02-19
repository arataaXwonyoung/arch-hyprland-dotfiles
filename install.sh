#!/bin/bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

echo "Installing dotfiles..."
mkdir -p "$CONFIG_DIR"

backup_and_link() {
  local name="$1"
  local src="$REPO_DIR/$name"
  local dest="$CONFIG_DIR/$name"

  # backup kalau sudah ada dan bukan symlink
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Backup: $dest -> $BACKUP_DIR/"
    mv "$dest" "$BACKUP_DIR/"
  fi

  echo "Link: $src -> $dest"
  ln -sfn "$src" "$dest"
}

backup_and_link hypr
backup_and_link kitty
backup_and_link fish
backup_and_link foot
backup_and_link fuzzel
backup_and_link matugen
backup_and_link Kvantum
backup_and_link wlogout

# starship.toml (file)
STAR_DEST="$CONFIG_DIR/starship.toml"
if [ -e "$STAR_DEST" ] && [ ! -L "$STAR_DEST" ]; then
  mkdir -p "$BACKUP_DIR"
  echo "Backup: $STAR_DEST -> $BACKUP_DIR/"
  mv "$STAR_DEST" "$BACKUP_DIR/"
fi
echo "Link: $REPO_DIR/starship.toml -> $STAR_DEST"
ln -sfn "$REPO_DIR/starship.toml" "$STAR_DEST"

echo "Done."
if [ -d "$BACKUP_DIR" ]; then
  echo "Backup saved at: $BACKUP_DIR"
fi
