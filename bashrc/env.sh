#! /bin/bash

# set env variable
export HOME=`ls -d ~`
export TZ='America/Detroit'
#export TMPDIR=$HOME/.tmp
export TMPDIR=/tmp
export PATH=$PATH:~/bin
export CLICOLOR=1;
export LSCOLORS=exfxcxdxbxegedabagacad;
export LANG=en_US
export LANGUAGE=en_US
export LC_ALL=C

# set alias
alias ll='ls -al --color --group-directories-first'
alias ls='ls --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias py='python3'
alias grep='grep --color'
alias vim='nvim'
alias fzf='~/.fzf/bin/fzf'


