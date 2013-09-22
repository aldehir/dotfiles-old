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
DOTFILES="vimrc vim"

# Loop through and create a symlink for each dotfile. If a file already exists,
# back it up to ${BACKUP_DIR}.
for file in $DOTFILES; do
    if [[ -e $HOME/.$file ]]; then
        if [[ ! -d $BACKUP_DIR ]]; then
            echo "Creating backup directory ${BACKUP_DIR}"
            mkdir --parents $BACKUP_DIR
        fi
        echo "Backing up ~/.$file to ${BACKUP_DIR}/$file"
        mv $HOME/.$file ${BACKUP_DIR}/$file
    fi
    
    echo "Installing ${DIRECTORY}/$file to ~/.$file"
    ln -s ${DIRECTORY}/$file $HOME/.$file 
done
