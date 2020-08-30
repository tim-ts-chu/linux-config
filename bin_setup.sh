#! /bin/bash

BASEDIR=${HOME}/linux-config

echo "===== Link User bin ====="

if ! [ -d ${HOME}/bin ]; then
	mkdir ${HOME}/bin
fi

for bin in ${BASEDIR}/bin/*; do
    basename=`basename $bin`
    echo "link ${basename}"
    ln -s ${BASEDIR}/bin/${basename} ${HOME}/bin/${basename}
done


