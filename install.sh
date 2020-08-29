

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
$SUDO apt update
$SUDO apt install -y wget tmux build-essential curl git

# coc
$SUDO apt install -y nodejs cmdtest python3-pip ranger nodejs cmdtest

# run all setup shell script
for f in ~/linux-config/*setup.sh; do
	echo $f;
	$f;
done

