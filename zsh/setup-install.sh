#/bin/bash

DOTFILES_DIR="${1:-${HOME}/.dotfiles}"
ZDOTFILES_DIR="${DOTFILES_DIR}/zsh"
ZSH_FILES=(
  .zshenv
)

if [ ! -d "$ZDOTFILES_DIR" ] ; then
  echo "ERROR: ZSH does not exist in the dotfiles dir, path=${ZDOTFILES_DIR}"
  exit 1
fi

#if [ -f "$ZSH_ENV_FILE" ] ; then
#  move "$ZSH_ENV_FILE"
#fi

#cat - >"$ZSH_ENV_FILE" <<EOF
#DOTFILES_DIR="${DOTFILES_DIR}"
#ZDOTDIR="\${DOTFILES_DIR}/zsh"
#source "\${ZDOTDIR}/.zshenv"
#EOF

for filename in "${ZSH_FILES[@]}" ; do
  zfilename="${HOME}/${filename}"
  if [ -e "${zfilename}" ] ; then
    read -p "${zfilename} already exists, overwrite? [y/n] "
    if [[ "$REPLY" =~ ^[yY]$ ]] ; then
      echo "Backing up and replacing ${zfilename}."
      mv "$zfilename" "$zfilename.$(date +%Y-%m-%dT%H:%M:%S).bak"
    else
      continue
    fi
  elif [ -L "$zfilename" ] ; then
    read -p "${zfilename} is linked to another file, overwrite? [y/n] "
    if [[ "$REPLY" =~ ^[yY]$ ]] ; then
      echo "Removing soft link at ${zfilename}."
      rm -f "$zfilename"
    else
      continue
    fi
  fi

  echo "Linking ${zfilename} to ${ZDOTFILES_DIR}/${filename}"
  ln -s "${ZDOTFILES_DIR}/${filename}" "$zfilename"
done

if [ ! -d "${HOME}/.oh-my-zsh" ] ; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
