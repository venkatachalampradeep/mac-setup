# =========================
# ZSH Theme
# =========================
ZSH_THEME="agnoster"

# =========================
# LLM Stuff
# =========================
alias g="llm -m gpt-4.1-mini"
alias g4="llm -m gpt-4.1"

rr() {
  llm -m gpt-4.1-mini \
  "You are a senior RTL engineer.
  Review this code.
  Suggest improvements.
  Be concise." < "$1"
}

# =========================
# Path
# =========================
export PATH="/opt/homebrew/bin:$PATH"
export OPENAI_API_KEY=$(cat ~/.config/openai/key)
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
alias todo='subl ~/notes/todo.md'
alias malias='subl ~/.zshrc'
alias ralias='source ~/.zshrc'
alias gs='git status'
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
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf Ctrl-R fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =========================
# File Explorer: nnn with cd-on-exit
# =========================
# Remove any existing alias first

export NNN_EDITOR="vi"
export VISUAL="vi"

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

PATH="/Users/pradeepvenkatachalam/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/pradeepvenkatachalam/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/pradeepvenkatachalam/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/pradeepvenkatachalam/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/pradeepvenkatachalam/perl5"; export PERL_MM_OPT;

# Created by `pipx` on 2026-02-14 14:18:17
export PATH="$PATH:/Users/pradeepvenkatachalam/.local/bin"

# Auto-start tmuxinator dev session on new interactive terminals
if [ -z "$TMUX" ] && [ -z "$SSH_TTY" ] && [ -z "$DISABLE_AUTO_TMUXINATOR" ] && command -v tmuxinator >/dev/null 2>&1; then
  tmuxinator start dev
fi
