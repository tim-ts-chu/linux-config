#! /bin/bash

if ! [ -d ${HOME}/.tmp ]; then
	rm -rf ${HOME}/.tmp
	mkdir ${HOME}/.tmp
fi

cat > ${HOME}/.tmp/tmp << "EOF"

#===== add by timchu's linux-config =====
for f in ~/linux-config/bashrc/*; do
	source $f;
done
#=======================================

EOF

cat ${HOME}/.tmp/tmp  >> ${HOME}/.bashrc
rm -rf ${HOME}/tmp/.tmp



