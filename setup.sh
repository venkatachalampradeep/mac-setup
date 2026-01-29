#!/usr/bin/env bash
set -e

echo "== mac-setup bootstrap =="

# ---------- 1. Homebrew ----------
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Apple Silicon path
  if [[ -d /opt/homebrew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  echo "Homebrew already installed"
fi

# ---------- 2. Brew bundle ----------
if [[ -f Brewfile ]]; then
  echo "Installing brew packages..."
  brew bundle --file Brewfile
else
  echo "No Brewfile found"
fi

# ---------- 3. Dotfiles ----------
echo "Linking dotfiles..."

link_file () {
  src="$PWD/$1"
  dst="$HOME/.$1"

  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "Backing up existing .$1 to .$1.bak"
    mv "$dst" "$dst.bak"
  fi

  ln -sf "$src" "$dst"
}

link_file zshrc
link_file tmux.conf

# ---------- 4. Finish ----------
echo ""
echo "Setup complete."
echo "Next steps:"
echo "  - Restart terminal"
echo "  - Set iTerm2 as default shell"
echo "  - Configure 1Password + SSH"
