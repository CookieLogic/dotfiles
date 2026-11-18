# =============================================================================
# cdp — cd into a ~/projects/<dir> with tab completion
# =============================================================================

cdp() {
  cd "${HOME}/projects/${1}"
}

_cdp() {
  local -a projects
  projects=("${HOME}"/projects/*(N/:t))
  _describe 'project' projects
}

compdef _cdp cdp
