# Cookie's p10k config — agnoster-style powerline prompt
# Generated to match /Users/seth/.dotfiles/zsh/themes/agnoster.zsh-theme
#
# Based on p10k's "lean" config with powerline segments.
# To re-run the config wizard: p10k configure

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Zsh >= 5.1 is required.
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  # Left prompt segments (matching agnoster's build_prompt order)
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    status                  # exit code / root / background jobs
    virtualenv              # python virtualenv / conda
    aws                     # AWS profile
    terraform               # terraform workspace
    context                 # user@hostname
    dir                     # current directory
    vcs                     # git status
    prompt_char             # prompt symbol
  )

  # No right prompt (agnoster doesn't use one)
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

  # === Visual style: powerline (matching agnoster) ===
  typeset -g POWERLEVEL9K_MODE='nerdfont-v3'
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate

  # Powerline separators (agnoster style)
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0b0'
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0b1'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

  # No right prompt end cap
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=$'\ue0b0'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''

  # Single line prompt (like agnoster)
  typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=false
  typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

  # No extra newline before prompt
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

  # === Instant prompt ===
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  # === Transient prompt (show minimal prompt for past commands) ===
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

  # === Status segment (matches prompt_status) ===
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true

  # Status colors (agnoster: red X on black bg)
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=1        # red
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=0        # black
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=1
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=0
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=1
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=0

  # Background jobs (agnoster: cyan gear on black)
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=6     # cyan
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=0     # black

  # === Context: user@host (matches prompt_context) ===
  # Only show when not default user or in SSH
  typeset -g DEFAULT_USER="$USER"
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND='default'
  typeset -g POWERLEVEL9K_CONTEXT_BACKGROUND=0             # black
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=3        # yellow
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=0
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
  typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false

  # === Directory (matches prompt_dir with collapsed_path) ===
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=0                 # black
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=4                 # blue
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=0                 # no max

  # Writable/non-writable distinction
  typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND=0
  typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND=4

  # Don't show lock icon for non-writable
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3

  # === VCS / Git (matches prompt_git) ===
  # Clean: black on green
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=0           # black
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=2           # green

  # Dirty/modified: black on yellow
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=0        # black
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=3        # yellow

  # Untracked: black on yellow (same as dirty in agnoster)
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=0
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=3

  # Loading (async not yet returned): black on grey
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=0
  typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND=8

  # Show ahead/behind counts (matches AGNOSTER_GIT_BRANCH_STATUS)
  typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind)

  # Branch icon
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=$'\ue0a0 '

  # Truncate long branch names (matches agnoster's 15 char truncation)
  typeset -g POWERLEVEL9K_VCS_SHORTEN_LENGTH=15
  typeset -g POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=16
  typeset -g POWERLEVEL9K_VCS_SHORTEN_STRATEGY=truncate_from_right
  typeset -g POWERLEVEL9K_VCS_SHORTEN_DELIMITER='..'

  # Disable vcs_info (p10k uses gitstatus daemon instead — much faster)
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=false

  # Staged/unstaged icons (matching agnoster's vcs_info format)
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON='✚'
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON='±'

  # === Virtualenv (matches prompt_virtualenv) ===
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=0          # black
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=4          # blue
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

  # Conda
  typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=0
  typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND=5            # magenta (matches agnoster)
  typeset -g POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION='${CONDA_DEFAULT_ENV}'

  # === AWS Profile (matches prompt_aws) ===
  typeset -g POWERLEVEL9K_AWS_FOREGROUND=0                 # black
  typeset -g POWERLEVEL9K_AWS_BACKGROUND=2                 # green
  typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND=''           # always show when set
  typeset -g POWERLEVEL9K_AWS_CONTENT_EXPANSION='AWS: ${AWS_PROFILE//\%/%%}'

  # Production AWS profile highlighting (yellow on red)
  typeset -g POWERLEVEL9K_AWS_CLASSES=(
    '*-prod'        PROD
    '*production*'  PROD
    '*'             DEFAULT
  )
  typeset -g POWERLEVEL9K_AWS_PROD_FOREGROUND=3            # yellow
  typeset -g POWERLEVEL9K_AWS_PROD_BACKGROUND=1            # red
  typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=0         # black
  typeset -g POWERLEVEL9K_AWS_DEFAULT_BACKGROUND=2         # green

  # === Terraform (matches prompt_terraform) ===
  typeset -g POWERLEVEL9K_TERRAFORM_FOREGROUND=3           # yellow
  typeset -g POWERLEVEL9K_TERRAFORM_BACKGROUND=5           # magenta
  typeset -g POWERLEVEL9K_TERRAFORM_SHOW_DEFAULT=false
  typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
    '*'  DEFAULT
  )

  # === Prompt char (the final segment terminator) ===
  # In agnoster this is just the powerline arrow, not a separate char.
  # We hide the prompt_char content and let the powerline separator do the work.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_FOREGROUND=0
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=''

  # === Hot reload ===
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  # === Gitstatus configuration ===
  # Max time to wait for gitstatus in ms (affects prompt latency)
  typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0
  # Use gitstatus daemon for async git info
  typeset -g POWERLEVEL9K_GITSTATUS_DAEMON_ENABLE=true

  (( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
  'builtin' 'unset' 'p10k_config_opts'
}
