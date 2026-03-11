export DOTFILES_DIR="${HOME}/.dotfiles"
export ZDOTDIR="${DOTFILES_DIR}/zsh"

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
export LESS="-WURSN --line-num-width=5 --mouse --status-line --use-color"
export DEFAULT_USER="$USER"

# Default Programs
export EDITOR=/opt/homebrew/bin/nvim
export PAGER=less

# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cookie/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cookie/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
