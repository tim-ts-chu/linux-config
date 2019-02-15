
# install dependancy
cd ${HOME}/linux-config
if [ $? -ne 0 ]; then
    echo "Change directory to linux-config failed."
    echo "Please, make sure that linux-config is under the home directory."
    exit -1
fi

# run all setup shell script
for f in ~/linux-config/*setup.sh; do
	echo $f;
	#$f;
done

