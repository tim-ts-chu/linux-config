#! /bin/bash

# bookmark list
declare -A bk
bk[home]="cd ${HOME}"

# bookmark for home directory
for dir in ${HOME}/*; do
    if [ -d ${dir} ]; then
        base=`basename $dir`
        bk[$base]="cd $dir"
    fi
done

bk[regression]="cd ${HOME}/predict-behavior/src/python/predict_behavior/products/trajectory_regression"
for dir in ${HOME}/predict-behavior/src/python/predict_behavior/products/trajectory_regression/*; do
    if [ -d ${dir} ]; then
        base=`basename $dir`
        bk[$base]="cd $dir"
    fi
done

# *** print hint bookmark message for debug ***
cmd=''
for key in ${!bk[@]}; do
	echo ${key}=${bk[${key}]}
	cmd+=${key}' '
done

to() {
#execute bookmark command
${bk[$1]}
}

_to() {
	local cur prev
	COMPREPLY=()

	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	COMPREPLY=( $(compgen -W "${cmd}" -- ${cur} ) )
}

complete -F _to to


