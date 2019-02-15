#! /bin/bash

PS1='\[\e[0;36m\]['

# show username
if [ `id -u` -eq 0 ]; then
	PS1=$PS1'\[\e[0;31m\]\u'
else
	PS1=$PS1'\[\e[0;36m\]\u'
fi

# show hostname
PS1=$PS1'\[\e[1;36m\]@\h'

# show time
PS1=$PS1'\[\e[0;36m\] \A]'

#show workdir
PS1=$PS1'\[\e[1;32m\] \w'

# show exit state
PS1=$PS1'\[\e[0m\] $?\n$ '


