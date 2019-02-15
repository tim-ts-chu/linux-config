# linux-config
This is my setting for linux work environment.

# dependancies
git vim build-essential cmake python-dev python3-dev

# Setup
1. Install the above dependancise beforehand, and perhaps you may need sudo to install them
```
apt-get install git vim build-essential cmake python-dev python3-dev
```
or if you need sudo to do apt-get install. (Do not use sudo to execute install.sh)
```
sudo apt-get install git vim build-essential cmake python-dev python3-dev
```

2. Go to home direcoty and download the linux-config project form git
```
cd ~; git clone https://github.com/tim-ts-chu/linux-config.git
```

3. cd into linux-config and run **./install.sh** to setup by shell script
```
cd ~/linux-config; ./install.sh
```
