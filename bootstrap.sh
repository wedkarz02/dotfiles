#!/bin/bash

RED="\033[0;91m";
GREEN="\033[0;92m";
RESET="\033[0m";

cwd=$(pwd);
cd "$(dirname "${BASH_SOURCE}")";

git fetch --all;
git reset --hard origin/main;
git pull;

echo "";

function install() {
    declare -a dot_dirs=('bash' 'vim' 'git');

    for dot_dir in "${dot_dirs[@]}"; do
        cd $dot_dir;

        for file_name in .[!.]*; do
            echo "[INFO] Creating symlink: $HOME/$file_name -> $(pwd)/$file_name";
            ln -s -f $(pwd)/$file_name $HOME/$file_name;

            if [ $? -ne 0 ]; then
                echo -e "${RED}[ERROR]${RESET}: Creating symlink failed.";
            else
                echo -e "${GREEN}[DONE]${RESET}: Symlink created successfully.";
            fi
        done

        cd ..;
    done

    source "$HOME/.profile";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install;
else
    echo -ne "${RED}[WARNING]${RESET}: This may overwrite existing files in your home directory. Are you sure? (y/n) ";
    read -n 1;
	echo -e "\n";
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install;
    fi
fi

unset install;
cd $cwd;
