#!/bin/bash

RED="\033[0;91m";
GREEN="\033[0;92m";
RESET="\033[0m";

cwd=$(pwd);
cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;
echo "";

# This is kinda ugly but works nicely, might rewrite later.
function install() {
    declare -a bash_files=('.bash_aliases' '.bash_logout' '.bashrc' '.profile');
    declare -a git_files=('.gitconfig');
    declare -a vim_files=('.vimrc');

    for file in "${bash_files[@]}"; do 
        echo "[INFO] Creating symlink: $HOME/$file -> $(pwd)/bash/$file";
        ln -s -f $(pwd)/bash/$file $HOME/$file;

        if [ $? -ne 0 ]; then
            echo -e "${RED}[ERROR]${RESET}: Creating symlink failed.";
        else
            echo -e "${GREEN}[DONE]${RESET}: Symlink created successfully.";
        fi
    done

    for file in "${git_files[@]}"; do 
        echo "[INFO] Creating symlink: $HOME/$file -> $(pwd)/git/$file";
        ln -s -f $(pwd)/git/$file $HOME/$file;

        if [ $? -ne 0 ]; then
            echo -e "${RED}[ERROR]${RESET}: Creating symlink failed.";
        else
            echo -e "${GREEN}[DONE]${RESET}: Symlink created successfully.";
        fi
    done

    for file in "${vim_files[@]}"; do 
        echo "[INFO] Creating symlink: $HOME/$file -> $(pwd)/vim/$file";
        ln -s -f $(pwd)/vim/$file $HOME/$file;

        if [ $? -ne 0 ]; then
            echo -e "${RED}[ERROR]${RESET}: Creating symlink failed.";
        else
            echo -e "${GREEN}[DONE]${RESET}: Symlink created successfully.";
        fi
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
