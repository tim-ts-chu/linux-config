
# install dependancy
apt-get install vim python

# run all setup shell script
for f in ~/linux-config/*setup.sh; do
	echo $f;
	$f;
done

