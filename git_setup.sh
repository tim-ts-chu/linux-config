#!/bin/bash

GIT_USER="tim-ts-chu"
GIT_MAIL="tim.ts.chu@gmail.com"

echo "setup common global configurations"
git config --global user.name ${GIT_USER}
git config --global user.email ${GIT_MAIL}
git config --global core.editor vim
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.df diff
git config --global alias.cp cherry-pick
git config --global alias.ll "log --graph --decorate --pretty=oneline --abbrev-commit"
git config --global alias.la "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global color.ui auto
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.log auto
git config --global push.default simple
git config --global diff.tool vimdiff
git config --global difftool.prompt false

echo "use ssh via git"
SSH_PUBKEY="${HOME}/.ssh/id_rsa.pub"
if [ -f "${SSH_PUBKEY}"  ]; then
	echo "the ssh key is already generated, use the old one."
else
	ssh-keygen -f ~/.ssh/id_rsa -N ""
	echo "now, please update the \"public key\" to git server"
fi

echo 'git setup finished'
