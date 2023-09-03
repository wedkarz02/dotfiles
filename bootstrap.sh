#!/usr/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function install() {
    rsync --exclude ".git/" \
          --exclude "atom/" \
          --exclude "vscode/" \
          --exclude "LICENSE" \
          --exclude "README.md" \
          --exclude "bootstrap.sh" \
          -avh --no-perms --progress bash/ git/ vim/ ~;
    source "$HOME/.profile" 2>&1;
    echo "source exit status: $?";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install;
    fi
fi
unset install;
