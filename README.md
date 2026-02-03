# mac-setup

# mac-setup

Minimal, reproducible setup for a fresh Mac.

This repo contains:
- Homebrew packages (`Brewfile`)
- Shell config (`zshrc`)
- tmux config (`tmux.conf`)
- One bootstrap script (`setup.sh`)

The goal is:
> Run one script and get a usable dev environment.

---

## What `setup.sh` does

`setup.sh` is safe to run multiple times.

### Steps performed

1. **Ensure Homebrew is installed**
   - Installs Homebrew if missing
   - Uses existing install if present

2. **Install packages via Brewfile**
   - CLI tools (git, tmux, fzf, ripgrep, etc.)
   - GUI apps (iTerm2, VS Code, Sublime, Rectangle)

3. **Link dotfiles**
   - Creates symlinks:
     - `~/.zshrc  ->  zshrc`
     - `~/.tmux.conf -> tmux.conf`
   - Existing files are backed up as `.bak`

4. **Print manual next steps**
   - Restart terminal
   - Set iTerm2 defaults
   - Configure SSH / 1Password

---

## Usage

```bash
git clone git@github.com:venkatachalampradeep/mac-setup.git
cd mac-setup
chmod +x setup.sh
./setup.sh
