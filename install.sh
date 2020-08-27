

# install dependancy
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
$SUDO apt install -y wget tmux build-essential curl git

# neovim
$SUDO apt install -y ninja-build libtool-bin gperf luajit luarocks libuv1-dev libluajit-5.1-dev libunibilium-dev libmsgpack-dev libtermkey-dev libvterm-dev libutf8proc-dev gettext libtool autoconf automake cmake g++ pkg-config unzip

# coc
$SUDO apt install -y nodejs cmdtest python3-pip ranger

# run all setup shell script
for f in ~/linux-config/*setup.sh; do
	echo $f;
	$f;
done

