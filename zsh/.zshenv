export DOTFILES_DIR="/Users/${USER}/dotfiles"
export ZDOTDIR="${DOTFILES_DIR}/zsh"

PATH="/Users/${USER}/Library/Python/3.7/bin:$PATH"
PATH="/Users/${USER}/.cargo/bin:$PATH"
PATH="/Users/${USER}/bin:$PATH"
PATH="/Users/${USER}/Library/Python/3.7/bin:$PATH"
export PATH="$PATH"

export PYTHONPATH="/Users/${USER}/Library/Python/3.7/lib"

#export ZSH="/Users/${USER}/.oh-my-zsh"
export HOMEBREW_NO_ENV_HINTS=1  # Hide Brew hints
export LESS="-RS"

# Default Programs
export EDITOR=vim
export PAGER=less

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/${USER}/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cookie/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/${USER}/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cookie/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
