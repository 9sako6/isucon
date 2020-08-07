#!/bin/bash

set -eu

function set-symboliclink () {
  echo "set-symboliclink: ${1}"
  fname="$(basename ${1}).$(hostname)"
  cp ${1} "${root_path}/${fname}"
  sudo rm ${1}
  sudo ln -s "${root_path}/${fname}" ${1}
}

root_path=~/isubata
cd ${root_path}
set-symboliclink "/etc/nginx/nginx.conf"
set-symboliclink "/home/isucon/env.sh"
set-symboliclink "/home/isucon/.bashrc"
