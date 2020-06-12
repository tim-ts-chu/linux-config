#! /bin/bash

# set env variable
export HOME=`ls -d ~`
export TZ='America/Detroit'
#export TMPDIR=$HOME/.tmp
export TMPDIR=/tmp
export PATH=$PATH:~/bin
export CLICOLOR=1;
export LSCOLORS=exfxcxdxbxegedabagacad;

# set alias
alias ll='ls -al --color'
alias ls='ls --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias py='ipython'
alias grep='grep --color'


