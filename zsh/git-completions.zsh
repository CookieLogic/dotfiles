# =============================================================================
# Git / g — ZSH Completions
#
# Loaded automatically by oh-my-zsh (sources $ZSH_CUSTOM/*.zsh after compinit).
#
# Provides:
#   - compdef for the `g` shell alias → git's native completion
#   - Explicit alias mappings: git alias → native _git-<subcommand> completion
#   - cob:  branch-name completion   → <type>/<scope>-<description>
#   - ci/cia/amend -m completion     → <type>(<scope>): <message>
#
# The system _git dispatcher calls _git-<alias> when the function exists,
# falling back to alias expansion only when no such function is defined.
# =============================================================================

# Wire shell alias `g` → git's native completion
compdef _git g

# =============================================================================
# Shared types & scopes arrays (used by both cob and commit -m completion)
# =============================================================================

# Commit types for cob — add or remove as needed
typeset -ga GIT_COB_TYPES
GIT_COB_TYPES=(
  feat
  fix
  docs
  style
  refactor
  test
  chore
  perf
  ci
  build
  revert
)

# Predefined scopes for cob — add or remove as needed
# Derived from last 100 commits across: terraform, mnet, useful-scripts,
# node-health-checks, sandboxes, infra-utils; plus .gitmessage defaults.
typeset -ga GIT_COB_SCOPES
GIT_COB_SCOPES=(
  # .gitmessage defaults
  doppler
  grafana
  terraform

  # Infrastructure / clusters
  admin
  ai-devboxes
  data-workloads
  dev-infra
  euw4-gb200s
  gb200
  gcp-admin
  github
  k8s
  sbx
  sbx-cluster
  sre-dev-euw4
  training
  training-euw4
  training-infra
  training-usc1

  # CI / build
  ci
  bazel
  deps

  # Services & tooling
  allocate-domains
  clientlib
  cluster-health-exporter
  controller
  cuda-images
  deploy
  deploy-base-chart
  devbox
  devboxes
  docker
  docker-images
  domain-qa
  drr
  gpu-devbox
  gpu-health-checks
  ls-healthy-domains
  magicctl
  mctl
  metrics-based-checks
  nccl-test
  nccl-tests
  nhc
  node-info
  npa
  nsm
  passive-checks
  pnl
  pool-manager
  proxy
  pytorch-image
  rcd
  rce
  rce-agent
  redis
  runner-k8s
  sandboxes
  scalr
  scalr-agent
  session-manager
  sshconfig
  torch-images
  useful-scripts
  workload-manager
  workloadclient
)

# =============================================================================
# cob — branch name completion
# Format: <type>/<scope>-<description>   e.g. feat/grafana-add-new-panel
# =============================================================================
#
# State detection via $PREFIX:
#   "feat"          → start           → complete type, suffix "/"
#   "feat/gra"      → after "type/"   → complete scope, suffix "-"
#   "feat/grafana-" → after "scope-"  → prompt for description (free text, hyphens)
_git-cob() {
  local cur="$PREFIX"

  if [[ "$cur" =~ '^([a-z]+)/([^-]*)$' ]]; then
    # After "type/" — completing scope, e.g. "feat/gra<TAB>"
    # match[1]=type, match[2]=partial scope
    IPREFIX+="${match[1]}/"
    PREFIX="${match[2]}"
    compadd -S '-' -q -- "${GIT_COB_SCOPES[@]}"

  elif [[ "$cur" =~ '^[a-z]*$' ]]; then
    # At the beginning — complete commit type, suffix "/"
    compadd -S '/' -- "${GIT_COB_TYPES[@]}"

  else
    # After "type/scope-" — free-form description (hyphens, no spaces)
    _message 'branch description (hyphens only, no spaces)'
  fi
}

# =============================================================================
# Conventional commit message completion for -m flag
# Format: <type>(<scope>): <message>   e.g. feat(grafana): add new panel
# =============================================================================
#
# State detection via $PREFIX:
#   "feat"        → start          → complete type, suffix "("
#   "feat(gra"    → inside parens  → complete scope, suffix "): "
#   "feat(scope)" → past parens    → prompt for message (free text)
_git_conventional_commit_message() {
  local cur="$PREFIX"

  if [[ "$cur" =~ '^([a-z]+)\(([^)]*)$' ]]; then
    # Inside the scope parens, e.g. "feat(gra<TAB>"
    # match[1]=type, match[2]=partial scope
    IPREFIX+="${match[1]}("
    PREFIX="${match[2]}"
    compadd -S '): ' -q -- "${GIT_COB_SCOPES[@]}"

  elif [[ "$cur" =~ '^[a-z]*$' ]]; then
    # At the beginning — complete commit type, suffix "("
    compadd -S '(' -- "${GIT_COB_TYPES[@]}"

  else
    # Past "type(scope): " — free-form commit message
    _message 'commit message'
  fi
}

# =============================================================================
# Git alias → native subcommand completion mappings
#
# These explicit functions document the alias→command relationship and
# take precedence over _git's automatic alias-expansion fallback.
# Aliases whose completion is identical to the underlying command are
# listed here; shell-command aliases (chm, pr, ppr, pr-*) are intentionally
# omitted — _git's fallback handles them adequately.
# =============================================================================

_git-br()         { _git-branch   "$@" }  # br   → branch
_git-co()         { _git-checkout "$@" }  # co   → checkout
_git-st()         { _git-status   "$@" }  # st   → status
_git-s()          { _git-status   "$@" }  # s    → status (via st)
_git-d()          { _git-diff     "$@" }  # d    → diff
_git-unstage()    { _git-reset    "$@" }  # unstage → reset HEAD --
_git-push-amend() { _git-push     "$@" }  # push-amend → push --force-with-lease

# Commit aliases — intercept -m/--message to complete conventional format
_git-ci()    { _git_commit_with_msg_completion "$@" }  # ci    → commit
_git-cia()   { _git_commit_with_msg_completion "$@" }  # cia   → commit -a
_git-amend() { _git_commit_with_msg_completion "$@" }  # amend → commit --amend

_git_commit_with_msg_completion() {
  # When the word before the cursor is -m or --message, complete the
  # conventional commit format instead of git's default free-text prompt.
  if [[ "${words[CURRENT-1]}" == (-m|--message) ]]; then
    _git_conventional_commit_message
    return
  fi
  _git-commit "$@"
}
