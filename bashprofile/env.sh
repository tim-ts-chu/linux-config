#! /bin/bash

# set env variable
export HOME=`ls -d ~`
export TZ='Asia/Taipei'
export TMPDIR=$HOME/.tmp
export PATH=$PATH:~/bin
export CLICOLOR=1;
export LSCOLORS=exfxcxdxbxegedabagacad;

# set alias
alias ll='ls -al'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias py='ipython'
alias grep='grep --color'


