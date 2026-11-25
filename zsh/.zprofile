# Login-shell PATH setup.
# Runs AFTER /etc/zprofile (macOS path_helper), so prepends here are not
# reordered behind the system paths the way prepends in .zshenv are.

# Homebrew (/opt/homebrew/bin, /opt/homebrew/sbin, fpath, MANPATH, INFOPATH)
if [ -x /opt/homebrew/bin/brew ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

# Personal paths, highest priority first
path=(
  "$HOME/bin"
  "$HOME/.cargo/bin"
  "$HOME/Library/Python/3.7/bin"
  /Library/Frameworks/Python.framework/Versions/3.13/bin
  $path
)

# Drop duplicates (e.g. /opt/homebrew/bin also added via /etc/paths.d/homebrew)
typeset -U path
export PATH
