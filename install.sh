
# install dependancy
apt-get install vim build-essential cmake python-dev python3-dev

# run all setup shell script
for f in ~/linux-config/*setup.sh; do
	echo $f;
	$f;
done

