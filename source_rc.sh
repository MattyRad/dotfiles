#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

setup_dotfile() {
    local filename="$1"  # e.g., .bashrc
    local system_path="$HOME/$filename"
    local repo_path="$DOTFILES_DIR/$filename"

    if [ ! -f "$repo_path" ]; then
        echo "Warning: $filename not found in repo, skipping."
        return
    fi

    touch "$system_path"

    local source_line="[ -f $repo_path ] && . $repo_path"

    if ! grep -qF "$repo_path" "$system_path"; then
        echo "Linking $filename from repo to $system_path..."
        echo -e "\n# Loaded from dotfiles repo\n$source_line" >> "$system_path"
    else
        echo "$filename is already linked."
    fi
}

setup_dotfile ".bashrc"
setup_dotfile ".zshrc"

echo "Done"
