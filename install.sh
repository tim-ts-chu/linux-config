
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

echo "===== apt install essential library ====="

# essential
$SUDO apt update
$SUDO apt install -y wget tmux curl git

echo "===== conda ====="
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b
. ~/miniconda3/bin/activate
conda init
rm -rf ~/miniconda.sh

echo "===== coc dependencies ====="
$SUDO apt install -y cmdtest ranger

echo "===== install binaries ====="
mkdir -p ~/bin

cd ~; wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
chmod u+x ~/nvim.appimage
cd ~; ~/nvim.appimage --appimage-extract
mv ~/squashfs-root ~/bin/.squashfs-root
ln -s ~/bin/.squashfs/usr/bin/nvim ~/bin/nvim
rm -rf ~/nvim.appimage

curl -sL https://yarnpkg.com/install.sh  > ~/install.sh
bash ~/install.sh
rm -rf ~/install.sh
. ~/.bashrc

conda install -y nodejs pip
pip install pynvim jedi ranger-fm

echo "===== vim plugin install ====="
mkdir -p ~/.config
ln -s ~/linux-config/nvim ${HOME}/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

#echo "===== ranger ====="
#wget https://ranger.github.io/ranger-1.9.3.tar.gz
#tar xzv ranger-1.9.3.tar.gz
#mv ~/ranger-1.9.3 ~/bin/.ranger
#ln -s ~/bin/.ranger/ranger.py ~/bin/ranger

echo "===== fzf ====="
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo "===== ag ====="
$SUDO apt install -y silversearcher-ag


# run all setup shell script
for f in ~/linux-config/*setup.sh; do
	echo $f;
	$f;
done

