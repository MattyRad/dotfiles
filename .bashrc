switch_to_zsh() {
    echo "Starting zsh migration..."

    if ! command -v zsh >/dev/null 2>&1; then
        echo "Installing zsh..."
        sudo apt update && sudo apt install -y zsh git fzf
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

    rm -rf ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    rm -rf ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    rm -rf ~/.oh-my-zsh/custom/plugins/fzf-tab && git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

    sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf)/' ~/.zshrc

    chmod +x ~/.dotfiles/source_rc.sh
    ~/.dotfiles/source_rc.sh

    echo "--- Done ---"
}
