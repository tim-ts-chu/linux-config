#! /bin/bash

# bookmark list
declare -a bk
bk[home]="cd ~"

# bookmark for home directory
for dir in ~/*; do
    if [ -d dir ]; then
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


