
# check repo dir
cd ${HOME}/linux-config
if [ $? -ne 0 ]; then
    echo "Change directory to ${HOME}/linux-config failed."
    echo "Please, make sure that linux-config is under the home directory."
    exit -1
fi

if [ -z `which sudo` ]; then
    SUDO=''
else
    SUDO=sudo
fi

echo "===== apt install ====="

# essential
$SUDO apt update
$SUDO apt install -y wget tmux build-essential curl git

# coc
$SUDO apt install -y nodejs cmdtest python3-pip ranger

cd ~; wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
chmod u+x ~/nvim.appimage
cd ~; ~/nvim.appimage --appimage-extract
mv ~/squashfs-root ~/.squashfs-root
$SUDO ln -s ~/.squashfs-root/usr/bin/nvim /usr/bin/nvim
rm -rf ~/nvim.appimage

curl -sL https://yarnpkg.com/install.sh  > ~/install.sh
bash ~/install.sh
rm -rf ~/install.sh
. ~/.bashrc

pip3 install pynvim jedi ranger-fm
curl -sL install-node.now.sh/lts > ~/install.sh
$SUDO bash ~/install.sh -y
rm -rf ~/install.sh

# ignore conda first

# linux-config
mkdir -p ~/.config
ln -s ~/linux-config/nvim ${HOME}/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# run all setup shell script
for f in ~/linux-config/*setup.sh; do
	echo $f;
	$f;
done


