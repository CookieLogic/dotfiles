# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dotfiles/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zmodload zsh/zprof

alias_paths=(
  "${DOTFILES_DIR}/aliases"
  "${ZDOTDIR}/aliases"
)
for af in ${alias_paths[@]} ; do
  if [ -f "$af" ] ; then
    . "$af"
  fi
done

function_paths=(
  "${DOTFILES_DIR}/functions"
  "${ZDOTDIR}/functions"
)
for af in ${function_paths[@]} ; do
  if [ -f "$af" ] ; then
    . "$af"
  fi
done

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Skip compaudit security check and disable auto-update checks at startup
ZSH_DISABLE_COMPFIX=true
DISABLE_AUTO_UPDATE=true

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="cookie-p10k"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="%m/%d/%YT%M:%H:%S %z"
HISTSIZE=50000
SAVEHIST=1000000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#export ZSH_CUSTOM="${DOTFILES_DIR}/zsh/oh-my-zsh"
export ZSH_CUSTOM="${DOTFILES_DIR}/zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  argocd
  autoenv
  brew
  colored-man-pages
  colorize
  compleat
  cp
  docker
  gcloud
  git
  github
  gitignore
  helm
  history
  kind
  kubectl
  kubectx
  macos
  mosh
  opentofu
  pip
  profiles
  python
  safe-paste
  ssh
  terraform
  tldr
  tmux
  1password
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -f "${HOME}/.local/bin/env" ] ; then . "$HOME/.local/bin/env" ; fi

export NVM_DIR="$HOME/.nvm"
# Lazy-load NVM: defers sourcing nvm.sh until first use of nvm/node/npm/npx/corepack
if [ -s "$NVM_DIR/nvm.sh" ]; then
  __lazy_nvm() {
    unset -f nvm node npm npx corepack 2>/dev/null
    \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  }
  for __cmd in nvm node npm npx corepack; do
    eval "${__cmd}() { __lazy_nvm; ${__cmd} \"\$@\"; }"
  done
  unset __cmd
fi

# == Comletion Setup
# Set completion paths
#fpath=(${DOTFILES_DIR}/zsh/completions $fpath)
if [ -d /opt/homebrew/completions ] ; then
  fpath=(/opt/homebrew/completions $fpath)
fi
fpath=(/Users/seth/.local/share/doppler/zsh/completions $fpath)

zstyle ':omz:alpha:lib:git' async-prompt yes
#source $ZSH/oh-my-zsh.sh
source ${HOME}/.oh-my-zsh/oh-my-zsh.sh
source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script

# Ghostty shell integration (ssh-terminfo, ssh-env, etc.)
if [[ -n "$GHOSTTY_RESOURCES_DIR" ]]; then
  source "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration"
fi

_ZSH_INITIALIZED=true
# print "Shell ready in $(( SECONDS - _zsh_start ))s"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh
