#!/bin/bash

mkdir -p ~/.local/bin/

if ! command -v eget &> /dev/null; then
    echo "eget not found. Installing..."
    curl https://zyedidia.github.io/eget.sh | sh
    mv eget ~/.local/bin
fi

if ! command -v fzf &> /dev/null; then
    echo "needs fzf"
    exit 1
fi

APPS=(
"sharkdp/bat"
"clementtsang/bottom"
"charmbracelet/crush"
"dandavison/delta"
"bootandy/dust"
"sharkdp/fd"
"casey/just"
"jesseduffield/lazygit"
"jacobdeichert/mask"
"micro-editor/micro"
"jdx/mise"
"ouch-org/ouch"
"BurntSushi/ripgrep"
"abhinav/git-spice"
"achannarasappa/ticker"
"ajeetdsouza/zoxide"
"AlexsJones/llmfit"
"ollama/ollama"
)

printf "%s\n" "${APPS[@]}" | fzf \
  --prompt="Install App > " \
  --header="ENTER: Install | CTRL-R: Check Version" \
  --preview='
    # Extract the repo name (the part after the slash)
    binary_name=$(echo {} | cut -d/ -f2)

    # Check if it exists in ~/.local/bin
    if [ -f "$HOME/.local/bin/$binary_name" ]; then
      echo "Status: [INSTALLED]"
      ls -lh "$HOME/.local/bin/$binary_name"
    else
      echo "Status: [NOT INSTALLED]"
    fi
  ' \
  --bind 'enter:execute(eget {} --to ~/.local/bin)+reload(sleep 0.1; printf "%s\n" "${APPS[@]}")'
