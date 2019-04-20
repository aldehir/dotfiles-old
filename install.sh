#!/bin/bash
###############################################################################
#
# Installation script for dotfiles
# by Aldehir Rojas
#
###############################################################################

# Global Variables
DIRECTORY=$(realpath $(dirname $0))
BACKUP_DIR=${DIRECTORY}_old
DOTFILES=(
  vimrc
  vim
  fonts
  fzf
  oh-my-zsh
  zshrc
  tmux.conf
  theme
)

# Initialize and update submodules
pushd $DIRECTORY
git submodule init
git submodule update
popd

# Loop through and create a symlink for each dotfile. If a file already exists,
# back it up to ${BACKUP_DIR}.
for file in "${DOTFILES[@]}"; do
    INSTALL=1
    if [[ -e $HOME/.$file ]]; then
        # Don't backup if symlink already points to proper file
        if [[ "$(realpath $HOME/.$file)" != "${DIRECTORY}/$file" ]]; then
            if [[ ! -d $BACKUP_DIR ]]; then
                echo "Creating backup directory ${BACKUP_DIR}"
                mkdir --parents $BACKUP_DIR
            fi
            echo "Backing up ~/.$file to ${BACKUP_DIR}/$file"
            mv $HOME/.$file ${BACKUP_DIR}/$file
        else
            INSTALL=0
        fi
    fi
   
    if [[ $INSTALL -eq 1 ]]; then
        echo "Installing ${DIRECTORY}/$file to ~/.$file"
        ln -s ${DIRECTORY}/$file $HOME/.$file 
    fi
done

# Update font cache
fc-cache
