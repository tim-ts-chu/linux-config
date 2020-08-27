#!/bin/bash

BASEDIR=`realpath ~/linux-config`

apt install -y wget tmux build-essential curl git

echo "neovim build..."
apt install -y ninja-build libtool-bin gperf luajit luarocks libuv1-dev libluajit-5.1-dev libunibilium-dev libmsgpack-dev libtermkey-dev libvterm-dev libutf8proc-dev gettext libtool autoconf automake cmake g++ pkg-config unzip
cd ~; git clone -b v0.4.4 https://github.com/neovim/neovim.git
cd ~/neovim; make CMAKE_BUILD_TYPE=Release
cd ~/neovim; make install
rm -rf ~/neovim

echo "nodejs install..."
curl -sL https://deb.nodesource.com/setup_14.x > ~/install.sh
bash ~/install.sh -y
rm -rf ~/install.sh
apt install -y nodejs cmdtest

echo "yarn install..."
curl -sL https://yarnpkg.com/install.sh  > ~/install.sh
bash ~/install.sh
rm -rf ~/install.sh
source ~/.bashrc

echo "coc dependencies install..."
apt install -y python3-pip
pip3 install pynvim jedi
curl -sL install-node.now.sh/lts > ~/install.sh
bash ~/install.sh -y
rm -rf ~/install.sh

apt install -y ranger
pip3 install ranger-fm

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

echo "install vim-plug"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

echo "coc package"
nvim -c 'CocInstall coc-snippets coc-json coc-tsserver'


