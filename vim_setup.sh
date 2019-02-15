#! /bin/bash

BASEDIR=`pwd .`

echo "===== Setup vim configuration ====="

# link ~/.vim from /vim
if [ -e "${HOME}/.vim" ]; then
	echo "folder [.vim] is exist, move it to [.vim.origin]"
    if [ -e "${HOME}/.vim.origin" ]; then
        echo "folder [.vim.origin] is exist, skip rename."
        rm ${HOME}/.vim
    else
        mv -f ${HOME}/.vim ${HOME}/.vim.origin
    fi
fi
echo "link ${HOME}/.vim from ${BASEDIR}/vim"
ln -s ${BASEDIR}/vim ${HOME}/.vim

# create .tmp folder
if [ -e "${HOME}/.tmp" ]; then
	rm -rf ${HOME}/.tmp
fi
mkdir ${HOME}/.tmp

# link .vimrc from ~/.vim/vimrc
if [ -e "${HOME}/.vimrc" ]; then
	echo "[.vimrc] is exist, move it to [.vimrc.origin]"
    if [ -e "${HOME}/.vimrc.origin" ]; then
        echo "folder [.vimrc.origin] is exist, skip rename."
        rm ${HOME}/.vimrc
    else
    	mv ${HOME}/.vimrc ${HOME}/.vimrc.origin
    fi
fi
echo "link ${HOME}/.vimrc from ${HOME}/.vim/vimrc"
ln -s ${HOME}/.vim/vimrc ${HOME}/.vimrc

echo "install Vundel..."
if [ -e "${HOME}/.vim/bundle/Vundle.vim" ]; then
    echo "folder [~/.vim/bundle/Vundle.vim] is exist, skip to clone Vundle"
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
~/.vim/bundle/YouCompleteMe/install.py


