# Homebrew path
export PATH="/opt/homebrew/bin:$PATH"

# Navigation
alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ..'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# Quick apps
alias code='code .'        # open current folder in VS Code
alias subl='subl .'        # open current folder in Sublime

# Show user@host and current folder
export PROMPT="%F{green}%n@%m %F{blue}%~ %# %f"

autoload -Uz promptinit
promptinit
prompt adam1

# Enable command completion
autoload -Uz compinit
compinit

# Better history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
