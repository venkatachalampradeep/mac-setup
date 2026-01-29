# mac-setup

This repo contains my dotfiles and Brewfile for setting up a Mac from scratch.

## Steps

1. Install Homebrew
2. Clone this repo
3. Symlink `.zshrc`:
   ```bash
   ln -s ~/mac-setup/zshrc ~/.zshrc
   source ~/.zshrc
4. Install apps 
   ```bash
    brew bundle --file=~/mac-setup/Brewfile
    ```
