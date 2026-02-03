# =========================
# ZSH Theme
# =========================
ZSH_THEME="agnoster"

# =========================
# Path
# =========================
export PATH="/opt/homebrew/bin:$PATH"

# =========================
# Aliases - Navigation
# =========================
alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ..'

# =========================
# Aliases - Git
# =========================
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# =========================
# Aliases - Quick apps
# =========================
alias code='code .'
alias subl='subl .'

# =========================
# Prompt
# =========================
# Show user@host and current folder
export PROMPT="%F{green}%n@%m %F{blue}%~ %# %f"

# =========================
# Completion
# =========================
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# =========================
# Plugins
# =========================
# Make sure you installed these via brew
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf Ctrl-R fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =========================
# File Explorer: nnn with cd-on-exit
# =========================
# Remove any existing alias first
unalias n 2>/dev/null
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"
    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}
# =========================
# History Management
# =========================
HISTSIZE=5000
SAVEHIST=5000
HISTFILE="$HOME/.zsh_history"
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups