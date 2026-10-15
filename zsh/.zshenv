typeset -F SECONDS
_zsh_start=$SECONDS

# p10k instant prompt — must run before anything that produces console output
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES_DIR="${HOME}/.dotfiles"
export DD="$DOTFILES_DIR"
export ZDOTDIR="${DOTFILES_DIR}/zsh"

# Shortcuts
export ZD="$ZDOTDIR"
export ZDE="$ZD/.zshenv"
export ZDA="$ZD/aliases"
export ZDF="$ZD/functions"
export ZDR="$ZD/.zshrc"
if [ -e "$HOME/Library/Application Support/Smallstep/step-agent-ssh.sock" ] ; then
  export SSH_AUTH_SOCK="$HOME/Library/Application Support/Smallstep/step-agent-ssh.sock"
fi

# Paths
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"
PATH="${HOME}/Library/Python/3.7/bin:$PATH"
PATH="${HOME}/.cargo/bin:$PATH"
PATH="${HOME}/bin:$PATH"
PATH="${HOME}/Library/Python/3.7/bin:$PATH"
PATH="/opt/homebrew/bin:$PATH"
PATH="${HOME}/.local/bin:$PATH"
export PATH="$PATH"

export PYTHONPATH="${HOME}/Library/Python/3.7/lib"

#export ZSH="${HOME}/.oh-my-zsh"
export HOMEBREW_NO_ENV_HINTS=1  # Hide Brew hints
export LESS="-WRSN --line-num-width=5 --mouse --status-line --use-color"
export DEFAULT_USER="$USER"

# Default Programs
export EDITOR=/opt/homebrew/bin/nvim
export PAGER=less

# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cookie/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cookie/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
