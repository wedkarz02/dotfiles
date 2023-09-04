#!/bin/bash

RED="\e[31m";
RESET="\e[0m";

cwd=$(pwd);
cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;
echo "";

function install() {
    rsync --exclude ".git/" \
          --exclude "atom/" \
          --exclude "vscode/" \
          --exclude "LICENSE" \
          --exclude "README.md" \
          --exclude "bootstrap.sh" \
          -avh --no-perms --progress bash/ git/ vim/ ~;
    source "$HOME/.profile";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install;
else
    echo -ne "${RED}[WARNING]:${RESET} This may overwrite existing files in your home directory. Are you sure? (y/n) ";
    read -n 1;
	echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install;
    fi
fi
unset install;
cd $cwd;
