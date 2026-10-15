# cookie-p10k — agnoster-style theme powered by powerlevel10k
#
# Usage: ZSH_THEME="cookie-p10k" in .zshrc
# Requires: themes/powerlevel10k/ and themes/p10k-cookie.zsh

# Load the p10k engine
source "${0:h}/powerlevel10k/powerlevel10k.zsh-theme"

# Load the cookie config (colors, segments, layout)
[[ -f "${0:h}/p10k-cookie.zsh" ]] && source "${0:h}/p10k-cookie.zsh"
