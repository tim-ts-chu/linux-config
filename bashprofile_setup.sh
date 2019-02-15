#! /bin/bash

if ! [ -d ${HOME}/.tmp ]; then
	rm -rf ${HOME}/.tmp
	mkdir ${HOME}/.tmp
fi

cat > ${HOME}/.tmp/tmp << "EOF"

#===== add by timchu's linux-config =====
for f in ~/linux-config/bashprofile/*; do
	source $f;
done
#=======================================

EOF

cat ${HOME}/.tmp/tmp  >> ${HOME}/.bash_profile
rm -rf ${HOME}/tmp/.tmp



