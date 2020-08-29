#!/bin/bash

BASEDIR=`realpath ~/linux-config`


echo "===== neovim install... ====="
cd ~; wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
chmod u+x ~/nvim.appimage
cd ~; ~/nvim.appimage --appimage-extract
mv ~/squashfs-root ~/.squashfs-root
ln -s ~/.squashfs-root/usr/bin/nvim /usr/bin/nvim
rm -rf ~/nvim.appimage

#echo "yarn install..."
curl -sL https://yarnpkg.com/install.sh  > ~/install.sh
bash ~/install.sh
rm -rf ~/install.sh
source ~/.bashrc

echo "===== coc dependencies install... ====="
pip3 install pynvim jedi ranger-fm
curl -sL https://deb.nodesource.com/setup_14.x > ~/install.sh
bash ~/install.sh -y
rm -rf ~/install.sh

curl -sL install-node.now.sh/lts > ~/install.sh
bash ~/install.sh -y
rm -rf ~/install.sh

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

echo "===== install vim-plug ====="
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

