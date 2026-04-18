switch_to_zsh() {
    echo "Starting zsh migration..."

    if ! command -v zsh >/dev/null 2>&1; then
        echo "Installing zsh..."
        sudo apt update && sudo apt install -y zsh
    else
        echo "zsh is already installed."
    fi

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "Oh My Zsh is already installed."
    fi

    if [ "$SHELL" != "$(command -v zsh)" ]; then
        echo "Changing default shell to zsh..."
        sudo chsh -s "$(command -v zsh)" "$USER"
    fi

    echo "--- Done ---"
}
