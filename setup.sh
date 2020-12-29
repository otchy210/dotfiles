#!/bin/bash

scriptDir="$(cd "$(dirname $0)" && pwd)"

target=$1
shift

if [ "$target" == "" ] || [ "$1" != "" ]; then
    echo "setup.sh can take only one argument" >&2
    echo "./setup.sh mac-personal|mac-work|linux-work" >&2
    exit 1;
fi

if [ "$target" != "mac-personal" ] && [ "$target" != "mac-work" ] && [ "$target" != "linux-work" ]; then
    echo "first argument should be mac-personal, mac-work, or linux-work" >&2
    exit 1;
fi

targetDir="$scriptDir/$target"

echo "This script will override your dotfiles under $HOME/ if you have any files conflicting with files under $targetDir/"
read -r -p "Are you sure to continue? [yes/No] " answer

if [ "$answer" != "yes" ]; then
    echo "Aborted"
    exit 0;
fi

for file in $(ls -A $targetDir); do
    if [ -e "$HOME/$file" ]; then
        rm "$HOME/$file"
    fi
    ln -s "$targetDir/$file" "$HOME/$file"
done
