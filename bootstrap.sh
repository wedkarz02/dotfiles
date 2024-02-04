#!/bin/bash

RED="\033[0;91m";
GREEN="\033[0;92m";
RESET="\033[0m";

cwd=$(pwd);
cd "$(dirname "${BASH_SOURCE}")";

function install() {
    declare -a dot_dirs=('bash' 'vim' 'git');

    for dot_dir in "${dot_dirs[@]}"; do
        cd $dot_dir;

        for file_name in .[!.]*; do
            echo "[INFO] Creating symlink: $HOME/$file_name -> $(pwd)/$file_name";
            ln -s -f $(pwd)/$file_name $HOME/$file_name;

            if [ $? -ne 0 ]; then
                echo -e "${RED}[ERROR]${RESET}: creating symlink failed.";
            else
                echo -e "${GREEN}[DONE]${RESET}: symlink created successfully.";
            fi
        done

        cd ..;
    done

    echo "[INFO] Creating symlink: $HOME/.config/nvim/ -> $(pwd)/nvim/";
    ln -s -f $(pwd)/nvim $HOME/.config;

    if [ $? -ne 0 ]; then
        echo -e "${RED}[ERROR]${RESET}: creating symlink failed.";
    else
        echo -e "${GREEN}[DONE]${RESET}: symlink created successfully.";
    fi

    source "$HOME/.profile";
}

echo -ne "Synchronize with Github? This action will overwrite any local changes. (y/n): ";
read -n 1;
echo -e "\n";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    git fetch --all;
    git reset --hard origin/main;
    echo ""
fi

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install;
else
    echo -ne "${RED}[WARNING]${RESET}: This may overwrite existing files in your home directory. Are you sure? (y/n): ";
    read -n 1;
	echo -e "\n";
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install;
    fi
fi

unset install;
cd $cwd;
