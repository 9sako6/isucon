#!/bin/bash

set -eu

# git setting
repo_ssh_uri=''
git set-url origin ${repo_ssh_uri}
git config user.name $(hostname)
git config user.email "$(hostname)@example.com"

# resolve host [IP-Address]
sudo sh -c 'echo 127.0.1.1 $(hostname) >> /etc/hosts'

# set the default editor to Vim
sudo update-alternatives --set editor /usr/bin/vim.basic
