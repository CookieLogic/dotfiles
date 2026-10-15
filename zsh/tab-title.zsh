autoload -Uz add-zsh-hook

_set_tab_title() {
  [[ -v _ZSH_INITIALIZED ]] || return
  local title git_root git_branch
  if git_root=$(git rev-parse --show-toplevel 2>/dev/null); then
    git_branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    title="$(basename "$git_root"):${git_branch}"
  else
    title="${PWD/#$HOME/~}"
  fi
  # Works in iTerm2, Terminal.app, tmux, most xterm-compatible terminals
  printf '\e]1;%s\a' "$title"
}

add-zsh-hook precmd _set_tab_title
