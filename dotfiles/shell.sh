croot() {
    local repo_root
    repo_root="$(git rev-parse --show-toplevel)" || return
    cd -- "$repo_root" || return
}
