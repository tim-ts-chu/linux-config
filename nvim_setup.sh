#!/bin/bash

BASEDIR=`pwd .`

# create .config folder if not exist
mkdir -p $HOME/.config

# link ~/.config/nvim from linux-config/nvim
if [ -e "${HOME}/.confg/nvim" ]; then
	echo "folder [.config/nvim] is exist, move it to [.config/nvim.origin]"
    if [ -e "${HOME}/.config/nvim.origin" ]; then
        echo "folder [.config/nvim.origin] is exist, skip rename."
        rm ${HOME}/.config/nvim
    else
        mv -f ${HOME}/.config/nvim ${HOME}/.config/nvim.origin
    fi
fi
echo "link ${HOME}/.config/nvim from ${BASEDIR}/nvim"
ln -s ${BASEDIR}/nvim ${HOME}/.config/nvim


# install vim-plugin
echo "install vim-plug"
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#nvim +PluginInstall +qall



