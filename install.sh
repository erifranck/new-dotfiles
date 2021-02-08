#!/usr/bin/env bash

set -e

# Source: https://gist.github.com/davejamesmiller/1965569
ask() {
  while true; do
    if [ "${2:-}" = "Y" ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N" ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi
    read -p "$1 [$prompt] " REPLY </dev/tty
    if [ -z "$REPLY" ]; then
      REPLY=$default
    fi
    case "$REPLY" in
      Y*|y*) return 0 ;;
      N*|n*) return 1 ;;
    esac
  done
}

dir=`pwd`

if ask "install spaceVim ?" Y; then
  curl -sLf https://spacevim.org/install.sh | bash
  ln -sf ${dir}/init.toml ${HOME}/.SpaceVim.d/init.toml
  ln -sf ${dir}/config.vim ${HOME}/.SpaceVim/autoload/config.vim
fi
